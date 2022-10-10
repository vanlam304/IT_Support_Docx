**UFW (Uncomplicated Firewall)** là một giao diện với iptables nhằm hướng tới việc đơn giản hoá quá trình cấu hình tường lửa. Vì iptables là một công cụ vững chắc và linh hoạt nên người mới bắt đầu sử dụng sẽ thấy rất khó để thiết lập đúng cấu hình tường lửa.

# Cài đặt UFW

Tường lửa không biến chứng nên được cài đặt theo mặc định trong Ubuntu 18.04, nhưng nếu nó không được cài đặt trên hệ thống của bạn, bạn có thể cài đặt gói bằng cách gõ:

`sudo apt install ufw`

![image](https://user-images.githubusercontent.com/111721629/194842042-b7a7c7fe-3cd4-4d28-9b4c-69449f6ef04b.png)

- Sau khi cài đặt hoàn tất, kiểm tra trạng thái của UFW:

`sudo ufw status verbose`

- UFW bị tắt theo mặc định. Nếu bạn chưa bao giờ kích hoạt UFW trước đó, đầu ra sẽ như thế này:
![image](https://user-images.githubusercontent.com/111721629/194842939-6afb8737-e29f-412a-8967-00687fb9688a.png)

- Khi đó bạn phải kích hoạt thủ công:
![image](https://user-images.githubusercontent.com/111721629/194843246-16f28357-59d4-482d-b97c-c9bb3f28d131.png)


- Nếu UFW được kích hoạt, đầu ra sẽ trông giống như sau:

![image](https://user-images.githubusercontent.com/111721629/194843322-f9734067-3932-4930-aaa0-5ccd6c307806.png)

- Để khôi phục ufw về mặc định:

Vì một lý do nào đó bạn cần phục hồi, xóa tất cả các rule hiện có để đưa về mặc định ban đầu, hãy sử dụng tùy chọn reset để thực hiện.

`sudo ufw reset`

Để vô hiệu hóa kích hoạt ufw:

`sudo ufw disable`

# Chính sách mặc định của UFW

Theo mặc định, UFW sẽ chặn tất cả các kết nối đến và cho phép tất cả các kết nối ra ngoài. Điều này có nghĩa là bất kỳ ai đang cố gắng truy cập máy chủ của bạn sẽ không thể kết nối trừ khi bạn mở cổng cụ thể, trong khi tất cả các ứng dụng và dịch vụ đang chạy trên máy chủ của bạn sẽ có thể truy cập vào thế giới bên ngoài.

Các chính sách mặc định được xác định trong tệp _/etc/default/ufw_ và có thể được thay đổi bằng cách sử dụng:

`sudo ufw default`

Chính sách tường lửa là nền tảng để xây dựng các quy tắc chi tiết hơn và do người dùng xác định. Trong hầu hết các trường hợp, Chính sách mặc định UFW ban đầu là điểm khởi đầu tốt.

# Hồ sơ ứng dụng

Khi cài đặt một gói với apt nó sẽ thêm một hồ sơ ứng dụng vào thư mục _/etc/ufw/applications.d_. Hồ sơ mô tả dịch vụ và chứa các cài đặt UFW.

**Liệt kê các hồ sơ ứng dụng có sẵn trên máy chủ:**

`sudo ufw app list`

![image](https://user-images.githubusercontent.com/111721629/194843981-c8aa0ada-1229-4891-9b02-ad29a0cf1a04.png)

**Tìm thêm thông tin về một hồ sơ cụ thể và các quy tắc bao gồm:**

`sudo ufw app info 'CUPS'`

![image](https://user-images.githubusercontent.com/111721629/194844143-71a94838-b87b-4782-9661-cca392501fc6.png)

# Cho phép kết nối SSH

Trước khi bật tường lửa UFW, chúng ta cần thêm một quy tắc cho phép kết nối SSH đến. Nếu bạn đang kết nối với máy chủ của mình từ một địa điểm từ xa, điều này gần như luôn luôn như vậy và bạn kích hoạt tường lửa UFW trước khi cho phép rõ ràng các kết nối SSH đến, bạn sẽ không thể kết nối với máy chủ Ubuntu của mình nữa.

**Để định cấu hình tường lửa UFW của bạn để cho phép các kết nối SSH đến, hãy nhập lệnh sau:**

`sudo ufw allow ssh`

![image](https://user-images.githubusercontent.com/111721629/194844310-d8e09180-0b45-47fd-8d5d-4c4b2e7c7a67.png)

# Sử dụng ufw để quản lý quy tắc

**Cho phép mở port kết nối**

`sudo ufw allow <port>/<optional: protocol>`

Ví dụ: Sử dụng ufw để mở cổng 80, 443, 8080:

```
sudo ufw allow 80/tcp

sudo ufw allow https

sudo ufw allow 8080/tcp
```
![image](https://user-images.githubusercontent.com/111721629/194844517-fc97831c-6178-448f-8b76-8be1c79893de.png)

# Từ chối, đóng port kết nối

`sudo ufw deny <port>/<optional: protocol> `

Ví dụ: đóng cổng kết nối là 3306 và 8080

```
sudo ufw deny 3306
sudo ufw deny 8080
```

Ngoài ra ufw còn hỗ trợ cú pháp đơn giản như sau. Nếu bạn xác định được cổng thuộc dịch vụ nào bạn có thể deny dịch vụ thay vì cổng thuộc dịch vụ đó.

`sudo ufw deny mysql`

# Cho phép IP truy cập đến cổng nhất định

Với cú pháp này sẽ cho phép một IP cụ thể được quyền truy cập vào cổng đã được chỉ định.

```
sudo ufw allow from 192.168.0.1 to any port 22
sudo ufw allow from 192.168.0.1 to any port 3306
```
## Xóa bỏ các quy tắc

Để quản lý các quy tắc trên UFW của bạn, bạn có thể liệt kê chúng ra theo dạng menu danh sách. Để thực hiện được bạn sử dụng lệnh sau, màn hình hiển thị các quy tắc kèm số thứ tự và bạn sẽ chọn các số thứ tự hoặc tên quy tắc để xoá bỏ.

`sudo ufw status numbered`

![image](https://user-images.githubusercontent.com/111721629/194844879-c888c52f-5e7e-45c4-b587-70044e88fa75.png)

**Dùng lệnh sau để xóa:**

`sudo ufw delete [number]`

![image](https://user-images.githubusercontent.com/111721629/194845097-158c00c8-f868-4519-895a-8e7be1dd9210.png)

## Cho phép phạm vi cổng

UFW cho phép bạn truy cập vào phạm vi cổng kết nối thay vì bạn mở cho từng cổng riêng biệt. Và khi bạn cho phép phạm vi cổng bạn cần xác định phạm vi cổng thuộc giao thức TCP hay là UDP để mở.

```
sudo ufw allow 35000:35999/tcp
sudo ufw allow 35000:35999/udp
```

## Đóng phạm vi cổng
 ```
sudo ufw deny 35000:35999/tcp
sudo ufw deny 35000:35999/udp
```

![image](https://user-images.githubusercontent.com/111721629/194845258-9e1c358b-6881-41f6-83d1-e4d520702172.png)

## Cho phép và từ chối IP

Để cho phép, mở IP bạn sử dụng lệnh:

`sudo ufw allow from $Your_IP`

Để từ chối IP truy cập bạn sử dụng lệnh:

`sudo ufw deny from $Your_IP`

![image](https://user-images.githubusercontent.com/111721629/194845470-bd7df608-77d3-4c60-90e4-e2393ddc6841.png)
