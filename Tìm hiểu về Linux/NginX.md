# NginX

![image](https://user-images.githubusercontent.com/111721629/188782919-6d4e206a-9334-447b-b690-0cc238f11535.png)

Nginx là một máy chủ Web Server mã nguồn mở. Dự án Nginx được phát hành và sử dụng như một web server được thiết kế hướng đến mục đích cải thiện tối đa hiệu năng và sự ổn định. Bên cạnh đó, nhờ vào các khả năng của máy chủ HTTP mà NGINX còn có thể hoạt dộng như một proxy server cho email (IMAP, POP3, và SMTP), reverse proxy, và trung gian để cân bằng tải cho các máy chủ HTTP, TCP, và UDP.

Những công ty lớn sử dụng Nginx bao gồm: Autodesk, Atlassian, Intuit, T-Mobile, GitLab, DuckDuckGo, Microsoft, IBM, Google, Adobe, Salesforce, VMWare, Xerox, LinkedIn, Cisco, Facebook, Target, Citrix Systems, Twitter, Apple, Intel và rất nhiều công ty khác.

# Cách thức hoạt động của NginX

![image](https://user-images.githubusercontent.com/111721629/188783165-d38cba63-28bf-4110-b6d0-30939263b177.png)

Về cơ bản, Nginx hoạt động cũng tương tự như những Web Server khác. Thông thường, khi người dùng truy cập trang Web, browser sẽ kết nối với Server chứa trang Web này. Sau đó, Server sẽ tìm đúng file yêu cầu của Website và gửi lại cho người dùng, Đây được gọi là trình tự xử lý Single Thread hay cấu trúc luồng. Nghĩa là các bước chỉ thực hiện đúng theo một quy trình duy nhất. Và mỗi yêu cầu sẽ được tạo cho một Thread riêng biệt.

Tuy nhiên, nguyên lý hoạt động của Nginx có sự khác biệt ở chỗ nó hoạt động theo dạng kiến trúc bất đồng bộ, theo hướng sự kiện nhằm sử dụng ít bộ nhớ và tăng khả năng chạy đồng thời. Cụ thể, Nginx cho phép các Threads tương đồng với nhau cùng được quản lý trong cùng một tiến trình - Process. Tức là, mỗi Process sẽ bao gồm nhiều thực thể nhỏ hơn – và Worker Connections sẽ làm nhiệm vụ xử lý tất cả Threads đó.

Theo đó, các Worker Connections chính là bộ phận gửi yêu cầu cho Worker Process, và Worker Process lại tiếp tục gửi nó cho Master Process. Cuối cùng, Master Process sẽ đáp ứng các yêu cầu về cho người dùng. Đó cũng là lý do vì sao mỗi Worker Connections lại có thể xử lý được hàng ngàn yêu cầu tương tự nhau. Nhờ vậy, Nginx cũng có thể xử lý hàng ngàn yêu cầu khác nhau cùng một lúc.

# Tính năng của NginX

![image](https://user-images.githubusercontent.com/111721629/188783427-1d18394e-e4f2-408c-b038-f28b34866a31.png)

### Hiện nay, máy chủ HTTP Nginx sở hữu nhiều tính năng nổi bật như:

- Tạo ra khả năng xử lý hơn đến 10.000 kết nối cùng một lúc với các bộ nhớ thấp.
- Hỗ trợ phục vụ các tập tin tĩnh và lập ra các chỉ mục tập tin phù hợp.
- Có khả năng tăng tốc reverse proxy bằng các bộ nhớ đệm giúp cân bằng tải đơn giản hơn với khả năng chịu lỗi vô cùng cao.
- Nginx có thể hỗ trợ tăng tốc cùng với bộ nhớ FastCGI, uwsgi, SCGI và những máy chủ memcached vô cùng hiệu quả.
- Kiến trúc modular cho phép bạn gia tăng tốc độ nạp trang bằng biện pháp nén gzip một cách tự động.
- Nginx có khả năng hỗ trợ thực hiện mã hóa SSL và TLS.
- Cấu hình của Nginx vô cùng linh hoạt giúp lưu lại nhật ký truy vấn một cách dễ dàng.
- Nginx có khả năng chuyển hướng lỗi 3XX-5XX.
- Rewrite URL có thể sử dụng expression.
- Nginx có thể hạn chế tỷ lệ đáp ứng của truy vấn.
- Nginx giúp giới hạn số kết nối đồng thời cũng như truy vấn từ 1 địa chỉ.
- Nginx có khả năng nhúng mã PERL một cách dễ dàng.
- Nginx có thể hỗ trợ và tương thích hoàn toàn với IPv6.
- Nginx có thể hỗ trợ cho websockets.
- Nginx hỗ trợ truyền tải các file FLV và MP4.
