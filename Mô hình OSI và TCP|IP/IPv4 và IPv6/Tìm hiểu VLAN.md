# VLAN

VLAN là viết tắt của **Virtual Local Area Network** hay còn gọi là mạng LAN ảo. Mạng LAN ảo (VLAN) là một nhóm các máy tính được kết nối với cùng một mạng nhưng không ở gần nhau. Sử dụng VLAN cho phép sử dụng tài nguyên mạng hiệu quả hơn và có thể hữu ích khi có quá nhiều thiết bị cho một mạng.

Một VLAN được định nghĩa là một nhóm logic các thiết bị mạng và được thiết lập dựa trên các yếu tố như chức năng, bộ phận, ứng dụng… của công ty. Về mặt kỹ thuật, VLAN là một miền quảng bá được tạo bởi các switch. Bình thường thì router đóng vai trò tạo ra miền quảng bá. Đối với VLAN, switch có thể tạo ra miền quảng bá.

<p>
  <img src="https://st.quantrimang.com/photos/image/012010/26/vlan1.jpg">
  </p>
  
 # Phân loại VLAN
+ **Port - based VLAN:** là cách cấu hình VLAN đơn giản và phổ biến. Mỗi cổng của Switch được gắn với một VLAN xác định (mặc định là VLAN 1), do vậy bất cứ thiết bị host nào gắn vào cổng đó đều thuộc một VLAN nào đó.
+ **MAC address based VLAN:** Cách cấu hình này ít được sử dụng do có nhiều bất tiện trong việc quản lý. Mỗi địa chỉ MAC được đánh dấu với một VLAN xác định.
+ **Protocol – based VLAN:** Cách cấu hình này gần giống như MAC Address based, nhưng sử dụng một địa chỉ logic hay địa chỉ IP thay thế cho địa chỉ MAC. Cách cấu hình không còn thông dụng nhờ sử dụng giao thức DHCP.

# Hoạt động

VLAN được tạo bằng cách thêm tag hoặc header vào mỗi frame Ethernet. Tag này cho mạng biết frame sẽ được gửi đến VLAN nào. Các thiết bị trong những VLAN khác nhau không thể nhìn thấy lưu lượng của nhau trừ khi chúng đều kết nối với router được cấu hình cho phép việc này.

# Lợi ích

<p> 
  <img src="https://st.quantrimang.com/photos/Image/012006/09/vlan.jpg" style="width:600px;">
  </p>
  
            
+ **Tiết kiệm băng thông của hệ thống mạng:** VLAN chia mạng LAN thành nhiều đoạn (segment) nhỏ, mỗi đoạn đó là một vùng quảng bá (broadcast domain). Khi có gói tin quảng bá (broadcast), nó sẽ được truyền duy nhất trong VLAN tương ứng. Do đó việc chia VLAN giúp tiết kiệm băng thông của hệ thống mạng.
+ **Tăng khả năng bảo mật:** Do các thiết bị ở các VLAN khác nhau không thể truy nhập vào nhau (trừ khi ta sử dụng router nối giữa các VLAN). Như trong ví dụ trên, các máy tính trong VLAN kế toán (Accounting) chỉ có thể liên lạc được với nhau. Máy ở VLAN kế toán không thể kết nối được với máy tính ở VLAN kỹ sư (Engineering).
+ **Dễ dàng thêm hay bớt máy tính vào VLAN:** Việc thêm một máy tính vào VLAN rất đơn giản, chỉ cần cấu hình cổng cho máy đó vào VLAN mong muốn.
+ **Giúp mạng có tính linh động cao:** VLAN có thể dễ dàng di chuyển các thiết bị. Giả sử trong ví dụ trên, sau một thời gian sử dụng công ty quyết định để mỗi bộ phận ở một tầng riêng biệt. Với VLAN, ta chỉ cần cấu hình lại các cổng switch rồi đặt chúng vào các VLAN theo yêu cầu. VLAN có thể được cấu hình tĩnh hay động. Trong cấu hình tĩnh, người quản trị mạng phải cấu hình cho từng cổng của mỗi switch. Sau đó, gán cho nó vào một VLAN nào đó. Trong cấu hình động mỗi cổng của switch có thể tự cấu hình VLAN cho mình dựa vào địa chỉ MAC của thiết bị được kết nối vào.


