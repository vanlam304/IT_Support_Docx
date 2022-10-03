# Vì Zimbra Administration Console có hỗ trợ Tiếng Việt nên cực kì dễ thao tác 
```
.........+++++
...+++++
e is 65537 (0x010001)
```
### 1. Chọn Cấu hình
Tại danh mục chính, click “Cấu hình” để mở tuỳ chọn cấu hình.

![image](https://user-images.githubusercontent.com/111721629/193490365-46d79329-f903-41c2-9d03-196207c38962.png)

### 2. “Install Certificate”
Chọn “Chứng chỉ” & click vào “Cài đặt chứng chỉ”

![image](https://user-images.githubusercontent.com/111721629/193490998-3d8f0471-f07b-4381-91b9-c51ee5f0b6f2.png)

### 3. Chọn Mail Server của bạn

Trong phần Chọn máy chủ đích, chọn server cần cài & click “Kế tiếp”.

![image](https://user-images.githubusercontent.com/111721629/193491138-fe08630c-0caa-43e6-b7ce-f1224ce70bc5.png)

### 4. Chọn “Install the commercially signed certificate”
Sau đolick “Kế tiếp”.
![image](https://user-images.githubusercontent.com/111721629/193491495-2d9570fc-553c-4c8e-82a5-40d70595349b.png)

5. Review the Certificate Signing Request
Sau khi kiểm tra Cái thông tin hiển thị là đúng click “Next”

Review CSR

6. Tải file Certificate lên server
Tải các file chứng chỉ bạn nhận được tại mục Lấy SSL của muassl.com vào các ô tương ứng. Sau đó click vào Next

Upload SSL

7. Nhấn vào “Install”
Quá trình có thể mất vài phút

Install

Thông báo nhận được khi cài thành công.

Configure

9. Restart - Khởi động lại để áp dụng thay đổi
Chạy lệnh sau

sudo su
su zimbra
Chuyển sang Zimbra user, khởi động lại dịch vụ sử dụng lệnh bên dưới:
zmcontrol restart
