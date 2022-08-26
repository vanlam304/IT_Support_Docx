# Đầu tiên cần hiểu IP là gì?

Địa chỉ IP (IP viết tắt của Internet Protocol - giao thức Internet) là số định dạng cho một phần cứng mạng, các thiết bị sử dụng địa chỉ IP để liên lạc với nhau qua mạng dựa trên IP như mạng Internet.

Hầu hết các địa chỉ IP có dạng như sau: 151.101.65.121, đây là địa chỉ IPv4. Một số địa chỉ IP khác có dạng: 2001:4860:4860::8844, đây là địa chỉ IPv6.

# IPv4

IPv4 là phiên bản IP thế hệ thứ 4, nó được sử dụng nhiều nhất hiện nay bên cạnh IPv6. Hai phiên bản IP này là yếu tố chủ chốt cho việc giao tiếp giữa các thiết bị trong mạng internet.

IPv4 được ứng dụng trong các hệ thống chuyển mạch gói. Vai trò của nó là định hướng dữ liệu truyền đi. Khi truyền đi các gói tin, giao thức này chỉ đảm bảo phần truyền tải mà không để ý đến thứ tự truyền gói tin hoặc vấn đề gói tin có đến đích hay không, có lặp lại ở máy đích hay không. Vấn đề này sẽ được giải quyết ở tầng cao hơn của hệ thống TCP/IP. Một điều mà IPv4 đảm bảo được đó là tính toàn vẹn dữ liệu bằng cách sử dụng kết quả của việc chạy thuật toán Checksum để kiểm tra.

# Cấu trúc của địa chỉ IPv4

Về cấu tạo, địa chỉ IPv4 sẽ có 32 bit và được biểu diễn thành một dãy số nhị phân và chia thành 4 cụm. Mỗi cụm như vậy sẽ gọi là octet. Mỗi octet sẽ là 8 bit và chúng được ngăn cách bằng dấu chấm (.)

Về hình dáng, cấu trúc của một địa chỉ IPv4 sẽ gồm 4 con số ở dạng thập phân tượng trưng cho 4 cụm. Địa chỉ này gồm 2 phần là phần mạng và phần host.
<p>
  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSX8baFBhbLICDVJtn_cOKc6B33V7xdfd0cA&usqp=CAU">
  </p>
  <p>
  <img src="https://bkhost.vn/wp-content/uploads/2022/03/cau-truc-dia-chi-ipv4.jpg">
  </p>
  
  
  ## Phân Lớp
  Dựa vào cách chọn địa chỉ mạng mà địa chỉ IP được phân thành 5 lớp A, B, C, D, E. Đặc điểm của các lớp như sau:
  
  **Lớp A**:
  
  Lớp A của địa chỉ Ipv4 sử dụng cụm đầu làm network và 3 cụm sau làm host. Bit đầu tiên của địa chỉ lớp A luôn được chọn là 0. Dải địa chỉ mạng lớp A chạy từ 1.0.0.0 đến 126.0.0.0. Vì vậy lớp A sẽ có tổng cộng 126 mạng. Trong khi đó mạng Loopback là 127.0.0.0. Phần host của lớp A có tất cả 24 bit. Do đó, mỗi lớp A có (224 – 2) host.
  
  **Lớp B**:
  
  Lớp B của địa chỉ Ipv4 sử dụng 2 cụm đầu làm phần mạng và 2 cụm sau làm phần host. Hai bit đầu tiên của lớp B luôn là 1 và 0. Dải địa chỉ mạng lớp B chạy từ 128.0.0.0 đến 191.255.0.0. Như vậy lớp B sẽ có tổng cộng 214 mạng. Vì phần host dài 16 bit nên mạng lớp B có (216 – 2) host. 
  
  **Lớp C**:
  
  Lớp C của địa chỉ Ipv4 dùng 3  đầu làm phần mạng và 1 octet sau làm phần host. Địa chỉ lớp C luôn có 3 bit đầu là 1 1 0. Dải mạng lớp C chạy từ 192.0.0.0 -> 223.255.255.0. Như vậy sẽ có 221 mạng trong lớp C. Đối với phần host gồm 1 cụm sau cùng nên dài 8 bit và sẽ có (28 – 2) host trong lớp C.
  
  **Lớp D**:
  
  Lớp D được sử dụng làm các địa chỉ multicast và dải địa chỉ lớp D từ 224.0.0.0 -> 239.255.255.255. Lấy ví dụ như Ví dụ: 224.0.0.5 dùng cho OSPF; 224.0.0.9 dùng cho RIPv2.
  
  **Lớp E**:
  
  Lớp E gồm các ải số từ 240.0.0.0 trở đi và được sử dụng cho mục đích dự phòng.
  
  #### Việc đặt địa chỉ IP phải tuân theo các quy tắc sau:

- Không được đặt những bit ở phần network bằng 0 cùng một lúc. Khi đặt tất cả những bit ở phần network bằng không thì địa chỉ IP sẽ có 3 số đầu là 0.0.0. Đây là một địa chỉ sai.
- Nếu đặt tất cả các bit ở phần host bằng 0 thì số cuối cùng của địa chỉ IP sẽ bằng 0. Khi đó địa chỉ đó là một địa chỉ mạng, không thể dùng làm host. Ví dụ: 191.168.10.0 là một địa chỉ mạng.
- Nếu đặt tất cả các bit ở phần host là 1 thì số cuối cùng của địa chỉ IP là 255. Khi đó địa chỉ này sẽ là một địa chỉ broadcast của mạng đó. Ví dụ: 192.168.10.255 là một địa chỉ broadcast.
  
