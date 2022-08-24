# Tìm hiểu Git Và GitHub
## Đầu tiên : Phân biệt về Git và GitHub 
>Câu chuyện về hai anh chàng lập trình viên, cùng làm dự án chung với nhau:

  "Có hai anh chàng lập trình viên đang cùng với nhau cùng xây dựng một phần mềm cho khách hàng. Và hai anh chàng này chọn làm việc chung với nhau bằng cách mỗi người tự viết code một ít và gửi cho nhau qua email hoặc một phương thức gửi dữ liệu thông thường nào đó. Mỗi người sau khi nhận được code của nhau sẽ tiến hành tự xem và sửa lại, sau đó cùng nhau ráp nối vào phần mềm mà họ cần làm. Tuy nhiên, một hôm anh A bỗng nhiên vô tình viết code sai vào phần mềm dẫn tới sản phẩm bị lỗi mà trước đó cả hai anh đều không hề sao lưu lại do phần mềm quá lớn. Và thế là hai anh lại cùng nhau xây dựng lại tính năng bị lỗi và tiếp tục gửi cho nhau như vậy." Xuất phát từ câu chuyện trên chúng ta thấy có hai vấn đề phát sinh ở đây đó là:

  + Mỗi người tự code riêng và gửi cho nhau qua email rất mất thời gian của nhau. Hơn nữa, anh B sẽ không thể biết được anh A đã thay đổi những gì, có ảnh hưởng gì đến code chung của toàn hệ thống hay không, và việc tiến hành merge code rất khó kiểm soát.
  + Việc sửa code mà không hề có bản sao lưu trước đó khiến cho họ phải viết lại code từ đầu khi phần mềm bị lỗi. Việc Git xuất hiện sẽ giúp giải quyết được vấn đề của hai anh chàng trên một cách gọn lẹ, ngoài ra Git còn rất nhiều tính năng hữu hiệu khác nữa đó các bạn. Vậy Git là gì?
## Git là gì?
Git là tên gọi là một hệ thống quản lý phiên bản phân tán phổ biến nhất hiện nay (Distributed Version Control System – DVCS). DVCS nghĩa là hệ thống giúp mỗi máy tính có thể lưu trữ nhiều phiên bản khác nhau của một mã nguồn được nhân bản (clone) từ một kho chứa mã nguồn (repository), mỗi thay đổi vào mã nguồn trên máy tính sẽ có thể ủy thác (commit) rồi đưa lên máy chủ nơi đặt kho chứa chính. Và một máy tính khác (nếu họ có quyền truy cập) cũng có thể clone lại mã nguồn từ kho chứa hoặc clone lại một tập hợp các thay đổi mới nhất trên máy tính kia. Trong Git, thư mục làm việc trên máy tính gọi là Working Tree.
  <p align = "center">
<img src="https://images.viblo.asia/f8fad344-a8db-4de3-ae5b-ee283b0e06b2.png"> 
  </p>
Hiểu đơn giản thì Git sẽ giúp người dùng lưu lại các phiên bản của những lần thay đổi vào mã nguồn và sẽ dễ dàng cho việc khôi phục lại mà không cần phải thủ công copy rồi paste vào đâu đó, phiên bản đó đã được sao lưu. Khi chúng ta phát hiện ra lỗi ở đâu đó và muốn backup lại phiên làm việc trước khi bị lỗi xảy ra thì sẽ thật đơn giản khi chúng ta sử dụng Git. Một điểm đặc biệt nữa là một thành viên trong cùng một team khi làm việc với nhau hoàn toàn có thể theo dõi online được các thay đổi của các thành viên khác ở từng phiên bản làm việc mà không nhất thiết phải ngồi ngay cạnh nhau, họ cũng có thể đối chiếu được những thay đổi đó để rồi gộp phiên bản của thành viên khác vào phiên bản của họ. Cuối cùng là tất cả có thể đưa các thay đổi vào mã nguồn của mình lên một kho chứa mã nguồn./n

Cơ chế lưu trữ phiên bản của Git là nó sẽ tạo ra một “ảnh chụp” (snapshot) trên mỗi tập tin và thư mục sau khi commit, từ đó nó có thể cho phép bạn tái sử dụng lại một ảnh chụp nào đó mà bạn có thể hiểu đó là một phiên bản. Đây cũng chính là lợi thế của Git so với các DVCS khác khi nó không “lưu cứng” dữ liệu mà sẽ lưu với dạng snapshot.
## Github là gì?
 <p align = "center">
<img src="https://images.viblo.asia/8743dae2-a3d4-4dca-8383-f5340f56e97f.png"> 
  </p>
  Chúng ta đã nghe tới Git và có thể đã dùng GitHub nhưng chúng ta đa phần vẫn nhầm lẫn Git vs GitHub là một bởi vì cứ nói đến Git là nghĩ tới GitHub. Đó là một sự hiểu lầm vì Git như đã giải thích ở trên đó là tên gọi của một mô hình hệ thống, các máy tính có thể clone lại mã nguồn từ một repository , còn GitHub là tên của một công ty cũng cấp dịch vụ máy chủ repository công cộng, mỗi người có thể truy cập vào website trang chủ để tạo tài khoản trên đó và tạo ra kho chứa source của riêng mình khi làm việc.
  
# Tại sao nên sử dụng Git?
## Git mang đến nhiều lợi thế cho công việc lập trình:
+ Git dễ sử dụng, an toàn và nhanh chóng.
+ Quản lý source code dễ dàng chuyên nghiệp
+ Có thể giúp quy trình làm việc code theo nhóm đơn giản hơn rất nhiều bằng việc kết hợp các phân nhánh (branch).
+ Hạn chế được lỗi xảy ra trong quá trình code trong 1 team
+ Khi gặp lỗi có thể dễ dàng Backup lại phiên bản trước
+ Code không giới hạn khoảng cách giữa các thành viên trong team, bạn có thể làm việc ở bất cứ đâu vì chỉ cần clone mã nguồn từ kho chứa hoặc clone một phiên bản thay đổi nào đó từ kho chứa, hoặc một nhánh nào đó từ kho chứa.
+ Dễ dàng trong việc deployment sản phẩm.
