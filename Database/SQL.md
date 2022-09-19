# Tổng quan

SQL là viết tắt của cụm từ tiếng anh Structured Query Language , là ngôn ngữ truy vấn có cấu trúc . Nó là công cụ được thiết kế nhằm để quản lý dữ liệu sử dụng trong nhiều lĩnh vực , cho phép bạn truy cập và và thực hiện các thao tác lấy các hàng hoặc sửa đổi các hàng, trích xuất ,tạo, xóa dữ liệu .

SQL cũng là ngôn ngữ tiêu chuẩn cho các hệ cơ sở dữ liệu quan hệ ( RDBMS ) . Hầu hết các ngôn ngữ bậc cao đều lấy SQL làm tiêu chuẩn như MySQL (hệ quản trị cơ sở dữ liệu thường được sử dụng cho những dịch vụ thiết kế website giá rẻ bởi nó hoàn toàn miễn phí) , MS Access, Oracle , Sybase, Visual C , Visual Basic , Postgres, Informix , SQL Server,..

![image](https://user-images.githubusercontent.com/111721629/190945696-add854ff-b83f-4828-a17b-a03652d9c7ba.png)

# Những kiến thức cần biết về tổng quan SQL:

## Mức độ quan trọng của SQL

Tạo ra cơ sở dữ liệu mới khi thiết kế website hoặc lập trình phần mềm.
Tạo bảng và view mới trong CSDL
Dễ dàng tạo , chèn , xóa các bản ghi trong một CSDL
Lấy dữ liệu từ một cơ sở dữ liệu 

## Các chức năng của SQL :

- Cho phép chúng ta truy cập Database theo nhiều cách khác nhau , nhờ sử dụng các lệnh

- Người dùng có thể truy cập dữ liệu từ cơ sở dữ liệu quan hệ

- SQL còn cho phép người sử dụng miêu tả dữ liệu

- Cho phép người dùng định nghĩa dữ liệu thao tác nó khi cần thiết trong một Database

- Bạn có thể tạo , xóa Database và bảng

- Cho phép người dùng tạo view , hàm ,procedure trong một Database

- Người dùng được quyền truy cập vào bảng , thủ tục và view

![image](https://user-images.githubusercontent.com/111721629/190945855-cb6f6b49-50ef-463e-8dfa-25a0d19407d2.png)

## Đặc điểm và đối tượng của SQL :

### 1. Đặc điểm

SQL là ngôn ngữ như tiếng Anh nên các lập trình viên cũng cần có một số vốn ngoại ngữ về chuyên ngành

SQL là ngôn ngữ phi thủ tục , không đòi hỏi chúng ta về cách thức truy cập dữ liệu thế nào .Tất cả các thông báo của SQL đều rất dễ sử dụng và hầu như giảm thiểu tối đa khả năng xảy ra lỗi

SQL cung cấp các tập lệnh đa dạng cho việc hỏi đáp dữ liệu

Chèn , update , xóa các hàng trong 1 quan hệ

Tạo ,xóa , sửa đổi và thêm các đối tượng trong của cơ sở dữ liệu

Điều khiển việc truy cập tới CSDL và các đối tượng của nó để đảm bảo tính năng bảo mật của CSDL

Luôn bảo đảm tính chất nhất quán và sự ràng buộc

Điều kiện tiên quyết để tiện lợi cho việc sử dụng các hỏi đáp là phải nắm vững được các cấu trúc cơ sở dữ liệu của mình

### 2. Đối tượng làm việc của SQL :

Là các bảng ( tổng quan là các quan hệ dữ liệu 2 chiều ) . Các bảng này thường chứa nhiều cột ( gọi là trường ) và nhiều hàng ( gọi là bản ghi ) . Cột với tên gọi và kiểu dữ liệu xác định tạo nên cấu trúc của bảng ( kiểu dữ liệu của cột là dạng duy nhất ) . Ta có thể dùng lệnh Desc[ribe] TABLE-name để tra xem cấu trúc của bảng .Phần tùy chọn [] có thể được để trong Oracle . Khi bảng đã được hệ thống cho một mục đích nào đó ta có một cơ sở dữ liệu.

### 3. Cách thức thực hiệu lệnh SQL :

Khi thao tác lệnh SQL trên bất kì CSDL quan hệ nào , hệ thống sẽ tự động chọn lọc quyết định cách thức tốt nhất để tiến hành lệnh đó .Và engine SQL sẽ giúp hiểu rõ nhiệm vụ được thông dịch như thế nào .

Có rất nhiều thành phần trong suốt quá trình này phải kể đến như : Classic Query Engine , Query Dispatcher , SQL Query Engine , Optimization Engines .

# Các lệnh SQL:

 SQL sử dụng các lệnh nhất định như Create, Drop, Insert,… để thực hiện các tác vụ cần thiết. Các lệnh SQL này chủ yếu được phân loại thành bốn loại như sau: 

- DDL – Ngôn ngữ định nghĩa dữ liệu.

- DQl – Ngôn ngữ truy vấn dữ liệu.

- DML – Ngôn ngữ thao tác dữ liệu.

- DCL – Ngôn ngữ điều khiển dữ liệu.

![image](https://user-images.githubusercontent.com/111721629/190947047-7b390dbb-e5f6-4b57-8033-3ae450b925e0.png)

### DDL (Ngôn ngữ Định nghĩa Dữ liệu)

DDL (Data Definition Language) bao gồm các lệnh SQL có thể được sử dụng để xác định lược đồ cơ sở dữ liệu. Danh sách các lệnh DDL: 

- CREATE: Lệnh này được sử dụng để tạo cơ sở dữ liệu hoặc các đối tượng của nó (như bảng, chỉ mục, hàm, dạng xem, thủ tục lưu trữ và trình kích hoạt).

- DROP: Lệnh này dùng để xóa các đối tượng khỏi cơ sở dữ liệu.

- ALTER: Sử dụng để thay đổi cấu trúc của cơ sở dữ liệu.

- TRUNCATE: Sử dụng để xóa tất cả các bản ghi khỏi một bảng, bao gồm tất cả các khoảng trống được cấp cho các bản ghi sẽ bị xóa.

- COMMENT: Sử dụng để thêm nhận xét vào từ điển dữ liệu.

- RENAME: Sử dụng để đổi tên một đối tượng hiện có trong cơ sở dữ liệu.

### DQL (Ngôn ngữ truy vấn dữ liệu)

Các câu lệnh DQL (Data Query Language) được sử dụng để thực hiện các truy vấn về dữ liệu trong các đối tượng lược đồ. Mục đích của lệnh DQL là lấy một số quan hệ lược đồ dựa trên truy vấn được chuyển đến nó. 

Danh sách DQL: 

- SELECT : Nó được sử dụng để lấy dữ liệu từ cơ sở dữ liệu.

### DML (Ngôn ngữ thao tác dữ liệu)

DML (Data Manipulation Language) là ngôn ngữ thao tác dữ liệu. Danh sách các lệnh DML bao gồm: 

- INSERT: Nó được sử dụng để chèn dữ liệu vào bảng.

- UPDATE: Nó được sử dụng để cập nhật dữ liệu hiện có trong bảng.

- DELETE: Nó được sử dụng để xóa các bản ghi khỏi một bảng cơ sở dữ liệu.

- LOCK: Đồng thời điều khiển bảng.

- CALL: Gọi một chương trình con PL/SQL hoặc JAVA.

- EXPLAIN PLAN: Nó mô tả đường dẫn truy cập đến dữ liệu.

### DCL (Ngôn ngữ điều khiển dữ liệu):

DCL (Data Control Language) là ngôn ngữ điều khiển dữ liệu, bao gồm các lệnh như GRANT và REVOKE chủ yếu giải quyết các quyền, quyền hạn và các điều khiển khác của hệ thống cơ sở dữ liệu. 

Danh sách các lệnh DCL: 

- GRANT: Lệnh này cung cấp cho người dùng đặc quyền truy cập vào cơ sở dữ liệu.

- REVOKE: Lệnh này thu hồi các đặc quyền truy cập của người dùng được cấp bằng cách sử dụng lệnh GRANT.

## Một số lệnh cơ bản khác cửa SQL

- INSERT INTO –  chèn dữ liệu mới vào cơ sở dữ liệu.
- CREATE DATABASE – tạo cơ sở dữ liệu mới.
- ALTER DATABASE – sửa đổi cơ sở dữ liệu.
- CREATE TABLE – tạo một bảng mới.
- ALTER TABLE – sửa đổi bảng.
- DROP TABLE – xóa bảng.
- CREATE INDEX – tạo một chỉ mục (khóa tìm kiếm).
- DROP INDEX – xóa một chỉ mục.

# Một số mệnh đề truy vấn cơ bản trong SQL :

### Mệnh đề WHERE :

Mệnh đề này trong SQL để xác định một điều kiện trong khi lấy dữ liệu từ bảng đơn hoặc có thể là nhiều bảng kết hợp lại

Nếu điều kiện đã cho được thỏa mãn xong,từ bảng đó  nó sẽ trả về các giá trị cụ thể. Bạn sẽ sử dụng mệnh đề WHERE để lọc và chỉ lấy các bản ghi thiết yếu

Mệnh đề WHERE không chỉ được sử dụng trong lệnh SELECT, ngoài ra nó còn hữu dụng trong các lệnh UPDATE, DELETE, …

Cú pháp của lệnh SELECT với mệnh đề WHERE trong SQL như sau:
```
SELECT cot1, cot2, cotN

FROM ten_bang

WHERE [dieu_kien]
```

### Mệnh đề SELECT

Lệnh SELECT trong SQL được dùng để lấy dữ liệu từ một bảng trong Cơ sở dữ liệu mà trả về dữ liệu ở dạng bảng dữ liệu kết quả. Những bảng này được gọi chung là các tập hợp kết quả.

Cú pháp của lệnh SELECT trong SQL :

` SELECT cot1, cot2, cotN FROM ten_bang `

Ở đây, cot1, cot2, … là các trường của một bảng có các giá trị mà bạn muốn lấy. Nếu bạn muốn lấy tất cả các trường có sẵn trong bảng, bạn có thể sử dụng cú pháp sau:

` SELECT * FROM ten_bang `

### Mệnh đề Order By và Group By

 **Order By**
 
ORDER BY trong SQL được sử dụng để sắp xếp dữ liệu tùy theo thứ tự tăng dần hoặc là theo thứ tự giảm dần, nằm trên cùng một hoặc nhiều cột. Một số trường hợp khác ,Database đã sắp xếp kết quả truy vấn theo thứ tự tăng dần mặc định.

Cú pháp cơ bản của mệnh đề ORDER BY trong SQL :
```
SELECT danh_sach_cot 

FROM ten_bang

[WHERE dieu_kien]

[ORDER BY cot1, cot2, .. cotN] [ASC | DESC];
```

Chúng ta còn có thể sử dụng nhiều hơn một cột trong mệnh đề ORDER BY. Chắn chắn  rằng, cho dù bạn đang sắp xếp cột nào thì nó đều phải có mặt xuất hiện trong danh sách cột

**Group By**

Mệnh đề GROUP BY trong SQL sử dụng kết hợp với lệnh SELECT nhằm sắp xếp dữ liệu đồng nhất vào trong các nhóm.

Trong SQL, mệnh đề GROUP BY  đi sau mệnh đề WHERE trong một lệnh SELECT và ở phía trước mệnh đề ORDER BY.

Mệnh đề GROUP BY phải tuân sau các điều kiện tiên quyết trong mệnh đề WHERE và buộc phải đứng trước ORDER BY nếu được sử dụng.
```
SELECT cot1, cot2

FROM ten_bang

WHERE [ dieu_kien ]

GROUP BY cot1, cot2

ORDER BY cot1, cot2
```

# Mệnh đề JOIN , INNER JOIN , LEFT JOIN VÀ RIGHT JOIN

Các mệnh đề JOIN trong SQL được sử dụng với việc kết hợp các bản ghi từ hai bảng trở lên trong một Database. Một JOIN là một hình thức phương tiện để kết hợp các trường từ hai bảng bằng việc sử dụng các giá trị chung của mỗi bảng.

#### Trong SQL, một số loại JOIN có sẵn là:

- INNER JOIN : Đưa về các hàng khi có một so khớp (match) trong các bảng.

- LEFT JOIN :Từ bảng bên trái đưa trả về tất cả các hàng, mặc dù gặp trường hợp không có so khớp nào trong bảng bên phải.

- RIGHT JOIN : như LEFT JOIN , cho dù không có so khớp nào bên bảng trái

- FULL JOIN trong SQL: Khi xuất hiện một so khớp trong các hàng sẽ trả về các hàng

- SELF JOIN : Được sử dụng cho việc kết hợp một bảng với chính bản thân nó, khi nếu table đó là hai bảng dữ liệu,phải thay tên tạm thời cho một trong hai bảng có trong lệnh SQL.

- CARTESIAN JOIN : Hoàn về tích Đề-các của tập hợp các bản ghi từ hai bảng kết hợp trở lên.
