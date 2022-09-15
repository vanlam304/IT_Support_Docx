# Một số linux command cơ bản trong quản trị mạng
 
## 1. ifconfig

- `ifconfig -a` - Liệt kê tất cả các inteface hiện đang có, kể cả các interface không sử dụng.
- `ifconfig <interface>` - Thông tin chi tiết của một interface cụ thể.
- `ifconfig <interface> <address> netmask <address>` - Gán địa chỉ IP và Gateway cho một giao diện. Tuy nhiên, các cấu hình này sẽ được thiết lập lại sau khi hệ thống khởi động lại.
- `ifup <interface> hay ifdown <interface>` - Để bật hay tắt một interface.

![image](https://user-images.githubusercontent.com/111721629/189088966-c892aa73-a31f-4ea6-8cc2-19f5eb17d340.png)

## 2. ip

- `ip a` - Lệnh này cung cấp thông tin chi tiết của tất cả các mạng như ifconfig.
- `ip link` - Cấu hình, thêm và xóa các interface. Sử dụng ip link show để hiển thị tất cả các interface trên hệ thống.
- `ip address` - Hiển thị địa chỉ ip, gắn địa chỉ ip mới hoặc xóa địa chỉ ip chỉ cũ.
- `ip route` - Được sử dụng để Cấu hình quản lý bảng định tuyến.

![image](https://user-images.githubusercontent.com/111716161/188849728-347c0b93-515b-486b-9aee-13d2b24fec8c.png)
## 3. hostname

- `hostname` - Hiển thị hostname
- `hostname --all-ip-addresses` - Hiển thị tất cả các địa chỉ IP
- `sudo hostname <new hostname>` - Thay đổi hostname. Tuy nhiên thay đổi bằng hostname chỉ tạm thời. Sau khi reboot, hostname sẽ bị đưa trở về như cũ.
  
![image](https://user-images.githubusercontent.com/111721629/189099342-ebd16571-b5ec-4e7d-8f10-fe37f99bd25f.png)

## 4. ping

- `ping <destination>` - Lệnh ping gửi gói tin echo ICMP để kiểm tra kết nối mạng, destination có thể là tên miền hoặc địa chỉ ip trực tiếp
- `ping -c <number> <destination>` - Bạn có thể giới hạn số lượng gói tin bằng cách thêm " -c " vào lệnh ping.
  
  ![image](https://user-images.githubusercontent.com/111721629/189099522-c97f6746-1049-4bb0-b2b2-ad3f91c63a2f.png)
  

## 5. telnet

telnet là lệnh sẽ thực hiện kết nối máy chủ và máy đích thông qua một port bằng cách sử dụng giao thức telnet TCP/IP. Nếu kết nối được thiết lập có nghĩa là kết nối giữa hai máy đang hoạt động tốt. Trong trường hợp bạn không xác định một port cụ thể nào thì telnet sẽ sử dụng port mặc định là 23. 
  
`telnet <hostname/IP address> <port> `

## 6. traceroute

traceroute chính là một trong những lệnh hữu ích nhất trong khắc phục sự cố mạng qua những thông tin mà lệnh này cung cấp gồm:

- Cung cấp tên và xác định mọi thiết bị trên đường dẫn.
- Theo dõi lộ trình để đến đích của gói tin.
- Xác định và chỉ ra vị trí các sự cố trong kết nối mạng, độ trễ trong kết nối mạng đến từ đâu.

`traceroute <option> <destination>`
  
## 7. nslookup
nslookup là lệnh được sử dụng để thực hiện các tra cứu liên quan đến DNS. nslookup có thể cho chúng ta biết các thông tin quan trọng như MX records và địa chỉ IP liên kết với tên miền.

`nslookup <domainName>`

## 8. dig
dig là viết tắt của Domain Information Groper, có nghĩa là công cụ tìm kiếm thông tin tên miền. Nó có tác dụng để kiểm tra và xử lí sự cố DNS Server, tìm kiếm DNS và hiển thị các nội dung được yêu cầu. Lệnh dig như là một phiên bản mới hơn của nslookup, có thể thay thế cho những công cụ cũ trước đây là nslookup hay host và được sử dụng phổ biến để khắc phục sự cố DNS vì tính linh hoạt và dễ sử dụng của nó.

- `dig <domainName>` - Đây là lệnh truy vấn DNS cơ bản. Theo mặc định, nó sẽ xuất ra các bản ghi A
- `dig <domainName> MX` - Truy vấn các bản ghi MX
- `dig <domainName> NS` - Truy vấn các bản ghi NS
- `dig <domainName> ANY` - Truy vấn tất cả các loại bản ghi
  
## 9. netstat

netstat là một công cụ dòng lệnh rất hữu ích khi nó giúp ta hiển thị các thông tin bảng định tuyến, thông tin kết nối, trạng thái của các cổng, các cài đặt và nhiều các thống kê mạng khác nhau,...

Một số cú pháp lệnh netstat:

- `netstat -i` - Liệt kê các interface
- `netstat -r` - Hiển thị bảng định tuyến

## 10. curl 

Lệnh curl là 1 công cụ để truy cập trang web thông qua command, curl hỗ trợ những protocol khác nhau như FILE, FTP, FTPS, Gopher, HTTP, HTTPS, IMAP, LDAP, POP3, RTSP, SMTP, …

Mặc định curl chưa có sẵn trong Linux, để cài đặt curl từ Ubuntu repository sử dụng lệnh sau:

`yum install curl`

![image](https://user-images.githubusercontent.com/111721629/189258070-bdff0d84-c3eb-422d-83b6-ee5dcdbd9bd2.png)

Và có thể curl với những lệnh thường xuyên sử dụng dưới đây, ví dụ lấy về nội dung của trang web www.google.com.

`curl http://www.google.com`

![image](https://user-images.githubusercontent.com/111721629/189258183-c6b719d5-ebe7-42d2-8bb2-2e8c1849f062.png)

# Đổi tên Network interface trong CentOS 7
Kiểm tra tên Network interface hiện tại

`ip a`

![image](https://user-images.githubusercontent.com/111721629/189258264-75d0a874-50a3-42ff-bd86-a0d07fafb986.png)

Ta thấy tên hiện tại của Network interface là ens33. Các bước dưới đây sẽ mô tả cách đưa tên Network interface về dạng eth0, eth1, …

### 1. Chỉnh sửa tham số Kernel boot

Chỉnh sửa file `/etc/default/grub`.

```
nano /etc/default/grub
```
Tìm đến dòng `GRUB_CMDLINE_LINUX` và thêm đoạn sau `net.ifnames=0 biosdevname=0`. Ta sẽ được dòng sau:

```
GRUB_CMDLINE_LINUX=" crashkernel=auto net.ifnames=0 biosdevname=0 rhgb quiet"
```

![image](https://user-images.githubusercontent.com/111721629/189259534-75d15e6b-7f8c-4be1-900e-5de45f398f5a.png)

Sinh lại tệp GRUB và ghi đè lên tệp hiện có.

```
grub2-mkconfig -o /boot/grub2/grub.cfg
```

![image](https://user-images.githubusercontent.com/111721629/189259759-c8676c4e-08f1-4b29-932a-3c5c2192a56f.png)

### 2. Chỉnh sửa file cấu hình mạng
Chỉnh sửa file cấu hình mạng ban đầu là ens33. Tại mục NAME và DEVICE, ta đổi từ ens33 thành eth0.

Lệnh sửa tên file cấu hình mạng: ifcfg-ens33 thành ifcfg-eth0:

```
mv /etc/sysconfig/network-scripts/ifcfg-ens33 /etc/sysconfig/network-scripts/ifcfg-eth0
```

Chỉnh sửa file cấu hình card mạng interface “ifcfg-eth0” và thay đổi giá trị biến “NAME”  và biến ‘DEVICE‘ trong file thành giá trị tên mới tương ứng ““.

```
nano /etc/sysconfig/network-scripts/ifcfg-eth0
```

![image](https://user-images.githubusercontent.com/111721629/189260254-565a4a88-79d7-457b-8225-c9c77142f694.png)

### 3. Disable NetworkManager
Đảm bảo rằng NetworkManager không hoàn nguyên các thay đổi khi khởi động lại máy hay khởi động lại mạng.

```
systemctl disable NetworkManager
```

![image](https://user-images.githubusercontent.com/111721629/189260326-0d0771e1-e007-4e66-b788-f2213d869fbf.png)

### 4. Reboot máy
Reboot máy để những thay đổi được thực hiện.

```
reboot
```

### 5. Kiểm tra lại tên thiết bị đã được đổi tên
```
ip a
```

![image](https://user-images.githubusercontent.com/111721629/189260839-a12451d1-f568-4b73-a730-d0a673160e1b.png)

Kiểm tra kết nối Internet: `ping 8.8.8.8`

![image](https://user-images.githubusercontent.com/111721629/189260888-b944a5c2-303e-4129-9ce8-ff7c8485ba41.png)

Tên Network interface đã được đổi thành công từ ens33 sang eth0 và hoạt động bình thường.
