**Yêu cầu hệ thống**: Máy client chạy hệ điều hành CentOS7 đã cài đặt Apache, tắt SELinux.

### Bước 1: Cài đặt Zabbix repository

```
rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-release-5.0-1.el7.noarch.rpm
yum clean all
```

### Bước 2: Cài đặt Zabbix-agent

```
yum install zabbix-agent -y
```

![image](https://user-images.githubusercontent.com/111716161/194243644-601f4621-3382-4f7a-b75a-7a61c95f2c45.png)

### Bước 3: Cấu hình Zabbix agent

- Sửa file cấu hình:

```
nano /etc/zabbix/zabbix_agentd.conf
```

- Sửa theo các tham số sau: 

```
Server=<IP_ZABBIX_SERVER>
ServerActive=<IP_ZABBIX_SERVER>
Hostname=<ZABBIX_SERVER_HOSTNAME>
```

![image](https://user-images.githubusercontent.com/111716161/194214154-d7619597-3154-4a3e-a58c-02395cfaea7a.png)

![image](https://user-images.githubusercontent.com/111716161/194214249-1bad1374-f274-4742-801e-0679324bb305.png)

![image](https://user-images.githubusercontent.com/111716161/194244602-9f5002b0-2f00-4b60-b213-42a30cca34c2.png)

### Bước 4: Bước 4: Cấu hình firewalld

```
firewall-cmd --zone=public --add-port=10050/tcp --permanent
firewall-cmd --reload
```

### Bước 5: Khởi động lại dịch vụ

```
systemctl enable zabbix-agent
systemctl restart zabbix-agent
systemctl status zabbix-agent
```

![image](https://user-images.githubusercontent.com/111716161/194214563-64c08219-3f98-4cd8-9d01-5232dc2795e1.png)

### Bước 6: Kiểm tra việc cài đặt

Thực hiện trên Zabbix Server

- Cài đặt zabbix-get

```
yum install zabbix-get
```

![image](https://user-images.githubusercontent.com/111716161/194253798-2089c06e-a3db-4b20-a7da-5cbb86dff942.png)

- Kiểm tra kết nối

```
zabbix_get -s <ZABBIX_AGENT_IP> -k agent.version
```

![image](https://user-images.githubusercontent.com/111716161/194254236-374a3897-8f77-448b-8a4b-996e4afc496a.png)
