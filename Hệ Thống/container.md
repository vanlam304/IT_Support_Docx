# 1. Định nghĩa

Containers là một giải pháp cho vấn đề làm thế nào để phần mềm chạy một cách đáng tin cậy khi được chuyển từ môi trường máy tính này sang môi trường máy tính khác.Docker đã bùng nổ vào năm 2013 và nó đã gây ra sự phấn khích trong giới CNTT kể từ đó.

Điều này có thể là từ máy tính xách tay của nhà phát triển đến môi trường thử nghiệm, từ môi trường tiền sản xuất đến môi trường sản xuất và có thể từ máy vật lý trong trung tâm dữ liệu đến máy ảo trên cloud.

### 2. Cách làm việc của Container

Nói một cách đơn giản, một container bao gồm toàn bộ môi trường trong thời gian chạy: một ứng dụng với tất cả các thư viện, các tệp tin nhị phân, các tệp tin cấu hình cần thiết để chạy ứng dụng đó sẽ được gói vào một gói. Bằng cách này, vấn đề về sự khác biệt trong các hệ điều hành và cơ sở hạ tầng cơ bản được khắc phục và loại bỏ.

# 3. Sự Khác Biệt Giữa Container Và Ảo Hóa

Với công nghệ ảo hóa, các gói là một máy ảo và nó bao gồm toàn bộ hệ điều hành cũng như ứng dụng. Một máy chủ vật lý chạy ba máy ảo sẽ có một trình ảo hóa và ba hệ điều hành riêng biệt chạy trên nó.

Ngược lại, một máy chủ chạy ba ứng dụng được đóng gói với Docker chạy một hệ điều hành và mỗi container chia sẻ nhân hệ điều hành với các container khác. Các phần được chia sẻ của hệ điều hành có chức năng chỉ cho phép được đọc, trong khi mỗi container có các phân vùng riêng (nghĩa là cách truy cập vào bộ chứa) cho quá trình ghi. Điều đó có nghĩa là các container nhẹ hơn nhiều và sử dụng ít tài nguyên hơn nhiều so với máy ảo.

Container thường nhẹ và linh hoạt hơn, mức yêu cầu tài nguyên cũng thấp hơn so với phương pháp ảo hóa máy chủ thông thường bởi vì chúng không chứa image hệ điều hành mà dùng chung kernel của máy chủ host. Container cũng có thể triển khai thành 1 hoặc nhiều cụm container khi muốn chạy những ứng dụng lớn hơn.
<p>
  <img src="https://tigosoftware.com/sites/default/files/inline-images/tgmc-blog-5e534fcaa1861.png">
  </p>
  
  # 4. Lợi ích
  
  Một container có thể chỉ có kích thước hàng chục megabyte, trong khi đó một máy ảo với toàn bộ hệ điều hành của nó có thể có kích thước vài gigabyte. Bởi vì điều này, một máy chủ duy nhất có thể lưu trữ nhiều container hơn nhiều so với máy ảo. Các lập trình viên có thể sử dụng container để chạy các ứng dụng từ siêu nhỏ, thao tác ngắn đến các ứng dụng lớn hơn và các thao tác phức tạp hơn. Tất cả những gì mà ứng dụng cần để chạy như mã nguồn, các thư viện, file cấu hình… được gom lại thành 1 gói duy nhất trong container.

Một lợi ích lớn khác là các máy ảo có thể mất vài phút để khởi động hệ điều hành của chúng và bắt đầu chạy các ứng dụng mà chúng lưu trữ, trong khi các ứng dụng được đóng gói trong 1 container có thể được khởi động gần như ngay lập tức. 

Điều đó có nghĩa là các container có thể được khởi tạo theo kiểu “just in time” khi chúng cần thiết và có thể biến mất khi không còn cần thiết nữa, theo đó tài nguyên được giải phóng trên máy chủ của chúng.

Một lợi ích thứ ba là container hóa cho phép mô đun hóa lớn hơn. Thay vì chạy toàn bộ một ứng dụng phức tạp bên trong một container, ứng dụng có thể được chia thành các mô-đun (chẳng hạn như cơ sở dữ liệu, giao diện người dùng, v.v.). Đây là cách tiếp cận được gọi là microservice.

Các ứng dụng được xây dựng theo cách này dễ quản lý hơn vì mỗi mô-đun tương đối đơn giản và các thay đổi có thể được thực hiện cho các mô-đun mà không phải xây dựng lại toàn bộ ứng dụng.

Vì các container rất nhẹ, các mô-đun riêng lẻ (hoặc microservice) chỉ có thể được khởi tạo khi chúng cần thiết và có sẵn gần như ngay lập tức.

# 5. Sự tiện dụng

Một trong những đặc điểm nổi bật của công nghệ container là sự linh hoạt. Với một máy ảo, nó mất vài phút để khởi động. Nhưng với công nghệ container, máy chủ vật lý đã chạy một hệ điều hành, các container chỉ mất vài giây để chạy. Điều này cho phép các container chạy hay dừng theo nhu cầu, nhiều yêu cầu đến server sẽ cho chạy nhiều container, ít thì có thể dừng một số container.
<p>
  <img src="https://i.imgur.com/PG64nzT.png">
       </p>
       
Thêm vào đó nếu một container bị lỗi, nó có thể khởi động lại rất nhanh để làm việc trở lại. Việc này được gọi là container orchestration và Docker Swarm, Kubernetes là những ứng dụng kiểu này. Chúng phân bổ lượng task trong mỗi container cluster.

Nhiều container cùng chia sẻ một hệ điều hành, sẽ gây ra lo ngại về tính bảo mật. Khi bảo mật trên máy chủ không tốt, nó tác động đến nhiều container. Có nhiều nghiên cứu cho vấn đề này. Một trong số đó là trước khi được chạy các container phải được xác thực. Cũng có những phần mềm bảo mật container như Twistlock, nó sẽ xem xét hành vi của container và sẽ ngưng chạy nếu phát hiện hoạt động nghi ngờ.
