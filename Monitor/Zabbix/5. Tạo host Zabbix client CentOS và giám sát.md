### Bước 1: Đăng nhập vào dashboard Zabbix Server

![image](https://user-images.githubusercontent.com/111716161/194249561-1c09a671-9d53-4658-b772-e9051b6d3da5.png)

### Bước 2: Tạo host

- Chọn tab Configuration -> Host -> Create host.

![image](https://user-images.githubusercontent.com/111716161/194245489-b8d61a63-ca19-41f5-bd22-240f72d035db.png)

- Điền các thông số của host, bắt buộc phải điền Hostname, Group, IP

![image](https://user-images.githubusercontent.com/111716161/194245685-248c8f47-33b7-4f92-8b79-ea4d566bef32.png)

### Bước 3: Tạo Template cho host

- Chọn Template -> Select -> Template OS Linux by Zabbix agent -> Select.

![image](https://user-images.githubusercontent.com/111716161/194245799-1a5ff192-a47c-48ad-9739-9df519cd3dc0.png)

![image](https://user-images.githubusercontent.com/111716161/194245954-2d362409-5775-4a25-b78c-b2b509e36c1c.png)

Như vậy ta đã tạo thành công host Zabbix Client trên CentOS7.

![image](https://user-images.githubusercontent.com/111716161/194245113-69b0b9da-c93a-41ae-b500-f3f0dc6357e6.png)

### Bước 4: Kiểm tra thông số monitor

Chọn tab Monitoring -> Lastest data -> Lựa chọn host -> Apply.

![image](https://user-images.githubusercontent.com/111716161/194249289-2e55af3b-3db0-433e-a7e1-1db36857da39.png)


