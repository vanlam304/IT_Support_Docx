# FireWall(Tường lửa)

Trong Công nghệ mạng thông tin, FireWall là một kỹ thuật được tích hợp vào hệ thống mạng để chống lại sự truy cập trái phép nhằm bảo vệ các nguồn thông tin nội bộ cũng như hạn chế sự xâm nhập vào hệ thông của một số thông tin khác không mong muốn.

Internet FireWall là một tập hợp thiết bị (bao gồm phần cứng và phần mềm) giữa mạng của một tổ chức, một công ty, hay một quốc gia (Intranet) và Internet:

( INTRANET - FIREWALL - INTERNET )

![image](https://user-images.githubusercontent.com/111721629/194815451-06ad89f8-ad07-4bc3-9163-ebb69ec56b81.png)

Trong một số trường hợp, Firewall có thể được thiết lập ở trong cùng một mạng nội bộ và cô lập các miền an toàn. Ví dụ như mô hình dưới đây thể hiện một mạng cục bộ sử dụng Firewall để ngăn cách phòng máy và hệ thống mạng ở tầng dưới.

# Chức năng

FireWall quyết định những dịch vụ nào từ bên trong được phép truy cập từ bên ngoài, những người nào từ bên ngoài được phép truy cập đến các dịch vụ bên trong, và cả những dịch vụ nào bên ngoài được phép truy cập bởi những người bên trong.

# Cấu trúc của FireWall

FireWall bao gồm :

- Một hoặc nhiều hệ thống máy chủ kết nối với các bộ định tuyến (router) hoặc có chức năng router.

- Các phần mềm quản lí an ninh chạy trên hệ thống máy chủ. Thông thường là các hệ quản trị xác thực (Authentication), cấp quyền (Authorization) và kế toán (Accounting).

# Các thành phần của FireWall

Một FireWall bao gồm một hay nhiều thành phần sau :

+ Bộ lọc packet (packet- filtering router).

+ Cổng ứng dụng (Application-level gateway hay proxy server).

+ Cổng mạch (Circuite level gateway).

# FireWall bảo vệ cái gì ?

Nhiệm vụ cơ bản của FireWall là bảo vệ những vấn đề sau :

+ Dữ liệu : Những thông tin cần được bảo vệ do những yêu cầu sau:

-- Bảo mât.

-- Tính toàn vẹn.

-- Tính kịp thời.

- Tài nguyên hệ thống.

- Danh tiếng của công ty sở hữu các thông tin cần bảo vệ.

# FireWall bảo vệ chống lại cái gì ?

FireWall bảo vệ chống lại những sự tấn công từ bên ngoài.

+ Tấn công trực tiếp:

Cách thứ nhất là dùng phương pháp dò mật khẩu trực tiếp. Thông qua các chương trình dò tìm mật khẩu với một số thông tin về người sử dụng như ngày sinh, tuổi, địa chỉ v.v…và kết hợp với thư viện do người dùng tạo ra, kẻ tấn công có thể dò được mật khẩu của bạn. Trong một số trường hợp khả năng thành công có thể lên tới 30%. Ví dụ như chương trình dò tìm mật khẩu chạy trên hệ điều hành Unix có tên là Crack.

Cách thứ hai là sử dụng lỗi của các chương trình ứng dụng và bản thân hệ điều hành đã được sử dụng từ những vụ tấn công đầu tiên và vẫn được để chiếm quyền truy cập (có được quyền của người quản trị hệ thống).

+ Nghe trộm: Có thể biết được tên, mật khẩu, các thông tin chuyền qua mạng thông qua các chương trình cho phép đưa vỉ giao tiếp mạng (NIC) vào chế độ nhận toàn bộ các thông tin lưu truyền qua mạng.

+ Giả mạo địa chỉ IP.

+ Vô hiệu hoá các chức năng của hệ thống (deny service). Đây là kiểu tấn công nhằm làm tê liệt toàn bộ hệ thống không cho nó thực hiện các chức năng mà nó được thiết kế. Kiểu tấn công này không thể ngăn chặn được do những phương tiện tổ chức tấn công cũng chính là các phương tiện để làm việc và truy nhập thông tin trên mạng.

+ Lỗi người quản trị hệ thống.

+ Yếu tố con người với những tính cách chủ quan và không hiểu rõ tầm quan trọng của việc bảo mật hệ thống nên dễ dàng để lộ các thông tin quan trọng cho hacker.
