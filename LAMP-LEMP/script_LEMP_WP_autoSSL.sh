#!/bin/bash

# Kiểm tra quyền root
if [[ $EUID -ne 0 ]]; then
    echo "⚠️  Vui lòng chạy script với quyền root!"
    exit 1
fi

# Kiểm tra mạng
echo "🔍 Kiểm tra kết nối mạng..."
if ! ping -c 1 1.1.1.1 &>/dev/null; then
    echo "❌ Mạng không hoạt động. Kiểm tra lại kết nối Internet."
    exit 1
fi

echo "✅ Mạng OK. Tiếp tục cài đặt..."

# Sửa DNS nếu cần
echo "nameserver 1.1.1.1" > /etc/resolv.conf

# Cập nhật và cài đặt gói cần thiết
apt update --fix-missing && apt install -y nginx mysql-server php-fpm php-mysql php-cli php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip unzip wget curl certbot python3-certbot-nginx

# Khởi động dịch vụ
systemctl enable --now nginx mysql php8.1-fpm

# Đặt lại mật khẩu root MySQL
echo "🔐 Đặt lại mật khẩu root cho MySQL..."
MYSQL_ROOT_PASS=$(openssl rand -hex 12)
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_ROOT_PASS'; FLUSH PRIVILEGES;"
echo "✅ Mật khẩu root MySQL đã đặt lại."

# Nhập domain
read -p "Nhập danh sách domain (cách nhau bằng dấu cách): " -a domains

# Tạo file log thông tin
LOGFILE="/root/wordpress_credentials_$(date +%Y%m%d_%H%M%S).log"
echo "📝 Ghi thông tin ra file: $LOGFILE"
echo "=========================" >> "$LOGFILE"
echo "MYSQL ROOT PASSWORD: $MYSQL_ROOT_PASS" >> "$LOGFILE"
echo "=========================" >> "$LOGFILE"

for domain in "${domains[@]}"; do
  echo "====================="
  echo "🔧 Cài đặt domain: $domain"
  echo "====================="

  mkdir -p /var/www/$domain
  chown -R www-data:www-data /var/www/$domain
  chmod -R 755 /var/www/$domain

  # Tạo database + user/password
  dbname="wp_$(echo $domain | tr '.' '_')"
  dbuser="${dbname}_user"
  dbpass=$(openssl rand -hex 10)

  mysql -uroot -p"$MYSQL_ROOT_PASS" -e "CREATE DATABASE ${dbname};"
  mysql -uroot -p"$MYSQL_ROOT_PASS" -e "CREATE USER '${dbuser}'@'localhost' IDENTIFIED BY '${dbpass}';"
  mysql -uroot -p"$MYSQL_ROOT_PASS" -e "GRANT ALL PRIVILEGES ON ${dbname}.* TO '${dbuser}'@'localhost';"
  mysql -uroot -p"$MYSQL_ROOT_PASS" -e "FLUSH PRIVILEGES;"

  # Ghi thông tin ra file
  {
    echo "Domain: $domain"
    echo "Database: $dbname"
    echo "DB User: $dbuser"
    echo "DB Pass: $dbpass"
    echo "-------------------------"
  } >> "$LOGFILE"

  # Tải và giải nén WordPress
  cd /tmp
  wget -q https://wordpress.org/latest.zip && unzip -q latest.zip
  cp -r wordpress/* /var/www/$domain/
  cp /var/www/$domain/wp-config-sample.php /var/www/$domain/wp-config.php
  rm -rf wordpress latest.zip

  sed -i "s/database_name_here/$dbname/" /var/www/$domain/wp-config.php
  sed -i "s/username_here/$dbuser/" /var/www/$domain/wp-config.php
  sed -i "s/password_here/$dbpass/" /var/www/$domain/wp-config.php

  # Cấu hình nginx
  cat > /etc/nginx/sites-available/$domain <<EOF
server {
    listen 80;
    server_name $domain www.$domain;

    root /var/www/$domain;
    index index.php index.html;

    location / {
        try_files \$uri \$uri/ /index.php?\$args;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.1-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOF

  ln -s /etc/nginx/sites-available/$domain /etc/nginx/sites-enabled/
done

# Reload nginx
nginx -t && systemctl reload nginx

# Cấp SSL
for domain in "${domains[@]}"; do
  certbot --nginx -d $domain -d www.$domain --non-interactive --agree-tos -m admin@$domain
done

# Thông báo kết thúc
echo -e "\n✅ Hoàn tất cài đặt LEMP + WordPress + SSL!"
echo "📄 Thông tin đăng nhập và DB được lưu tại: $LOGFILE"
