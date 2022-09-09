# Shell Scripts

Về cơ bản shell script là 1 tập hợp các lệnh được thực thi nối tiếp nhau, bắt đầu 1 shell script thường có ghi chú comment mở đầu bằng # như này:

```
#!/bin/bash

# Author : Không AI
# Copyright (c) Viblo.asia
# Script chạy linh tinh lắm
HELLO="Xin chào, "
HELLO=$(printf "%s %s" "$HELLO" "$(whoami)" "!")
DAY="Hôm nay là ngày "
DAY=$(printf "%s %s" "$DAY" "$(date)")
echo $HELLO
echo $DAY
```

- Trước khi làm bất cứ điều gì với script, cần thông báo với system rằng chuẩn bị có shell chạy bằng dòng lệnh ` #!/bin/bash `

- Để soạn thảo shell script thì có thể gõ ngay trên terminal hoặc dùng các trình soạn thảo nào mà bạn thích, vim, gedit, kate,... sau đó lưu lại file*.sh, ví dụ ` test.sh `

- Sau đó thiết lập quyền thực thi cho shell $chmod +x test.sh

- Rồi chạy script bằng 1 trong 3 cách: bash test.sh, sh test.sh, ./test.sh

### Biến trong shell

**Đặt tên**

Như mọi ngôn ngữ khác, tên biến chỉ bao gồm các chữ cái a đến z, từ A đến Z, chữ số từ 0 tới 9 và dấu _, tên biến không được bắt đầu bằng chữ số.

#### Khai báo

```
variable_name=variable_value
```

Ví dụ:

```
LAM="Trương Văn Lâm"
```
Sử dụng
```
LAM="Trương Văn Lâm"
echo $THAO
```

**Biến Read-only**

Sau khi khai báo biến này, thì giá trị của biến không thể bị thay đổi.

```
lam@bla-bla ~ $ LAM="Trương Văn Lâm"
lam@bla-bla ~ $ readonly LAM
lam@bla-bla ~ $ LAM="Muốn Thay Tên Khác"
bash: LAM: readonly variable
```

**Xóa giá trị của biến**

```
lam@bla-bla ~ $ a="value"
lam@bla-bla ~ $ echo $a
value
lam@bla-bla ~ $ unset a
lam@bla-bla ~ $ echo $a

@bla-bla ~ $
```

## Các loại biến

- Biến hệ thống: tạo ra và quản lý bởi system, tên là chữ hoa, ví dụ

```
thao@bla-bla ~ $ echo $SHELL
/bin/bash
thao@bla-bla ~ $ echo $TERM
xterm
```
- Biến do người dùng định nghĩa: tạo ra và quản lý bởi người dùng, tên lung tung, thỏa mãn yêu cầu đặt tên của shell.

**Mảng**

```
NAME[0]="Zara"
NAME[1]="Qadir"
NAME[2]="Mahnaz"
NAME[3]="Ayan"
NAME[4]="Daisy"
```

Nếu dùng ksh shell thì có thể khai báo:

```
set -A array_name value1 value2 ... valuen
```

Nếu dùng bash shell thì khai báo thế này:

```
array_name=(value1 ... valuen)
```

Để sử dụng 1 giá trị trong mảng:

```
${array_name[index]}
```

hoặc tất cả giá trị trong mảng:

```
${array_name[*]}
${array_name[@]}
```

Ví dụ:

```
#!/bin/sh

NAME[0]="Zara"
NAME[1]="Qadir"
NAME[2]="Mahnaz"
NAME[3]="Ayan"
NAME[4]="Daisy"
echo "First Index: ${NAME[0]}"
echo "Second Index: ${NAME[1]}"
echo "First Method: ${NAME[*]}"
echo "Second Method: ${NAME[@]}"
```

Kết quả:

```
$./test.sh
First Index: Zara
Second Index: Qadir
First Method: Zara Qadir Mahnaz Ayan Daisy
Second Method: Zara Qadir Mahnaz Ayan Daisy
```
**Các phép toán số học**

Để thực hiện các phép toán số học, cần dùng expr để thực hiện:

```
#!/bin/sh

val=`expr 2 + 2`
echo "Total value : $val"
```

Kết quả:

```
Total value : 4
```

Với `$a` có giá trị 10 và `$b` có giá trị 20, ta có bảng sau:

| Phép tính | Ý nghĩa | Ví dụ |
|-----------|---------|-------|
| + | Phép cộng | expr $a + $b; cho kết quả 30 |
| - | Phép trừ | expr $a - $b; cho kết quả -10 |
| * | Phép nhân | expr $a * $b; cho kết quả 200|
| / | Phép chia | expr $b / $a ; cho kết quả 2 |
| % | Phép chia lấy dư | expr $b % $a; cho kết quả 0 |
| = | Gán giá trị | a=$b giá trị của b sẽ gán cho $a, giờ $a có giá trị là 20 |
| == | So sánh bằng, trả về true nếu 2 biến cùng giá trị | [ $a == $b ] trả về false |
|!= | 	So sánh không bằng, trả về true nếu 2 biến khác giá trị | [ $a == $b ] trả về true |


## Phép toán quan hệ

Vẫn với $a có giá trị 10 và $b có giá trị 20, ta có bảng sau:

| Phéo tính | Ý Nghĩa | Ví dụ |
|-----------|---------|-------|
| -eq | 	Kiểm tra giá trị 2 toán tử có bằng nhau hay không, bằng thì trả về true | [ $a -eq $b ] trả kết quả không phải là true |
| -ne | Kiểm tra giá trị 2 toán tử có bằng nhau hay không, không thì trả về true | [ $a -ne $b ] trả kết quả true |
| -gt | Kiểm tra giá trị của toán tử bên trái có lớn hơn giá trị bên phải hay không, có trả về true | [ $a -gt $b ] trả kết quả không phải là true |
| -lt | Kiểm tra giá trị của toán tử bên trái có nhỏ hơn giá trị bên phải hay không, có trả về true | [ $a -lt $b ] trả kết quả true |
| -ge | 	Kiểm tra giá trị của toán tử bên trái có lớn hơn hoặc bằng giá trị bên phải hay không, có trả về true | [ $a -ge $b ] trả kết quả không phải là true |
| -le | 	Kiểm tra giá trị của toán tử bên trái có nhỏ hơn hoặc bằng giá trị bên phải hay không, có trả về true | [ $a -le $b ] trả kết quả là true |

### Cấu trúc rẽ nhánh

Ví dụ:

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

### Cấu trúc lặp

Vòng lặp while

```
#!/bin/sh

a=0

while [ $a -lt 10 ]
do
   echo $a
   a=`expr $a + 1`
done
```

Vòng lặp for
```
#!/bin/sh

for var in 0 1 2 3 4 5 6 7 8 9
do
   echo $var
done
```

Vòng lặp until
```
#!/bin/sh

a=0

until [ ! $a -lt 10 ]
do
   echo $a
   a=`expr $a + 1`
done
```

vòng lặp select
```
#!/bin/ksh

select DRINK in tea cofee water juice appe all none
do
   case $DRINK in
      tea|cofee|water|all)
         echo "Go to canteen"
         ;;
      juice|appe)
         echo "Available at home"
      ;;
      none)
         break
      ;;
      *) echo "ERROR: Invalid selection"
      ;;
   esac
done
```

Kết quả của vòng select

```
$./test.sh
1) tea
2) cofee
3) water
4) juice
5) appe
6) all
7) none
#? juice
Available at home
#? none
```

### Hàm

```
#!/bin/sh

# Define your function here
Hello () {
   echo "Hello World"
}

# Invoke your function
Hello
```

Chạy script
```
$./test.sh
Hello World
```
Dùng hàm với parameters:

```
#!/bin/sh

# Define your function here
Hello () {
   echo "Hello World $1 $2 $3"
}

# Invoke your function
Hello Trương Văn Lâm
```

Kết quả
```
$./test.sh
Hello World Trương Văn Lâm
```

Lấy kết quả trả về từ hàm

```
#!/bin/sh

# Define your function here
Hello () {
   echo "Hello World $1 $2 $3"
   return 10
}

# Invoke your function
Hello Trương Văn Lâm

# Capture value returnd by last command
ret=$?

echo "Return value is $ret"
```

Kết quả:
```
$./test.sh
Hello World Trương Văn Lâm
Return value is 10
```
