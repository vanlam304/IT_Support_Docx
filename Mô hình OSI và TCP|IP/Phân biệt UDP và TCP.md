# Sự khác nhau giữa giao thức TCP và UDP

TCP/IP là một bộ các cổng được thiết bị sử dụng để giao tiếp qua Internet và hầu hết các mạng cục bộ. Nó được đặt tên theo hai giao thức ban đầu của nó - Transmission Control Protocol (TCP) và Internet Protocol (IP). TCP cung cấp cho các ứng dụng cách để chuyển (và nhận) một luồng gói thông tin đã được đặt hàng và kiểm tra lỗi qua mạng.

Giao thức User Datagram Protocol (UDP) được các ứng dụng sử dụng để vận chuyển một luồng dữ liệu nhanh hơn bằng cách bỏ qua kiểm tra lỗi. Khi cấu hình phần cứng hoặc phần mềm mạng bạn sẽ thấy sự khác biệt.
# Những điều cơ bản về TCP và UDP
| TCP | UDP |
| Đảm bảo rằng dữ liệu đến đúng như khi được gửi | Không đảm bảo dữ liệu đến |
| Kiểm tra lỗi các luồng dữ liệu. | Không cung cấp tính năng kiểm tra lỗi. |
| Header 20 byte cho phép 40 byte dữ liệu tùy chọn. | Header 8 byte chỉ cho phép dữ liệu bắt buộc. |
| Chậm hơn UDP. | Nhanh hơn TCP. |
| Tốt nhất cho các ứng dụng yêu cầu độ tin cậy. | Tốt nhất cho các ứng dụng yêu cầu tốc độ. |

<p align="center">
  <img src="https://st.quantrimang.com/photos/image/2020/08/07/su-khac-nhau-giua-giao-thuc-tcp-va-udp.jpg" style="width:600px;">
  </p>
  
Cả hai giao thức đều gửi dữ liệu qua internet dưới dạng gói. Trong đó, TCP thiên về kết nối. Sau khi kết nối được thực hiện, dữ liệu sẽ di chuyển theo hai chiều. UDP là một giao thức đơn giản hơn không có kết nối.

TCP mạnh hơn UDP. Nó cung cấp các chức năng sửa lỗi và độ tin cậy cao. UDP nhanh hơn TCP, chủ yếu vì nó không cung cấp khả năng sửa lỗi. Ngoài ra, TCP xử lý kiểm soát luồng, trong khi UDP không có tùy chọn để kiểm soát luồng.

# Điểm giống nhau giữa hai giao thức

TCP và UDP đều là các giao thức được sử dụng để gửi các bit dữ liệu - được gọi là các gói tin - qua Internet. Cả hai giao thức đều được xây dựng trên giao thức IP. Nói cách khác, dù bạn gửi gói tin qua TCP hay UDP, gói này sẽ được gửi đến một địa chỉ IP. Những gói tin này được xử lý tương tự bởi vì chúng được chuyển tiếp từ máy tính của bạn đến router trung gian và đến điểm đích.
<p align="center">
  <img src="https://st.quantrimang.com/photos/image/2018/07/12/so-sanh-giao-thuc-tcp-va-udp-1.jpg" style="width:600px;">
  </p>
TCP và UDP không phải là giao thức duy nhất hoạt động trên IP, tuy nhiên, chúng được sử dụng rộng rãi nhất

# Các ứng dụng của TCP
Dưới đây là các ứng dụng của TCP:

- TCP giúp bạn thiết lập kết nối giữa các loại máy tính khác nhau.
- Hoạt động độc lập với hệ điều hành
- Hỗ trợ nhiều giao thức định tuyến.
- TCP cho phép kết nối Internet giữa các tổ chức.
- TCP có thể hoạt động độc lập.
- TCP có thể được sử dụng để thiết lập kết nối giữa hai máy tính.
# Các ứng dụng của UDP
Dưới đây là các ứng dụng của UDP:

- Phương pháp UDP phần lớn được sử dụng bởi các ứng dụng nhạy cảm với thời gian cũng như những máy chủ trả lời các truy vấn nhỏ từ cơ sở khách hàng lớn hơn.
- UDP tương thích với các chương trình phát gói để gửi trên toàn mạng và gửi đa hướng.
- UDP cũng được sử dụng trong Domain Name System, Voice over IP và các game trực tuyến.

| Đặc điểm | TCP | UDP |
|-----|-----|-----|
| Độ tin cậy | Đảm bảo việc cung cấp dữ liệu. Theo dõi các gói dữ liệu. Kiểm tra các gói để tìm lỗi. Kiểm soát lưu lượng. Header 20 byte với một tùy chọn cho dữ liệu bổ sung. | Không đảm bảo việc chuyển dữ liệu.Các gói có thể bị mất.Không có kiểm soát luồng.Header được giới hạn ở 8 byte.|
| Tốc độ | Chậm vì nó thực hiện nhiều chức năng. | Nhanh chóng vì nó cung cấp các chức năng hạn chế |
| Nhu cầu | Tốt nhất cho web, truyền file, email và Secure Shell (SSH) | Tốt nhất cho VPN, phát video trực tuyến, VoIP, phát sóng trực tiếp và chơi game trực tuyến.|
