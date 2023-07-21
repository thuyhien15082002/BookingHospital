-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: hospitalbooking
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `appointment_date` datetime DEFAULT NULL,
  `appointment_purpose` text,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_appoinment_user` (`user_id`),
  KEY `fk_appoinment_doctor` (`doctor_id`),
  CONSTRAINT `fk_appoinment_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  CONSTRAINT `fk_appoinment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `specialist_id` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `intro` text,
  `gender` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_doctor_specialist` (`specialist_id`),
  CONSTRAINT `fk_doctor_specialist` FOREIGN KEY (`specialist_id`) REFERENCES `specialist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (15,1,'huyen@gmail.com','huyen123','Nguyễn Huyền','0900300223',NULL,NULL,'nữ'),(16,2,'nhung@gmail.com','nhung123','Nguyễn Nhung','0900300223',NULL,NULL,'nữ'),(17,3,'hoa@gmail.com','hoa123','Nguyễn Hoa','0900300223',NULL,NULL,'nữ'),(18,4,'khanh@gmail.com','khanh123','Nguyễn Khánh','0900300223',NULL,NULL,'nam'),(19,5,'thanh@gmail.com','thanh123','Trung Thành','0900300223',NULL,NULL,'nam'),(20,6,'lan@gmail.com','lan123','Văn Lan','0900300223',NULL,NULL,'nữ'),(21,7,'ngoc@gmail.com','ngoc123','Thị Ngọc','0900300223',NULL,NULL,'nữ'),(22,8,'hieu@gmail.com','hieu123','Dương Hiếu','0900300223',NULL,NULL,'nam'),(23,9,'linh@gmail.com','linh123','Trương Linh','0900300223',NULL,NULL,'nữ'),(24,10,'dat@gmail.com','dat123','Nguyễn Đạt','0900300223',NULL,NULL,'nam'),(25,11,'sinh@gmail.com','sinh123','Văn Sinh','0900300223',NULL,NULL,'nam'),(26,12,'tan@gmail.com','tan123','Lỗ Tấn','0900300223',NULL,NULL,'nam'),(27,13,'trang@gmail.com','trang123','Huỳnh Trang','0900300223',NULL,NULL,'nữ');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialist`
--

DROP TABLE IF EXISTS `specialist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(55) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialist`
--

LOCK TABLES `specialist` WRITE;
/*!40000 ALTER TABLE `specialist` DISABLE KEYS */;
INSERT INTO `specialist` VALUES (1,'KHOA KHÁM BỆNH','Tổ chức và tiếp nhận người bệnh đến cấp cứu. Khám chữa bệnh cho mọi đối tượng có nhu cầu BHYT đúng tuyến, BHYT vượt tuyến, tự nguyện. Khám bệnh, chọn lọc người bệnh vào điều trị nội trú; thực hiện điều trị ngoại trú và hướng dẫn chăm sóc sức khỏe ban đầu. Tổ chức khám sức khỏe định kì, theo dõi tình hình bệnh tật trong vùng dân cư được phụ trách để có biện pháp ngăn ngừa bệnh tật.'),(2,'KHOA CẤP CỨU','Tiếp nhận và điều trị mọi trường hợp người bệnh cấp cứu được chuyển tới bệnh viện;Đánh giá, phân loại tình trạng bệnh và thực hiện các biện pháp cấp cứu thích hợp theo mức độ ưu tiên cấp cứu đến khi người bệnh qua khỏi tình trạng nguy kịch và trong vòng 48 giờ phải chuyển người bệnh đến khoa Hồi sức tích cực hoặc một chuyên khoa phù hợp khi điều kiện bệnh nhân cho phép;Tổ chức làm việc theo ca đối với điều dưỡng Thực hiện nghiêm chỉnh các quy trình, quy chế chuyên môn trong bệnh viện;Tổ chức dây chuyền cấp cứu cùng với khoa Hồi sức tích cực hỗ trợ chuyên môn cho hệ thống cấp cứu tại các khoa trong bệnh viện;Nghiên cứu khoa học, tư vấn và tuyên truyền giáo dục về cấp cứu cho cộng đồng;'),(3,'KHOA HỒI SỨC TÍCH CỰC','Điều trị bệnh nhân nặng cần hồi sức tích cực nội và ngoại khoa, Đào tạo, huấn luyện học viên đại học, sau đại học, Nghiên cứu khoa học và chỉ đạo tuyến dưới về cấp cứu hồi sức chuyên ngành Lao và Bệnh phổi, Hợp tác quốc tế.'),(4,'KHOA NỘI TỔNG HỢP','Khoa Nội tổng hợp có chức năng và nhiệm vụ chính là chẩn đoán và điều trị bệnh thuộc lĩnh vực nội khoa, người bệnh lao ngoài phổi, lao ngoài phổi/HIV đồng thời là đơn vị thực hành lâm sàng và thực hiện đề tài tốt nghiệp của sinh viên và học viên thuộc các chuyên ngành đào tạo đại học và sau đại học: bác sĩ nội trú, cao học.'),(5,'KHOA BỆNH PHỔI MÃN TÍNH','Chức năng Khoa Bệnh phổi mạn tính thực hiện chức năng khám, chẩn đoán, điều trị nội khoa các bệnh phổi mạn tính, không liên quan đến phẫu thuật, với trình độ chuyên môn chuyên sâu.'),(6,'KHOA NHI','- Công tác chuyên môn: Phục vụ khám chữa bệnh cho tất cả trẻ em từ 0 – 15 tuổi mắc các bệnh về hô hấp như viêm phổi, các bệnh ký sinh trùng ở phổi, các bệnh phổi hiếm gặp, nấm phổi, hen phế quản, các bệnh lý màng phổi. Phối hợp cùng với Khoa Nội soi can thiệp phát hiện và điều trị cắt đốt khối u trong lòng phế quản bằng điện động cao tần. Chẩn đoán và điều trị giai đoạn đầu cho các trường hợp mắc lao các thể từ tất cả các bệnh viện các tuyến chuyển đến.'),(7,'KHOA UNG BƯỚU','Chẩn đoán và điều trị hóa chất, tia xạ, điều trị đích, miễn dịch và chăm sóc giảm nhẹ bệnh nhân ung thư phổi, ung thư màng phổi và một số ung thư khác trong lồng ngực.'),(8,'KHOA PHẨU THUẬT','Tổ chức tiếp nhận, khám chẩn đoán bệnh,lập kế hoạch điều trị ngoại khoa các bệnh lý về lồng ngực bao gồm các bệnh lý của phổi, trung thất, màng phổi và thành ngực. Đào tạo, tham gia đào tạo, tiếp nhận học viên đến thực tập, nghiên cứu tại Bệnh viện về các bệnh lý ngoại khoa lồng ngực.'),(9,'KHOA GÂY MÊ, HỒI SỨC','- Gây mê hồi sức , giảm đau cho bệnh nhân phẫu thuật lồng ngực (nội soi cắt thùy phổi, cắt u trung thất, tràn khí màng phổi, bóc vỏ màng phổi, ho ra máu, tạo hình phế quản); phẫu thuật chỉnh hình xương khớp ( nẹp vít cột sống , thay thân đốt sống nhân tạo, thay khớp háng, nội soi khớp gối ); gây mê nội soi khí phế quản, nong khí phế quản ống cứng, đặt stent khí phế quản…vv'),(10,'KHOA PHỤC HỒI CHỨC NĂNG','Khoa thực hiện 2 nhiệm vụ chính: Phục vụ người bệnh phục hồi chức năng hô hấp với 2 hình thức nội trú và ngoại trú.'),(11,'KHOA DINH DƯỠNG VÀ TIẾT CHẾ','Tham mưu cho lãnh đạo bệnh viện về hoạt động dinh dưỡng trong bệnh viện.  - Xây dựng, triển khai quy trình kỹ thuật chuyên môn về dinh dưỡng lâm sàng và an toàn thực phẩm trong bệnh viện. - Tổ chức thực hiện các hoạt động khám, tư vấn và điều trị bằng chế độ dinh dưỡng phù hợp với tình trạng dinh dưỡng và bệnh lý cho người bệnh Tổ chức xây dựng chế độ dinh dưỡng phù hợp với tình trạng dinh dưỡng và bệnh lý cho người bệnh điều trị nội trú trong bệnh viện. Phối hợp với các khoa lâm sàng chỉ định chế độ dinh dưỡng bệnh lý cho người bệnh bị suy dinh dưỡng nặng, người bệnh được phân cấp chăm sóc cấp I. Kiểm tra, giám sát việc thực hiện các quy định về hoạt động dinh dưỡng tại các khoa lâm sàng trong bệnh viện.'),(12,'KHOA NỘI SOI',' Khám và điều trị, cấp cứu bệnh phổi phế quản và bệnh lý khoang màng phổi bằng nội soi cho bệnh nhân trong và ngoài Bệnh viện.'),(13,'KHOA NGOẠI TỔNG HỢP',' Tổ chức khám bệnh, điều trị, phẫu thuật, tư vấn phòng bệnh cho người bệnh mắc lao ngoài phổi và các bệnh xương khớp ngoài lao.');
/*!40000 ALTER TABLE `specialist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role` int NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-09 21:44:49
