### 1. pwd

Sử dụng lệnh pwd để tìm ra đường dẫn của thư mục (folder) làm việc hiện tại mà bạn đang đứng.

Lệnh này sẽ trả về một đường dẫn tuyệt đối (đầy đủ), về cơ bản là đường dẫn của tất cả các thư mục bắt đầu bằng dấu gạch chéo lên (/).

![image](https://user-images.githubusercontent.com/111721629/188381606-42190475-e7d3-4aaa-b5c5-10844a81772d.png)


### 2. cd

Để điều hướng qua các tệp và thư mục Linux, hãy sử dụng lệnh cd.

Nó yêu cầu đường dẫn đầy đủ hoặc tên của thư mục, tùy thuộc vào thư mục làm việc hiện tại mà bạn đang ở.

Có một số phím tắt giúp bạn điều hướng nhanh chóng hơn:
```
cd .. (2 dấu hai chấm) để di chuyển một cấp lên thư mục bên trên thư mục hiện tại
cd để chuyển thẳng đến thư mục chính
cd - (có dấu gạch ngang) để chuyển đến thư mục trước của bạn
cd / để chuyển đến thư mục gốc
```

![image](https://user-images.githubusercontent.com/111721629/188381996-99be7c8e-e3d2-4ee9-b099-de1930ac554a.png)

### 3. ls 

Lệnh ls được sử dụng để xem nội dung của một thư mục. Theo mặc định, lệnh này sẽ hiển thị nội dung của thư mục làm việc hiện tại của bạn.

Nếu bạn muốn xem nội dung của các thư mục khác, hãy nhập ls rồi đến đường dẫn của thư mục.

Có các biến thể bạn có thể sử dụng với lệnh ls:
```
ls -R cũng sẽ liệt kê tất cả các tệp trong các thư mục con
ls -a sẽ hiển thị các tệp ẩn
ls -al sẽ liệt kê các tệp và thư mục với thông tin chi tiết như quyền, kích thước, chủ sở hữu, v.v.
```

![image](https://user-images.githubusercontent.com/111721629/188382206-0cd6cae1-9d5f-4ca7-8f82-e052e6d69a9e.png)


### 4. cat

cat (viết tắt của concatenate) là một trong những lệnh được sử dụng thường xuyên nhất trong Linux.

Nó được sử dụng để liệt kê nội dung của một tệp trên đầu ra chuẩn (sdout).

Để chạy lệnh này, hãy nhập cat, theo sau là tên tệp và phần mở rộng của nó.

Dưới đây là các cách khác để sử dụng lệnh cat:
```
cat > filename để tạo một tệp mới tên là filename
Cat filename1 filename2>filename3 kết hợp hai tệp (1 và 2) và lưu trữ kết quả đầu ra của chúng trong một tệp mới (3)
Để chuyển đổi một tệp sang sử dụng chữ hoa hoặc chữ thường, cat filename | tr a-z A-Z>output.txt
```
Ví dụ: Tệp bai1.txt nằm trong tâp có nội dung: 

nhan hoa 

thuctap

Khi gõ lệnh cat demo.txt ta được kết quả như hình: 

![image](https://user-images.githubusercontent.com/111721629/188382388-d2b3a4e9-b309-43d0-a942-896c69d4205a.png)


### 5. cp

Sử dụng lệnh cp để sao chép tệp từ thư mục hiện tại sang một thư mục khác.

Ví dụ: Sao chép tệp demo.txt nằm trong desktop sang thư mục demo nằm trong Documents:

![image](https://user-images.githubusercontent.com/111721629/188383116-81112179-9a9a-41e1-a233-7b1bda4adf45.png)


### 6. mv

Công dụng chính của lệnh mv là di chuyển tệp, mặc dù nó cũng có thể được sử dụng để đổi tên tệp.

Các đối số trong mv tương tự như lệnh cp. Bạn cần nhập mv, tên tệp và thư mục đich. 

Để đổi tên tệp, lệnh Linux là mv ten-cu.ext ten-moi.ext

![image](https://user-images.githubusercontent.com/111721629/188384604-0b920da8-2518-45a8-b3c2-214022534643.png)


### 7. mkdir

Sử dụng lệnh mkdir để tạo một thư mục mới - nếu bạn nhập mkdir Music, nó sẽ tạo một thư mục có tên là Music.

Ngoài ra còn có các lệnh mkdir bổ sung:

Để tạo một thư mục mới bên trong một thư mục khác, hãy sử dụng lệnh cơ bản của Linux này mkdir Music/Newfile
Sử dụng tùy chọn p (viết tắt của từ parents) để tạo một thư mục ở giữa hai thư mục hiện có. Ví dụ: mkdir -p Music/2021/Newfile sẽ tạo tệp “2021” mới.

![image](https://user-images.githubusercontent.com/111721629/188385659-1b143f2e-fbdb-49ca-86e8-9486d22b966d.png)


### 8. rmdir

Nếu bạn cần xóa một thư mục, hãy sử dụng lệnh rmdir. Tuy nhiên, rmdir chỉ cho phép bạn xóa các thư mục trống.

![image](https://user-images.githubusercontent.com/111721629/188385802-f08defa4-3769-41b6-a2a2-0f18b59916ea.png)


### 9. rm

Lệnh rm được sử dụng để xóa các thư mục và nội dung bên trong chúng.

Nếu bạn chỉ muốn xóa thư mục, thay vì sử dụng rmdir, hãy sử dụng rm -r

Lưu ý: Hãy hết sức cẩn thận với lệnh này và kiểm tra kỹ xem bạn đang ở thư mục nào. Thao tác này sẽ xóa mọi thứ và KHÔNG THỂ HOÀN TÁC.

### 10. touch

Lệnh touch cho phép bạn tạo một tệp mới trống thông qua dòng lệnh Linux.

Ví dụ: nhập touch /home/username/Documents/index.html để tạo tệp HTML có tên index.html trong thư mục Documents
 
![image](https://user-images.githubusercontent.com/111721629/188389610-ffdb8108-d0c9-41af-8f9c-43324e43120f.png)


### 11. locate

Bạn có thể sử dụng lệnh locate để định vị tệp, giống như lệnh tìm kiếm trong Windows.

![image](https://user-images.githubusercontent.com/111721629/188393023-43adae27-3184-4642-ae72-cce3e2e740bc.png)


Hơn nữa, việc sử dụng đối số -i cùng với lệnh locate này sẽ làm cho nó không phân biệt chữ hoa chữ thường, vì vậy bạn có thể tìm kiếm một tệp ngay cả khi bạn không nhớ tên chính xác của nó.

Để tìm kiếm một tệp chứa hai từ trở lên, hãy sử dụng dấu *

Ví dụ: locate -i java*niit sẽ tìm kiếm bất kỳ tệp nào có chứa từ java và niit, cho dù đó là chữ hoa hay chữ thường.

### 12. find

Tương tự như lệnh locate, sử dụng lệnh find cũng giúp tìm kiếm các tệp và thư mục. Sự khác biệt là bạn sử dụng lệnh find để định vị các tệp trong một thư mục nhất định.

Ví dụ, lệnh find /Documents/ -name demo.txt sẽ tìm kiếm một tệp có tên là demo.txt trong thư mục Documents và các thư mục con của nó.

Các biến thể khác khi sử dụng tìm kiếm là:
```
Để tìm các tệp trong thư mục sử dụng hiện tại, hãy sử dụng find -name demo.txt
Để tìm kiếm thư mục sử dụng, / -type d -name demo.txt
```
![image](https://user-images.githubusercontent.com/111721629/188398774-42e583bf-26fd-4ce4-9901-bc1f1930d00d.png)


### 13. grep

Một lệnh Linux cơ bản khác chắc chắn hữu ích cho việc sử dụng hàng ngày là grep. Nó cho phép bạn tìm kiếm qua tất cả văn bản trong một tệp nhất định.

Để minh họa, lệnh grep "TNHH" demo.txt sẽ tìm kiếm từ "" trong tệp demo.

Các dòng có chứa từ được tìm kiếm sẽ được hiển thị đầy đủ.

![image](https://user-images.githubusercontent.com/111721629/188406692-742d9803-1dda-4d1c-a8d4-17d08ebfd4de.png)


### 14. sudo

sudo viết tắt của “SuperUser Do”, lệnh này cho phép bạn thực hiện các tác vụ yêu cầu quyền quản trị hoặc quyền root.

Tuy nhiên, không nên sử dụng lệnh này hàng ngày vì có thể dễ xảy ra lỗi nếu bạn làm sai.

### 15. df

Sử dụng lệnh df để nhận báo cáo về việc sử dụng dung lượng ổ đĩa của hệ thống, được hiển thị bằng phần trăm và KBs.

Nếu bạn muốn xem báo cáo bằng megabyte, hãy nhập df -m

![image](https://user-images.githubusercontent.com/111721629/188406829-1f492a19-c094-47a0-9868-f6522cb9fa8f.png)

### 16. du

Nếu bạn muốn kiểm tra xem một tệp hoặc một thư mục chiếm bao nhiêu dung lượng thì lệnh du (Disk Usage) là thứ bạn cần.

Tuy nhiên, bản tóm tắt sử dụng đĩa sẽ hiển thị số khối đĩa thay vì định dạng kích thước thông thường.

Nếu bạn muốn xem nó ở dạng byte, kilobyte và megabyte, hãy thêm đối số -h vào dòng lệnh.

![image](https://user-images.githubusercontent.com/111721629/188406973-1929517c-fb5b-4857-879d-4a7e25f2e6e5.png)

### 17. head

Lệnh head được sử dụng để xem các dòng đầu tiên của bất kỳ tệp văn bản nào.

Theo mặc định, nó sẽ hiển thị mười dòng đầu tiên, nhưng bạn có thể thay đổi con số này theo ý thích của mình.

Ví dụ: nếu bạn chỉ muốn hiển thị năm dòng đầu tiên, hãy nhập head -n 5 demo.txt

![image](https://user-images.githubusercontent.com/111721629/188408183-ca220710-7f9b-4eeb-a582-6ae0ded3e003.png)

### 18. tail

Lệnh này có chức năng tương tự như lệnh head, nhưng thay vì hiển thị các dòng đầu tiên, lệnh tail sẽ hiển thị dòng cuối cùng của tệp văn bản. 

Ví dụ: tail -n  3 demo.txt

![image](https://user-images.githubusercontent.com/111721629/188410631-e7e3d449-8f96-453b-b94d-252d35f2a502.png)

### 19. diff

Lệnh diff là viết tắt của different (khác biệt), lệnh diff so sánh nội dung của hai tệp theo từng dòng.

Sau khi phân tích các tập tin, nó sẽ xuất ra những dòng không khớp. Các lập trình viên thường sử dụng lệnh này khi họ cần sửa đổi chương trình thay vì viết lại toàn bộ mã nguồn.

Dạng đơn giản nhất của lệnh này là diff file1.ext file2.ext

### 20. tar

Lệnh tar là lệnh được sử dụng nhiều nhất để lưu trữ nhiều tệp vào một tarball - một định dạng tệp Linux phổ biến tương tự như định dạng zip, với việc nén là tùy chọn.

Lệnh này khá phức tạp với một danh sách dài các chức năng như thêm tệp mới vào kho lưu trữ hiện có, liệt kê nội dung của kho lưu trữ, trích xuất nội dung từ kho lưu trữ và nhiều chức năng khác.


### 21. chmod

chmod là một lệnh Linux khác, được sử dụng để thay đổi quyền đọc, ghi và thực thi các tệp và thư mục. Vì lệnh này khá phức tạp, bạn có thể đọc toàn bộ hướng dẫn này để thực thi nó đúng cách.

### 22. chown

Trong Linux, tất cả các tệp được sở hữu bởi một người dùng (user) cụ thể. Lệnh chown cho phép bạn thay đổi hoặc chuyển quyền sở hữu tệp sang tên người dùng được chỉ định.

Ví dụ: Lệnh chown user2 file.ext sẽ đặt user2 làm chủ sở hữu của file.ext.

### 23. jobs

Lệnh jobs sẽ hiển thị tất cả các công việc hiện tại cùng với trạng thái của chúng. Một công việc về cơ bản là một quá trình được bắt đầu bởi shell.

### 24. kill

Lệnh này rất hữu ích khi chương trình bị "đơ".

Trong trường hợp bạn có một chương trình bị "đơ", bạn có thể tắt chương trình đó theo cách thủ công bằng cách sử dụng lệnh kill

Nó sẽ gửi một tín hiệu nhất định đến ứng dụng hoạt động sai và hướng dẫn ứng dụng tự kết thúc.

Có tổng cộng 64 tín hiệu mà bạn có thể sử dụng, nhưng mọi người thường chỉ sử dụng 2 tín hiệu:
```
SIGTERM (15) - yêu cầu chương trình ngừng chạy và cho nó một khoảng thời gian để lưu tất cả tiến trình của nó. Nếu bạn không chỉ định tín hiệu khi nhập lệnh hủy, tín hiệu này mặc định sẽ được sử dụng.
SIGKILL (9) - buộc các chương trình phải dừng ngay lập tức. Tiến trình chưa được lưu sẽ bị mất.
```

Bên cạnh việc biết các tín hiệu, bạn cũng cần biết số nhận dạng quy trình (PID - Process ID) của chương trình bạn muốn tắt. Nếu bạn không biết PID là gì, chỉ cần chạy lệnh ps ux

Sau khi biết tín hiệu bạn muốn sử dụng và PID của chương trình, hãy nhập cú pháp sau:
```
kill [tùy chọn tín hiệu] PID
```

Ví dụ, nếu muốn tắt chương trình có PID là 678 và lưu tất cả tiến trình của nó thì ta dùng lệnh: kill 678

### 25. ping

Sử dụng lệnh ping để kiểm tra trạng thái kết nối của bạn với máy chủ.

Ví dụ: Chỉ cần nhập ping google.com, lệnh sẽ kiểm tra xem bạn có thể kết nối với Google hay không và cũng là cách đo thời gian phản hồi.

![image](https://user-images.githubusercontent.com/111721629/188411260-3356c4d2-d49b-44b9-bd1e-481da9da5d52.png)
### 26. wget

Lệnh Linux cực kỳ hữu ích - bạn thậm chí có thể tải xuống các tệp từ internet với sự trợ giúp của lệnh wget. Để làm như vậy, chỉ cần gõ wget theo sau là liên kết tải xuống.

### 27. uname

Lệnh uname, viết tắt của Unix Name, sẽ in thông tin chi tiết về hệ thống Linux của bạn như tên máy, hệ điều hành, nhân, v.v.

![image](https://user-images.githubusercontent.com/111721629/188411807-b5ba9ad9-c685-4115-b630-70f6521076c3.png)
### 28. top

Là một terminal tương đương với Task Manager trong Windows, lệnh top cùng sẽ hiển thị danh sách các tiến trình đang chạy và lượng CPU mà mỗi tiến trình sử dụng.

Lệnh này rất hữu ích khi giúp bạn theo dõi việc sử dụng tài nguyên hệ thống, đặc biệt là biết quy trình nào cần được tắt nếu này tiêu tốn quá nhiều tài nguyên không cần thiết.

### 29. history

Khi sử dụng Linux trong một khoảng thời gian nhất định, bạn sẽ nhanh chóng nhận thấy rằng bạn có thể đã chạy hàng trăm lệnh mỗi ngày.

Do đó, lệnh history đặc biệt hữu ích nếu bạn muốn xem lại các lệnh bạn đã nhập trước đó.

### 30. man

Bạn nhầm lẫn về chức năng của các lệnh Linux nhất định?

Đừng lo, bạn có thể dễ dàng học cách sử dụng các lệnh linux ngay từ trong shell của Linux bằng cách sử dụng lệnh man

Ví dụ, nhập man tail sẽ hiển thị hướng dẫn thủ công của lệnh tail.

![image](https://user-images.githubusercontent.com/111721629/188412413-4ae9e94d-9e72-4562-a32f-90772ba59557.png)

### 31. echo

Lệnh echo được sử dụng để chuyển một số dữ liệu vào một tệp chỉ định.

Ví dụ: Nếu bạn muốn thêm văn bản, "Nhân Hòa" vào một tệp có tên là demo.txt, bạn sẽ nhập echo "Nhân Hòa" >> demo.txt

![image](https://user-images.githubusercontent.com/111721629/188415440-f517bbc1-65ec-4cec-9889-6f4f4b4b7db2.png)

### 32. zip và unzip

Sử dụng lệnh zip để nén các tệp của bạn thành một file zip và sử dụng lệnh unzip để giải nén các tệp đã nén từ một file zip.

### 33. hostname

Nếu bạn muốn biết tên host / network của mình, chỉ cần nhập lệnh hostname. Thêm -I vào cuối sẽ hiển thị địa chỉ IP của mạng của bạn.

![image](https://user-images.githubusercontent.com/111721629/188416371-24fc2a41-b37d-4ea0-9eaa-c807817a4a44.png)

### 34. useradd và userdel

Vì Linux là một hệ thống nhiều người dùng, điều này có nghĩa là nhiều người có thể tương tác với cùng một hệ thống cùng một lúc.

Lệnh useradd được sử dụng để tạo người dùng mới, và passwd là thêm mật khẩu vào tài khoản của người dùng đó.

Để thêm một người mới có tên niit, hãy sử dụng lệnh useradd niit

Sau đó để thêm mật khẩu của người dùng này, sử dụng lệnh passwd 123456

Để xóa người dùng cũng tương tự như thêm người dùng mới, ta sử dụng lệnh: userdel UserName

### 35. Lệnh lưu trữ tệp của các thư mục

tar -czf new-tar-file-name.tar.gz file-or-folder-to-archive

tar -czf new-tar-file-name.tar.gz file1 file2 folder1 folder2

### 36. Hủy lưu trữ

tar -xzf tar-file-name.tar.gz

### 37. Lệnh liệt kê và sắp xếp các tệp theo kích thước

ls -lS

![image](https://user-images.githubusercontent.com/111721629/188417512-588ee858-cdfb-4421-b326-f3ef1efae98c.png)

ls -lSr

![image](https://user-images.githubusercontent.com/111721629/188417611-eb9ee787-bb78-47c1-9161-69416bb80565.png)

### 38. Lệnh liệt kê kích thước các thư mục

du -sh /*

![image](https://user-images.githubusercontent.com/111721629/188418648-eb1ec201-9792-4d53-8db2-468c4af458d0.png)


### 39. Lệnh xem ổ đĩa còn trống bao nhiêu

df -h

![image](https://user-images.githubusercontent.com/111721629/188419104-0a06e60e-fd0b-4a16-b35a-2bdc4aa8f6cc.png)

### 40. Lệnh đếm tất cả các tệp và thư mục trong một thư mục

ls | wc -l

![image](https://user-images.githubusercontent.com/111721629/188419619-8fc8458d-87f7-4063-a92c-277b795eeda6.png)


### 41. Lệnh xóa toàn bộ thư mục với tất cả nội dung của nó

rm -rf dir_name

### 42. Tạo một liên kết tượng trưng

ln -s [TARGET DIRECTORY OR FILE] ./[SHORTCUT]

Ví dụ:

ln -s /usr/local/apache/logs ./logs

![image](https://user-images.githubusercontent.com/111721629/188421864-d482b319-d310-44bc-b20e-5df6438ff342.png)


