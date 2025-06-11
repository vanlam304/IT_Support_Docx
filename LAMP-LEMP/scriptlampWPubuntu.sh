#!/bin/bash

# Script cài đặt LAMP + nhiều site WordPress, mỗi domain có VirtualHost riêng

# ========================
# 1. Cài đặt LAMP stack
# ========================
echo "--- Cài đặt LAMP stack ---"
sudo apt update
sudo apt install apache2 mariadb-server php php-mysql libapache2-mod-php unzip curl software-properties-common certbot python3-certbot-apache -y

# Bật mod cần thiết
sudo a2enmod rewrite

# ========================
# 2. Khai báo thư mục và mảng domain
# ========================
BASE_DIR="/var/www"
DOMAINS=()

# ========================
# 3. Nhập domain và xử lý từng site
# ========================
while true; do
  read -p "Nhập tên miền (domain) cho site WP (bấm Enter nếu xong): " DOMAIN
  [ -z "$DOMAIN" ] && break

  DOMAINS+=("$DOMAIN")
  SITE_DIR="$BASE_DIR/$DOMAIN"
  VHOST_PATH="/etc/apache2/sites-available/$DOMAIN.conf"

  echo "--- Cài đặt WordPress cho $DOMAIN ---"

  # Tạo thư mục site và tải WordPress
  sudo mkdir -p "$SITE_DIR"
  wget -q https://wordpress.org/latest.zip -O /tmp/wordpress.zip
  unzip -qq /tmp/wordpress.zip -d /tmp/
  sudo mv /tmp/wordpress/* "$SITE_DIR/"
  sudo rm -rf /tmp/wordpress /tmp/wordpress.zip

  # Phân quyền
  sudo chown -R www-data:www-data "$SITE_DIR"
  sudo chmod -R 755 "$SITE_DIR"

  # Tạo VirtualHost
  sudo tee "$VHOST_PATH" > /dev/null <<EOF
<VirtualHost *:80>
    ServerName $DOMAIN
    DocumentRoot $SITE_DIR

    <Directory $SITE_DIR>
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/$DOMAIN-error.log
    CustomLog \${APACHE_LOG_DIR}/$DOMAIN-access.log combined
</VirtualHost>
EOF

  sudo a2ensite "$DOMAIN.conf"

  # Tạo database riêng
  DB_NAME="wp_$(echo $DOMAIN | tr '.' '_')"
  DB_USER="user_$(echo $DOMAIN | tr '.' '_')"
  DB_PASS=$(openssl rand -base64 12)

  sudo mysql -u root <<MYSQL
CREATE DATABASE \`$DB_NAME\` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
MYSQL

  # Cấu hình wp-config.php
  cp "$SITE_DIR/wp-config-sample.php" "$SITE_DIR/wp-config.php"
  sed -i "s/database_name_here/$DB_NAME/" "$SITE_DIR/wp-config.php"
  sed -i "s/username_here/$DB_USER/" "$SITE_DIR/wp-config.php"
  sed -i "s/password_here/$DB_PASS/" "$SITE_DIR/wp-config.php"

  # Ghi thông tin DB ra file quản lý
  echo -e "[Thông tin database - $DOMAIN]\nDB_NAME: $DB_NAME\nDB_USER: $DB_USER\nDB_PASS: $DB_PASS\n" >> ~/wordpress-db-info.txt

done

# ========================
# 4. Reload Apache và mở firewall
# ========================
sudo systemctl reload apache2
sudo ufw allow 80
sudo ufw allow 443

# ========================
# 5. Cài đặt SSL cho từng domain
# ========================
for domain in "${DOMAINS[@]}"; do
  echo "--- Cài SSL cho $domain ---"
  sudo certbot --apache -d "$domain" --non-interactive --agree-tos -m admin@$domain
  echo "[✓] Đã cài SSL cho $domain"
done

# ========================
# 6. Hoàn tất
# ========================
echo "--- ✅ Hoàn tất! Truy cập từng domain để hoàn tất cài đặt WordPress. ---"
echo "📁 Thông tin database của từng site đã được lưu tại: ~/wordpress-db-info.txt"
echo "💡 Để đăng nhập MySQL root, dùng lệnh: sudo mysql"
