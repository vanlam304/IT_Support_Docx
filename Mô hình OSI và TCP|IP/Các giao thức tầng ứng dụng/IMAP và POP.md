# IMAP là gì?
IMAP (hay Internet Message Access Protocol) là giao thức truyền mail giúp bạn truy cập tài khoản và đọc email của mình từ bất kỳ thiết bị nào (miễn là kết nối internet).

Về cơ bản, dữ liệu email được lưu trữ trên máy chủ. Bất cứ khi nào bạn kiểm tra hộp thư đến, ứng dụng email của bạn sẽ liên lạc với máy chủ để kết nối với nội dung email của bạn.

Khi đọc email bằng IMAP, dữ liệu không thực sự tải xuống hoặc lưu trữ trên máy tính. Do đó, bạn có thể kiểm tra email từ một số thiết bị khác nhau mà không bỏ sót điều gì (không phụ thuộc vào máy chủ vật lý).
## Tương quan IMAP và Mail Servers, Email Clients
Cách dễ nhất để hiểu cách thức hoạt động của IMAP là định nghĩa nó như một trung gian giữa Mail Servers (máy chủ) và Email Clients (máy khách) của bạn.

Mail Servers luôn được sử dụng khi gửi và nhận email. Tuy nhiên, với giao thức IMAP, chúng vẫn được lưu trên máy chủ trừ khi bạn xóa.

Ví dụ: Khi bạn đăng nhập vào ứng dụng email như Microsoft Outlook, nó sẽ liên lạc với máy chủ bằng IMAP. Bạn sẽ thấy tất cả tiêu đề của email trước, trừ khi bạn mở email thì nội dung mới được tải về. Khi không mở email, nội dung vẫn nằm ở máy chủ và bạn có thể mở ra đọc bất kỳ khi nào bạn muốn.
# Giao thức POP là gì?
POP viết tắt của từ Post Office Protocol là một giao thức tầng ứng dụng, dùng để lấy email từ server mail, thông qua kết nối TCP/IP.
### Các loại POP
Trước POP3, đã có 2 phiên bản là POP1 (phiên bản đầu tiên được chỉ định trong RFC 918 (1984) và POP2 (được chỉ định trong RFC 937 (1985).

Khi POP3 ra đời, nó đã ngay lập tức thay thế hoàn toàn các phiên bản cũ. Vì vậy, ngày nay khi nói đến POP thì thường ám chỉ POP3.

Ngắn gọn: POP3 là một giao thức truyền email tiêu chuẩn được sử dụng để nhận email từ máy chủ từ xa đến máy khách email cục bộ.

POP3 cho phép bạn tải xuống các email trên máy tính cục bộ của bạn và đọc chúng ngay cả khi bạn ngoại tuyến.

POP3 được thiết kế để xóa thư trên máy chủ ngay khi người dùng đã tải xuống. Tuy nhiên, một số triển khai cho phép người dùng hoặc quản trị viên chỉ định rằng thư sẽ được lưu trong một khoảng thời gian. POP có thể được coi là một dịch vụ “lưu trữ và chuyển tiếp”.
| Giao thức | IMAP | POP |
|-----------|------|-----|
| Ưu điểm | Truy cập email từ nhiều thiết bị khác nhau cho cùng một tài khoản hoặc nhiều tài khoản email. Xem nội dung email mà không phải tải xuống từ máy chủ hoặc phải chuyển email từ thiết bị này sang thiết bị khác. Khả năng tương thích với các tiêu chuẩn tiện ích mở rộng Internet Mail như S/MIME. Lướt xem nhanh tiêu đề mail để chọn email cần mở và tải về nếu có quá nhiều email được gửi đến bạn. Tiết kiệm không gian lưu trữ cục bộ | – Xem được toàn bộ email ngay cả khi không kết nối Internet vì email sẽ được lưu toàn bộ về thiết bị vật lýGiải phóng không gian lưu trữ trên server Được lựa chọn để lại bản sao mail trên server. Hợp nhất nhiều tài khoản email và nhiều server vào một hộp thư đến |
| Nhược điểm| Giới hạn dung lượng hòm thư (tùy vào nhà cung cấp hoặc gói dịch vụ email của bạn). Nếu dung lượng hòm thư lớn dẫn đến việc nhận quá nhiều email, khó kiểm soát. Phải kết nối internet dù sử dụng thiết bị nào để truy cập vào email | Không thể sử dụng trên nhiều thiết bị. Bị giới hạn sử dụng bởi máy chủ vật lý, máy hỏng hoặc thư mục hỏng có thể mất toàn bộ email. Khó khăn trong việc xuất folder lưu trữ mail.
# Vậy khi nào dùng POP, khi nào dùng IMAP

**Dùng IMAP khi:**
Bạn cần truy cập email từ nhiều thiết bị khác nhau, trên điện thoại và cả máy tính
Thường xuyên kết nối internet
Quá nhiều email mỗi ngày và chỉ muốn kiểm tra các email quan trọng
Dữ liệu email là rất quan trọng đối với cá nhân hoặc tổ chức, cần được lưu trữ dự phòng

**Dùng POP khi:**
Bạn muốn truy cập email chỉ từ một thiết bị cố định
Bạn cần truy cập email thường xuyên ngay cả khi không có Internet
Có số lượng lớn thư muốn lưu trữ và không muốn máy chủ Email bị đầy
Mail Servers bị hạn chế dung lượng lưu trữ
