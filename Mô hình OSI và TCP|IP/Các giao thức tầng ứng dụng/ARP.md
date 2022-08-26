# ARP

ARP (Address Resolution Protocol) đây là một thủ tục để kết nối một địa chỉ IP động tới một server vật lý cố định trong mạng Lan (còn gọi là địa chỉ Mac).

Hiện tại phổ biến nhất là địa chỉ IP4 (Ipv4) với độ dài là 32 bit. Trong khi đó địa chỉ Mac lại 48 bit. Chính vì sự khác biệt đó mà ARP cần phải ánh xạ để phiên dịch 32 bit thành 48 bit và ngược lại. Quá trình mapping của ARP giữ chức năng quan trọng để các hệ thống nhận ra nhau và bảo mật một cách trọn vẹn, an toàn.

Từ những năm 1970, mô hình mạng OSI được ra đời sử dụng nhiều lớp để người dùng có thể quan sát những vấn đề xảy ra với các hệ thống mạng. Địa chỉ Mac là lớp liên kết dữ liệu nằm tại lớp 2 của OSI. Địa chỉ IP hay còn gọi là lớp mạng tồn tại ở lớp 3 của OSI. Còn ARP hoạt động giữa cả hai lớp 2 và 3 của OSI.

Ngoài nhiệm vụ trên ARP cũng còn được sử dụng cho IP qua các công nghệ LAN khác. Có thể kể đến như giao diện dữ liệu phân tán sợi quang, vòng mã thông báo hoặc IP qua ATM.

# Hoạt động của ARP

<p> 
  <img="https://vsudo.net/blog/wp-content/uploads/2020/02/quy-trinh-ARP.jpg">
  </p>
Quá trình hoạt động của ARP sẽ bắt đầu khi một gói tin được gửi tới cho một máy chủ nào đó trong mạng LAN. Chương trình ARP cần tìm địa chỉ Mac khớp với địa chỉ IP của gói tin ở bảng ARP cache (bản ghi từng địa chỉ Mac và địa chỉ IP tương ứng).

Nếu địa chỉ Mac có trong ARP cache thì thiết bị nguồn sẽ sử dụng địa chỉ Mac ở đó để giao tiếp. Trường hợp trong ARP cache không có địa chỉ mà nguồn muốn tìm thì ARP sẽ gửi một thông báo tới các máy trong mạng LAN để xem máy nào có địa chỉ IP khớp với địa chỉ IP đích. Khi một máy nhận ra địa chỉ IP đích khớp với IP của chính nó thì nó sẽ trả lời để ARP cập nhật vào bộ nhớ ARP cache và tiếp tục giao tiếp.

# Proxy ARP
ARP là giao thức phân giải cho các thiết bị nội mạng. Tuy nhiên các thiết bị khác mạng vẫn gửi được gói tin cho nhau là nhờ vào công nghệ Proxy ARP? Nó được xem là một cổng trung gian để chuyển tiếp thành công các gói tin bên ngoài mạng đến đích mà chúng muốn.

**Ví dụ:** A muốn gửi tin cho B nhưng lại không cùng mạng, lúc này router của Proxy ARP sẽ trực tiếp gửi địa chỉ Mac của router cho A. Sau đó A sẽ gửi gói tin sang cho router và router sẽ forward sang cho B.

# Giả mạo ARP và nhiễm độc bộ nhớ ARP cache
Khi mạng LAN sử dụng ARP rất dễ bị giả mạo ARP hoặc nhiễm độc bộ nhớ ARP cache. Trong cuộc tấn công đó, tin tặc sẽ phát các thông tin về ARP sai lệch với mục đích liên kết địa chỉ Mac của chúng với địa chỉ IP máy tính trong mạng. Khi một liên kết thành công máy tính trong mạng LAN thì tất cả những lượng truy cập dành cho địa chỉ IP đó đều được gửi tới máy tính của kẻ tấn công.

Vấn đề nói trên có thể gây hậu quả vô cùng nghiêm trọng cho doanh nghiệp khi thông tin nhạy cảm bị đánh cắp. Bên cạnh đó những cuộc tấn công này là bước đệm để thực hiện các cuộc tấn công khác như từ chối dịch vụ, chiếm quyền điều khiển phiên, tấn công xen giữa.
