# HƯỚNG DẪN CÀI ĐẶT MAIL SERVER ZEXTRAS CARBONIO CE TRÊN UBUNTU 22.04

Hướng dẫn này sẽ giúp bạn cài đặt Zextras Carbonio CE, một phần mềm mail server mã nguồn mở, trên Ubuntu 22.04. Hướng dẫn được viết chi tiết, từng bước, dành cho người mới bắt đầu, không cần biết nhiều về Linux hay server.

## 🧠 Yêu cầu trước khi bắt đầu
1. **Máy chủ (VPS hoặc server vật lý)**:
   - Hệ điều hành: **Ubuntu 22.04 Server** (phiên bản mới nhất, không dùng bản Desktop).
   - Cấu hình tối thiểu: **8GB RAM**, **2 CPU core**, ổ cứng ≥ 20GB trống.
   - Một địa chỉ IP tĩnh (ví dụ: `203.113.0.123`).
2. **Tên miền (Domain)**:
   - Bạn cần sở hữu một tên miền (ví dụ: `hihihi.pro`).
   - Cấu hình DNS cho tên miền:
     - **A record**: `mail.hihihi.pro` → IP của VPS (ví dụ: `203.113.0.123`).
     - **MX record**: `@` → `mail.hihihi.pro`.
     - **TXT records** (SPF, DKIM, DMARC): Sẽ được thêm sau khi cài đặt.
3. **Kết nối SSH**:
   - Bạn cần một công cụ để SSH vào server, như **PuTTY** (Windows) hoặc **Terminal** (Linux/Mac).
   - Đã có tài khoản root hoặc user có quyền `sudo`.
4. **Kiến thức cơ bản**:
   - Không cần biết nhiều về Linux, nhưng bạn cần biết cách copy-paste lệnh và hiểu cơ bản về file hệ thống.

**Lưu ý**: Thay `hihihi.pro` bằng tên miền của bạn và `203.113.0.123` bằng IP thực tế của server trong các lệnh dưới đây.

---

## 1. Chuẩn bị hệ thống
Đầu tiên, chúng ta sẽ cập nhật hệ thống và cài đặt một số công cụ cơ bản.

### Cập nhật hệ thống
1. Đăng nhập vào server qua SSH (dùng PuTTY hoặc Terminal).
2. Chạy lệnh sau để cập nhật hệ thống:
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```
   - **Giải thích**: Lệnh này tải danh sách gói phần mềm mới nhất và nâng cấp hệ thống.
   - Nếu được hỏi, nhấn `Y` để đồng ý.

3. Cài đặt các công cụ cơ bản:
   ```bash
   sudo apt install -y tmux screen vim curl gnupg2 software-properties-common lsb-release
   ```
   - **Giải thích**: Các công cụ này giúp bạn làm việc dễ dàng hơn (tmux để giữ phiên làm việc, vim để chỉnh sửa file, curl để tải file, v.v.).

---

## 2. Khắc phục lỗi DNS (nếu cần)
Một số server có thể gặp lỗi DNS, gây khó khăn khi tải gói phần mềm. Để đảm bảo không gặp lỗi, làm như sau:

1. Tắt dịch vụ DNS mặc định của Ubuntu:
   ```bash
   sudo systemctl disable --now systemd-resolved
   sudo rm -f /etc/resolv.conf
   ```
2. Thêm DNS của Google:
   ```bash
   echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
   ```
   - **Giải thích**: Lệnh này dùng DNS của Google để đảm bảo server có thể truy cập Internet.

---

## 3. Cấu hình hostname và file hosts
Hostname là tên của server, cần khớp với tên miền bạn dùng (ví dụ: `mail.hihihi.pro`).

1. Đặt hostname:
   ```bash
   sudo hostnamectl set-hostname mail.hihihi.pro
   ```
2. Chỉnh sửa file `/etc/hosts`:
   ```bash
   sudo nano /etc/hosts
   ```
   - Thêm hoặc sửa các dòng sau (thay `203.113.0.123` bằng IP của server):
     ```
     127.0.0.1       localhost
     203.113.0.123   mail.hihihi.pro mail
     ```
   - Nhấn `Ctrl+O`, Enter để lưu, rồi `Ctrl+X` để thoát.

3. Kiểm tra hostname:
   ```bash
   hostname
   ```
   - Nếu kết quả trả về `mail.hihihi.pro`, bạn đã làm đúng.

---

## 4. Cài đặt PostgreSQL 16
Carbonio CE sử dụng PostgreSQL làm cơ sở dữ liệu. Chúng ta sẽ cài phiên bản 16.

1. Thêm key và repository của PostgreSQL:
   ```bash
   curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor | sudo tee /usr/share/keyrings/postgresql.gpg > /dev/null
   echo "deb [signed-by=/usr/share/keyrings/postgresql.gpg] https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
   ```
2. Cập nhật và cài đặt PostgreSQL:
   ```bash
   sudo apt update && sudo apt install -y postgresql-16
   ```
3. Kiểm tra trạng thái PostgreSQL:
   ```bash
   sudo systemctl status postgresql
   ```
   - Nếu thấy `active (running)`, PostgreSQL đã chạy.

---

## 5. Tạo database và user cho Carbonio
Carbonio cần một database và user để lưu trữ dữ liệu.

1. Tạo user và database:
   ```bash
   sudo -u postgres psql -c "CREATE ROLE carbonio_adm WITH LOGIN SUPERUSER PASSWORD 'HOAthuong2011.';"
   sudo -u postgres createdb -O carbonio_adm carbonio_adm
   ```
   - **Lưu ý**: Mật khẩu `HOAthuong2011.` có thể thay bằng mật khẩu mạnh khác. Lưu lại mật khẩu này.

2. Cấp quyền đầy đủ cho user `carbonio_adm`:
   ```bash
   sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE carbonio_adm TO carbonio_adm;"
   sudo -u postgres psql -d carbonio_adm -c "GRANT ALL ON SCHEMA public TO carbonio_adm;"
   ```

3. Kiểm tra kết nối database:
   ```bash
   PGPASSWORD=HOAthuong2011. psql -U carbonio_adm -h 127.0.0.1 -d carbonio_adm -c "\l"
   ```
   - Nếu không có lỗi, bạn đã tạo thành công.

---

## 6. Cài đặt Carbonio CE
Bây giờ, chúng ta sẽ thêm repository của Zextras và cài Carbonio CE.

1. Tải và chạy script thêm repository:
   ```bash
   wget https://repo.zextras.io/inst_repo_ubuntu.sh
   bash ./inst_repo_ubuntu.sh
   ```
2. Cập nhật và cài đặt Carbonio CE:
   ```bash
   sudo apt update && sudo apt upgrade -y
   sudo apt install carbonio-ce
   ```

---

## 7. Khởi tạo hệ thống Carbonio
Chạy lệnh khởi tạo để thiết lập các cấu hình ban đầu:

```bash
carbonio-bootstrap
```
- Nhấn `y` khi được hỏi và chờ khoảng 5-10 phút để hoàn tất.

---

## 8. Cấu hình Carbonio Mesh và Files DB
Carbonio Mesh giúp quản lý các dịch vụ, còn Files DB là cơ sở dữ liệu cho module lưu trữ file.

1. Cài đặt các gói cần thiết:
   ```bash
   sudo apt install -y carbonio-files-db carbonio-files-ce consul
   ```
2. Cấu hình Carbonio Mesh:
   ```bash
   service-discover setup-wizard
   ```
   - Làm theo hướng dẫn trên màn hình (thường chỉ cần nhấn Enter để dùng giá trị mặc định).
3. Chạy lệnh khởi tạo các thiết lập:
   ```bash
   pending-setups -a
   ```
4. Khởi tạo database cho Carbonio Files:
   ```bash
   PGPASSWORD=HOAthuong2011. carbonio-files-db-bootstrap carbonio_adm 127.0.0.1
   ```
5. Kiểm tra trạng thái dịch vụ:
   ```bash
   sudo systemctl status consul
   sudo systemctl status carbonio-files-db
   ```
   - Nếu dịch vụ không chạy, khởi động lại:
     ```bash
     sudo systemctl enable consul
     sudo systemctl start consul
     sudo systemctl restart carbonio-files-db
     ```

---

## 9. Khởi động lại dịch vụ mail
Sau khi cài đặt, khởi động lại các dịch vụ Carbonio:

```bash
su - zextras
zmcontrol stop
zmcontrol start
exit
```

---

## 10. Mở port trên firewall
Nếu server của bạn dùng UFW (Uncomplicated Firewall), mở các cổng cần thiết:

```bash
sudo ufw allow 25,22,6071,80,110,143,443,465,587,993,995,5222,5223,7071,9071/tcp
```

- **Giải thích**: Các cổng này cho phép truy cập email, webmail, và giao diện quản trị.

---

## 11. Cài đặt SSL với Let's Encrypt
Để bảo mật, bạn nên dùng SSL (HTTPS). Chúng ta sẽ dùng Let's Encrypt để lấy chứng chỉ miễn phí.

1. Cài đặt Certbot:
   ```bash
   sudo apt install certbot
   ```
2. Lấy chứng chỉ SSL:
   ```bash
   sudo certbot certonly --standalone -d mail.hihihi.pro
   ```
   - Làm theo hướng dẫn, nhập email và đồng ý các điều khoản.
3. Copy chứng chỉ vào thư mục của Carbonio:
   ```bash
   export DOMAIN="mail.hihihi.pro"
   cp /etc/letsencrypt/live/$DOMAIN/privkey.pem /opt/zextras/ssl/carbonio/commercial/commercial.key
   cp /etc/letsencrypt/live/$DOMAIN/cert.pem /tmp
   cp /etc/letsencrypt/live/$DOMAIN/chain.pem /tmp
   wget -O /tmp/ISRG-X1.pem https://letsencrypt.org/certs/isrgrootx1.pem.txt
   cat /tmp/ISRG-X1.pem >> /tmp/chain.pem
   chown -R zextras:zextras /opt/zextras/ssl/carbonio/commercial/commercial.key
   ```
4. Cài đặt chứng chỉ:
   ```bash
   su - zextras -c 'zmcertmgr verifycrt comm /opt/zextras/ssl/carbonio/commercial/commercial.key /tmp/cert.pem /tmp/chain.pem'
   su - zextras -c 'zmcertmgr deploycrt comm /tmp/cert.pem /tmp/chain.pem'
   su - zextras -c 'zmcontrol restart'
   ```

---

## 12. Tạo user và phân quyền
Sau khi cài đặt, bạn cần tạo tài khoản người dùng để sử dụng email.

1. Tạo user mới:
   ```bash
   su - zextras
   zmprov createAccount user1@hihihi.pro UserPass123
   exit
   ```
   - Thay `user1@hihihi.pro` và `UserPass123` bằng email và mật khẩu bạn muốn.
2. (Tùy chọn) Cấp quyền quản trị cho user mặc định:
   ```bash
   su - zextras
   zmprov addAccountAlias zextras@hihihi.pro admin@hihihi.pro
   zmprov grantRight domain hihihi.pro +adminConsoleRights zextras@hihihi.pro
   exit
   ```

---

## 13. Đổi mật khẩu tài khoản mặc định
Tài khoản mặc định là `zextras@mail.hihihi.pro`. Đổi mật khẩu như sau:

```bash
su - zextras
zmprov setpassword zextras@mail.hihihi.pro MatKhauMoiCuaBan
exit
```

---

## ✅ HOÀN TẤT!
- **Truy cập webmail**: `https://mail.hihihi.pro`
- **Giao diện quản trị**: `https://mail.hihihi.pro:6071`
- **Tài khoản mặc định**: `zextras@mail.hihihi.pro` (mật khẩu đã đổi ở bước 13).
- **Tài khoản người dùng**: `user1@hihihi.pro` (hoặc các tài khoản bạn tạo ở bước 12).

---

## Khắc phục sự cố
1. **Lỗi kết nối database**:
   - Kiểm tra file `/etc/postgresql/16/main/pg_hba.conf`:
     ```bash
     sudo nano /etc/postgresql/16/main/pg_hba.conf
     ```
     Thêm hoặc sửa:
     ```
     local   all   carbonio_adm   md5
     host    all   carbonio_adm   127.0.0.1/32   md5
     ```
     Khởi động lại PostgreSQL:
     ```bash
     sudo systemctl restart postgresql
     ```
2. **Lỗi Carbonio không khởi động**:
   - Kiểm tra trạng thái:
     ```bash
     su - zextras
     zmcontrol status
     tail -f /opt/zextras/log/mailbox.log
     ```
   - Kiểm tra DNS, hostname, hoặc database nếu có lỗi.

---

## Lưu ý cuối
- Cấu hình SPF, DKIM, DMARC trong DNS của tên miền để tăng độ tin cậy email.
- Định kỳ kiểm tra log (`/opt/zextras/log/`) để phát hiện vấn đề.
- Nếu cần hỗ trợ, truy cập [diễn đàn Zextras](https://community.zextras.com/).

Chúc bạn thành công với mail server của mình!
