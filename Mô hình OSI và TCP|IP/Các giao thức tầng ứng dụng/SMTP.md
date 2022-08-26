# SMTP là gì?
<p>
  <img src="https://wikimaytinh.com/wp-content/uploads/smtp-la-gi-giao-thuc-truyen-thu-don-gian.jpg">
  </p>
  SMTP là viết tắt của Simple Mail Transfer Protocol nghĩa là Giao thức truyền thư đơn giản. SMTP cung cấp một tập hợp các hướng dẫn giao tiếp cho phép phần mềm truyền một thư điện tử (email) qua internet.

# Lịch sử của giao thức SMTP
Giao thức trước đó của SMTP trong Arpanet là Mail Box Protocol (RFC 278) có từ tháng 7 năm 1971 và sau đó là FTP Mail (RFC 458) từ tháng 2 năm 1973. Với sự xuất hiện của Internet từ ARPANET vào khoảng năm 1980, Jon Postel đề nghị tách riêng nó ra khỏi sự phụ thuộc của việc vận chuyển thư điện tử từ dịch vụ FTP (RFC 772) và SMTP được công bố theo RFC 821 vào năm 1982.
Vào đầu những năm 1980, nó đã trở thành một bổ sung cho UUCP, được sử dụng chủ yếu cho các máy tính kết nối định kỳ dùng cho việc lưu hành e-mail. SMTP đã trở thành tiêu chuẩn cho các máy tính nối liên tục với mạng. 
SMTP là một giao thức dùng nền văn bản (ASCII) và tương đối đơn giản. Trước khi một thông điệp được gửi, người ta có thể định vị một hoặc nhiều địa chỉ nhận thông điệp – những địa chỉ này thường được kiểm tra về sự tồn tại trung thực của chúng). Việc kiểm thử một trình chủ SMTP là một việc tương đối dễ dàng, dùng chương trình ứng dụng “telnet”

# Đặc điểm của giao thức SMTP
<p>
  <img src="https://wikimaytinh.com/wp-content/uploads/smtp-la-gi-giao-thuc-truyen-thu-don-gian-mohinh.jpg"> 
  </p>
  + Nó là một chương trình được sử dụng để gửi tin nhắn cho người dùng máy tính khác dựa trên địa chỉ e-mail.
  + Nó cung cấp trao đổi thư giữa những người dùng trên cùng một máy tính hoặc các máy tính khác nhau và nó cũng hỗ trợ 
  + Nó có thể gửi một tin nhắn cho một hoặc nhiều người nhận.
  + Tin nhắn gửi có thể bao gồm văn bản, thoại, video hoặc đồ họa. 
  + Nó cũng có thể gửi tin nhắn trên các mạng bên ngoài internet. 
  + Mục đích chính của SMTP được sử dụng để thiết lập các quy tắc giao tiếp giữa các máy chủ. Các máy chủ có cách tự nhận dạng và thông báo loại giao tiếp mà chúng đang cố gắng thực hiện. Họ cũng có một cách để xử lý các lỗi như địa chỉ email không chính xác. Ví dụ: nếu địa chỉ người nhận sai, thì máy chủ sẽ nhận được phản hồi kèm theo một thông báo lỗi nào đó.

 # Các thành phần của SMTP 
 Đầu tiên, chúng ta sẽ chia máy khách SMTP và máy chủ SMTP thành hai thành phần như tác nhân người dùng (UA) và tác nhân truyền thư (MTA). Tác nhân người dùng (UA) chuẩn bị thư, tạo phong bì và sau đó đặt thư vào phong bì. Đại lý chuyển thư (MTA) chuyển thư này qua internet.
 SMTP cho phép một hệ thống phức tạp hơn bằng cách thêm một hệ thống chuyển tiếp. Thay vì chỉ có một MTA ở phía gửi và một ở phía nhận, có thể thêm nhiều MTA hơn, hoạt động như một máy khách hoặc máy chủ để chuyển tiếp email.
 Hệ thống chuyển tiếp không có giao thức TCP/IP cũng có thể được sử dụng để gửi email đến người dùng và điều này đạt được bằng cách sử dụng cổng thư. Cổng thư là một MTA chuyển tiếp có thể được sử dụng để nhận email.

# Giao thức SMTP hoạt động như thế nào?
<p>
  <img src="https://wikimaytinh.com/wp-content/uploads/smtp-la-gi-giao-thuc-truyen-thu-don-gian-hoat-dong.jpg">
  </p>
  
**Thành phần của Thư:** Người dùng gửi e-mail bằng cách soạn thư điện tử bằng Mail User Agent (MUA). Mail User Agent là một chương trình được sử dụng để gửi và nhận thư. Thư có hai phần: nội dung và tiêu đề. Phần thân là phần chính của thư trong khi phần tiêu đề bao gồm thông tin như địa chỉ người gửi và người nhận. Tiêu đề cũng bao gồm thông tin mô tả chẳng hạn như chủ đề của thư. Trong trường hợp này, nội dung thư giống như một lá thư và tiêu đề giống như một phong bì chứa địa chỉ của người nhận. 
 
**Gửi thư:** Sau khi soạn email, ứng dụng thư khách sau đó sẽ gửi e-mail đã hoàn thành đến máy chủ SMTP bằng cách sử dụng SMTP trên port TCP 25.

**Chuyển phát thư:**  Địa chỉ thư điện tử bao gồm hai phần: tên người dùng của người nhận và tên miền. Ví dụ: userxyz@gmail.com, trong đó “userxyz” là tên người dùng của người nhận và “gmail.com” là tên miền. 

  Nếu tên miền của địa chỉ email của người nhận khác với tên miền của người gửi, thì MSA sẽ gửi thư đến Mail Transfer Agent (MTA). Để chuyển tiếp email, MTA sẽ tìm miền đích. Nó kiểm tra bản ghi MX từ Hệ thống tên miền để lấy tên miền đích. Bản ghi MX chứa tên miền và địa chỉ IP của miền của người nhận. Khi bản ghi được định vị, MTA kết nối với máy chủ trao đổi để chuyển tiếp thông báo.
  
  **Nhận và xử lý thư:** Sau khi nhận được thư đến, máy chủ trao đổi sẽ gửi thư đến máy chủ đến (Mail Delivery Agent), nơi lưu trữ e-mail nơi nó chờ người dùng lấy nó. 
  
  **Truy cập và Truy xuất Thư:** Email được lưu trữ trong MDA có thể được truy xuất bằng cách sử dụng MUA (Tác nhân Người dùng Thư). MUA có thể được truy cập bằng cách sử dụng đăng nhập và mật khẩu.
