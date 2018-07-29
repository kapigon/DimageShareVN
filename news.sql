-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2018 at 07:34 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `name`, `created_at`) VALUES
(1, 1, 'Technology', '2018-07-27 13:03:18'),
(2, 1, 'Business', '2018-07-27 13:05:25'),
(5, 1, 'IOT', '2018-07-28 17:09:19');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `user_id`, `title`, `slug`, `body`, `post_image`, `created_at`, `active`, `updated_at`) VALUES
(1, 5, 2, 'Internet of things là gì?', 'Internet-of-things-la-gi', '<p>Thuật ngữ ” Internet of things”( viết tắt là IoT) dạo gần đây xuất hiện khá nhiều và thu hút không ít sự quan tâm chú ý của thế giới công nghệ. Vì sự bùng nổ của IoT trong tương lai sẽ có tác động mãnh mẽ tới cuộc sống, công việc và xã hội loài người.</p><p>Thực tế, Internet of things đã manh nha từ nhiều thập kỹ trước. Tuy nhiên mãi đến năm 1999 cụm từ IoT mới được đưa ra bởi Kevin Ashton , Ông là một nhà khoa học đã sáng lập ra Trung tâm Auto-ID ở đại học MIT, nơi thiết lập các quy chuẩn toàn cầu cho RFID (một phương thức giao tiếp không dây dùng sóng radio) cũng như một số loại cảm biến khác.</p><p>Internet of things là gì?<br>Theo định nghĩa của Wikipedia&nbsp;<br>Mạng lưới vạn vật kết nối Internet hoặc là Mạng lưới thiết bị kết nối Internet viết tắt là IoT (tiếng Anh: Internet of Things) là một kịch bản của thế giới, khi mà mỗi đồ vật, con người được cung cấp một định danh của riêng mình, và tất cả có khả năng truyền tải, trao đổi thông tin, dữ liệu qua một mạng duy nhất mà không cần đến sự tương tác trực tiếp giữa người với người, hay người với máy tính. IoT đã phát triển từ sự hội tụ của công nghệ không dây, công nghệ vi cơ điện tử và Internet. Nói đơn giản là một tập hợp các thiết bị có khả năng kết nối với nhau, với Internet và với thế giới bên ngoài để thực hiện một công việc nào đó.</p><p>Hay hiểu một cách đơn giản IoT là tất cả các thiết bị có thể kết nối với nhau . Việc kết nối thì có thể thực hiện qua Wi-Fi, mạng viễn thông băng rộng (3G, 4G), Bluetooth, ZigBee, hồng ngoại… Các thiết bị có thể là điện thoại thông minh, máy pha cafe, máy giặt, tai nghe, bóng đèn, và nhiều thiết bị khác. Cisco, nhà cung cấp giải pháp và thiết bị mạng hàng đầu hiện nay dự báo: Đến năm 2020, sẽ có khoảng 50 tỷ đồ vật kết nối vào Internet, thậm chí con số này còn gia tăng nhiều hơn nữa. IoT sẽ là mạng khổng lồ kết nối tất cả mọi thứ, bao gồm cả con người và sẽ tồn tại các mối quan hệ giữa người và người, người và thiết bị, thiết bị và thiết bị. Một mạng lưới IoT có thể chứa đến 50 đến 100 nghìn tỉ đối tượng được kết nối và mạng lưới này có thể theo dõi sự di chuyển của từng đối tượng. Một con người sống trong thành thị có thể bị bao bọc xung quanh bởi 1000 đến 5000 đối tượng có khả năng theo dõi.</p><figure class=\"image\"><img src=\"http://iot.dtt.vn/img/mh9.jpg\" alt=\"\"></figure><p>Đặc tính cơ bản<br>– Tính kết nối liên thông(interconnectivity): với IoT, bất cứ điều gì cũng có thể kết nối với nhau thông qua mạng lưới thông tin và cơ sở hạ tầng liên lạc tổng thể.</p><p>– Những dịch vụ liên quan đến “Things”: hệ thống IoT có khả năng cung cấp các dịch vụ liên quan đến “Things”, chẳng hạn như bảo vệ sự riêng tư và nhất quán giữa Physical Thing và Virtual Thing. Để cung cấp được dịch vụ này, cả công nghệ phần cứng và công nghệ thông tin(phần mềm) sẽ phải thay đổi.</p><p>– Tính không đồng nhất: Các thiết bị trong IoT là không đồng nhất vì nó có phần cứng khác nhau, và network khác nhau. Các thiết bị giữa các network có thể tương tác với nhau nhờ vào sự liên kết của các network.</p><p>– Thay đổi linh hoạt: Status của các thiết bị tự động thay đổi, ví dụ, ngủ và thức dậy, kết nối hoặc bị ngắt, vị trí thiết bị đã thay đổi,và tốc độ đã thay đổi… Hơn nữa, số lượng thiết bị có thể tự động thay đổi.</p><p>– Quy mô lớn: Sẽ có một số lượng rất lớn các thiết bị được quản lý và giao tiếp với nhau. Số lượng này lớn hơn nhiều so với số lượng máy tính kết nối Internet hiện nay. Số lượng các thông tin được truyền bởi thiết bị sẽ lớn hơn nhiều so với được truyền bởi con người.</p><p>&nbsp;</p><p>Yêu cầu ở mức high-level đối với một hệ thống IoT<br><strong>Một hệ thống IoT phải thoả mãn các yêu cầu sau:</strong></p><p>– Kết nối dựa trên sự nhận diện: Nghĩa là các “Things” phải có ID riêng biệt. Hệ thống IoT cần hỗ trợ các kết nối giữa các “Things”, và kết nối được thiết lập dựa trên định danh (ID) của Things.</p><p>– Khả năng cộng tác: hệ thống IoT khả năng tương tác qua lại giữa các network và Things.</p><p>– Khả năng tự quản của network: Bao gồm tự quản lý, tự cấu hình, tự chữa bệnh, tự tối ưu hóa và tự có cơ chế bảo vệ. Điều này cần thiết để network có thể thích ứng với các domains ứng dụng khác nhau, môi trường truyền thông khác nhau, và nhiều loại thiết bị khác nhau.</p><p>– Dịch vụ thoả thuận: dịch vụ này để có thể được cung cấp bằng cách thu thập, giao tiếp và xử lý tự động các dữ liệu giữa các “Things” dựa trên các quy tắc(rules) được thiết lập bởi người vận hành hoặc tùy chỉnh bởi các người dùng.</p><p>– Các Khả năng dựa vào vị trí(location-based capabilities): Thông tin liên lạc và các dịch vụ liên quan đến một cái gì đó sẽ phụ thuộc vào thông tin vị trí của Things và người sử dụng. Hệ thống IoT có thể biết và theo dõi vị trí một cách tự động. Các dịch vụ dựa trên vị trí có thể bị hạn chế bởi luật pháp hay quy định, và phải tuân thủ các yêu cầu an ninh.</p><p>– Bảo mật: Trong IoT, nhiều “Things” được kết nối với nhau. Chình điều này làm tăng mối nguy trong bảo mật, chẳng hạn như bí mật thông tin bị tiết lộ, xác thực sai, hay dữ liệu bị thay đổi hay làm giả.</p><p>– Bảo vệ tính riêng tư: tất cả các “Things” đều có chủ sở hữu và người sử dụng của nó. Dữ liệu thu thập được từ các “Things” có thể chứa thông tin cá nhân liên quan chủ sở hữu hoặc người sử dụng nó. Các hệ thống IoT cần bảo vệ sự riêng tư trong quá trình truyền dữ liệu, tập hợp, lưu trữ, khai thác và xử lý. Bảo vệ sự riêng tư không nên thiết lập một rào cản đối với xác thực nguồn dữ liệu.</p><p>– Plug and play: các Things phải được plug-and-play một cách dễ dàng và tiện dụng.</p><p>– Khả năng quản lý: hệ thống IoT cần phải hỗ trợ tính năng quản lý các “Things” để đảm bảo network hoạt động bình thường. Ứng dụng IoT thường làm việc tự động mà không cần sự tham gia người, nhưng toàn bộ quá trình hoạt động của họ nên được quản lý bởi các bên liên quan.</p><p>Ứng dụng của IoT<br><strong>IoT có ứng dụng rộng vô cùng, có thể kể ra một số thư như sau:</strong></p><p>• Quản lí chất thải<br>• Quản lí và lập kế hoạch quản lí đô thị<br>• Quản lí môi trường<br>• Phản hồi trong các tinh huống khẩn cấp<br>• Mua sắm thông minh<br>• Quản lí các thiết bị cá nhân<br>• Đồng hồ đo thông minh<br>• Tự động hóa ngôi nhà<br>• ...</p><p>Tác động của IoT rất đa dạng, trên các lĩnh vực: quản lý hạ tầng, y tế, xây dựng và tự động hóa, giao thông…. Cụ thể trong lĩnh vực y tế, Thiết bị IoT có thể được sử dụng để cho phép theo dõi sức khỏe từ xa và hệ thống thông báo khẩn cấp. Các thiết bị theo dõi sức khỏe có thể dao động từ huyết áp và nhịp tim màn với các thiết bị tiên tiến có khả năng giám sát cấy ghép đặc biệt, chẳng hạn như máy điều hòa nhịp hoặc trợ thính tiên tiến. cảm biến đặc biệt cũng có thể được trang bị trong không gian sống để theo dõi sức khỏe và thịnh vượng chung là người già, trong khi cũng bảo đảm xử lý thích hợp đang được quản trị và hỗ trợ người dân lấy lại mất tính di động thông qua điều trị là tốt. thiết bị tiêu dùng khác để khuyến khích lối sống lành mạnh, chẳng hạn như, quy mô kết nối hoặc máy theo dõi tim mặc.</p><p>IoT trong tương lai<br>Vì sao Cisco, Intel, và Qualcomm tài trợ khởi nghiệp cho IoT? Vì Tiềm năng hưởng lợi từ việc đầu tư vào các công ty khởi nghiệp đáng để mạo hiểm cho các hãng công nghệ khổng lồ. Như trong năm 2014, Intel kiếm hơn 2 tỷ USD từ Internet of Things</p><figure class=\"image\"><img src=\"http://iot.dtt.vn/img/mh10.jpg\" alt=\"\"></figure><p>Những con số khẳng định IoT là xu hướng của tương lai</p><p>Internet of Things đến năm 2020:</p><p>+ 4 tỷ người kết nối với nhau&nbsp;<br>+ 4 ngàn tỷ USD doanh thu&nbsp;<br>+ Hơn 25 triệu ứng dụng&nbsp;<br>+ Hơn 25 tỷ hệ thống nhúng và hệ thống thông minh&nbsp;<br>+ 50 ngàn tỷ Gigabytes dữ liệu</p><p>Vì thế, Internet of Thing đang là chìa khóa của thành công trong tương lai.</p>', 'IOT.jpg', '2018-07-27 13:22:28', 1, '2018-07-27'),
(2, 1, 2, 'CodeIgniter', 'CodeIgniter', '<p>CodeIgniter là nền tảng ứng dụng web nguồn mở được viết bằng ngôn ngữ PHP bởi Rick Ellis. Phiên bản đầu tiên được phát hành vào ngày 28/02/2006. Hiện tại CodeIgniter đang được phát triển bởi ExpressionEngine Development Team thuộc EllisLab, Inc.</p><p>&nbsp;</p><p><a href=\"https://thietkeweb9999.com/blogs/thiet-ke-website/1475-gioi-thieu-php-framework-codeigniter\"><i><strong>Giới thiệu PHP Framework CodeIgniter</strong></i></a></p><h3><strong>Những điểm nổi bật</strong></h3><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Được thiết kế theo mô hình MVC (Model-View-Controller):</strong> mô hình MVC giúp tách thành phần hiển thị giao diện (presentation) và xử lý (business logic) của một phần mềm thành các phần độc lập, từ đó giúp cho việc <a href=\"https://thietkeweb9999.com/\"><strong>thiết kế web</strong></a>, xử lý và bảo trì mã nguồn dễ dàng, đồng thời tăng khả năng mở rộng của phần mềm. CodeIgniter vận dụng mô hình này trong thiết kế, giúp tách biệt các tập tin giao diện với các tập tin xử lý dữ liệu, nâng cao khả năng xử lý và bảo trì.</p><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Nhỏ gọn</strong> : gói cài đặt chỉ 404KB, kích thước&nbsp; CodeIgniter giúp giảm thiểu đáng kể không gian lưu trữ.</p><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Tốc độ nhanh</strong> : CodeIgniter được đánh giá là PHP Framework có tốc độ nhanh nhất hiện nay. Bằng cơ chế lưu nội dung vào bộ đệm (cache), kiểm tra bộ đệm trước khi tiến hành thực hiện yêu cầu, CodeIgniter giảm số lần truy cập và xử lý dữ liệu, từ đó tối ưu hoá tốc độ tải trang.</p><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Miễn phí </strong>: CodeIgniter được phát hành dưới giấy phép Apache/BSD mở rộng, cho phép người dùng tự do thay đổi, phát triển và phân phối mã nguồn.</p><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Hỗ trợ Search Engine Optimization </strong>: Cấu trúc URL của CodeIgniter rất thân thiện với các Robot tìm kiếm.</p><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Hệ thống thư viện phong phú </strong>:<strong> </strong>CodeIgniter cung cấp những thư viện phục vụ cho những tác vụ thường gặp nhất trong lập trình web, chẳng hạn như truy cập cơ sở dữ liệu, gửi email, kiểm tra dữ liệu, quả lý session, xử lý ảnh,… đến những chức năng nâng cao như XML-RPC, mã hoá, bảo mật,…</p><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Bảo mật hệ thống </strong>: cơ chế kiểm tra dữ liệu chặt chẽ, ngăn ngừa XSS và SQL Injection của CodeIgniter giúp giảm thiểu các nguy cơ bảo mật cho hệ thống.</p><p><strong>Những điểm hạn chế</strong></p><figure class=\"image\"><img src=\"https://thietkeweb9999.com/data/upload/gioi-thieu-CodeIgniter.jpg\" alt=\"Giới thiệu codeigniter\"></figure><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Chưa hỗ trợ Object-Relational Mapping (ORM)</strong> : ORM là một kỹ thuật lập trình, trong đó các bảng của cơ sở dữ liệu được ánh xạ thành các đối tượng trong lập trình. Kỹ thuật này giúp cho việc thực hiện các thao tác trong cơ sở dữ liệu <strong>(Create Read UpdateDelete – CRUD)</strong> dễ dàng, mã nguồn ngắn gọn hơn.</p><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Chưa hỗ trợ AJAX </strong>(Asynchronous Javascrip and XML) : AJAX đã trở thành một phần không thể thiếu trong bất kỳ ứng dụng web 2.0 nào. AJAX giúp nâng cao tính tương tác giữa người dùng và hệ thống, giúp cho người dùng có cảm giác như đang sử dụng desktop vì các thao tác đều diễn ra tức thời. Hiện tại, CodeIgniter vẫn chưa có thư viện dựng sẵn nào hỗ trợ xây dựng ứng dụng AJAX. Lập trình viên phải sử dụng các thư viện bên ngoài, như JQuery, Script.aculo.us, Prototype, hay Mootools,…</p><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Chưa hỗ trợ một số module thông dụng : </strong>So với các framework khác, CodeIgniter không có các module thực&nbsp; thi một số tác vụ thường gặp trong quá trình xây dựng ứng dụng web như Chứng thực người dùng (User Authorization), trình phân tích RSS (RSS Parser) hay trình xử lý PDF,…</p><p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Chưa hỗ trợ Event Driver Programming –</strong> EDP :<strong> </strong>EDP là một nguyên lý lập trình, trong đó các luồng &nbsp;xử lý của hệ thống sẽ dựa vào các sự kiện, chẳng hạn như click chuột, gõ bàn phím,… Đây không phải là một khuyết điểm lớn của CodeIgniter vì hiện tại chỉ có một số ít Framework hỗ trợ EDP bao gồm Prado, QPHP, Yii.</p>', 'ci.png', '2018-07-27 13:23:23', 1, '2018-07-28'),
(3, 2, 2, 'Test Post', 'Test-Post', '<p>Test</p>\r\n', 'noimage.jpg', '2018-07-27 14:15:59', 0, '2018-07-29'),
(4, 0, 3, 'Bài 1', 'Bai-1', '<p>abc</p>', 'noimage.jpg', '2018-07-28 08:57:05', 0, '2018-07-28'),
(6, 0, 2, 'Blockchain là gì ?', 'Blockchain-la-gi', '<p><a href=\"https://bitcoinvietnamnews.com/blockchain-la-gi\">Blockchain</a> là gì ? Blockchain là một công nghệ cho phép truyền tải dữ liệu một cách an toàn dựa vào hệ thống mã hoá vô cùng phức tạp, &nbsp;tương tự cuốn sổ cái kế toán của một công ty, nơi mà tiền mặt được giám sát chặt chẽ. Trong trường hợp này Blockchain là một cuốn sổ cái kế toán hoạt động trong lĩnh vực kỹ thuật số.</p><p>Blockchain sở hữu tính năng vô cùng đặc biệt đó là việc truyền tải dữ liệu không đòi hỏi một trung gian để xác nhận thông tin. Hệ thống Blockchain tồn tại rất nhiều nút độc lập có khả năng xác thực thông tin mà không đòi hỏi “dấu hiệu của niềm tin”. Thông tin trong Blockchain không thể bị thay đổi và chỉ được bổ sung thêm khi có sự đồng thuận của tất cả các nút trong hệ thống. Đây là một hệ thống bảo mật an toàn cao trước khả năng bị đánh cắp dữ liệu. Ngay cả khi một phần của hệ thống Blockchain sụp đổ, những máy tính và các nút khác sẽ tiếp tục bảo vệ thông tin và giữ cho mạng lưới tiếp tục hoạt động.</p><p>Công nghệ Blockchain có thể nói là sự kết hợp giữa 3 loại công nghệ bên dưới:</p><ul><li>Mật mã học: Sử dụng public key và hàm hash function để đảm bảo tính minh bạch, toàn vẹn và riêng tư.</li><li>Mạng ngang hàng: Mỗi một nút trong mạng được xem như một client và cũng là server để lưu trữ bản sao ứng dụng.</li><li>Lý thuyết trò chơi: Tất cả các nút tham gia vào hệ thống đều phải tuân thủ luật chơi đồng thuận (PoW, PoS…) và được thúc đẩy bởi động lực kinh tế.</li></ul><p>Trên góc độ business có thể gọi là một sổ cái kế toán, hay một cơ sở dữ liệu chứa đựng tài sản, hay một cấu trúc dữ liệu, mà dùng để ghi chép lại lịch sử tài sản giữa các thành viên trong hệ thống mạng ngang hàng.</p><p>Trên góc độ kỹ thuật đó là một phương thức bất biến để lưu trữ lịch sử các giao dịch tài sản.</p><p>Trên góc độ xã hội đó là một hiện tượng, mà dùng để thiết lập niềm tin bằng quy tắc đồng thuận giữa các thành viên trong một hệ thống phân cấp.</p><p><br>&nbsp;</p>', 'Blockchain.jpg', '2018-07-28 17:07:55', 1, '2018-07-28'),
(7, 0, 2, 'Trí tuệ nhân tạo là gì?', 'Tri-tue-nhan-tao-la-gi', '<p><strong>Định nghĩa trí tuệ nhân tạo: (AI: Artificial Intelligence) có thể được định nghĩa như một ngành của khoa học máy tính liên quan đến việc tự động hóa các hành vi thông minh.</strong> AI là một bộ phận của khoa học máy tính và do đó nó phải được đặt trên những nguyên lý lý thuyết vững chắc, có khả năng ứng dụng được của lĩnh vực này.</p><p>Ở thời điểm hiện tại, Thuật ngữ này thường dùng để nói đến các MÁY TÍNH có mục đích không nhất định và ngành khoa học nghiên cứu về các lý thuyết và ứng dụng của trí tuệ nhân tạo. Tức là mỗi loại trí tuệ nhân tạo hiện nay đang dừng lại ở mức độ những máy tính hoặc siêu máy tính dùng để xử lý một loại công việc nào đó như điều khiển một ngôi nhà, nghiên cứu nhận diện hình ảnh, xử lý dữ liệu của bệnh nhân để đưa ra phác đồ điều trị, xử lý dữ liệu để tự học hỏi, khả năng trả lời các câu hỏi về chẩn đoán bệnh, trả lời khách hàng về các sản phẩm của một công ty,...</p><figure class=\"image\"><img src=\"http://img.khoahoc.tv/photos/image/2017/03/25/tri-tue-nhan-tao.jpg\" alt=\"AI là một bộ phận của khoa học máy tính và do đó nó phải được đặt trên những nguyên lý lý thuyết vững chắc.\"></figure><p><br>AI là một bộ phận của khoa học máy tính và do đó nó phải được đặt trên những nguyên lý lý thuyết vững chắc.</p><p>Nói nôm na cho dễ hiểu: <strong>đó là trí tuệ của máy móc được tạo ra bởi con người.</strong> Trí tuệ này có thể tư duy, suy nghĩ, học hỏi,... như trí tuệ con người. Xử lý dữ liệu ở mức rộng lớn hơn, quy mô hơn, hệ thống, khoa học và nhanh hơn so với con người.</p><p>Rất nhiều hãng công nghệ nổi tiếng có tham vọng tạo ra được những AI (trí tuệ nhân tạo) vì giá trị của chúng là vô cùng lớn, giải quyết được rất nhiều vấn đề của con người mà loài người đang chưa giải quyết được.</p><p><strong>Trí tuệ nhân tạo mang lại rất nhiều giá trị cho cuộc sống loài người, nhưng cũng tiềm ẩn những nguy cơ.</strong> Rất nhiều chuyên gia lo lắng rằng khi trí tuệ nhân tạo đạt tới 1 ngưỡng tiến hóa nào đó thì đó cũng là thời điểm loài người bị tận diệt. Rất nhiều các bộ phim đã khai thác đề tài này với nhiều góc nhìn, nhưng qua đó đều muốn cảnh báo loài người về mối nguy đặc biệt này.</p><figure class=\"image\"><img src=\"http://img.khoahoc.tv/photos/image/2017/03/25/tri-tue-nhan-tao-1.jpg\" alt=\"1 cảnh trong bộ phim \"></figure><p><br>1 cảnh trong bộ phim \"I, Robot\" nói về một AI đã tiến hóa, sau đó đã dồn con người vào cảnh<i> \"nô lệ\"</i> với danh nghĩa bảo vệ con người.</p><p>Dự báo cho rằng từ 5 đến 10 năm nữa, ngành khoa học này sẽ phát triển lên tới đỉnh cao. Hãy cùng chờ đợi những thành tựu mới nhất của loài người về lĩnh vực này.</p>', 'AI.jpg', '2018-07-29 17:21:46', 1, '2018-07-29'),
(8, 0, 2, 'AngularJS là gì?', 'AngularJS-la-gi', '<p>Mở đầu với loạt bài về Angular JS, ở phần này mình sẽ nói qua các khái niệm về Angular JS, các thành phần trong Angular JS, phân tích ưu và nhược điểm của nó.</p><h2>AngularJS là cái gì?</h2><p>Đây là một mã nguồn mở, 1 framwork cho các ứng dụng web. Được phát triển từ năm 2009, hiện tại được duy trì bởi google và đã ra mắt phiên bản 2.0</p><figure class=\"image\"><img src=\"https://viblo.asia/uploads/8358e33d-0676-4a79-a1f3-8617c0a43bc5.png\" alt=\"angular0.png\"></figure><p>Định nghĩa chính thức được đưa ra như sau :</p><p><i>AngularJS là một framework có cấu trúc cho các ứng dụng web động. Nó cho phép bạn sử dụng HTML như là ngôn ngữ mẫu và cho phép bạn mở rộng cú pháp của HTML để diễn đạt các thành phần ứng dụng của bạn một cách rõ ràng và súc tích. Hai tính năng cốt lõi: Data binding và Dependency injection của AngularJS loại bỏ phần lớn code mà bạn thường phải viết. Nó xảy ra trong tất cả các trình duyệt, làm cho nó trở thành đối tác lý tưởng của bất kỳ công nghệ Server nào.</i></p><p>Để học được AngularJS bạn cần phải có những kiến thức cơ bản javascript, object, string …. Việc bạn có hiểu biết chuyên sâu về javascript sẽ giúp cho bạn dễ dàng học AngularJS. Bản chất của AngularJS là hoạt động dạng Single Page, sử dụng API để lấy data, cho nên bạn cần biết các kĩ thuật DHTML, AJAX.</p><h2>Đặc trưng của AngularJS</h2><ul><li>Phát triển dự trên Javascript</li><li>Tạo các ứng dụng client-side theo mô hình MVC.</li><li>Khả năng tương thích cao, tự động xử lý mã javascript để phù hợp vứi mỗi trình duyệt.</li><li>Mã nguồn mở, miễn phí hoàn toàn và được sủ dụng rộng rãi.</li></ul><h2>Các tính năng cơ bản</h2><ul><li>Scope : là đối tượng có nhiệm vụ giao tiếp giữa controller và view của ứng dụng.</li><li>Controller : xử lí dữ liệu cho đối tượng $scope, từ đây bên views sẽ sử dụng các dữ liệu trong scope để hiển thị ra tương ứng.</li><li>Data-binding : tự động đồng bộ dữ liệu giữa model và view</li><li>Service : là singleton object được khởi tạo 1 lần duy nhất cho mỗi ứng dụng, cung cấp các phương thức lưu trữ dữ liệu có sãn. ($http, $httpBackend, $sce, $controller, $document, $compile, $parse, $rootElement, $rootScope …..)</li><li>Filter : Lọc các tập con từ tập item trong các mảng và trả về các mảng mới.</li><li>Directive : dùng để tạo các thẻ HTML riêng phục vụ những mục đích riêng. AngularJS có những directive có sẵn như ngBind, ngModel…</li><li>Temple : một thành phần của view, hiển thị thông tin từ controller</li><li>Routing : chuyển đổi giữa các action trong controller, qua lại giữa các view.</li><li>MVC &amp; MVVM : mô hình thiết kế để phân chia các ứng dụng thành nhiều phần khác nhau (gọi là Model, View và Controller) mỗi phần có một nhiệm vụ nhất định. AngularJS không triển khai MVC theo cách truyền thống, mà gắn liền hơn với Model-View-ViewModel.</li><li>Deep link : Liên kết sâu, cho phép bạn mã hóa trạng thái của ứng dụng trong các URL để nó có thể bookmark với công cụ tìm kiếm. Các ứng dụng có thể được phục hồi lại từ các địa chỉ URL với cùng một trạng thái.</li><li>Dependency Injection: AngularJS có sẵn một hệ thống con dependency injection để giúp các lập trình viên tạo ra các ứng dụng dễ phát triển, dễ hiểu và kiểm tra.</li></ul><figure class=\"image\"><img src=\"https://viblo.asia/uploads/8ba0d6b9-92b2-487d-a29b-d90c54f6b7bd.png\" alt=\"angular1.png\"></figure><h2>Các components chính</h2><ul><li>ng-app : định nghĩa và liên kết một ứng dụng AngularJS tới HTML.</li><li>ng-model : gắn kết giá trị của dữ liệu ứng dụng AngularJS đến các điều khiển đầu vào HTML.</li><li>ng-bind : gắn kết dữ liệu ứng dụng AngularJS đến các thẻ HTML.</li></ul><h2>Ưu điểm của angularJS</h2><ul><li>Cung cấp khả năng tạo ra các Single Page Aplication dễ dàng.</li><li>Cung cấp khả năng data binding tới HTML, khiến cho người dùng cảm giác linh hoạt, thân thiện.</li><li>Dễ dàng Unit test</li><li>Dễ dàng tái sử dụng component</li><li>Giúp lập trình viên viết code ít hơn với nhiều chức năng hơn.</li><li>Chạy được trên các loại trình duyệt, trên cả PC lẫn mobile.</li></ul><h2>Nhược điểm</h2><ul><li>Không an toàn : được phát triển từ javascript cho nên ứng dụng được viết bởi AngularJS không an toàn. Nên có sự bảo mật và xác thực phía server sẽ giúp ứng dụng trở nên an toàn hơn.</li><li>Nếu người sử dụng ứng dụng của vô hiệu hóa JavaScript thì sẽ chỉ nhìn thấy trang cơ bản.</li></ul><p>Phần giới thiệu về Angular JS của mình đến đây là kết thúc. Ở phần tiếp theo mình sẽ nói về Directive trong AngularJS.</p>', 'angularjs.png', '2018-07-29 17:23:10', 1, '2018-07-29'),
(9, 0, 2, 'Giới thiệu về Laravel', 'Gioi-thieu-ve-Laravel', '<p>developer, đặc biệt là các PHP developer chắc hẳn ai cũng biết đến <a href=\"https://laravel.com/\"><strong>Laravel</strong></a> một open source framework đứng đầu về số lượt download trên <a href=\"https://packagist.org/packages/laravel/laravel\">Packagist</a> cũng như số lượng sao đạt được trên <a href=\"https://github.com/laravel/laravel\">Github</a>. <strong>Laravel</strong> được tạo ra bởi <strong>Taylor Otwell</strong> với phiên bản đầu tiên được ra mắt vào tháng 6 năm 2011. Từ đó cho đến này, <strong>Laravel</strong> đã phát triển một cách mạnh mẽ, vượt qua những framework khác và vươn lên trở thành framework PHP có thể nói được ưa chuộc và được cộng đồng sử dụng nhiều nhất khi phát triển web với PHP. Dưới đây là biểu đồ cho thấy sự tăng trưởng về số lượng sao trên github của <strong>Laravel</strong> so với một số framework khác:</p><figure class=\"image\"><img src=\"https://viblo.asia/uploads/848943d4-0afd-42b3-a374-d02544ab357c.png\" alt=\"\"></figure><h2>Lý do khiến Laravel nổi tiếng?</h2><p>Mặc dù ra đời muộn hơn so với CakePHP và CodeIgniter nhưng <strong>Laravel</strong> đã nhanh chóng được công nhận đón nhận và sử dụng nên chỉ đến khoảng giữa năm 2013 nó đã đứng đầu trong bảng xếp hạng đánh giá sao trên Github. Sở dĩ, <strong>Laravel</strong> phát triển nhanh và mạnh được đến như ngày này là nhờ vào các đặc điểm mà nó cung cấp có thể kể đến như sau:</p><h3>1. Dễ dàng sử dụng</h3><ul><li>Lý do đầu tiên khiến <strong>Laravel</strong> nhanh chóng được cộng đồng đón nhận và sử dụng nhiều là do nó rất dễ để có thể sử dụng. Ngay cả khi bạn chỉ mới chỉ có những kiến thức cơ bản nhất về lập trình web với PHP thì việc bắt đầu sử dụng <strong>Laravel</strong> cũng chỉ mất vài giờ là bạn có thể bắt tay vào việc làm một project nhỏ.</li><li>Document mà <strong>Laravel</strong> cung cấp trên <a href=\"https://laravel.com/docs/5.5\">trang chủ </a>của mình được viết rất rõ ràng và dể hiểu giúp cho bạn nhanh chóng có thể tìm được những gì mình muốn.</li></ul><h3>2. Xây dựng theo mô hình MVC</h3><ul><li><strong>Laravel</strong> được xây dựng và phát triển theo mô hình MVC (Model-View-Controller) nhờ đó mà cấu trúc và cách tổ chức code trong project được sắp xếp một cách hợp lý dễ dàng cho việc maintain cũng như phát triển về lâu dài.</li></ul><h3>3. Các tính năng dựng sẵn</h3><ul><li>Bản thân <strong>Laravel</strong> đã cung cấp cho người dùng rất nhiều các nhóm tính năng giúp quá trình phát triển trở nên nhanh chóng hơn rất nhiều lần.</li><li>Chỉ với một câu lệnh đơn giản:$ php artisan make:auth \r\nlà bạn đã dựng được cho mình toàn bộ các tính năng như đăng nhập, đăng xuất, đăng kí, quên mật khẩu mà không tốn công code một dòng nào cả. Tất nhiên bạn cũng có thể tự mình chỉnh sửa lại logic sao cho hợp với nhu cầu sử dụng cá nhân.</li></ul><h3>4. Các tính năng bảo mật</h3><ul><li>Để giúp lập trình viên có thể tối đa thời gian tập chung vào việc phát triển các tính năng, <strong>Laravel</strong> đã cung cấp sẵn cho người dùng các tính năng bảo mật cơ bản như:<ul><li>ORM của <strong>Laravel</strong> sử dụng PDO thay vì mysqli để chống lại tấn công SQL Injection.</li><li><strong>Laravel</strong> sử dụng một field token ẩn để chống lại tấn công kiểu CSRF.</li><li>Các biến được đưa ra view mặc định đều được <strong>Laravel</strong> escape để tránh tấn công XSS</li><li>&nbsp;</li></ul></li></ul><h3>5. Blade template</h3><ul><li>Ở phần view, <strong>Laravel</strong> cung cấp sẵn cho người dùng một <i>template enigine</i> có tên là blade, giúp người dùng có thể sử dụng code php bên trong file giao diện của mình một cách thuật lợi và không bị rối mắt như sử dụng cặp thẻ &lt;?php ?&gt; thông thường: Chắc bạn cũng thấy rằng việc sử dụng blade engine của <strong>Laravel</strong> sẽ mang lại kết quả tuyệt vời hơn so với cách thông thường ntn</li></ul><h3>6. Cộng đồng mạnh mẽ</h3><ul><li>Chắc hẳn trong quá trình làm việc, bạn có thể sẽ gặp rất nhiều những vấn đề, nhưng bug phát sinh nhưng chưa tìm được câu trả lời. Nhưng may thay nếu bản sử dụng <strong>Laravel</strong> vướng mắc của bạn có thể đã được người khác giải quyết và bạn có thể lập tức sử dụng đáp án đó hoặc nếu không khi bạn đặt câu hỏi trên các diễn đàn thì cộng đồng đông đảo người sử dụng <strong>Laravel</strong> sẽ hỗ trợ bản giải quyết vấn đề đó.</li></ul><h2>Kết bài</h2><p>Bài viết trên nhằm giới thiệu cho bạn những lý do cở bản tại sao chúng ta nên sử dụng <strong>Laravel</strong> nếu như bạn là một lập trình viên PHP. Trong những bài viết sau mình sẽ giới thiệu chi tiết hơn về tính năng và cách sử dụng các tính năng đó trong <strong>Laravel</strong>. Hẹn gặp lại bạn ở bài viết sau.</p><figure class=\"image\"><img src=\"https://twemoji.maxcdn.com/2/72x72/1f604.png\" alt=\"????\"></figure><figure class=\"image\"><img src=\"https://viblo.asia/uploads/f6b3de98-8584-420f-95e9-c0e4da7c2ee6.png\" alt=\"\"></figure><figure class=\"image\"><img src=\"https://viblo.asia/uploads/ca7a151b-e54d-43ca-b1ce-ab2ab9a75f12.png\" alt=\"\"></figure>', 'laravel.jpg', '2018-07-29 17:25:03', 1, '2018-07-29');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `active`) VALUES
(1, 'Administrator', 1),
(2, 'Author', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `roleId` int(11) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `roleId`, `email`, `username`, `password`, `register_date`, `active`) VALUES
(1, 'Admin', 1, 'admin@gmail.com', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2018-07-27 10:14:31', 1),
(2, 'Author', 2, 'author@gmail.com', 'author', 'e10adc3949ba59abbe56e057f20f883e', '2018-07-27 10:14:31', 1),
(3, 'Author1', 2, 'author1@gmail.com', 'author1', 'e10adc3949ba59abbe56e057f20f883e', '2018-07-27 10:14:31', 0),
(4, 'Author2', 2, 'author2@gmail.com', 'author2', 'e10adc3949ba59abbe56e057f20f883e', '2018-07-27 10:14:31', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
