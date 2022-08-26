# DHCP
DHCP viết tắt từ **Dynamic Host Configuration Protocol (DHCP – giao thức cấu hình động máy chủ)**. Là  một giao thức cho phép cấp phát địa chỉ IP một cách tự động cùng với các cấu hình liên quan khác như subnet mask và gateway mặc định.

DHCP giúp máy tính được cấu hình tự động. Nó cung cấp một cơ sở dữ liệu trung tâm để theo dõi tất cả các máy tính trong hệ thống mạng. Tránh trường hợp hai máy tính có cùng địa chỉ IP.

Nếu không có DHCP, máy tính vẫn có thể cấu hình IP tĩnh thủ công. Bên cạnh việc cung cấp địa chỉ IP, DHCP còn cung cấp thông tin cấu hình DNS với hai phiên bản mới nhất đang được sử dụng là IPv4 và IPv6.

# Cách hoạt động của DHCP
DHCP server được sử dụng để phát hành các địa chỉ IP duy nhất và tự động cấu hình các thông tin mạng. Nói một cách ngắn gọn dễ hiểu về cách thức hoạt động của DHCP chính là khi một thiết bị yêu cầu địa chỉ IP từ một router thì ngay sau đó router sẽ gán một địa chỉ IP khả dụng cho phép thiết bị đó có thể giao tiếp trên mạng.

Router hoạt động như một máy chủ DHCP đối với các mô hình mạng nhỏ như là các hộ gia đình hoặc các doanh nghiệp nhỏ. Còn đối với các mạng lớn hơn thì một router không thể nào quản lí được số lượng lớn các thiết bị nên sẽ có máy chủ chuyên dụng để cấp IP.

Khi có yêu cầu kết nối mạng, thiết bị sẽ thực hiện gửi yêu cầu đến máy chủ (yêu cầu này được gọi là DHCP DISCOVER). Và sau khi yêu cầu này được đưa đến máy chủ thì lúc này ngay tại đó máy chủ sẽ tìm một địa chỉ IP khả dụng có thể sử dụng trên thiết bị đó rồi cung cấp địa chỉ cho thiết bị cùng với đó là gói DHCP OFFER.

Sau khi nhận được địa chỉ, thiết bị sẽ phản hồi với máy chủ bằng một gói tin DHCP REQUEST. Đây là lúc chấp nhận yêu cầu thì máy chủ sẽ báo tin nhận (ACK) để xác nhận thiết bị đó đã có IP, đồng thời xác định rõ thời gian sử dụng địa chỉ IP vừa cấp cho đến khi có địa chỉ IP mới khác.

<p>
  <img src="https://it.itsystems.vn/wp-content/uploads/2020/12/dhcp2-768x484.png">
  </p>
  
  # Các thành phần của DHCP
  
**DHCP Server:** Đây là máy chủ thực hiện việc kết nối mạng, có chức năng phản hồi thông tin khi máy trạm phát yêu cầu, ngoài ra DHCP server còn có nhiệm vụ truyền thông tin một cách hợp lý nhất đến các thiết bị, đồng thời thực hiện cấu hình cổng mặc định (Default gateway) hay subnet mask.

**DHCP Client:** Được định nghĩa là máy trạm chạy dịch vụ DHCP, được sử dụng với mục đích để thực hiện đăng kí, cập nhật thông tin về địa chỉ IP cùng với những bản ghi DNS cho chính nó.

IP Address Pool: Đây là dãy địa chỉ có sẵn cho client DHCP. Và những dãy địa chỉ thường được truyền tuần tự từ thấp nhất cho đến cao nhất.

Subnet: Mạng IP có thể được phân thành các phân đoạn được gọi là mạng con và mạng con giúp mạng được quản lí dễ dàng hơn.

Lease: Đây là khoảng thời gian client DHCP giữ thông tin địa chỉ IP. Khi khoảng thời gian này hết hạn, client phải làm mới lại nó.

DHCP Relay: Router hoặc máy chủ nghe tin nhắn được phát trên mạng đó và sau đó chuyển chúng đến một máy chủ được cấu hình. Máy chủ này sau đó phản hồi lại relay agent để truyền chúng đến client. Nó được sử dụng để tập trung máy chủ DHCP thay vì để máy chủ trên mỗi mạng con.

# Ưu điểm và nhược điểm của DHCP
**Ưu điểm:**
DHCP có chức năng cho phép cấu hình tự động. Nhờ vậy nên tốc độ truy cập kết nối mạng của các thiết bị thông minh như máy tính, điện thoại,…có thể kết nối được mạng nhanh.

DHCP thực hiện gán địa chỉ IP nên sẽ không xảy ra trường hợp trùng cùng một địa chỉ IP. Việc gán này sẽ dễ dàng hơn cũng như giúp hệ thống mạng luôn hoạt động ổn định.

DHCP vừa quản lí địa chỉ IP và cả các tham số TCP/IP, sẽ giúp cho dễ dàng theo dõi được các thông số và quản lí chúng qua các trạm.

Các thiết bị có thể tự do di chuyển từ mạng này sang mạng khác và nhận địa chỉ IP mới một cách tự động.

Các nhà quản trị mạng có thể thay đổi cấu hình và thông số của địa chỉ IP để nâng cấp cơ sở hạ tầng.

**Nhược điểm:**

Mặc dù DHCP mang lại rất nhiều ưu điểm nổi bật nhưng cũng có những hạn chế như là

Việc dùng địa chỉ IP sẽ không phù hợp với những thiết bị cố định, có tần suất truy cập cao, liên tục như là máy in, file server,… DHCP sever chỉ phù hợp cho các mô hình mạng nhỏ hoặc hộ gia đình.

DHCP có thể giảm rủi ro gặp lỗi trùng IP bằng cách tự động gán địa chỉ IP cho các thiết bị. Tuy nhiên, trong một số trường hợp bản thân DHCP gặp lỗi cũng là nguyên nhân dẫn đến lỗi xung đột IP.

<p>
  <img src="https://it.itsystems.vn/wp-content/uploads/2020/12/dhcp-3.png">
  </p>
  
  # DHCP server bất hợp pháp:
  
Khi hacker phá vỡ tường bảo vệ mạng, chúng sẽ có được quyền kiểm soát máy chủ DHCP và xâm nhập để điều khiển hệ thống. Thông thường có 3 kiểu tấn công máy chủ DHCP bất hợp pháp.

**- DoS hệ thống mạng:** Hacker sẽ thiết lập một dải IP, subnet mask khiến các máy trạm không đăng nhập được vào hệ thống, dẫn đến DoS mạng. 

**– Man-in-the-middle:** Kiểu tấn công này nhắm vào cổng mặc định bằng cách chuyển đổi chúng về máy của hacker. Từ đó, hacker dễ dàng sao chép, đánh cấp tất cả thông tin của người truy cập. Tuy nhiên, kiểu tấn công này chỉ giúp hacker xem được các thông tin gửi ra ngoài mạng. Còn nội dung từ bên ngoài gửi đến máy trạm Client thì chúng không xâm nhập được.

**– DNS redirect:** Kiểu tấn công này thông qua việc thay đổi DNS các máy trạm, các lượt truy cập sẽ bị dẫn đến những website giả có chứa mã độc, virus nhằm mục đích đánh cắp thông tin của người dùng.
