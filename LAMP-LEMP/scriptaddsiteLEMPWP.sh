#!/bin/bash

echo "=== ➕ THÊM WEBSITE WORDPRESS MỚI ==="

# Kiểm tra quyền root
if [[ $EUID -ne 0 ]]; then
    echo "⚠️  Vui lòng chạy script với quyền root!"
    exit 1
fi

# Nhập mật khẩu root MySQL trước
read -s -p "🔐 Nhập mật khẩu root MySQL: " MYSQL_ROOT_PASS
echo ""

# Vòng lặp cho phép nhập lại domain nếu trùng
while true; do
    read -p "🌐 Nhập domain mới (VD: upnet1.vn): " domain

    if [[ -z "$domain" ]]; then
        echo "❌ Domain không được để trống!"
        continue
    fi

    if [[ -d "/var/www/$domain" || -f "/etc/nginx/sites-available/$domain" ]]; then
        echo "❌ Domain $domain đã tồn tại. Vui lòng nhập domain khác."
    else
        break
    fi
done

# Tạo thư mục web
mkdir -p /var/www/$domain
chown -R www-data:www-data /var/www/$domain
chmod -R 755 /var/www/$domain

# Tạo database, user, password
dbname="wp_$(echo $domain | tr '.' '_')"
dbuser="${dbname}_user"
dbpass=$(openssl rand -hex 10)

mysql -uroot -p"$MYSQL_ROOT_PASS" -e "
CREATE DATABASE ${dbname};
CREATE USER '${dbuser}'@'localhost' IDENTIFIED BY '${dbpass}';
GRANT ALL PRIVILEGES ON ${dbname}.* TO '${dbuser}'@'localhost';
FLUSH PRIVILEGES;"

# Tải WordPress
cd /tmp && rm -rf wordpress latest.zip
wget -q https://wordpress.org/latest.zip && unzip -q latest.zip
cp -r wordpress/* /var/www/$domain/
cp /var/www/$domain/wp-config-sample.php /var/www/$domain/wp-config.php
chown -R www-data:www-data /var/www/$domain

# Sửa wp-config
sed -i "s/database_name_here/$dbname/" /var/www/$domain/wp-config.php
sed -i "s/username_here/$dbuser/" /var/www/$domain/wp-config.php
sed -i "s/password_here/$dbpass/" /var/www/$domain/wp-config.php

# Tạo file Nginx config
cat > /etc/nginx/sites-available/$domain <<EOF
server {
    listen 80;
    server_name $domain www.$domain;

    root /var/www/$domain;
    index index.php index.html;

    location / {
        try_files \$uri \$uri/ /index.php?\$args;
    }

    location ~ \.php\$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.1-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }

    access_log /var/log/nginx/$domain.access.log;
    error_log /var/log/nginx/$domain.error.log;
}
EOF

ln -s /etc/nginx/sites-available/$domain /etc/nginx/sites-enabled/
nginx -t && systemctl reload nginx

# Cấp SSL
certbot --nginx -d $domain -d www.$domain --non-interactive --agree-tos -m admin@$domain

# Lưu thông tin
LOG="/root/wp_added_$(date +%F_%H%M%S).log"
{
    echo "✅ Thêm site $domain thành công!"
    echo "Database: $dbname"
    echo "DB User: $dbuser"
    echo "DB Pass: $dbpass"
    echo "Đường dẫn: /var/www/$domain"
    echo "SSL: Đã cấp tự động"
} > "$LOG"

echo -e "\n✅ Site WordPress $domain đã được thêm thành công!"
echo "📄 Thông tin lưu tại: $LOG"
