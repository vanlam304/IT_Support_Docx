# Giao thức HTTP là gì?
HTTP (Hypertext Transfer Protocol) là giao thức truyền tải siêu văn bản. Đây là giao thức tiêu chuẩn cho World Wide Web (www) để truyền tải dữ liệu dưới dạng văn bản, âm thanh, hình ảnh, video từ Web Server tới trình duyệt web của người dùng và ngược lại.

>>HTTP là một giao thức ứng dụng của bộ giao thức TCP/IP (các giao thức nền tảng cho Internet). Bộ giao thức TCP/IP là một bộ các giao thức truyền thông cài đặt chồng giao thức mà Internet và hầu hết các mạng máy tính thương mại đang chạy trên đó. Bộ giao thức này được đặt theo tên hai giao thức chính là TCP (Transmission Control Protocol – Giao thức điều khiển truyền vận) và IP (Internet Protocol – Giao thức Internet).
<p>
  <img src="">
  </p>
  HTTP hoạt động theo mô hình Client (máy khách) – Server (máy chủ). Việc truy cập website được tiến hành dựa trên các giao tiếp giữa 2 đối tượng trên. Khi bạn truy cập một trang web qua giao thức HTTP, trình duyệt sẽ thực hiện các phiên kết nối đến server của trang web đó thông qua địa chỉ IP do hệ thống phân giải tên miền DNS cung cấp. Máy chủ sau khi nhận lệnh, sẽ trả về lệnh tương ứng giúp hiển thị website, bao gồm các nội dung như: văn bản, ảnh, video, âm thanh,…

Trong quá trình kết nối và trao đổi thông tin, trình duyệt của bạn sẽ mặc nhiên thừa nhận địa chỉ IP đó đến từ server của chính website mà bạn muốn truy cập mà không hề có biện pháp xác thực nào. Các thông tin được gửi đi qua giao thức HTTP (bao gồm địa chỉ IP, các thông tin mà bạn nhập vào website…) cũng không hề được mã hóa và bảo mật. Đây chính là kẽ hở mà nhiều hacker đã lợi dụng để đánh cắp thông tin người dùng, thường được gọi là tấn công sniffing.

# Giao thức HTTPS là gì?
HTTPS (Hypertext Transfer Protocol Secure) là giao thức truyền tải siêu văn bản an toàn. Thực chất, đây chính là giao thức HTTP nhưng tích hợp thêm Chứng chỉ bảo mật SSL nhằm mã hóa các thông điệp giao tiếp để tăng tính bảo mật. Có thể hiểu, HTTPS là phiên bản HTTP an toàn, bảo mật hơn.
<p>
  <img src="">
  </p>
  HTTPS hoạt động tương tự như HTTP, tuy nhiên được bổ sung thêm chứng chỉ **SSL (Secure Sockets Layer – tầng ổ bảo mật) hoặc TLS (Transport Layer Security – bảo mật tầng truyền tải)**. Hiện tại, đây là các tiêu chuẩn bảo mật hàng đầu cho hàng triệu website trên toàn thế giới.

Cả SSL và TLS đều sử dụng hệ thống PKI (Public Key Infrastructure -hạ tầng khóa công khai) không đối xứng. Hệ thống này sử dụng hai “khóa” để mã hóa thông tin liên lạc, “khóa công khai” (public key) và “khóa riêng” (private key). Bất cứ thứ gì được mã hóa bằng khóa công khai chỉ có thể được giải mã bởi khóa riêng và ngược lại. Các tiêu chuẩn này đảm bảo các nội dung sẽ được mã hóa trước khi truyền đi, và giải mã khi nhận. Điều này khiến hacker dù có chen ngang lấy được thông tin cũng không thể “hiểu” được thông tin đó.

# HTTP và HTTPS khác nhau như thế nào?
Mặc dù cùng là giao thức truyền tải thông tin trên mạng internet, nhưng HTTP và HTTPS có những điểm khác nhau cốt lõi khiến cho HTTPS được ưa chuộng hơn trên toàn thế giới.

Chứng chỉ SSL
<p>
  <img src="">
  </p>
  Sự khác biệt lớn nhất giữa HTTP và HTTPS là chứng chỉ SSL. Về cơ bản, HTTPS là một giao thức HTTP với bảo mật bổ sung. Tuy nhiên, trong thời đại mà mọi thông tin đều được số hóa, thì giao thức HTTPS lại trở nên cực kỳ cần thiết cho bảo mật website. Dù bạn sử dụng máy tính cá nhân hay công cộng, các tiêu chuẩn SSL sẽ luôn đảm bảo liên lạc giữa máy khách và máy chủ được an toàn, chống bị dòm ngó.

### Port trên HTTP và HTTPS
Port là cổng xác định thông tin trên máy khách, sau đó phân loại để gửi đến máy chủ. Mỗi Port mang một số hiệu riêng với chức năng riêng biệt. Giao thức HTTP sử dụng Port 80, trong khi đó HTTPS sử dụng Port 443 – đây chính là cổng hỗ trợ mã hóa kết nối từ máy tính client đến server, nhằm bảo vệ gói dữ liệu đang được truyền đi.

# Mức độ bảo mật của HTTP và HTTPS
Khi máy khách truy cập một website, giao thức HTTPS sẽ hỗ trợ xác thực tính đích danh của website đó thông qua việc kiểm tra xác thực bảo mật (Security Certificate).

Các xác thực bảo mật này được cung cấp và xác minh bởi Certificate Authority (CA) – các tổ chức phát hành các chứng thực các loại chứng thư số cho người dùng, doanh nghiệp, máy chủ, mã nguồn, phần mềm. Các tổ chức này đóng vai trò là bên thứ ba, được cả hai bên tin tưởng để hỗ trợ quá trình trao đổi thông tin an toàn.

Đối với HTTP, vì dữ liệu không được xác thực bảo mật nên sẽ không có gì đảm bảo được phiên kết nối của bạn có đang bị “nghe lén” hay không, hoặc bạn đang cung cấp thông tin cho website thật hay một website giả mạo.

# Lý do nên sử dụng HTTPS cho website?
Trước đây, HTTPS thường được sử dụng cho các website tài chính, ngân hàng, thương mại điện tử để bảo mật thông tin thanh toán online. Tuy nhiên trong thời điểm hiện tại, HTTPS đã trở thành tiêu chuẩn bảo mật tối thiểu mà tất cả các website doanh nghiệp cần phải đáp ứng. Vì những lý do sau đây:

HTTPS bảo mật thông tin người dùng
Giao thức HTTPS sử dụng phương thức mã hóa (encryption) để đảm bảo các thông điệp trao đổi giữa máy khách và máy chủ không bị kẻ thứ ba (hackers) đọc được.

Nếu truy cập một website không được cài đặt giao thức HTTPS, người dùng sẽ đối diện với nguy cơ bị tấn công sniffing. Hacker có thể “chen ngang” vào kết nối giữa máy khách và máy chủ, đánh cắp các dữ liệu mà người dùng gửi đi (password, thông tin thẻ tín dụng, văn bản email,…) và các thông tin sẵn có từ website. Thậm chí, mọi thao tác của người dùng trên website đều có thể bị quan sát, ghi lại mà họ không hề hay biết.

Với giao thức HTTPS, người dùng và máy chủ hoàn toàn có thể tin tưởng rằng các thông điệp chuyển giao qua luôn trong trạng thái nguyên vẹn, không qua bất kì chỉnh sửa, sai lệch nào so với dữ liệu đầu vào.

### Tránh lừa đảo bằng website giả mạo
  
