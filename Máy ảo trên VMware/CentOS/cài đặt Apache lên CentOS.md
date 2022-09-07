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
