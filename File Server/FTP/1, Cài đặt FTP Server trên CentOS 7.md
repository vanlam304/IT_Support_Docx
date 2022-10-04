# Cài đặt máy chủ FTP với VSFTPD

### Bước 1: Cập nhật trình quản lý gói

```
yum update -y
```
![image](https://user-images.githubusercontent.com/111721629/193771382-eb0be34f-7087-43b9-9d3c-8f372f77451f.png)

### Bước 2: Cài đặt phần mềm VSFTPD

```
yum install vsftpd
```

![image](https://user-images.githubusercontent.com/111721629/193771582-7fe41957-239b-4ef7-b459-f7fadf2ce143.png)

### Bước 3: Bắt đầu dịch vụ, thiết lập cho khởi động cùng hệ thống. 

```
systemctl start vsftpd
```

```
systemctl enable vsftpd
```
![image](https://user-images.githubusercontent.com/111721629/193771688-cf094c79-48e4-4db5-addb-7f55b7451605.png)

### Bước 4: Cấu hình firewall

```
firewall-cmd --zone=public --permanent --add-port=21/tcp
firewall-cmd --zone=public --permanent --add-service=ftp
firewall-cmd --reload
```

![image](https://user-images.githubusercontent.com/111721629/193771826-ac962e67-c9ea-4fcd-93a9-a4fe38d7bb71.png)
# Cấu hình VSFTPD

### Bước 1: Tạo một bản sao để cấu hình mặc định:

```
cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.default
```

### Bước 2: Mở tệp `vsftpd.conf`

```
nano /etc/vsftpd/vsftpd.conf
```

![image](https://user-images.githubusercontent.com/111721629/193771981-a7805ddf-0fd6-4b86-b68b-54f6201978ad.png)

### Bước 3: Tìm và sửa các mục dưới đây
**Dùng Ctrl+W để tìm kiếm nhanh**
```
anonymous_enable=NO

local_enable=YES

write_enable=YES

```

![image](https://user-images.githubusercontent.com/111721629/193772252-e57ab69d-e34a-4003-a15e-92cfe43dce43.png)

```
chroot_local_user=YES
```

![image](https://user-images.githubusercontent.com/111721629/193772401-2704c175-307c-4b5c-8de8-6970d68698f2.png)

```
userlist_enable=YES
```

![image](https://user-images.githubusercontent.com/111721629/193772462-a9f63869-d58b-4a4f-8f49-6ae8e0bfefd6.png)

### bước 4: Lưu thay đổi và reset lại dịch vụ 

```
systemctl restart vsftpd
```

# Tạo người dùng FTP mới

- Tạo tài khoản user mới:

```
sudo adduser username

sudo passwd username
```

Sau khi tạo người dùng mới, hệ thống sẽ nhắc bạn nhập và xác nhận mật khẩu người dùng mới.

![image](https://user-images.githubusercontent.com/111721629/193772934-06ea00ce-65f1-4003-baf8-c02ec7d62a41.png)

**- Thêm người dùng vào userlist**

```
echo "username" | sudo tee -a /etc/vsftpd/user_list
```

![image](https://user-images.githubusercontent.com/111721629/193773055-fe0989bf-95a4-4ed4-87c1-a5d8b8bed040.png)

**- Tạo một thư mục cho người dùng mới, điều chỉnh các quyền:**

```
sudo mkdir –p /home/username/ftp/upload
sudo chmod 550 /home/usename/ftp
sudo chmod 750 /home/username/ftp/upload
sudo chown –R username: /home/username/ftp
```
![image](https://user-images.githubusercontent.com/111721629/193773768-845654f8-00e2-4b9b-b32f-abf991de53cb.png)

**- Truy cập vào FTP**

```
ftp localhost
```

![image](https://user-images.githubusercontent.com/111721629/193773926-6c2be7d2-b2dd-45c5-9314-8e0c709d480c.png)
