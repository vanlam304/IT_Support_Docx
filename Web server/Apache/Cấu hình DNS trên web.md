# Gắn miền cho IP

### 1. Sử dụng lệnh ip add để check IP của Centos 7

```
ip address
```

![image](https://user-images.githubusercontent.com/111721629/189013004-cff17006-df13-4254-9155-b2b6593a97a8.png)
IP ở đây là 192.168.157.134

### 2. Gắn miền cho IP, sử dụng lệnh vi /etc/hosts để cài DNS cho địa chỉ IP

```
vi /etc/hosts
```

### 3. Sử dụng phím tắt Insert trên bàn phím để sửa tập tin và thêm DNS và miền
![image](https://user-images.githubusercontent.com/111721629/189013171-27b0e7b9-47e6-4157-9f1e-81acf01d743d.png)

### 4. Tiếp theo ấn phím tắt Esc trên bàn phím để thoát chế độ chỉnh sửa và sử dụng lệnh :wq để lưu lại và gõ Enter để lưu
![image](https://user-images.githubusercontent.com/111721629/189013263-0ad245b8-fca1-42d4-84e9-dc095abc6f87.png)

# Tạo file trên DNS

### 1. Sử dụng cd /etc/httpd/ đây là thư mục cấu hình cho httpd

``` 
cd /etc/httpd/
```

![image](https://user-images.githubusercontent.com/111721629/189013345-ee8dcf49-ed44-40db-86b1-4f887968cecb.png)
### 2. Gõ ls để kiếm tra các file cấu hình:

```
ls
```

![image](https://user-images.githubusercontent.com/111721629/189013386-3f2d423f-c48b-427e-a30d-0a8923b0ec73.png)

### 3. Gõ cd conf để vào file cấu hình web và gõ cd /var/www/html để truy cập vào file tạo web

```
cd conf
cd /var/www/html
```

![image](https://user-images.githubusercontent.com/111721629/189013453-16f8ff18-7bbd-4e69-adbc-879f95cec2a1.png)

### 4. Gõ vi index.html để tạo một trang web riêng, nhập nội dung hiển thị và lưu lại. 

```
vi index.html
```

![image](https://user-images.githubusercontent.com/111721629/189013621-12f5d2a1-ac7d-4a8f-affd-aee03cc6324c.png)

### 5. Truy cập "vanlam.net"
![image](https://user-images.githubusercontent.com/111721629/189013683-d72722f1-7aa3-4612-98c9-87d185adbc2f.png)




