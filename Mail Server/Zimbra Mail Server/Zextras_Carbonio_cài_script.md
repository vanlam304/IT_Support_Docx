## **1. Chuẩn bị hệ thống**

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

https://github.com/vanlam304/IT_Support_Docx/blob/main/Mail%20Server/Zimbra%20Mail%20Server/Zextras_Carbonio_c%C3%A0i_%20th%E1%BB%A7_c%C3%B4ng.md

