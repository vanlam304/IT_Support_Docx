# cHẠY MỘT SỐ BÀI VỀ PYTHON TRÊN CENTOS 7

### Bài 1

Viết chương trình tìm tất cả các số chia hết cho 7 nhưng không phải bội số của 5, nằm trong đoạn 2000 và 3200 (tính cả 2000 và 3200). Các số thu được sẽ được in thành chuỗi trên một dòng, cách nhau bằng dấu phẩy.

ta có đoạn code sau
```
j=[]
for i in range(2000, 3201):
    if (i%7==0) and (i%5!=0):
        j.append(str(i))
print (','.join(j))
```

![image](https://user-images.githubusercontent.com/111721629/189629341-7788ae90-c679-4533-8dd0-b62bae7056ff.png)

kết quả:
![image](https://user-images.githubusercontent.com/111721629/189629926-cac8d962-2a99-485f-9661-9d96d574092b.png)

### Bài 2

Với số nguyên n nhất định, hãy viết chương trình để tạo ra một dictionary chứa (i, i*i) như là số nguyên từ 1 đến n (bao gồm cả 1 và n) sau đó in ra dictionary này. Ví dụ: Giả sử số n là 8 thì đầu ra sẽ là: {1: 1, 2: 4, 3: 9, 4: 16, 5: 25, 6: 36, 7: 49, 8: 64}.

code
![image](https://user-images.githubusercontent.com/111721629/189631440-9595325e-fa9e-4648-951e-926e9178a93f.png)

kết quả 
![image](https://user-images.githubusercontent.com/111721629/189631632-ac07e3e2-dd41-4254-9ad3-89c3041691ab.png)

### Bài 3:

Viết một chương trình chấp nhận chuỗi từ do người dùng nhập vào, phân tách nhau bởi dấu phẩy và in những từ đó thành chuỗi theo thứ tự bảng chữ cái, phân tách nhau bằng dấu phẩy.

code
![image](https://user-images.githubusercontent.com/111721629/189632085-cca67059-a674-4f5b-bc5c-ed313d40971b.png)

kết quả


