# Một số linux command cơ bản trong quản trị mạng
 
## 1. ifconfig

- `ifconfig -a` - Liệt kê tất cả các inteface hiện đang có, kể cả các interface không sử dụng.
- `ifconfig <interface>` - Thông tin chi tiết của một interface cụ thể.
- `ifconfig <interface> <address> netmask <address>` - Gán địa chỉ IP và Gateway cho một giao diện. Tuy nhiên, các cấu hình này sẽ được thiết lập lại sau khi hệ thống khởi động lại.
- `ifup <interface> hay ifdown <interface>` - Để bật hay tắt một interface.

![image](https://user-images.githubusercontent.com/111716161/188848360-36227ced-48bc-44fa-abb0-94a32eb53f0a.png)

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
  
![image](https://user-images.githubusercontent.com/111716161/188849988-6fe2f46d-cbcb-4aad-ab01-e00320de6325.png)

## 4. ping

- `ping <destination>` - Lệnh ping gửi gói tin echo ICMP để kiểm tra kết nối mạng, destination có thể là tên miền hoặc địa chỉ ip trực tiếp
- `ping -c <number> <destination>` - Bạn có thể giới hạn số lượng gói tin bằng cách thêm " -c " vào lệnh ping.
  
  ![image](https://user-images.githubusercontent.com/111716161/188851488-abcee0de-dff3-48e8-a402-ce44399f7bc4.png)

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

![image](https://user-images.githubusercontent.com/111716161/188853828-13ef1887-625a-42eb-8175-c70c7eff7e1f.png)

Và có thể curl với những lệnh thường xuyên sử dụng dưới đây, ví dụ lấy về nội dung của trang web www.google.com.

`curl http://www.google.com`

![image](https://user-images.githubusercontent.com/111716161/188854122-8ef91822-424e-4f0b-a740-170485c182aa.png)

# Đổi tên Network interface trong CentOS 7
Kiểm tra tên Network interface hiện tại

`ip a`

![image](https://user-images.githubusercontent.com/111716161/188854689-053817a3-cc4a-4869-81b6-ca0a0128dafe.png)

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

![image](https://user-images.githubusercontent.com/111716161/188855148-ae12e3b2-e2c3-41dc-86d1-36be65f500b4.png)

Sinh lại tệp GRUB và ghi đè lên tệp hiện có.

```
grub2-mkconfig -o /boot/grub2/grub.cfg
```

![image](https://user-images.githubusercontent.com/111716161/188855323-b56f48f2-2813-4d26-9da0-b4415d472b86.png)

### 2. Chỉnh sửa file cấu hình mạng
Chỉnh sửa file cấu hình mạng ban đầu là ens33. Tại mục NAME và DEVICE, ta đổi từ ens33 thành eth0.

Lệnh sửa tên file cấu hình mạng: ifcfg-ens33 thành ifcfg-eth0:

```
mv /etc/sysconfig/network-scripts/ifcfg-ens33 /etc/sysconfig/network-scripts/ifcfg-eth0
```

Chỉnh sửa file cấu hình card mạng interface “ifcfg-eth0” và thay đổi giá trị biến “NAME”  và biến ‘DEVICE‘ trong file thành giá trị tên mới tương ứng “eth0“.

```
nano /etc/sysconfig/network-scripts/ifcfg-eth0
```

![image](https://user-images.githubusercontent.com/111716161/189061565-d17200b5-482c-4b50-8a11-020e2ca82630.png)

### 3. Disable NetworkManager
Đảm bảo rằng NetworkManager không hoàn nguyên các thay đổi khi khởi động lại máy hay khởi động lại mạng.

```
systemctl disable NetworkManager
```

![image](https://user-images.githubusercontent.com/111716161/188855697-2b73a6b5-5dc8-4b8b-9781-46634081c31c.png)

### 4. Reboot máy
Reboot máy để những thay đổi được thực hiện.

```
reboot
```

### 5. Kiểm tra lại tên thiết bị đã được đổi tên
```
ip a
```

![image](https://user-images.githubusercontent.com/111716161/189062150-04a55b5e-b118-4777-b04f-bf5c26532766.png)

Kiểm tra kết nối Internet: `ping 8.8.8.8`

![image](https://user-images.githubusercontent.com/111716161/189062302-b24b81ec-a2b0-4ccc-8a7a-84b46ec87aed.png)

Tên Network interface đã được đổi thành công từ ens33 sang eth0 và hoạt động bình thường.
