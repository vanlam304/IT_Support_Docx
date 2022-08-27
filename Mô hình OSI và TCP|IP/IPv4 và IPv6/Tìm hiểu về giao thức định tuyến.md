# Giao thức định tuyến

Giao thức định tuyến là ngôn ngữ giao tiếp giữa các router. Một giao thức định tuyến cho phép các router chia sẻ thông tin về các network, router sử dụng các thông tin này để xây dựng và duy trì bảng định tuyến.

#### Bảng định tuyến của mỗi giao thức định tuyến là khác nhau, nhưng có thể bao gồm những thông tin sau:

- Địa chỉ đích của mạng, mạng con hoặc hệ thống.

- Địa chỉ IP của router chặng kế tiếp phải đến.

- Giao tiếp vật lí phải sử dụng để đi đến Router kế tiếp.

- Subnet mask của địa chỉ đích.

- Khoảng cách đến đích (ví dụ: số lượng chặng để đến đích).

- Thời gian (tính theo giây) từ khi Router cập nhật lần cuối.


#  Phân loại định tuyến

Có nhiều tiêu chí để phân loại các giao thức định tuyến khác nhau. Định tuyến được phân chia thành 2 loại cơ bản:

- Định tuyến tĩnh: Việc xây dựng bảng định tuyến của router được thực hiện bằng tay bởi người quản trị.

- Định tuyến động: Việc xây dựng và duy trì trạng thái của bảng định tuyến được thực hiện tự động bởi router.

**Việc chọn đường đi được tuân thủ theo 2 thuật toán cơ bản:**

+ Distance vector: Chọn đường đi theo hướng và khoảng cách tới đích.

+ Link State: Chọn đường đi ngắn nhất dựa vào cấu trúc của toàn bộ mạng theo trạng thái của các đường liên kết mạng.

<p>
  <img src="https://vnpro.vn/upload/user/images/Th%C6%B0%20Vi%E1%BB%87n/tong-quan-ve-dinh-tuyen.jpg">
  </p>
