# Cách đặt lại mật khẩu root khi quên trong Ubuntu

Khởi động lại Ubuntu và nhấn **ESC** liên tục cho đến khi hiện lên menu Grub

![image](https://user-images.githubusercontent.com/111721629/188596695-f2f76419-fa69-411a-8901-3d1eef770d50.png)

Sử dụng các phím mũi tên [lên] và [xuống] của bàn phím để vào Advanced Options for Ubuntu.

![image](https://user-images.githubusercontent.com/111721629/188596756-5784e395-d018-4e73-ab5d-d411645ea8de.png)

Nhấn [Enter] và bạn sẽ được chuyển hướng đến một cửa sổ Grub khác rồi chọn recovery mode

![image](https://user-images.githubusercontent.com/111721629/188596840-1a6112ba-675d-484b-b50a-52905f88747b.png)

Chờ chút đề màn hình dưới hiện lên.

![image](https://user-images.githubusercontent.com/111721629/188596885-361d8304-ed14-49eb-acdf-ae124bbdcd52.png)

Chọn root Drop to root shell prompt và nhấn [Enter] 

![image](https://user-images.githubusercontent.com/111721629/188596962-3c3ac9f6-e103-47d6-8616-e5fad6338571.png)

Ở cuối cửa sổ, bạn sẽ thấy một giao diện dòng lệnh có quyền truy cập trực tiếp vào terminal root shell.

![image](https://user-images.githubusercontent.com/111721629/188597680-2e26d03e-abe2-476b-a274-466ae97c070c.png)

Bước tiếp theo là cấp lại phân vùng hệ thống tệp root (/) với quyền ghi. Phân vùng truy cập mặc định của nó là chỉ đọc.

```
# mount -rw -o remount /
```

![image](https://user-images.githubusercontent.com/111721629/188597805-f36499f6-e3ce-433b-a775-6c31920d77e5.png)

Đặt lại mật khẩu root và thậm chí cả tên người dùng nếu muốn.
Trước khi đặt lại mật khẩu root,xác định được người dùng liên kết với mật khẩu đó.
```
# ls /home
```

![image](https://user-images.githubusercontent.com/111721629/188598022-92e73884-9ac0-4050-b586-9c35a3695bc4.png)

Sau khi xác định được người dùng root, sử dụng cú pháp lệnh này để đặt lại mật khẩu root:
```
# passwd username
```
Sẽ được nhắc hai lần để nhập và xác nhận lại mật khẩu root mới muốn sử dụng

![image](https://user-images.githubusercontent.com/111721629/188598350-825a0097-ad4e-4ca9-a86c-60e0557660ab.png)

Nhập phím thoát trên terminal và nhấn [Enter] trên bàn phím. Quay lại cửa sổ Recovery Menu. Chọn Resume normal boot.

![image](https://user-images.githubusercontent.com/111721629/188598479-0a568ac2-a885-487d-9008-27a076fecdde.png)

Bỏ qua mọi cảnh báo về khả năng tương thích của chế độ đồ họa vì quá trình khởi động lại hệ thống hoàn chỉnh sẽ khắc phục được lỗi đó.

![image](https://user-images.githubusercontent.com/111721629/188598533-4acdde11-1081-4bc4-a4d3-cd3e569f80d3.png)

Dựa trên mật khẩu root đã đặt, có thể thoải mái truy cập lại hệ thống Ubuntu của mình với tư cách là người dùng quản trị/root.
