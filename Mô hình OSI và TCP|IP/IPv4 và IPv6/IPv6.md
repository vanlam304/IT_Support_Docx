# IPv6

IPv6 (Internet Protocol version 6) là phiên bản mới nhất của Giao thức Internet (IP), giao thức truyền thông cung cấp một hệ thống định vị vị trí cho các máy tính trên mạng và định tuyến lưu lượng trên Internet.

Trong thời đại Internet bùng nổ và trở nên phổ biến, lượng địa chỉ IPv4 ngày càng cạn kiệt, bộc lộ các hạn chế đối với việc phát triển các loại hình dịch vụ hiện đại trên Internet, không đáp ứng đủ nhu cầu người dùng. Được IETF tạo ra để thay thế và khắc phục những lỗi của IPv4,  IPv6  ra đời.. 

# Ưu điểm vượt trội của IPv6

**Không gian địa chỉ lớn hơn và dễ dàng quản lý hơn:** Tăng từ 32bit lên 128bit.

**Header của giao thức được cải tiến:** Cải thiện hiệu suất chuyển tiếp gói tin.. Khôi phục lại nguyên lý kết nối đầu cuối-đầu cuối của Internet và loại bỏ hoàn toàn công nghệ NAT

**Quản trị TCP/IP dễ dàng hơn:**  IPv6 được thiết kế với khả năng tự động cấu hình mà không cần sử dụng máy chủ DHCP, hỗ trợ nhiều trong việc giảm cấu hình thủ công.

**Cấu trúc định tuyến tốt hơn:** Định tuyến IPv6 được thiết kế hoàn toàn phân cấp. Khả năng QoS (Quality of service) giúp đánh dấu QoS cho các gói tin và dán nhãn để giúp xác định những traffic cần được ưu tiên.

**Hỗ trợ tốt hơn Multicast:** Tăng cường sử dụng truyền thông một chiều hiệu quả.

**Hỗ trợ bảo mật tốt hơn:** Mã hóa và xác thực truyền thông.

**Tính di động:** Dễ dàng hơn khi xử lý với thiết bị di động hay chuyển vùng

**Jumbograms:** Hỗ trợ các packet payload cực lớn cho hiệu quả cao hơn.

**Anycast:** Dịch vụ dự phòng sử dụng những địa chỉ không có cấu trúc đặc biệt.

# Địa chỉ IPv6 được biểu diễn như thế nào?

Vẫn giữ đặc trưng là một chuỗi tập hợp của các con số có giới hạn, được sắp xếp thành 1 dãy số có quy luật, địa chỉ IPv6  có chiều dài ấn tượng:128bit

Địa chỉ IPv6 được biểu diễn dưới dạng các cụm số hexa được ngăn thành 8 phần, mỗi phần có chiều dài 16bit và được ngăn bởi dấu “:”

Với 128 bit chiều dài, không gian địa chỉ IPv6 gồm 2128 địa chỉ, cung cấp một lượng địa chỉ khổng lồ cho hoạt động Internet.

# Phân loại

**Unicast**
Một địa chỉ unicast được định nghĩa duy nhất trên một cổng của một node IPv6. Một gói tin được gởi đến một địa chỉ unicast được đưa đến cổng được định nghĩa bởi địa chỉ đó.

**Multicast**
Một địa chỉ multicast định nghĩa một nhóm các cổng IPv6. Một gói tin gởi đến địa chỉ multicast được xử lý bởi tất cả những thành viên của nhóm multicast.

**Anycast**
Một địa chỉ anycast được đăng kí cho nhiều cổng (trên nhiều node). Một gói tin được gởi đến một địa chỉ anycast là được chuyển đến chỉ một trong số các cổng này.

# Cách chuyển IPv4 sang IPv6 và ngược lại

Ví dụ chúng ta có dải địa chỉ IPv4: 192.168.25.234. Để chuyển địa chỉ IPv4 sang IPv6 và ngược lại chúng ta sẽ có 2 cách chính như sau:

### Chuyển IPv4 sang IPv6 thủ công

Với địa chỉ IPv4 trên, chúng ta phân ra làm 4 vùng, lấy mỗi vùng chia cho 16 và ghi kết quả đạt như sau:

192 : 16 = 12 dư 0

168 : 16 = 10 dư 8

25 : 16 = 1 dư 9

234 : 16 = 14 dư 10

So sánh với giá trị HEX chúng ta có:

A = 10

B = 11

C = 12

D = 13

E = 14

F = 15

Dựa vào kết quả của phép tính trên, ghép kết quả và số dư lại sẽ được: C0A8:19EA

Như vậy chúng ta sẽ có địa chỉ IPv6 của 192.168.25.234 là C0A8:19EA

Địa chỉ IPv4 chỉ có 32bit, trong khi địa chỉ IPv6 là 128bit. Chính vì thế ta còn thiếu 96bit. 96bit này là 1 dãy số 0. Do đó, để ghi chính xác, chúng ta sẽ có 2 cách ghi như sau :

Cách ghi đầy đủ 0000:0000:0000:0000:0000:0000:C0A8:19EA

Cách ghi rút gọn ::C0A8:19EA


### Để chuyển ngược lại địa chỉ IPv6 thành IPv4 chúng ta làm như sau:

C0 = (12 x 16) + 0 = 192

A8 = (10 x 16) + 8 = 168

19 = (1 x 16) + 9 = 25

EA = (14 x 16) + 10 = 234

Như vậy chúng ta sẽ có địa chỉ IPv4 của C0A8:19EA là 192.168.25.234

### Chuyển IPv4 sang IPv6 trực tuyến

Hiện nay có khá nhiều trang web dịch vụ hỗ trợ chuyển IPv4 sang IPv6 và ngược lại nhanh chóng. Bạn đọc có thể tham khảo một số trang dịch vụ sau:

ultratools.com/tools

ipv6.ztsoftware

Subnetonline.com

Cách sử dụng khá đơn giản, chỉ cần nhập địa chỉ IPv4 hay IPv6 cần chuyển đổi vào đúng công cụ chuyển đổi là thành công.
