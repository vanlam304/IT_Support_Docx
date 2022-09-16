# Process (Tiến trình)

Một tiến trình là một chương trình đã nạp vào bộ nhớ và được cấp CPU để hoạt động. Đơn giản hơn hiểu là một chương trình đang chạy trong hệ điều hành. Một tiến trình có thể phân thành một hay nhiều tiến trình con khác.

# Phân loại tiến trình

### Tiến trình Init

Tiến trình Init là tiến trình đầu tiên được khởi động sau khi bạn lựa chọn hệ điều hành trong boot loader. Trong cây tiến trình, init là tiến trình cha của các tiến trình khác. Init có các đặc điểm sau:

- PID = 1
- không thể loại bỏ Init

### Tiến trình cha- Tiến trình con

Trong Linux thì các tiến trình được phân thành tiến trình cha và tiến trình con. Một tiến trình khi thực hiện lệnh fork để tạo ra một tiến trình mới chính là tiến trình cha. Còn tiến trình mới tạo không phải qua fork là tiến trình con.

![image](https://user-images.githubusercontent.com/111721629/190597602-29646be0-c602-4611-b609-d45d65a10c3b.png)

Một tiến trình cha có thể có nhiền tiến trình con nhưng một tiến trình con chỉ có một triến trình cha. Khi quan sát thông tin của một tiến trình, ngoài PID (Processes ID) ta cần để ý tới PPID (Parent Processes ID). Nó sẽ cho ta thông tin về tiến trình cha của tiến trình đó:

` ps -ef `

![image](https://user-images.githubusercontent.com/111721629/190617016-73b15a34-726e-4693-bac7-dfe1c685ee75.png)


### Orphan process – Zombie Process

Khi parents process – child process hoạt động sẽ xảy ra một số trường hợp đặc biệt. Lúc đó Orphan process – Zombie Process sẽ được hình thành.

Khi một parents process bị tắt trước khi child process được tắt, tiến trình con đó sẽ trở thành một orphan process. Lúc này init process sẽ trở thành cha của orphan processes và thực hiện tắt chúng.

Khi một child process được kết thúc, mọi trạng thái của child process sẽ được thông báo bởi lời gọi hàm wait() của parents process. Vì vậy, kernel sẽ đợi parents process trả về hàm wait() trước khi tắt child process. Tuy nhiên vì một vài lí do mà parents process không thể trả về hàm wait(), khi đó child process sẽ trở thành một zombie process. Khi ở trạng thái này, tiến trình sẽ gần như giải phóng bộ nhớ hoàn toàn, chỉ lưu giữ một số thông tin như PID, lượng tại nguyên sử dụng,… trên bảng danh sách tiến trình.

Tuy giải phóng bộ nhớ hoàn toàn nhưng các zombie process không bị kết thúc. Vì vậy nếu lượng zombie process lớn sẽ nắm giữ lượng lớn các PID. Nếu lượng PID đầy, sẽ không có tiến trình mới được tạo thêm. Các zombie process sẽ chỉ bị kết thúc nếu như parents process của chúng bị kill.

Để tìm các zombie process ta gõ kiểm tra trạng thái của tiến trình theo lệnh sau:

 ` ps -lA | grep '^. Z' `
 
 
 
 ### Daemon Process
 
Một Daemon Process là một tiến trình chạy nền. Nó sẽ luôn trong trạng thái hoạt động và sẽ được kích hoạt bởi một điều kiện hoặc câu lệnh nào đó. Trong Unix, các daemon thường được kết thúc bằng “d” ví dụ như httpd, sshd, crond, mysqld,…

Chúng ta có thể chạy một đoạn script bash shell, python, java,… dưới dạng một daemon process bằng cách sử dụng dấu & ví dụ:

` ./simpleshell.sh & `


Tuy nhiên, vấn đề ở đây là khi ta kết thúc phiên của terminal, tiến trình đó sẽ không có tiến trình cha và sẽ trở thành một orphan process. Để giải quyết vấn đề này, ta sẽ cho shell chạy với tư cách là tiến trình con của init process bằng cách dùng lệnh nohup như sau:

` nohup ./simpleshell.sh & `

## Theo dõi process `ps`

Câu lệnh phổ biến để theo dõi các process là `ps`. `ps` có rất nhiều tùy chọn, cách dùng cơ bản nhất là 
```
ps
```

![image](https://user-images.githubusercontent.com/111721629/190618193-1507f7e6-7753-43ac-8157-386b7bbef232.png)

- Kết quả list ra 2 process cùng với thông tin PID.
- `TTY` là viết tắt của teletype, để chỉ terminal đang chạy process đó. 
- `TIME` để chỉ thời gian chiếm CPU của process tương ứng.

Khi thêm option `x`: 
```
ps x
```
![image](https://user-images.githubusercontent.com/111721629/190618276-13b9817a-bcbd-4969-a34d-c858c20de761.png)

- `STAT` là viết tắt của Status để chỉ trạng thái của process tương ứng.

Các dạng state: 

| Trạng thái | Ý nghĩa | 
|------------|---------|
| R |Running: process đang chạy hoặc sẵn sàng để chạy|
| S | Sleeping: process đang đợi một event để tiếp tục chạy |
| D | Process đang đợi I/O |
| T | Stopped: process đang trong quá trình dừng chạy |
| Z | Zombie process: đây là các tiến trình con đã bị chấm dứt nhưng chưa được tiến trình cha giải phóng |
| < | Process có độ ưu tiên cao, có thể có nhiều thời gian CPU hơn |
| N | Process có độ ưu tiên thấp, chỉ có thể chiếm CPU khi các process khác có độ ưu tiên cao hơn hết thời gian CPU |

Khi thêm option `aux`:

```
ps aux
```

![image](https://user-images.githubusercontent.com/111721629/190618391-c71d85b1-c7a7-4f00-adab-f9cd45498bf9.png)

- Hiển thị process thuộc về mọi user.

## Theo dõi process với `top`

`ps` cung cấp một bản snapshot của các tiến trình trong hệ thống tại thời điểm mà chúng ta chạy nó. Trong khi đó `top` cung cấp một hệ thống theo dõi động. 

![image](https://user-images.githubusercontent.com/111721629/190618530-949bc770-4885-4465-8c07-cca6b366a1dd.png)

| Dòng | Trường | Ý nghĩa |
|----|----|---|
| 1 | top | Tên của chương trình |
| | 21:46:52| Thời gian hiện tại |
| | up 3:03 | uptime, thời gian hệ thống bắt đầu chạy |
| | 3 users | có 3 user đã log in |
| | load average: 0.08, 0.08, 0.09 | Chỉ ra con số ở trạng thái có thể chạy và đang share CPU. Giá trị < 0.1 chỉ ra là hệ thống đang không busy |
| 2 | Task | Tổng kết số lượng process và số lượng process theo trạng thái |
| 3 | Cpu(s) | Miêu tả đặc điểm của những tác vụ CPU đang thực thi |
| | us | CPU đang được dùng cho user process |
| | sy | CPU đang được dùng cho systeam process |
| | ni | CPU đang được dùng cho process có độ ưu tiên thấp |
| | id | Phần CPU đang nhàn rỗi | 
| | wa | Phần CPU đang chờ I/O |
| 4 | Mem | Chỉ ra có bao nhiêu RAM đang được dùng |
| 5 | Swap | Chỉ ra có bao nhiêu Swap Space đang được dùng |

## Kiểm soát process

Khi chúng ta gõ một lệnh và chạy nó, terminal sẽ ở trạng thái không dùng được cho đến khi chương trình chạy xong. Để một chương trình không chiếm terminal, ta thêm `&` vào cuối câu lệnh muốn chạy, ví dụ `xlogo &`

![image](https://user-images.githubusercontent.com/111721629/190618972-5966b0d9-7c13-41bc-a8bb-81e15de6a7e8.png)

- Để list các background job: 
```
jobs
```
- Để trả một process đang chạy background về foreground:
```
fg
```

## Signals

Signals là cách mà OS giao tiếp với chương trình. Để gửi signal đến một chương trình, sử dụng lệnh `kill`` kết hợp với số/tên của signal.

| Số hiệu | Tên | Ý nghĩa |
|---|---|---|
| 2 | INT | Giống với Ctrl - c, thường là terminate chương trình |
| 9 | KILL | Kernel ngay tập tức terminate chương trình mà không có một hành động clean up nào |
| 15 | TERM | Terminate, đây là tín hiệu mặc định mà lệnh kill gửi đến chương trình |
| 18 | CONT | continue, restore trạng thái của process sau khi nhận tín hiệu STOP |
| ... |...|...|

- `kill -l`: list ra các signal khả dụng của hệ thống. 
- `killall`: gửi kill signal đến nhiều tiến trình chạy cùng một chương trình. 
- `kill`: dừng process.
