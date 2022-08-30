# Định nghĩa

Containers là một giải pháp cho vấn đề làm thế nào để phần mềm chạy một cách đáng tin cậy khi được chuyển từ môi trường máy tính này sang môi trường máy tính khác.Docker đã bùng nổ vào năm 2013 và nó đã gây ra sự phấn khích trong giới CNTT kể từ đó.

Điều này có thể là từ máy tính xách tay của nhà phát triển đến môi trường thử nghiệm, từ môi trường tiền sản xuất đến môi trường sản xuất và có thể từ máy vật lý trong trung tâm dữ liệu đến máy ảo trên cloud.

### Cách làm việc của Container

Nói một cách đơn giản, một container bao gồm toàn bộ môi trường trong thời gian chạy: một ứng dụng với tất cả các thư viện, các tệp tin nhị phân, các tệp tin cấu hình cần thiết để chạy ứng dụng đó sẽ được gói vào một gói. Bằng cách này, vấn đề về sự khác biệt trong các hệ điều hành và cơ sở hạ tầng cơ bản được khắc phục và loại bỏ.

# 3. Sự Khác Biệt Giữa Container Và Ảo Hóa

Với công nghệ ảo hóa, các gói là một máy ảo và nó bao gồm toàn bộ hệ điều hành cũng như ứng dụng. Một máy chủ vật lý chạy ba máy ảo sẽ có một trình ảo hóa và ba hệ điều hành riêng biệt chạy trên nó.

Ngược lại, một máy chủ chạy ba ứng dụng được đóng gói với Docker chạy một hệ điều hành và mỗi container chia sẻ nhân hệ điều hành với các container khác. Các phần được chia sẻ của hệ điều hành có chức năng chỉ cho phép được đọc, trong khi mỗi container có các phân vùng riêng (nghĩa là cách truy cập vào bộ chứa) cho quá trình ghi. Điều đó có nghĩa là các container nhẹ hơn nhiều và sử dụng ít tài nguyên hơn nhiều so với máy ảo.

Container thường nhẹ và linh hoạt hơn, mức yêu cầu tài nguyên cũng thấp hơn so với phương pháp ảo hóa máy chủ thông thường bởi vì chúng không chứa image hệ điều hành mà dùng chung kernel của máy chủ host. Container cũng có thể triển khai thành 1 hoặc nhiều cụm container khi muốn chạy những ứng dụng lớn hơn.
