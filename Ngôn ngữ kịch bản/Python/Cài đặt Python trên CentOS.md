# Cài đặt Python 3.8 cho CentOS 7

### Bước 1: Kiểm tra phiên bản python đang sử dụng.

Mặc định Python được cài đặt trên Centos 7 sẽ là phiên bản Python 2.7.x , các bạn sử dụng lệnh sau để kiểm tra phiên bản.

```
python --version
```

![image](https://user-images.githubusercontent.com/111721629/189625986-3e63fc27-3a91-49bc-871f-59ba60ddfcf9.png)

### Bước 2: Cập nhật công cụ quản lý Yum
Cập nhật Yum:

` yum -y update `

Cài đặt yum utils:

` yum -y install yum-utils `

Cài đặt các công cụ phát triển CentOS giúp xây dựng và biên dịch phần mềm từ mã nguồn:

` yum -y groupinstall development `

` yum -y install zlib zlib-devel `

### Bước 3: Cài đặt tiện ích và tải phiên bản Python 3
Để kiểm tra và Download các phiên bản Python mới nhất, các bạn có thể truy cập trang chủ Python tại đây.

Cài đặt tiện ích wget:

` yum -y install wget `

Di chuyển vào đường dẫn tmp:

` cd /tmp/ `

Tải file nén Python 3:

` wget https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tgz `

Giải nén file vừa tải về:

` tar xvf Python-3.8.2.tgz `

### Bước 4: Cài đặt Python 3

Di chuyển vào thư mục vừa giải nén:

` cd Python-3.8.2/ `

Thiết lập cài đặt bằng cách chạy lệnh sau

` ./configure --enable-optimizations `

Bắt đầu biên dịch Python 3.8 trên CentOS 7 bằng lệnh sau.

` make altinstall `

### Bước 5: Thiết lập Python 3 làm mặc định

Hiện tại bạn đã cài đặt thành công Python 3, nhưng hệ thống vẫn sử dụng Python 2.7 làm mặc định. Để thay đổi phiên bản mặc định các bạn thực hiện như sau.

Kiểm tra vị trí Python 3 vừa cài đặt:

` which python3.8 `

![image](https://user-images.githubusercontent.com/111721629/189626993-90335bae-b856-4bc3-9ebc-c2b4068ef25a.png)

Thêm bí danh (alias) vào .bash_profile

` vi ~/.bash_profile `

 

Bạn thay thế /usr/local/bin/python3.8 thành đường dẫn trên hệ thống của bạn.

```
alias python='/usr/local/bin/python3.8'
```

![image](https://user-images.githubusercontent.com/111721629/189627452-df3f4325-cf30-4369-9365-18e7d58fe78d.png)

Tải lại file .bash_profile bằng lệnh:

` source ~/.bash_profile `

 

### Bước 6: Kiểm tra kết quả.
` python --version `

![image](https://user-images.githubusercontent.com/111721629/189627770-4678abeb-0225-42b5-bb77-2486c15068dd.png)
