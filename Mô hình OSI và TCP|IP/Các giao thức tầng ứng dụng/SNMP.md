# SNMP

**SNMP ( Simple Network Management Protocol)** là một tập hợp các giao thức không chỉ cho phép kiểm tra các thiết bị mạng như router, switch hay server có đang vận hành mà còn hỗ trợ vận hành các thiết bị này một cách tối ưu, ngoài ra SNMP còn cho phép quản lý các thiết bị mạng từ xa.
<p>
  <img src="https://user-images.githubusercontent.com/111721629/186870930-0deebd7c-fcbb-48ce-8127-1d294cfd700c.PNG" style="width:600px;">
       </p>
  
  
# Thành phần
Một hệ thống sử dụng SNMP bao gồm 2 thành phần chính:

  <p>
    <img src="https://user-images.githubusercontent.com/111721629/186871327-f4ffff27-f1de-4a2d-a25d-50d5fc396022.PNG" style="width:600px;">
    </>
    
**Manager:** Là một máy tính chạy chương trình quản lý mạng. Manager còn được gọi là một NMS (Network Management Station). Nhiệm vụ của một manager là truy vấn các agent và xử lý thông tin nhận được từ agent.
**Agent:** Là một chương trình chạy trên thiết bị mạng cần được quản lý. Agent có thể là một chương trình riêng biệt (ví dụ như daemon trên Unix) hay được tích hợp vào hệ điều hành, ví dụ như IOS (Internetwork Operation System) của Cisco. Nhiệm vụ của agent là thông tin cho manager.

# Hoạt động của SNMP
SNMP sử dụng **UDP (User Datagram Protocol)** làm giao thức truyền tải thông tin giữa manager và các agent. Việc sử dụng UDP, thay vì TCP, bởi vì UDP là phương thức truyền mà trong đó hai đầu thông tin không cần thiết lập kết nối trứơc khi dữ liệu được trao đổi (connectionless), thuộc tính này phù hợp trong điều kiện mạng gặp trục trặc, hư hỏng v.v. cần ưu tiên về mặt tốc độ.

SNMP có các phương thức quản lý nhất định và các phương thức này được định dạng bởi các gói tin PDU (Protocol Data Unit). Các manager và agent sử dụng PDU để trao đổi với nhau.
