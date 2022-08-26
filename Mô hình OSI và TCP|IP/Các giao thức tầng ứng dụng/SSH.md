# SSH là gì ?

**SSH (Secure Socket Shell)** là một giao thức mạng cho phép truy cập  máy tính từ xa  một cách an toàn, bằng cách mã hóa đường truyền giữa hai máy tính. SSH hoạt động ở lớp trên trong mô hình phân lớp TCP/IP và sử dụng kỹ thuật cryptographic để đảm bảo tất cả các giao tiếp gửi tới và gửi từ máy chủ ở xa luôn trong tình trạng bảo mật, hạn chế việc nghe trộm, đánh cắp thông tin trên đường truyền. 

SSH thường được lập trình viên sử dụng để tương tác giữa máy chủ và máy khách, nhằm bảo vệ các giao dịch an toàn và hiệu quả nhất. 

# Cách thức hoạt động
<p>
  <img src="https://nhanhoa.com/uploads/attach/1621056103_ssh_la_gi_4.jpg">
  </p>
  
**Bước 1. Định danh host**
hoặc khởi tạo kết nối SSH. Được thực hiện qua việc trao đổi khóa, mỗi SSH trên máy tính có một kiểu định danh duy nhất. Nhằm xác định định danh của hệ thống được tham gia phiên làm việc SSH. Các server và client phải được bảo mật trên kênh kết nối này.

**Bước 2. Mã hoá dữ liệu**
SSH sẽ thiết lập các kênh làm việc mã hoá. Việc này được thực hiện sau khi Client đã xác định được định danh của của máy chủ. Các cặp mã bảo mật đối xứng sẽ được hình thành và chia sẻ với 2 bên máy. 

**Bước 3. Chứng thực mã hóa**
Đây là bước cuối cùng. chứng thực và giải mã nhằm đảm bảo người sử dụng hoàn toàn có quyền đăng nhập vào hệ thống. 
# Các kỹ thuật mã hóa SSH

 <p>
  <img src="https://user-images.githubusercontent.com/111721629/186846447-5e14c269-e3e4-43f3-a19a-f229ef4e8d22.PNG" >
  </p>
  
**Symmetrical Encryption**

Là một dạng mã hóa sử dụng secret key (chìa khóa bí mật) ở cả 2 chiều mã hóa và giải mã tin nhắn bởi cả host và client. Quá trình tạo symmetric key được thực hiện bởi key exchange algorithm. Khi thực hiện kỹ thuật này, chỉ những người có chìa khóa (mật khẩu) mới có thể giả mã tin nhắn trong quá trình chuyển.

Lưu ý, key không được truyền giữa client và host. Thay vào đó, cả 2 máy tính chia sẻ thông tin chung và sau đó sử dụng chúng để tính ra khóa bí mật. Điều này đảm bảo, dù có bị máy tính khác bắt được đường truyền chung thì thông tin vẫn được an toàn vì không tính được thuật toán tạo key.

**Asymmetrical Encryption**

Asymmetrical encryption sử dụng 2 khóa khác nhau là public key và private key để mã hóa và giải mã. Hay còn biết đến là cặp khóa public-private key pair. Giống như tên gọi, khóa public sẽ được công khai cho tất cả các bên liên quan còn private key phải luôn luôn được đảm bảo an toàn.

Asymmetrical Encryption chỉ được sử dụng trong quá trình trao đổi thuật toán của khóa của symmetric encryption, server sử dụng public key của client để tạo, challenge và truyền nó tới client để chứng thực. Nếu client giải mã được thông tin nghĩa là nó đang giữa đúng private key cần thiết.

**Hashing**

Hashing được SSH sử dụng để  để xác nhận tính xác thực của tin nhắn. Bằng cách tạo ra một giá trị duy nhất với độ dài nhất định cho mỗi lần nhập liệu mà không có hướng nào khác để khai thác.

SSH được thực hiện bởi HMACs, đảm bảo lệnh không bị giả mạo bởi bất kỳ phương thức nào.
