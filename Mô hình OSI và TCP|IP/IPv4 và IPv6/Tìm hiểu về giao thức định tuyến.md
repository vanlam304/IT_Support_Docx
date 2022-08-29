# Giao thức định tuyến

Giao thức định tuyến là ngôn ngữ giao tiếp giữa các router. Một giao thức định tuyến cho phép các router chia sẻ thông tin về các network, router sử dụng các thông tin này để xây dựng và duy trì bảng định tuyến.

#### Bảng định tuyến của mỗi giao thức định tuyến là khác nhau, nhưng có thể bao gồm những thông tin sau:

- Địa chỉ đích của mạng, mạng con hoặc hệ thống.

- Địa chỉ IP của router chặng kế tiếp phải đến.

- Giao tiếp vật lí phải sử dụng để đi đến Router kế tiếp.

- Subnet mask của địa chỉ đích.

- Khoảng cách đến đích (ví dụ: số lượng chặng để đến đích).

- Thời gian (tính theo giây) từ khi Router cập nhật lần cuối.


#  Phân loại định tuyến

Có nhiều tiêu chí để phân loại các giao thức định tuyến khác nhau. Định tuyến được phân chia thành 2 loại cơ bản:

- Định tuyến tĩnh: Việc xây dựng bảng định tuyến của router được thực hiện bằng tay bởi người quản trị.

- Định tuyến động: Việc xây dựng và duy trì trạng thái của bảng định tuyến được thực hiện tự động bởi router.

**Việc chọn đường đi được tuân thủ theo 2 thuật toán cơ bản:**

+ Distance vector: Chọn đường đi theo hướng và khoảng cách tới đích.

+ Link State: Chọn đường đi ngắn nhất dựa vào cấu trúc của toàn bộ mạng theo trạng thái của các đường liên kết mạng.

<p>
  <img src="https://vnpro.vn/upload/user/images/Th%C6%B0%20Vi%E1%BB%87n/tong-quan-ve-dinh-tuyen.jpg">
  </p>


# Chi tiết về định tuyến tĩnh

###1. Khái niệm

Định tuyến tĩnh là quá trình router thực hiện chuyển gói dữ liệu tới địa chỉ mạng đích dựa vào địa chỉ IP đích của gói dữ liệu. Để chuyển được gói dữ liệu đến đúng đích thì router phải học thông tin về đường đi tới các mạng khác. Thông tin về đường đi tới các mạng khác sẽ được người quản trị cấu hình cho router. Khi cấu trúc mạng thay đổi, người quản trị mạng phải tự thay đổi bảng định tuyến của router.

Kỹ thuật định tuyến tĩnh đơn giản, dễ thực hiện, ít hao tốn tài nguyên mạng và CPU xử lý trên router (do không phải trao đổi thông tin định tuyến và không phải tính toán định tuyến). Tuy nhiên kỹ thuật này không hội tụ với các thay đổi diễn ra trên mạng và không thích hợp với những mạng có quy mô lớn (khi đó số lượng route quá lớn, không thể khai báo bằng tay được).

**Ưu điểm:**

+ Sử dụng ít bandwidth hơn định tuyến động.

+ Không tiêu tốn tài nguyên để tính toán và phân tích gói tin định tuyến.

- Nhược điểm:

+ Không có khả năng tự động cập nhật đường đi.

+ Phải cấu hình thủ công khi mạng có sự thay đổi.

+ Phù hợp với mạng nhỏ, rất khó triển khai trên mạng lớn.

**Một số tình huống bắt buộc dùng định tuyến tĩnh:**

+ Đường truyền có băng thông thấp

+ Người quản trị mạng cần kiểm soát các kết nối.

+ Kết nối dùng định tuyến tĩnh là đường dự phòng cho đường kết nối dùng giao thức định tuyến động.

+ Chỉ có một đường duy nhất đi ra mạng bên ngoài (mạng stub).

+ Router có ít tài nguyên và không thể chạy một giao thức định tuyến động.

+ Người quản trị mạng cần kiểm soát bảng định tuyến và cho phép các giao thức classful và classless.

### 2. Cấu hình định tuyến tĩnh

<p>
  <img src="https://vnpro.vn/upload/user/images/Th%C6%B0%20Vi%E1%BB%87n/S%C6%A1-%C4%91%E1%BB%93-v%C3%AD-d%E1%BB%A5.jpg">
  </p>
  
  Hình trên là hai router, R1 sử dụng cổng f0/0 đấu xuống mạng LAN có subnet 192.168.1.0/24. Tương tự, R2 sử dụng cổng f0/0 đấu xuống PC có subnet 192.168.2.0/24. Subnet sử dụng cho kết nối leased-line nối giữa hai router là 192.168.3.0/24. Đầu tiên, chúng ta phải cấu hình đặt địa chỉ IP cho các cổng của router, cũng như IP và Default-gateway cho các PC. Default-gateway hiểu đơn giản là IP của cổng của router gần nhất mà PC đó kết nối trực tiếp đến.

**Cấu hình định tuyến tĩnh trên router Cisco được thực hiện bằng cách sử dụng lệnh có cú pháp như sau:**

Router (config) # ip route *destination_subnet subnetmask{IP_next_hop*|output_interface} [AD]

Trong đó:

*destination_subnet*: mạng đích đến.

*subnetmask*: subnet – mask của mạng đích.

*IP_next_hop*: địa chỉ IP của trạm kế tiếp trên đường đi.

*output_interface*: cổng ra trên router.

*AD*: chỉ số AD của route khai báo, sử dụng trong trường hợp có cấu hình dự phòng.

Trong ví dụ hình trên, từ R1 muốn đi đến mạng 192.168.2.0/24 thì phải đi ra khỏi cổng f1/0. Để thể hiện điều đó vào bảng định tuyến phải thực hiện cấu hình:

*R1 (config) # ip route 192.168.2.0 255.255.255.0 f1/0*

hoặc

*R1 (config) # ip route 192.168.2.0 255.255.255.0 192.168.3.2*

R2 muốn đi đến mạng 192.168.1.0/24 thì phải đi ra khỏi cổng f1/0:

*R2 (config) # ip route 192.168.1.0 255.255.255.0 f1/0*

hoặc

*R2 (config) # ip route 192.168.1.0 255.255.255.0 192.168.3.1*

Sau khi đã cấu hình xong các route cho các mạng 192.168.1.0/24 và 192.168.2.0/24, kiểm tra bảng định tuyến trên mỗi router: Bảng định tuyến của R1:

*R1#show ip route

*C 192.168.1.0/24 is directly connected, FastEthernet0/0

*S 192.168.2.0/24 [1/0] via 192.168.3.2

*C 192.168.3.0/24 is directly connected, FastEthernet1/0

Bảng định tuyến của R2:

*R2#show ip route

*S 192.168.1.0/24 [1/0] via 192.168.3.1

*C 192.168.2.0/24 is directly connected, FastEthernet0/0

*C 192.168.3.0/24 is directly connected, FastEthernet1/0

Kí tự “S” ở đầu dòng thể hiện rằng các thông tin định tuyến này được học vào bảng định tuyến thông qua định tuyến tĩnh và các dòng mô tả các mạng kết nối trực tiếp được ký hiệu bởi kí tự “C” – connected – kết nối trực tiếp.

### 3. Default route

Được dùng để định tuyến mặc định tất cả dữ liệu đến một mạng bất kỳ đi theo đường nào đó. Nhưng nếu mạng đó đã có đường đi trong bảng định tuyến, thì gói tin sẽ ưu tiên đi theo đường đi rõ ràng trước.

Router (config) # ip route 0.0.0.0 0.0.0.0 {ip next-hop | exit interface}
