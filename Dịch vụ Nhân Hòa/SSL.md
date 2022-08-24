# SSL(Secure Sockets Layer)

## SSL là gì ?

SSL là viết tắt của Secure Sockets Layer, một công nghệ tiêu chuẩn cho phép thiết lập kết nối được mã hóa an toàn giữa máy chủ web (host) và trình duyệt web (client).

Kết nối này đảm bảo rằng dữ liệu được truyền giữa host và client được duy trì một cách riêng tư, đáng tin cậy. SSL hiện đã được sử dụng bởi hàng triệu trang web để bảo vệ các giao dịch trực tuyến của họ với khách hàng.

Nếu bạn đã từng truy cập một trang web sử dụng ***https://*** trên thanh địa chỉ nghĩa là bạn đã tạo một kết nối an toàn qua SSL. Nếu có một cửa hàng online hoặc bán đồ trên website, SSL sẽ giúp tạo lập sự tin tưởng với khách hàng và bảo mật thông tin được trao đổi qua lại giữa bạn với khách hàng.
<p align="center">
  <img src="https://user-images.githubusercontent.com/111721629/186382621-3be97091-5584-427c-8466-ae137b35ff25.jpg" style="width:600px;">
  </p>
  
## Có 5 loại SSL
#### DV-SSL
Domain Validation (DV): chứng thư số SSL chứng thực cho Domain Name - Website . Khi 1 Website sử dụng DV SSL thì sẽ được xác thực tên domain , website đã được mã hoá an toàn khi trao đổi dữ liệu
#### EV-SSL
Extended Validation (EV): cho khách hàng của bạn thấy Website đang sử dụng chứng thư SSL có độ bảo mật cao nhất và được rà soát pháp lý kỹ càng.
Với thanh đại chỉ sang màu xanh với hiển thị đầy đủ thông tin của công ty, cung cấp một cấp độ cao hơn tin tưởng vào website của bạn.
#### OV-SSL
Organization Validation (OV): chứng thư số SSL chứng thực cho Website và xác thực doanh nghiệp đang sở hữu website đó
#### Wildcard SSL
(Wildcard SSL Certificate): sản phẩm lý tưởng dành cho các cổng thương mại điện tử. Các website dạng này thường có thể tạo ra các trang e-store dành cho các chủ cửa hàng trực tuyến, mỗi e-store là một sub domains và được chia sẻ trên một địa chỉ IP duy nhất. Khi đó, để triển khai giải pháp bảo bảo mật giao dịch trực tuyến (khi đặt hàng, thanh toán, đăng ký & đăng nhập tài khoản,...) bằng SSL, chúng ta có thể dùng duy nhất một chứng chỉ số Wildcard cho tên miền chính của website và dùng chung một địa chỉ IP duy nhất để chia sẻ cho tất cả mọi sub domains.
#### Subject Alternative Names (SANs SSL)
- Nhiều tên miền hợp nhất trong 1 chứng thư số:
  + Một chứng thư số SSL tiêu chuẩn chỉ bảo mật cho duy nhất một tên miền đã được kiểm định. Lựa chọn thêm SANs chỉ với chứng thư duy nhất bảo đảm cho nhiều tên miền con. SANs mang lại sự linh hoạt cho người sử dụng, dễ dàng hơn trong việc cài đặt, sử dụng và quản lý chứng thư số SSL. Ngoài ra, SANs có tính bảo mật cao hơn Wildcard SSL, đáp ứng chính xác yêu cầu an toàn đối với máy chủ và làm giảm tổng chi phí triển khai SSL tới tất cả các tên miền và máy chủ cần thiết.
  + Chứng thư số SSL SANs có thể tích hợp với tất cả các loại chứng thư số SSL của GlobalSign bao gồm: Chứng thực tên miền (DV SSL), Chứng thực tổ chức doanh nghiệp (OV SSL) và Chứng thực mở rộng cao cấp (EV SSL).
## Tại sao nên sử dụng SSL?

Bạn đăng ký domain để sử dụng các dịch vụ website, email v.v... -> luôn có những lỗ hổng bảo mật -> hacker tấn công -> SSL bảo vệ website và khách hàng của bạn.

Bảo mật dữ liệu: dữ liệu được mã hóa và chỉ người nhận đích thực mới có thể giải mã.

Toàn vẹn dữ liệu: dữ liệu không bị thay đổi bởi tin tặc.

Chống chối bỏ: đối tượng thực hiện gửi dữ liệu không thể phủ nhận dữ liệu của mình.

## Lợi ích khi sử dụng SSL?

Bạn đăng ký domain để sử dụng các dịch vụ website, email v.v… -> luôn có những lỗ hổng bảo mật -> hacker tấn công -> SSL bảo vệ website và khách hàng của bạn.

Bảo mật và mã hóa các thông điệp trao đổi giữa trình duyệt và server.

Bảo mật các giao dịch giữa khách hàng và doanh nghiệp, các dịch vụ truy nhập hệ thống.

Bảo mật webmail và các ứng dụng như Outlook Web Acess, Exchange, và Office Communication Server.

Bảo mật các ứng dụng ảo hóa như Citrix Delivery Platform hoặc các ứng dụng điện toán mây.

Bảo mật dịch vụ FTP.

Bảo mật truy cập Control panel

Bảo mật các dịch vụ truyền dữ liệu trong mạng nội bộ, file sharing, extranet.

Bảo mật VPN Access Servers, Citrix Access Gateway.

Nâng cao hình ảnh, thương hiệu và uy tín doanh nghiệp

Nâng cao thứ hạng website trên kết quả tìm kiếm Google (SEO)

Tạo lợi thế cạnh tranh, tăng niềm tin của khách hàng đối với website, tăng số lượng giao dịch, giá trị giao dịch trực tuyến của khách hàng. Website không được xác thực và bảo mật sẽ luôn ẩn chứa nguy cơ bị xâm nhập dữ liệu, dẫn đến hậu quả khách hàng không tin tưởng sử dụng dịch vụ.
