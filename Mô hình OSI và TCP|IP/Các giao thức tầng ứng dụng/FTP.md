# FTP là gì?
FTP viết tắt từ File Transfer Protocol, là một giao thức truyền tải tập tin từ máy tính này đến máy tính khác thông qua một mạng TCP hoặc qua mạng Internet. Nhờ vào giao thức này nên người sử dụng có thể tải dữ liệu như hình ảnh, văn bản, các tập tin nhạc, video... từ máy tính của mình lên máy chủ đang đặt ở một nơi khác hoặc tải các tập tin đã có trên máy chủ về máy tính cá nhân của mình một cách dễ dàng. FTP cũng là giao thức dùng để truyền tải dữ liệu web lên máy chủ web cho dù máy chủ đặt rất xa.
Giao thức FTP được sử dụng nhiều nhất vào mục đích truyền tải dữ liệu, rút gọn thời gian cũng như đáp ứng nhu cầu của việc tải và truyền đi của các dữ liệu dung lượng lớn một cách nhanh chóng. Bạn có thể gửi đi và nhận những tệp tin có dung lượng lên đến vài trăm MB mà không phải lo lắng nó không được chuyển đi. Điều quan trọng là bạn có thể cùng lúc thực hiện việc upload/download nhiều tập tin để tiết kiệm thời gian mà không hề gặp phải vấn đề gì.
# Mô hình hoạt động của giao thức FTP
<p>
  <img src="https://st.quantrimang.com/photos/image/2019/12/19/FTP-la-gi.png">
  </p>
  
Hình thức hoạt động của giao thức FTP dựa trên hai tiến trình cơ bản là kiểm soát kết nối và kết nối dữ liệu. Điều này xảy ra giữa client FTP và server FTP, hay còn gọi là Control Connection và Data Connection.
***Control connection (kiểm soát kết nối)***: Khi phiên làm việc bắt đầu thì trong suốt quá trình diễn ra công việc thì tiến trình này sẽ kiểm soát kết nối và chỉ thực hiện nhiệm vụ các thông tin điều khiển đi qua trong suốt quá trình truyền dữ liệu.
***Data connection (kết nối dữ liệu)***: Khác với Control connection thì đây là tiến trình nhằm thực hiện các kết nối chứ không còn kiểm soát nữa. Nó sẽ kết nối các dữ liệu khi dữ liệu được gửi từ server tới client hoặc ngược lại. Tiến trình này thực hiện xuyên suốt quá trình đến khi việc truyền dữ liệu hoàn tất thì nó cũng ngừng lại.
  
  # Các phương thức truyền dữ liệu trong giao thức FTP
Như chúng tôi đã nhắc phía trên thì FTP là một giao thức truyền tải tập tin từ một máy tính đến máy tính khác thông qua một mạng TCP hoặc qua mạng Internet. Và việc truyền tải này được thực hiện theo 3 phương thức khác nhau là: Stream mode, Block mode, và Compressed mode. Cụ thể từng phương thức như sau:

- Stream mode: Là phương thức truyền tập tin không có cấu trúc dạng header. Dựa vào tính tin cậy trong việc truyền dữ liệu và thông qua kết nối TCP tới phía nhận nên chỉ ngắt kết nối là dữ liệu cũng kết thúc.
- Block mode: Các dữ liệu truyền được chia làm nhiều đoạn nhỏ sau đó được đóng gói lại thành các FTP blocks, mỗi gói đều chứa thông tin dữ liệu và điều này sẽ là việc truyền nhận dữ liệu an toàn, đúng chuẩn hơn.
- Compressed mode: Phương thức thứ 3 mà giao thức FTP thực hiện, phương thức này sẽ giúp các tệp tin, dữ liệu truyền đi nếu gặp phải trường hợp quá nặng thì chúng sẽ giúp xử lý đoạn tập tin đó bằng cách nén chúng lại và chuyển đi một cách đơn giản. Tuy nhiên hiện nay các tệp tin truyền đi đều được nén sẵn cho phù hợp nên Block mode có sẽ không cần thiết.

# Ưu điểm và nhược điểm của FTP
a. Ưu điểm
+ Cho phép truyền nhiều tin cùng 1 lúc.
+ Cho phép chuyển tệp tin nếu không may mất kết nối.
+ Tự động chuyển tập tin bằng các Script.
+ Cho phép thêm dữ liệu vào khung chờ, và lên lịch truyền.
+ Khả năng đồng bộ hoá tệp tin.

b. Nhược điểm
+ Khả năng bảo mật kém. 
+ Không phù hợp cho các tổ chức, do yêu cầu phải tạo cổng kết nối khi truyền.
+ Máy chủ có khả năng bị qua mặt, gửi thông tin đến các cổng ngẫu nhiên.
