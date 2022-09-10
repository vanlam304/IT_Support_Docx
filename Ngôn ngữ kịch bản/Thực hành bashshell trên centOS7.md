# Tạo file chứa 

![image](https://user-images.githubusercontent.com/111721629/189473642-5bd71b7b-f6f6-4108-81c4-16c10c9ffc68.png)

tạo tệp chương trình với đuôi .sh

![image](https://user-images.githubusercontent.com/111721629/189473668-6988084b-f263-485f-9246-ec5457f1212c.png)

trước khi chạy một chương trình cần thông báo với system có shell chạy bằng dòng lệnh ` #!/bin/bash `

cấp quyền để chạy chương trình bằng lệnh 
```
chmod +x temchuongtrinh.sh
```

![image](https://user-images.githubusercontent.com/111721629/189473769-637587a7-f4c5-4d58-9026-fa87ef85d084.png)


### 1.In ra màn hình

ghi chú comment bằng # hoặc  dấu ` `

như chương trình sau đây:

```
#!/bin/bash
#author: Văn Lâm
# Mới học shell
` 
Thực tập sinh Trương Văn Lâm 
`
HELLO="Xin chào, "
HELLO=$(printf "%s %s" "$HELLO" "$(whoami)" "!")
DAY="Hôm nay là ngày : "
DAY=$(printf "%s %s" "$DAY" "$(date)")
echo $HELLO
echo $DAY
```

![image](https://user-images.githubusercontent.com/111721629/189474120-e34732de-63fa-4f10-af4f-60e99747ddb1.png)

Cấp quyền và chạy
![image](https://user-images.githubusercontent.com/111721629/189474165-7861d102-b67d-4b8e-9cd2-8832ecf3b4ff.png)

Và kết quả là:
![image](https://user-images.githubusercontent.com/111721629/189474188-5353c2b6-ee87-4c58-bb58-a04325650fa1.png)

Như vậy phần ghi chú trong chương trình có ý nghĩa để lưu nhớ lưu ý, để người xem chi tiết dòng code có thể hiểu dễ dàng hơn thì nên dùng đến.





