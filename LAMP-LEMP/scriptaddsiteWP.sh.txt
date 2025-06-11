#!/bin/bash

# Thư mục chứa các site
BASE_DIR="/var/www"
APACHE_SITES_DIR="/etc/apache2/sites-available"
DOMAINS_EXISTED=()
DOMAINS_NEW=()

echo "--- Danh sách site WordPress đã cài đặt ---"

# Quét tất cả file conf của Apache để tìm các site đã cài đặt
for file in "$APACHE_SITES_DIR"/*.conf; do
  DOMAIN=$(basename "$file" .conf)
  SITE_DIR="$BASE_DIR/$DOMAIN"

  if [ -f "$SITE_DIR/wp-config.php" ]; then
    echo "[✓] $DOMAIN"
    DOMAINS_EXISTED+=("$DOMAIN")
  fi
done

echo ""
echo "--- Thêm domain mới cần cài WordPress ---"
while true; do
  read -p "Nhập tên miền mới (bấm Enter để dừng): " NEW_DOMAIN
  [ -z "$NEW_DOMAIN" ] && break

  # Kiểm tra đã tồn tại chưa
  if [[ " ${DOMAINS_EXISTED[@]} " =~ " $NEW_DOMAIN " ]]; then
    echo "⚠️  $NEW_DOMAIN đã tồn tại. Bỏ qua."
  else
    DOMAINS_NEW+=("$NEW_DOMAIN")
  fi
done

# Nếu không có domain nào mới
if [ ${#DOMAINS_NEW[@]} -eq 0 ]; then
  echo "⛔ Không có domain mới cần cài đặt. Thoát."
  exit 0
fi

# Cài đặt WordPress cho các domain mới
for DOMAIN in "${DOMAINS_NEW[@]}"; do
  SITE_DIR="$BASE_DIR/$DOMAIN"
  VHOST_PATH="$APACHE_SITES_DIR/$DOMAIN.conf"

  echo "--- Cài đặt WordPress cho $DOMAIN ---"
  sudo mkdir -p "$SITE_DIR"

  # Tải và giải nén WordPress
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

  # Tạo database
  DB_NAME="wp_$(echo $DOMAIN | tr '.' '_')"
  DB_USER="user_$(echo $DOMAIN | tr '.' '_')"
  DB_PASS=$(openssl rand -base64 12)

  SQL=$(cat <<EOF
CREATE DATABASE \`$DB_NAME\` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
EOF
  )

  echo "$SQL" | sudo mysql -u root

  # Cấu hình wp-config
  cp "$SITE_DIR/wp-config-sample.php" "$SITE_DIR/wp-config.php"
  sed -i "s/database_name_here/$DB_NAME/" "$SITE_DIR/wp-config.php"
  sed -i "s/username_here/$DB_USER/" "$SITE_DIR/wp-config.php"
  sed -i "s/password_here/$DB_PASS/" "$SITE_DIR/wp-config.php"

  # Lưu thông tin DB
  echo -e "[Thông tin database - $DOMAIN]\nDB_NAME: $DB_NAME\nDB_USER: $DB_USER\nDB_PASS: $DB_PASS\n" >> ~/wordpress-db-info.txt

  echo "[✓] Đã cài WordPress cho $DOMAIN"
done

# Reload Apache
sudo systemctl reload apache2

# Cài SSL cho domain mới
for DOMAIN in "${DOMAINS_NEW[@]}"; do
  echo "--- Cài SSL cho $DOMAIN ---"
  sudo certbot --apache -d "$DOMAIN" --non-interactive --agree-tos -m admin@$DOMAIN
  echo "[✓] SSL đã cài xong cho $DOMAIN"
done

echo ""
echo "--- ✅ Hoàn tất cài đặt các domain mới! ---"
echo "📁 Thông tin database được lưu tại: ~/wordpress-db-info.txt"
