#!/bin/bash

# ===============================
# Script kiểm tra và renew SSL cho tất cả domain Apache
# ===============================

APACHE_SITES_DIR="/etc/apache2/sites-available"
RENEWED_COUNT=0
EXPIRING_DOMAINS=()
NOW=$(date +%s)

echo "--- 🔍 Đang kiểm tra hạn SSL của các domain ---"

for file in "$APACHE_SITES_DIR"/*.conf; do
  DOMAIN=$(basename "$file" .conf)

  # Kiểm tra xem domain đã có chứng chỉ SSL hay chưa
  CERT_PATH="/etc/letsencrypt/live/$DOMAIN/fullchain.pem"

  if [ -f "$CERT_PATH" ]; then
    # Lấy ngày hết hạn
    EXP_DATE=$(openssl x509 -enddate -noout -in "$CERT_PATH" | cut -d= -f2)
    EXP_TS=$(date -d "$EXP_DATE" +%s)

    # Tính số ngày còn lại
    REMAIN_DAYS=$(( (EXP_TS - NOW) / 86400 ))

    echo "🔗 $DOMAIN: SSL hết hạn sau $REMAIN_DAYS ngày."

    if [ "$REMAIN_DAYS" -lt 30 ]; then
      EXPIRING_DOMAINS+=("$DOMAIN")
    fi
  else
    echo "⚠️  $DOMAIN chưa có SSL. Sẽ tiến hành cài mới."
    EXPIRING_DOMAINS+=("$DOMAIN")
  fi
done

# Nếu có domain cần renew hoặc cài mới
if [ ${#EXPIRING_DOMAINS[@]} -gt 0 ]; then
  echo ""
  echo "--- 🔁 Tiến hành renew hoặc cài mới SSL ---"

  for DOMAIN in "${EXPIRING_DOMAINS[@]}"; do
    echo "➡️  Xử lý SSL cho $DOMAIN..."
    sudo certbot --apache -d "$DOMAIN" --non-interactive --agree-tos -m admin@$DOMAIN --quiet
    if [ $? -eq 0 ]; then
      echo "✅ $DOMAIN: SSL đã được renew/cài đặt."
      ((RENEWED_COUNT++))
    else
      echo "❌ $DOMAIN: Renew thất bại!"
    fi
  done
else
  echo "--- ✅ Tất cả SSL đều còn hạn trên 30 ngày. Không cần renew."
fi

echo ""
echo "--- 🏁 Hoàn tất. Tổng số domain đã renew/cài mới: $RENEWED_COUNT ---"
