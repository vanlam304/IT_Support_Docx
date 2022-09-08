#  Cài đặt Apache
B1: Cài đặt repo Epel :
```
yum install -y epel-release
```

![image](https://user-images.githubusercontent.com/111721629/188775772-55b9ba43-09ed-4599-975f-eb7e15aafd42.png)

![image](https://user-images.githubusercontent.com/111721629/188775709-7cb7d7d8-a59c-40a8-8af3-4ea9794cb1ab.png)


B2: Cài đặt gói httpd :
```
yum install -y httpd
```
![image](https://user-images.githubusercontent.com/111721629/188776062-380d98de-0b93-4fd3-85e8-9f347ed82d7c.png)



B3: Cấu hình Firewalld Cho phép dịch vụ httpd  :
```
firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --reload
```
![image](https://user-images.githubusercontent.com/111721629/188776584-18ee377f-b3a5-4fbe-86f0-83f815a862d0.png)

B4: Khởi động dịch vụ httpd và cấu hình tự khởi động khi boot  :
```
systemctl start httpd
systemctl enable httpd
```
![image](https://user-images.githubusercontent.com/111721629/188776993-05fe24f9-6fdd-4a7d-960d-bbb82dedc725.png)

B5: Kiểm tra trạng thái dịch vụ httpd :
```
systemctl status httpd
```
![image](https://user-images.githubusercontent.com/111721629/188777085-fcef20d5-5f69-4f01-bb3b-1bc3f160db5d.png)

# Gỡ cài đặt Apache
```
yum remove httpd -y
```
![image](https://user-images.githubusercontent.com/111721629/188777480-ea8e4a1b-d5dc-4e80-b28b-eb4d288f27c5.png)

# Kiểm tra version Apache đã cài
```
httpd -v
```
![image](https://user-images.githubusercontent.com/111721629/188777231-8ab06d28-b6fa-4b92-a290-df6ea92e4631.png)

# Quản lý Apache Service với systemctl

Để dừng Apache, dùng lệnh:
```
systemctl stop httpd
```
Để khởi động Apache dùng lệnh:
```
systemctl start httpd
```
Lệnh khởi động lại Apache:
```
systemctl restart httpd
```
Tải lại dịch vụ Apache mỗi khi bạn thay đổi cấu hình:
```
systemctl reload httpd
```
Nếu không muốn Apache tự động chạy mỗi khi khởi động lại VPS sử dụng lệnh sau:
```
systemctl disable httpd
```
Nếu muốn Apache tự động chạy mỗi khi khởi động lại VPS sử dụng lệnh sau:
```
systemctl enable httpd
```

# Các file cấu hình

Tất cả các file cấu hình của Apache đều nằm trong thư mục */etc/httpd.*

File cấu hình chính của Apache là */etc/httpd/conf/httpd.conf.*

Tất cả các tệp cấu hình đều phải kết thúc bằng *.conf* và nằm trong thư mục */etc/httpd/conf.d.*

Các tệp cấu hình chịu trách nhiệm tải các modules Apache được đặt trong thư mục */etc/httpd/conf.modules.d.*

Để quản lý tốt hơn, nên tạo một tệp cấu hình riêng (vhost) cho mỗi tên miền.

Các tệp vhost Apache phải kết thúc bằng .conf và được lưu trữ trong thư mục /etc/httpd/conf.d. 

Ví dụ: nếu tên miền của bạn là mydomain.com thì tệp cấu hình sẽ được đặt tên ***/etc/httpd/conf.d/mydomain.com.conf***

Các file log của Apache (access_log và error_log) nằm trong thư mục /var/log/httpd/. Bạn nên có file log riêng cho mỗi vhost.

# Tạo Virtualhost (Vhost)

### Bật userdir

Mặc định thư mục chứa code sẽ nằm trong /var/www/html, với chức năng userdir cho phép di chuyển thư mục chứa code sang vị trí khác đồng thời dễ dàng quản lý vhost theo từng user.

Để bật Userdir các bạn mở file /etc/httpd/conf.d/userdir.conf.

**nano /etc/httpd/conf.d/userdir.conf**

Tại đây các bạn cần sửa các rules sau

UserDir disabled

#UserDir public_html

Sửa lại thành như sau

#UserDir disabled

UserDir public_html

và sửa khúc cuối thành như này

![image](https://user-images.githubusercontent.com/111721629/188820952-67ed4909-3a9b-43e2-8c20-73d24e48bece.png)

### Chặn truy cập IP VPS tự động redirect về website trên VPS

Theo mặc định thì khi truy cập IP của VPS hoặc khi trỏ một tên miền về VPS mà tên miền này không được cấu hình vhost thì bạn sẽ được redirect tới một website bất kỳ trên VPS, điều này là không nên và để hạn chế điều này các bạn mở file /etc/httpd/conf/httpd.conf

***nano /etc/httpd/conf/httpd.conf***

Thêm phía trên dòng IncludeOptional conf.d/*.conf rules sau:
```
<VirtualHost *:80>
	DocumentRoot /var/www/html
	ServerName www.example.com
	<Directory "/var/www/html">
		AllowOverride All
                Options None
                Require method GET POST OPTIONS
	</Directory>
</VirtualHost>
```

### Tạo virtual host (vhost) cho website

Virtual Host là file cấu hình trong Apache để cho phép nhiều domain cùng chạy trên một máy chủ. Có một khái niệm khác được đề cập tới trong Nginx cũng có chức năng tương tự như Virtual Host được gọi là Server Block.

Tất cả các file vhost sẽ nằm trong thư mục /etc/httpd/conf.d/. Để tiện quản lý mỗi website nên có một vhost riêng, ví dụ: vanlam.net.conf

Trong ví dụ này sẽ tạo website vanlam.com với vhost tương ứng là /etc/httpd/conf.d/vanlam.net.conf

***nano /etc/httpd/conf.d/vanlam.net.conf***

Dán nội dung sau vào
```
<VirtualHost *:80>
        ServerName www.vanlam.net
        ServerAlias vanlam.net
        DocumentRoot /home/vanlam.net/public_html
        ErrorLog /home/vanlam.net/logs/error_log
        CustomLog /home/vanlgs/access_log combined
</VirtualHost

```
Tiếp theo các bạn cần tạo thư mục chứa mã nguồn website và thư mục chứa file log bằng các lệnh sau
```
mkdir -p /home/vanlam.net/public_html

mkdir -p /home/vanlam.net/logs

chown -R apache:apache /home/vanlam.net

```
Reload lại Apache để cập nhật cấu hình
```
systemctl reload httpd
```
Sau khi cấu hình hoàn tất các bạn trỏ tên miền về vps sau đó tạo file */home/vanlam.net/public_html/index.html*

***nano /home/vanlam.net/public_html/index.html***

Dán nội dung sau vào
```
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Cài Apache lên CentOS 7</title>
</head>
<body>
	<p><center><?= "Văn Lâm vjppro" ?></center></p>
</body>
</html>
```


## Cuối cùng test thử với vanlam.net

