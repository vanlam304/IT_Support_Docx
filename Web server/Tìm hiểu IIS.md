# Internet Information Services (IIS)

Microsoft Internet Information Services là dịch vụ cung cấp và phân tán các thông tin trên mạng dành riêng cho máy chủ chạy trên nền hệ điều hành Window. Nó còn bao gồm nhiều dịch vụ khăc nhau như FTP Server, Web Server,... Và có thể được dùng để xuất bản nội dung của các trang web lên internet bằng cách sử dụng Hypertext Transport Protocol(HTTP) hoặc HTTPS.

![image](https://user-images.githubusercontent.com/111721629/189833180-bfcff1ce-f346-4437-9a85-0db4453b24bc.png)

# Chức năng của IIS

chức năng của IIS là tiếp nhận yêu cầu từ máy trạm và đáp lại yêu cầu đó bằng cách gửi về những thông tin máy trạm yêu cầu. Nhìn chung, IIS có thể sử dụng để:

- Xuất bản trang Web trên môi trường internet
- Tạo các giao dịch thưong mại điện tử trên môi trường internet, cụ thể là hiện CAtalog và nhậm đơn đặt hàng từ người tiêu dùng 
- Chia sẻ dữ liệu thông qua FTP
- Cho phép người dùng ở xa có truy xuất database(Database Remote Access) và nhiều ứng dụng khác.

# Cách hoạt động của IIS

IIS thường sử dụng giao thức truyền phổ biến là FTP(File Transfer Protocol), HTTP và một sối giao thức khác như POP3, SMTP ,... để tiếp nhận yêu cầu và truyền tải thông tin trên mạng ở nhiều điwjn dạng khác nhau. Môt trong những dịch vụ Web IIS phổ biến nhất là WWWW(World Wide Web).

![image](https://user-images.githubusercontent.com/111721629/189835805-09ddda19-354c-4fa5-98b6-6556cce09a21.png)


Dịch vụ Web sử dụng HTTp để tiếp nhận Requests của trình duyệt Web dưới dạng URL(Uniform Resource Locator) của Website. Sau đó, IIS phản hồi kại các Requests này bằng cách trả về cho WEbbrowser nội dung của trang Web tương ứng.
