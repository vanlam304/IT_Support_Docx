## **1. Chuẩn bị hệ thống( Hãy nhớ trỏ bản ghi mail và MX từ đầu, tắt proxy ở bản ghi mail nhé 🥲)**

```bash
# Cập nhật hệ thống
sudo apt update && sudo apt upgrade -y

# Cài các gói cơ bản
sudo apt install curl wget net-tools gnupg lsb-release software-properties-common apt-transport-https -y

# Đặt hostname theo domain
sudo hostnamectl set-hostname mail.hihihi.pro

# Sửa /etc/hosts
sudo nano /etc/hosts
```

Thêm dòng:

```
163.47.30.19    mail.hihihi.pro mail
```

---

## **2. Xoá sạch Carbonio cũ (nếu cài lại). Cài mới đừng chạy lệnh này nhé**

```bash
sudo systemctl stop $(sudo systemctl list-units --type=service --state=running | grep carbonio | awk '{print $1}')
sudo apt purge "carbonio*" "zextras*" -y
sudo apt autoremove --purge -y
sudo rm -rf /opt/zextras /var/lib/zextras /etc/zextras /etc/carbonio /var/log/zextras /var/log/carbonio /tmp/*
sudo rm -rf /var/lib/service-discover /etc/service-discover
sudo find / -name "*carbonio*" -exec rm -rf {} +
```

---

## **3. Cài repo Carbonio**

```bash
wget https://repo.zextras.io/inst_repo_ubuntu.sh
sudo bash inst_repo_ubuntu.sh
```

---

## **4. Cài Carbonio CE Single Server**

```bash
wget https://docs.zextras.com/carbonio-ce/html/_downloads/bed211d6fc1b9ca35f15be01eb9aa3fc/install_carbonio_ce_singleserver_ubuntu.sh
sudo bash install_carbonio_ce_singleserver_ubuntu.sh
```

Lúc này script sẽ:

* Cài MariaDB (carbonio-mariadb-server)
* Cài LDAP, MTA, Proxy, v.v.
* Chuẩn bị để bootstrap

---

## **5. Bootstrap hệ thống**

```bash
sudo carbonio-bootstrap
```

Khi hỏi:

* **Domain**: `hihihi.pro`
* **Hostname**: `mail.hihihi.pro`
* **Admin password**: tạo password cho `admin@hihihi.pro`
* Các mật khẩu khác (LDAP, MTA, Amavis, Nginx, DB) => lưu lại

---

## **6. Mở firewall**

```bash
sudo ufw allow 25,22,6071,80,110,143,443,465,587,993,995,5222,5223,7071,9071/tcp
sudo ufw reload
```

---

## **7. Cấu hình DNS, SSL, DKIM... cho domain hihihi.pro ở bước 11 của hướng dẫn cài thủ công**

Ok, để mình viết lại hướng dẫn **SSL + DKIM** cho Zextras Carbonio CE đầy đủ, gọn gàng, và kèm luôn fix cho truy cập domain qua HTTPS thay vì IP.

---

## **I. Cài đặt & Cấu hình SSL Let’s Encrypt cho Zextras Carbonio CE**

### **Bước 1: Cài đặt Certbot**

```bash
apt install software-properties-common -y
add-apt-repository universe
add-apt-repository ppa:certbot/certbot -y
apt update
apt install certbot -y
```

---

### **Bước 2: Tạo chứng chỉ SSL**

Thay `mail.hihihi.pro` bằng domain của bạn:

```bash
certbot certonly --standalone -d mail.hihihi.pro
```

> Nếu firewall chặn, mở port 80:

```bash
ufw allow 80/tcp
```

---

### **Bước 3: Triển khai chứng chỉ cho Carbonio**

```bash
export DOMAIN="mail.hihihi.pro"
cp /etc/letsencrypt/live/$DOMAIN/privkey.pem /opt/zextras/ssl/carbonio/commercial/commercial.key
cp /etc/letsencrypt/live/$DOMAIN/cert.pem /tmp
cp /etc/letsencrypt/live/$DOMAIN/chain.pem /tmp
```

---

### **Bước 4: Thêm ISRG Root X1 vào chain.pem**

```bash
wget -O /tmp/ISRG-X1.pem https://letsencrypt.org/certs/isrgrootx1.pem.txt
cat /tmp/ISRG-X1.pem >> /tmp/chain.pem
```

---

### **Bước 5: Set quyền**

```bash
chown -R zextras:zextras /opt/zextras/ssl/carbonio/commercial/commercial.key
```

---

### **Bước 6: Xác minh chứng chỉ**

```bash
su - zextras -c 'zmcertmgr verifycrt comm /opt/zextras/ssl/carbonio/commercial/commercial.key /tmp/cert.pem /tmp/chain.pem'
```

---

### **Bước 7: Triển khai chứng chỉ**

```bash
su - zextras -c 'zmcertmgr deploycrt comm /tmp/cert.pem /tmp/chain.pem'
su - zextras -c 'zmcontrol restart'
```

---

### **Bước 8: Fix truy cập domain cho Admin Console**

Mặc định Carbonio Admin chỉ bind vào IP. Ta cần thêm domain vào cấu hình:

```bash
nano /opt/zextras/conf/localconfig.xml
```

Tìm và chỉnh:

```xml
<key name="zimbraAdminConsoleHostName" value="mail.hihihi.pro"/>
```
Nếu không có hãy làm theo trrong ngoặc nhé
Đây{

**1. Dùng lệnh (khuyến nghị)**

```bash
su - zextras
zmlocalconfig -e zimbraAdminConsoleHostName=mail.hihihi.pro
```

**2. Sửa file cấu hình thủ công**
Mở file:

```bash
nano /opt/zextras/conf/localconfig.xml
```

Thêm vào trước `</localconfig>`:

```xml
<key name="zimbraAdminConsoleHostName" value="mail.hihihi.pro"/>
```

---

**3. Khởi động lại dịch vụ**

```bash
su - zextras -c 'zmcontrol restart'
```

---

}
Lưu lại rồi restart:

```bash
su - zextras -c 'zmcontrol restart'
```

> Giờ có thể truy cập:
> `https://mail.hihihi.pro:6071/carbonioAdmin/dashboard`

---

## **II. Cấu hình DKIM cho Carbonio CE**

### **Bước 1: Cài gói hỗ trợ**

```bash
apt-get install libxml-simple-perl -y
```

---

### **Bước 2: Tạo DKIM key**

```bash
sudo su - zextras
/opt/zextras/libexec/zmdkimkeyutil -a -d hihihi.pro
```

---

### **Bước 3: Thêm DKIM vào DNS**

Sau khi chạy lệnh trên, bạn sẽ nhận được key dạng:

```
<selector>._domainkey IN TXT "v=DKIM1; k=rsa; p=MIIBIjANB...IDAQAB"
```

Vào DNS (Cloudflare, Namecheap, v.v.) → Thêm bản ghi:

* **Type:** TXT
* **Name:** `<selector>._domainkey`
* **Value:** Chuỗi `v=DKIM1; k=rsa; p=...`

---

### **Bước 4: Xác minh DKIM**

```bash
su - zextras -c 'zmcontrol restart'
su - zextras -c 'zmdkimkeyutil verify -d hihihi.pro'
```

---



