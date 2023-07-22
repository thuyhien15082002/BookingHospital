-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 21, 2023 lúc 04:19 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `hospitalbooking`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  `appointment_purpose` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `appointment`
--

INSERT INTO `appointment` (`id`, `user_id`, `doctor_id`, `appointment_date`, `appointment_time`, `appointment_purpose`, `status`, `patient_name`, `phone`, `dob`, `gender`, `address`) VALUES
(1, 2, 3, '2023-07-04', '10:00:00', 'âbcd', NULL, 'hiền', '0123456789', '2002-08-15', 'Nữ', 'vĩnh Linh'),
(2, 2, 8, '2023-07-04', '11:00:00', NULL, NULL, 'nam', '0123456789', '2023-07-16', 'nam', NULL),
(3, 2, 8, '2023-07-05', '15:00:00', NULL, NULL, 'nam', '0123456789', '2023-07-16', 'nam', NULL),
(4, 2, 8, '2023-07-04', '09:00:00', NULL, NULL, 'nam', '0123456789', '2023-07-16', 'nam', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `specialist_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `intro` text DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `doctor`
--

INSERT INTO `doctor` (`id`, `specialist_id`, `email`, `password`, `name`, `phone`, `image`, `intro`, `gender`, `role`) VALUES
(1, 1, 'huyen@gmail.com', 'huyen123', 'Nguyễn Huyền', '0900300223', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMeDL9HeCBG2yaZURCXMkODj-kx3nwyHBA6j1XvFY5qKLUhd9v3j0RsI8Kn56-3aoQb_E&usqp=CAU', NULL, 'Nam', 2),
(2, 2, 'nhung@gmail.com', 'nhung123', 'Nguyễn Nhung', '0900300223', 'https://www.fvhospital.com/wp-content/uploads/2018/03/dr-vo-trieu-dat-2020.jpg', NULL, 'Nữ', 2),
(3, 3, 'hoa@gmail.com', 'hoa123', 'Nguyễn Hoa', '0900300223', NULL, '', 'Nữ', 2),
(4, 4, 'khanh@gmail.com', 'khanh123', 'Nguyễn Khánh', '0900300223', NULL, '', 'Nữ', 2),
(5, 5, 'thanh@gmail.com', 'thanh123', 'Trung Thành', '0900300223', NULL, '', 'Nam', 2),
(6, 6, 'lan@gmail.com', 'lan123', 'Văn Lan', '0900300223', NULL, '', 'Nữ', 2),
(7, 7, 'ngoc@gmail.com', 'ngoc123', 'Thị Ngọc', '0900300223', NULL, '', 'Nam', 2),
(8, 8, 'hieu@gmail.com', 'hieu123', 'Dương Hiếu', '0900300223', NULL, '', 'Nữ', 2),
(9, 9, 'linh@gmail.com', 'linh123', 'Trương Linh', '0900300223', NULL, '', 'Nam', 2),
(10, 10, 'dat@gmail.com', 'dat123', 'Nguyễn Đạt', '0900300223', NULL, '', 'Nam', 2),
(11, 11, 'sinh@gmail.com', 'sinh123', 'Văn Sinh', '0900300223', NULL, '', 'Nam', 2),
(12, 12, 'tan@gmail.com', 'tan123', 'Lỗ Tấn', '0900300223', NULL, '', 'Nam', 2),
(13, 13, 'trang@gmail.com', 'trang123', 'Huỳnh Trang', '0900300223', NULL, '', 'Nữ', 2),
(14, 13, 'ltthien.20it4@vku.udn.vn', 'hien123', 'Hien L', '0828388158', NULL, '', 'Nam', 2),
(15, 7, 'hai123@gmail.com', 'hai123', 'Hải', '0353195741', NULL, '', 'Nữ', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `specialist`
--

CREATE TABLE `specialist` (
  `id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `specialist`
--

INSERT INTO `specialist` (`id`, `name`, `description`) VALUES
(1, 'KHOA KHÁM BỆNH', 'Tổ chức và tiếp nhận người bệnh đến cấp cứu. Khám chữa bệnh cho mọi đối tượng có nhu cầu BHYT đúng tuyến, BHYT vượt tuyến, tự nguyện. Khám bệnh, chọn lọc người bệnh vào điều trị nội trú; thực hiện điều trị ngoại trú và hướng dẫn chăm sóc sức khỏe ban đầu. Tổ chức khám sức khỏe định kì, theo dõi tình hình bệnh tật trong vùng dân cư được phụ trách để có biện pháp ngăn ngừa bệnh tật.'),
(2, 'KHOA CẤP CỨU', 'Tiếp nhận và điều trị mọi trường hợp người bệnh cấp cứu được chuyển tới bệnh viện;Đánh giá, phân loại tình trạng bệnh và thực hiện các biện pháp cấp cứu thích hợp theo mức độ ưu tiên cấp cứu đến khi người bệnh qua khỏi tình trạng nguy kịch và trong vòng 48 giờ phải chuyển người bệnh đến khoa Hồi sức tích cực hoặc một chuyên khoa phù hợp khi điều kiện bệnh nhân cho phép;Tổ chức làm việc theo ca đối với điều dưỡng Thực hiện nghiêm chỉnh các quy trình, quy chế chuyên môn trong bệnh viện;Tổ chức dây chuyền cấp cứu cùng với khoa Hồi sức tích cực hỗ trợ chuyên môn cho hệ thống cấp cứu tại các khoa trong bệnh viện;Nghiên cứu khoa học, tư vấn và tuyên truyền giáo dục về cấp cứu cho cộng đồng;'),
(3, 'KHOA HỒI SỨC TÍCH CỰC', 'Điều trị bệnh nhân nặng cần hồi sức tích cực nội và ngoại khoa, Đào tạo, huấn luyện học viên đại học, sau đại học, Nghiên cứu khoa học và chỉ đạo tuyến dưới về cấp cứu hồi sức chuyên ngành Lao và Bệnh phổi, Hợp tác quốc tế.'),
(4, 'KHOA NỘI TỔNG HỢP', 'Khoa Nội tổng hợp có chức năng và nhiệm vụ chính là chẩn đoán và điều trị bệnh thuộc lĩnh vực nội khoa, người bệnh lao ngoài phổi, lao ngoài phổi/HIV đồng thời là đơn vị thực hành lâm sàng và thực hiện đề tài tốt nghiệp của sinh viên và học viên thuộc các chuyên ngành đào tạo đại học và sau đại học: bác sĩ nội trú, cao học.'),
(5, 'KHOA BỆNH PHỔI MÃN TÍNH', 'Chức năng Khoa Bệnh phổi mạn tính thực hiện chức năng khám, chẩn đoán, điều trị nội khoa các bệnh phổi mạn tính, không liên quan đến phẫu thuật, với trình độ chuyên môn chuyên sâu.'),
(6, 'KHOA NHI', '- Công tác chuyên môn: Phục vụ khám chữa bệnh cho tất cả trẻ em từ 0 – 15 tuổi mắc các bệnh về hô hấp như viêm phổi, các bệnh ký sinh trùng ở phổi, các bệnh phổi hiếm gặp, nấm phổi, hen phế quản, các bệnh lý màng phổi. Phối hợp cùng với Khoa Nội soi can thiệp phát hiện và điều trị cắt đốt khối u trong lòng phế quản bằng điện động cao tần. Chẩn đoán và điều trị giai đoạn đầu cho các trường hợp mắc lao các thể từ tất cả các bệnh viện các tuyến chuyển đến.'),
(7, 'KHOA UNG BƯỚU', 'Chẩn đoán và điều trị hóa chất, tia xạ, điều trị đích, miễn dịch và chăm sóc giảm nhẹ bệnh nhân ung thư phổi, ung thư màng phổi và một số ung thư khác trong lồng ngực.'),
(8, 'KHOA PHẨU THUẬT', 'Tổ chức tiếp nhận, khám chẩn đoán bệnh,lập kế hoạch điều trị ngoại khoa các bệnh lý về lồng ngực bao gồm các bệnh lý của phổi, trung thất, màng phổi và thành ngực. Đào tạo, tham gia đào tạo, tiếp nhận học viên đến thực tập, nghiên cứu tại Bệnh viện về các bệnh lý ngoại khoa lồng ngực.'),
(9, 'KHOA GÂY MÊ, HỒI SỨC', '- Gây mê hồi sức , giảm đau cho bệnh nhân phẫu thuật lồng ngực (nội soi cắt thùy phổi, cắt u trung thất, tràn khí màng phổi, bóc vỏ màng phổi, ho ra máu, tạo hình phế quản); phẫu thuật chỉnh hình xương khớp ( nẹp vít cột sống , thay thân đốt sống nhân tạo, thay khớp háng, nội soi khớp gối ); gây mê nội soi khí phế quản, nong khí phế quản ống cứng, đặt stent khí phế quản…vv'),
(10, 'KHOA PHỤC HỒI CHỨC NĂNG', 'Khoa thực hiện 2 nhiệm vụ chính: Phục vụ người bệnh phục hồi chức năng hô hấp với 2 hình thức nội trú và ngoại trú.'),
(11, 'KHOA DINH DƯỠNG VÀ TIẾT CHẾ', 'Tham mưu cho lãnh đạo bệnh viện về hoạt động dinh dưỡng trong bệnh viện.  - Xây dựng, triển khai quy trình kỹ thuật chuyên môn về dinh dưỡng lâm sàng và an toàn thực phẩm trong bệnh viện. - Tổ chức thực hiện các hoạt động khám, tư vấn và điều trị bằng chế độ dinh dưỡng phù hợp với tình trạng dinh dưỡng và bệnh lý cho người bệnh Tổ chức xây dựng chế độ dinh dưỡng phù hợp với tình trạng dinh dưỡng và bệnh lý cho người bệnh điều trị nội trú trong bệnh viện. Phối hợp với các khoa lâm sàng chỉ định chế độ dinh dưỡng bệnh lý cho người bệnh bị suy dinh dưỡng nặng, người bệnh được phân cấp chăm sóc cấp I. Kiểm tra, giám sát việc thực hiện các quy định về hoạt động dinh dưỡng tại các khoa lâm sàng trong bệnh viện.'),
(12, 'KHOA NỘI SOI', ' Khám và điều trị, cấp cứu bệnh phổi phế quản và bệnh lý khoang màng phổi bằng nội soi cho bệnh nhân trong và ngoài Bệnh viện.'),
(13, 'KHOA NGOẠI TỔNG HỢP ', ' Tổ chức khám bệnh, điều trị, phẫu thuật, tư vấn phòng bệnh cho người bệnh mắc lao ngoài phổi và các bệnh xương khớp ngoài lao.'),
(14, 'abcd', '123');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role` int(11) NOT NULL,
  `phone` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `name`, `role`, `phone`) VALUES
(1, 'user@gmail.com', 'user', 'Tan Dat', 1, '0905789456'),
(2, 'doctor@gmail.com', 'doctor', 'D.Dat', 0, '0909525785');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_appoinment_user` (`user_id`),
  ADD KEY `fk_appoinment_doctor` (`doctor_id`);

--
-- Chỉ mục cho bảng `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_doctor_specialist` (`specialist_id`);

--
-- Chỉ mục cho bảng `specialist`
--
ALTER TABLE `specialist`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `specialist`
--
ALTER TABLE `specialist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `fk_appoinment_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  ADD CONSTRAINT `fk_appoinment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `fk_doctor_specialist` FOREIGN KEY (`specialist_id`) REFERENCES `specialist` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
