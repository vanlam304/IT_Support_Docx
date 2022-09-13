# Những điểm chung 

- Đều có khả năng chạy được trên nhiều hệ điều hành của hệ thống UNIX.
- Có hệ thống Mailing và diễn đàn Stack Overflow hỗ trợ.
- Có khả năng bảo mật tốt cho mã nguồn.
- Nginx kết nối với PHP có khả năng xử lý đồng thời như Apache ghép nối với các Module PHP-FPM.
- Hai server có hiệu năng trên nội dung động tương tự nhau.
- Thời gian chạy trong môi trường PHP của hai server trên khá giống nhau.
- Đều có cộng đồng sử dụng lớn

# Điểm khác biệt

| Apache | NginX |
|--------|--------|
|Chạy trên tất cả các loại hệ thống Unix-like và hỗ trợ đầy đủ cho Windows.|Cũng chạy trên một số Unix hiện đại và hỗ trợ một số tính năng cho Windows. Tuy nhiên, hiệu suất hoạt động của Nginx trên windows không mạnh như Apache.|
|Thiếu sự hỗ trợ người dùng từ phía công ty (Apache Foundation)|Chạy trên tất cả các loại hệ thống Unix-like và hỗ trợ đầy đủ cho Windows.|
|Có khả năng xử lý đến 1000 kết nối với nội dung tĩnh nhanh gấp 2.5 lần so với Apache. Sử dụng ít bộ nhớ hơn.|Xử lý cùng lúc ít kết nối và tốc độ không được nhanh như Nginx.|
|Có lợi thế hơn do Apache được cung cấp Dynamic Module từ rất lâu.|Vào năm 2016, Nginx mới bắt đầu hỗ trợ cho Dynamic Module.|
