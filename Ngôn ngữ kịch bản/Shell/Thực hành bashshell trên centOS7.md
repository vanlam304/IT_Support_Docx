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


# 1.In ra màn hình

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

# 2.Các loại biến 
 
 ## Mảng
 Chạy bài như sau có nội dung:
 
 ```
 #!/bin/sh

DOMAIN[0]="nhanhoa.com"
DOMAIN[1]="Truong Van Lam"
DOMAIN[2]="truonvanlam304@gmail.com"
DOMAIN[3]="0964159587"

echo "Domain ${DOMAIN[0]}"
echo "Author ${DOMAIN[1]}"
echo "Mail ${DOMAIN[2]}"
echo "Phone ${DOMAIN[3]}"
```


 
![image](https://user-images.githubusercontent.com/111721629/189514438-1f23667e-cab9-4f06-a443-231591ae8955.png)

Sẽ cho kết quả:

![image](https://user-images.githubusercontent.com/111721629/189514460-6665ef3c-6f02-44dd-850f-066cb2b57815.png)

## Toán số học 

Nội dung là :

```                                
#!/bin/sh

echo " Phep tinh cho ket qua la: `expr 156 + 1454`
```

chạy vào cho ra kết quả

![image](https://user-images.githubusercontent.com/111721629/189514851-9f1bd1a5-b586-42b0-8683-d087d51c1da0.png)

## Cấu trúc rẽ nhánh

chạy dòng code sau

```
#!/bin/sh

a=10
b=20

if [ $a == $b ]
then
   echo "a is equal to b"
fi

if [ $a == $b ]
then
   echo "a is equal to b"
elif [ $a -gt $b ]
then
   echo "a is greater than b"
elif [ $a -lt $b ]
then
   echo "a is less than b"
else
   echo "None of the condition met"
fi
``` 

![image](https://user-images.githubusercontent.com/111721629/189514964-912cb8b7-d8be-4742-9a4f-3bb191559194.png)

Cho ta kết quả:

![image](https://user-images.githubusercontent.com/111721629/189515024-ecec2890-140b-4538-bd71-0b435ce06cf3.png)

## Cấu trúc lặp

ví dụ vòng lặp for

```
#!/bin/sh

for var in 0 1 2 3 4 5 6 7 8 9
do
   echo $var
done
```
cho ta kết quả in từng giá trị trong chuỗi kí tự varchar

![image](https://user-images.githubusercontent.com/111721629/189515210-d146c136-f0d4-4db1-b790-ac746036e490.png)






 





