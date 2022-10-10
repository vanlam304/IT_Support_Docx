# Tường lửa trên Windows

**Windows Firewall** (tên chính thức là **Windows Defender Firewall** trong Windows 10), là thành phần tường lửa của Microsoft Windows. Nó lần đầu tiên được bao gồm trong Windows XP và Windows Server 2003. Trước khi phát hành Windows XP Service Pack 2 vào năm 2004, nó được gọi là Tường lửa kết nối Internet. Với việc phát hành Windows 10 phiên bản 1709, vào tháng 9 năm 2017, nó đã được đổi tên thành Windows Defender Firewall như một phần của chiến dịch quảng bá thương hiệu "Windows Defender".

**Một trong ba cấu hình được kích hoạt tự động cho từng giao diện mạng:**

- _Public_ giả định rằng mạng được chia sẻ với Thế giới và là hồ sơ hạn chế nhất.

- _Private_ giả định rằng mạng được cách ly với Internet và cho phép kết nối trong nước nhiều hơn so với công cộng. Một mạng không bao giờ được coi là riêng tư trừ khi được chỉ định bởi quản trị viên địa phương.

- _Domain_ là hạn chế ít nhất. Nó cho phép nhiều kết nối gửi đến hơn để cho phép chia sẻ tập tin, vv Cấu hình miền được chọn tự động khi được kết nối với mạng có miền được máy tính cục bộ tin cậy.

# Tác dụng của tường lửa

Nhiệm vụ cơ bản của Firewall là kiểm soát giao thông dữ liệu giữa hai vùng có độ tin cậy khác nhau điển hình gồm:

- Mạng Internet (vùng không đáng tin cậy).

- Mạng nội bộ (một vùng có độ tin cậy cao).

Mục đích cuối cùng của Firewall là cung cấp kết nối có kiểm soát giữa các vùng với độ tin cậy khác nhau thông qua việc áp dụng một chính sách an ninh và mô hình kết nối dựa trên nguyên tắc quyền tối thiểu.

# Bật tắt tường lửa 

## Cách tắt FireWall trên Windows 10

### Tắt thông qua Control Panel

**Bước 1**: Mở **Control Panel** >**System and Security** >**Chọn Windows Defender Firewall.**

![image](https://user-images.githubusercontent.com/111721629/194824875-73e31905-8113-47f7-9f6a-e89ec5105b1a.png)


![image](https://user-images.githubusercontent.com/111721629/194825238-dc5f0e68-fd45-4af2-8574-4a9791274a0c.png)

![image](https://user-images.githubusercontent.com/111721629/194825547-3756114a-ec70-4829-8ed8-3d0ffb5461cd.png)

**Bước 2:** Trong cửa sổ **Windows Firewall** bạn hãy nhấn vào mục Turn Windows Firewall on or off để có thể bắt đầu lựa chọn bật tắt tường lửa tùy ý.

![image](https://user-images.githubusercontent.com/111721629/194825778-f0408fba-f723-4650-aa07-c3e2f75efea4.png)

**Bước 3:** Nhấn vào 2 ô tùy chọn **Turn off windows firewall(not recommended)** và nhấn OK là được.

![image](https://user-images.githubusercontent.com/111721629/194828594-b4ef1ca8-d46c-4a88-acb8-9419daba00e2.png)

## Tắt thông qua Command Prompt

**Bước 1**: Nhập vào ô tìm kiếm từ khoá **CMD** > Chọn **Run as administrator**.

![image](https://user-images.githubusercontent.com/111721629/194829180-08605a0c-66ca-4d40-85ed-d600737e97a5.png)

**Bước 2**: Tại giao diện của Command Prompt bạn dùng lệnh **netsh advfirewall set allprofiles state off** để tắt tường lửa trên Windows 10.

![image](https://user-images.githubusercontent.com/111721629/194829513-49f5b798-ee73-45db-b545-103185020ac8.png)

