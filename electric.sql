-- --------------------------------------------------------
-- Máy chủ:                      localhost
-- Server version:               11.3.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Phiên bản:           12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for electric_shop
CREATE DATABASE IF NOT EXISTS `electric_shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `electric_shop`;

-- Dumping structure for table electric_shop.app_roles
CREATE TABLE IF NOT EXISTS `app_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table electric_shop.app_roles: ~2 rows (approximately)
DELETE FROM `app_roles`;
INSERT INTO `app_roles` (`id`, `name`) VALUES
	(1, 'ROLE_USER'),
	(2, 'ROLE_ADMIN');

-- Dumping structure for table electric_shop.carts
CREATE TABLE IF NOT EXISTS `carts` (
  `cart_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FKb5o626f86h46m4s7ms6ginnop` (`user_id`),
  CONSTRAINT `FKb5o626f86h46m4s7ms6ginnop` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table electric_shop.carts: ~3 rows (approximately)
DELETE FROM `carts`;
INSERT INTO `carts` (`cart_id`, `amount`, `address`, `phone`, `user_id`) VALUES
	(1, 0, 'Hà Tĩnh', '0967291997', 2),
	(2, 0, '123, Xã Thượng Ân, Huyện Ngân Sơn, Tỉnh Bắc Kạn', '0916891997', 3),
	(3, 0, '168, Xã Na Khê, Huyện Yên Minh, Tỉnh Hà Giang', '0916855648', 4);

-- Dumping structure for table electric_shop.cart_details
CREATE TABLE IF NOT EXISTS `cart_details` (
  `cart_detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cart_detail_id`),
  KEY `FKkcochhsa891wv0s9wrtf36wgt` (`cart_id`),
  KEY `FK9rlic3aynl3g75jvedkx84lhv` (`product_id`),
  CONSTRAINT `FK9rlic3aynl3g75jvedkx84lhv` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FKkcochhsa891wv0s9wrtf36wgt` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table electric_shop.cart_details: ~0 rows (approximately)
DELETE FROM `cart_details`;

-- Dumping structure for table electric_shop.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table electric_shop.categories: ~5 rows (approximately)
DELETE FROM `categories`;
INSERT INTO `categories` (`category_id`, `category_name`) VALUES
	(1, 'Điện thoại'),
	(2, 'Laptop'),
	(3, 'Điện gia dụng'),
	(4, 'Đồng hồ'),
	(5, 'Tivi');

-- Dumping structure for table electric_shop.favorites
CREATE TABLE IF NOT EXISTS `favorites` (
  `favorite_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`favorite_id`),
  KEY `FK6sgu5npe8ug4o42bf9j71x20c` (`product_id`),
  KEY `FKk7du8b8ewipawnnpg76d55fus` (`user_id`),
  CONSTRAINT `FK6sgu5npe8ug4o42bf9j71x20c` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FKk7du8b8ewipawnnpg76d55fus` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table electric_shop.favorites: ~9 rows (approximately)
DELETE FROM `favorites`;
INSERT INTO `favorites` (`favorite_id`, `product_id`, `user_id`) VALUES
	(1, 5, 3),
	(13, 54, 3),
	(14, 36, 4),
	(15, 4, 4),
	(16, 5, 4),
	(17, 8, 4),
	(18, 7, 4),
	(19, 33, 4),
	(20, 32, 4);

-- Dumping structure for table electric_shop.notification
CREATE TABLE IF NOT EXISTS `notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table electric_shop.notification: ~10 rows (approximately)
DELETE FROM `notification`;
INSERT INTO `notification` (`id`, `message`, `status`, `time`) VALUES
	(1, 'Trần Hữu Đồng đã đặt một đơn hàng (1)', b'0', '2024-02-27 22:18:21'),
	(2, 'Trần Hữu Đồng đã đặt một đơn hàng (2)', b'0', '2024-02-27 22:38:14'),
	(3, 'Trần Hữu Đồng đã đặt một đơn hàng (3)', b'0', '2024-02-27 22:47:49'),
	(4, 'Trần Hữu Đồng đã đặt một đơn hàng (4)', b'0', '2024-02-27 22:54:49'),
	(5, 'Trần Hữu Đồng đã đặt một đơn hàng (5)', b'0', '2024-02-27 23:11:09'),
	(6, 'Trần Hữu Đồng đã đặt một đơn hàng (6)', b'1', '2024-02-27 23:16:10'),
	(7, 'Trần Hữu Đồng đã đặt một đơn hàng (7)', b'0', '2024-02-27 23:29:46'),
	(8, 'Trần Hữu Đồng đã đặt một đơn hàng (8)', b'0', '2024-02-27 23:31:38'),
	(9, 'Trần Thảo Chi đã đặt một đơn hàng (9)', b'1', '0000-00-00 00:00:00'),
	(10, 'Trần Thảo Chi đã đặt một đơn hàng (10)', b'1', '0000-00-00 00:00:00');

-- Dumping structure for table electric_shop.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `orders_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`orders_id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table electric_shop.orders: ~10 rows (approximately)
DELETE FROM `orders`;
INSERT INTO `orders` (`orders_id`, `address`, `amount`, `order_date`, `phone`, `status`, `user_id`) VALUES
	(1, '68, Phường Gia Thụy, Quận Long Biên, Thành phố Hà Nội', 162773200, '2024-02-27 22:18:21', '0916891997', 2, 3),
	(2, '268, Xã Lương Sơn, Huyện Yên Lập, Tỉnh Phú Thọ', 363286480, '2024-02-27 22:38:14', '0916891997', 2, 3),
	(3, '22, Xã Đàm Thuỷ, Huyện Trùng Khánh, Tỉnh Cao Bằng', 283920000, '2024-02-27 22:47:49', '0916891997', 2, 3),
	(4, '68, Phường Thạch Quý, Thành phố Hà Tĩnh, Tỉnh Hà Tĩnh', 1042882800, '2024-02-27 22:54:49', '0916891997', 2, 3),
	(5, '86, Xã Động Đạt, Huyện Phú Lương, Tỉnh Thái Nguyên', 27300000, '2024-02-27 23:11:09', '0916891997', 2, 3),
	(6, '123, Xã Yên Hòa, Huyện Đà Bắc, Tỉnh Hoà Bình', 198009780, '2024-02-27 23:16:10', '0916891997', 2, 3),
	(7, '123, Xã Phúc Sơn, Huyện Chiêm Hóa, Tỉnh Tuyên Quang', 402380, '2024-02-27 23:29:46', '0916891997', 0, 3),
	(8, '123, Xã Thượng Ân, Huyện Ngân Sơn, Tỉnh Bắc Kạn', 31890000, '2024-02-27 23:31:38', '0916891997', 0, 3),
	(9, '68, Xã Vạn Khánh, Huyện Vạn Ninh, Tỉnh Khánh Hòa', 182910000, '0000-00-00 00:00:00', '0916855648', 2, 4),
	(10, '168, Xã Na Khê, Huyện Yên Minh, Tỉnh Hà Giang', 8014780, '0000-00-00 00:00:00', '0916855648', 2, 4);

-- Dumping structure for table electric_shop.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `order_detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`),
  CONSTRAINT `FK4q98utpd73imf4yhttm3w0eax` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table electric_shop.order_details: ~79 rows (approximately)
DELETE FROM `order_details`;
INSERT INTO `order_details` (`order_detail_id`, `price`, `quantity`, `order_id`, `product_id`) VALUES
	(1, 25088000, 1, 1, 23),
	(2, 680200, 1, 1, 27),
	(3, 29392999.999999996, 1, 1, 51),
	(4, 43290000, 1, 1, 9),
	(5, 31000000, 1, 1, 7),
	(6, 31890000, 1, 1, 5),
	(7, 716000, 1, 1, 25),
	(8, 716000, 1, 1, 24),
	(9, 93000000, 3, 2, 7),
	(10, 129870000, 3, 2, 8),
	(11, 52170000, 3, 2, 12),
	(12, 50670000, 3, 2, 13),
	(13, 23220000, 2, 2, 55),
	(14, 4644000, 3, 2, 32),
	(15, 5092500, 3, 2, 29),
	(16, 3052800, 2, 2, 28),
	(17, 716000, 1, 2, 24),
	(18, 402380, 1, 2, 41),
	(19, 448799.99999999994, 1, 2, 42),
	(20, 34790000, 1, 3, 3),
	(21, 33390000, 1, 3, 4),
	(22, 31890000, 1, 3, 5),
	(23, 48990000, 1, 3, 6),
	(24, 30890000, 1, 3, 10),
	(25, 43290000, 1, 3, 9),
	(26, 43290000, 1, 3, 8),
	(27, 17390000, 1, 3, 12),
	(28, 50970000, 3, 4, 11),
	(29, 93000000, 3, 4, 7),
	(30, 129870000, 3, 4, 9),
	(31, 129870000, 3, 4, 8),
	(32, 92670000, 3, 4, 10),
	(33, 50970000, 3, 4, 14),
	(34, 50670000, 3, 4, 13),
	(35, 1980000, 3, 4, 37),
	(36, 68600, 2, 4, 38),
	(37, 81900, 2, 4, 39),
	(38, 14049000, 3, 4, 40),
	(39, 43180000, 2, 4, 16),
	(40, 7526400, 3, 4, 21),
	(41, 71221500, 3, 4, 20),
	(42, 82290600, 3, 4, 22),
	(43, 75264000, 3, 4, 23),
	(44, 29602000, 4, 4, 47),
	(45, 8982000, 2, 4, 46),
	(46, 25350000, 2, 4, 52),
	(47, 58785999.99999999, 2, 4, 51),
	(48, 9900800, 2, 4, 50),
	(49, 16580000, 2, 4, 53),
	(50, 27300000, 2, 5, 36),
	(51, 1320000, 2, 6, 37),
	(52, 137200, 4, 6, 38),
	(53, 163800, 4, 6, 39),
	(54, 14049000, 3, 6, 40),
	(55, 5423760, 3, 6, 44),
	(56, 6029100, 3, 6, 43),
	(57, 2243999.9999999995, 5, 6, 42),
	(58, 2414280, 6, 6, 41),
	(59, 30922500, 7, 6, 45),
	(60, 2148000, 3, 6, 25),
	(61, 3346200, 5, 6, 26),
	(62, 2720800, 4, 6, 27),
	(63, 3234330, 3, 6, 31),
	(64, 4074000, 3, 6, 30),
	(65, 5092500, 3, 6, 29),
	(66, 2762560, 2, 6, 33),
	(67, 4644000, 3, 6, 32),
	(68, 20340450, 3, 6, 34),
	(69, 32343300, 3, 6, 35),
	(70, 54600000, 4, 6, 36),
	(71, 402380, 1, 7, 41),
	(72, 31890000, 1, 8, 5),
	(73, 40950000, 3, 9, 36),
	(74, 66780000, 2, 9, 4),
	(75, 31890000, 1, 9, 5),
	(76, 43290000, 1, 9, 8),
	(77, 2762560, 2, 10, 33),
	(78, 3096000, 2, 10, 32),
	(79, 2156220, 2, 10, 31);

-- Dumping structure for table electric_shop.products
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `discount` int(11) NOT NULL,
  `entered_date` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `sold` int(11) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table electric_shop.products: ~53 rows (approximately)
DELETE FROM `products`;
INSERT INTO `products` (`product_id`, `description`, `discount`, `entered_date`, `image`, `name`, `price`, `quantity`, `sold`, `status`, `category_id`) VALUES
	(3, 'Không thể phủ nhận, sự ra đời của iPhone 12 Pro Max 512 GB chính là đòn tấn công nghiêm túc của Apple dành cho các đối thủ. Sự chỉnh chu tổng thể từ ngoại hình cho đến sức mạnh tiềm tàng bên trong, chính là nguồn cảm hứng để các ông lớn trong ngành phấn đ', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647784189/products/uf2jknekpk9uthzx7htt.jpg', 'Điện thoại iPhone 12 Pro Max 512GB', 34790000, 9999, 1, b'1', 1),
	(4, 'Tất cả dòng iPhone 12 đều được hỗ trợ kết nối 5G giúp tốc độ tải xuống hoặc load trang cực nhanh và hỗ trợ đa băng tần.\n\n5G trên iPhone 12 Pro không chỉ nhanh mà nó còn thông minh, khi iPhone của bạn đang cập nhật nền thì nó sẽ sử dụng LTE hay các chế độ ', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647784312/products/ypb4hxx7eosthjca3fcw.jpg', 'Điện thoại iPhone 12 Pro 512GB', 33390000, 997, 3, b'1', 1),
	(5, 'Về cơ bản, thiết kế của iPhone 13 giống với người tiền nhiệm, tuy vậy có một vài chi tiết đã được cải thiện để nâng cao trải nghiệm cho người dùng. Cụ thể, phần notch được thu gọn lại 20% cho tỷ lệ của màn hình trông cân đối và hiển thị được nhiều chi tiế', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647784461/products/kxekujkueblk0gm7r0dd.jpg', 'Điện thoại iPhone 13 512GB', 31890000, 997, 3, b'1', 1),
	(6, 'iPhone 13 Pro Max 1 TB đang sở hữu những ưu điểm tuyệt vời dễ dàng làm chao đảo trái tim của mọi tín đồ Táo khuyết, đó là thiết kế sang chảnh trong từng chi tiết, màn hình rộng, hiệu suất mạnh mẽ, mạng 5G cực nhanh, bộ nhớ lưu trữ lớn cùng dung lượng pin ', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647784546/products/dggyoel2wvolfjwjuqln.jpg', 'Điện thoại iPhone 13 Pro Max 1TB Xanh lá', 48990000, 999, 1, b'1', 1),
	(7, 'iPhone 13 Pro nổi bật với thiết kế tinh tế, chip hiệu năng cao, hệ thống camera cho phép ghi hình chất lượng chuẩn điện ảnh, thời lượng pin dài cùng nhiều tính năng hữu dụng giúp bạn dễ dàng tạo nên vô số các khoảnh khắc tuyệt đẹp trong cuộc sống.', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647784624/products/r0vvwojslqmpe094c2sx.jpg', 'Điện thoại iPhone 13 Pro 256GB Gold', 31000000, 993, 7, b'1', 1),
	(8, 'iPhone 13 Pro Max 512GB của nhà Apple với màn hình ProMotion 120 Hz vượt trội, chip A15 Bionic hiệu năng mạnh mẽ, viên pin trâu nhất trong những chiếc iPhone và bộ 3 camera được nâng cấp đáng kể, xứng đáng là chiếc điện thoại thông minh được quan tâm nhất', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647784695/products/dvfk0g3rtszcm0muzne7.jpg', 'Điện thoại iPhone 13 Pro Max 512GB', 43290000, 992, 8, b'1', 1),
	(9, 'iPhone 13 Pro Max 512GB của nhà Apple với màn hình ProMotion 120 Hz vượt trội, chip A15 Bionic hiệu năng mạnh mẽ, viên pin trâu nhất trong những chiếc iPhone và bộ 3 camera được nâng cấp đáng kể, xứng đáng là chiếc điện thoại thông minh được quan tâm nhất', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647784768/products/zf2hrmlrvjpp9ss0p9vq.jpg', 'Điện thoại iPhone 13 Pro Max 512GB Xanh lá', 43290000, 995, 5, b'1', 1),
	(10, 'iPhone 13 Pro nổi bật với thiết kế tinh tế, chip hiệu năng cao, hệ thống camera cho phép ghi hình chất lượng chuẩn điện ảnh, thời lượng pin dài cùng nhiều tính năng hữu dụng giúp bạn dễ dàng tạo nên vô số các khoảnh khắc tuyệt đẹp trong cuộc sống.', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647784910/products/evfvcteq3dij4g97obmf.jpg', 'Điện thoại iPhone 13 Pro 128GB', 30890000, 996, 4, b'1', 1),
	(11, 'Sau chiếc điện thoại iPhone Xr, Apple tiếp tục ra mắt siêu phẩm 2019 mang tên iPhone 11 64GB - một smartphone được nâng cấp toàn diện từ thiết kế cao cấp, vi xử lý hiệu năng mạnh mẽ đến hệ thống camera chất lượng cùng thời lượng pin vượt trội.', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647784967/products/t9dfhpdegrxma9jhv7dg.jpg', 'Điện thoại iPhone 11 64GB', 16990000, 997, 3, b'1', 1),
	(12, 'Được đánh giá là phiên bản iPhone 2019 đáng mua nhất với mức giá rẻ, màu sắc đa dạng, trong khi vẫn đảm bảo hiệu năng mạnh mẽ. Có thể nói, iPhone 11 128GB là bản nâng cấp hoàn hảo của đàn anh iPhone Xr.\nCấu hình “khủng” - hiệu năng hàng đầu\nVới mỗi dòng i', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647785234/products/vdwzcybini8poyxjcgqe.jpg', 'Điện thoại iPhone 11 128GB', 17390000, 996, 4, b'1', 1),
	(13, 'Sự kiện Apple ra mắt dàn iPhone 12 series mới trong đó có sự xuất hiện của iPhone 12 mini 64 GB 5.4 inch, “người em út” nhỏ nhưng có võ đầy mình.\nNgoại hình nhỏ gọn, cao cấp\nDù nhìn có vẻ iPhone 12 mini chịu thiệt thòi về kích thước so với các đàn anh iPh', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647785284/products/ynrcze13baz0i3qlvnkt.jpg', 'Điện thoại iPhone 12 mini 64GB', 16890000, 994, 6, b'1', 1),
	(14, 'Apple chưa bao giờ khiến các fan hâm mộ thất vọng với bất kỳ một dòng smartphone nào được tung ra thị trường, hoàn hảo từ thiết kế đến những tính năng nổi bật. Trong đó, không thể không nhắc đến iPhone 12 mini 128 GB, được biết đến là chiếc smartphone nhỏ', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647785332/products/o0azxzdnkv3i4fxfljoo.jpg', 'Điện thoại iPhone 12 mini 128GB', 16990000, 997, 3, b'1', 1),
	(15, 'iPhone 13 mini nổi bật với thiết kế tinh tế, chip hiệu năng cao, hệ thống camera cho phép ghi hình chất lượng chuẩn điện ảnh, thời lượng pin dài cùng nhiều tính năng hữu dụng giúp bạn dễ dàng tạo nên vô số các khoảnh khắc tuyệt đẹp trong cuộc sống.', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647785406/products/r4kh6uebpnkvuvpb1egg.jpg', 'Điện thoại iPhone 13 mini 128GB Xanh lá', 21090000, 1000, 0, b'1', 1),
	(16, 'Laptop Acer Nitro 5 Gaming được bao bọc bởi lớp vỏ nhựa cứng cáp, bền bỉ, các đường góc cạnh cắt vát tỉ mỉ, tinh xảo, nắp lưng có khắc logo Acer đặt tinh tế giữa 2 tia sét, máy sở hữu trọng lượng 2.2 kg và bề dày 23.9 mm, vẫn thuận tiện bỏ vừa vào balo, s', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647785590/products/f9gbx72wlerazlxzyrry.jpg', 'Laptop Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H/8GB/512GB/144Hz/4GB', 21590000, 998, 2, b'1', 2),
	(17, 'Laptop Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H/8GB/512GB/144Hz/4GB GTX1650/Win11', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647785762/products/p8rlozbmfa0oochdo4ep.jpg', 'Laptop Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H/8GB/512GB/144Hz/4GB GTX1650/Win11', 21590000, 2000, 0, b'1', 2),
	(18, 'Laptop Dell Inspiron 15 3511 i3 (P112F001CBL) chiếc laptop hiện đại dành để phục vụ cho nhu cầu học tập - văn phòng và giải trí trong một thiết kế trẻ trung, tinh tế cùng sức mạnh hiệu năng ổn định đủ đáp ứng đa dạng nhu cầu sử dụng.', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647785881/products/phubaca4cxvfxmdlv4pe.jpg', 'Laptop Dell Inspiron 15 3511 i3 1115G4/4GB/256GB', 15000000, 10000, 0, b'1', 2),
	(19, 'Laptop HP 240 G8 i3 (519A7PA) là chiếc laptop nằm ở phân khúc học sinh - sinh viên, phù hợp với các công việc học tập - văn phòng cơ bản. Trong một thiết kế cơ bản và đơn giản, kết hợp cùng hiệu năng ổn định đến từ bộ xử lý Intel thế hệ thứ 10, chiếc lapt', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647785938/products/dwnwyxveayzdycsuhsqv.jpg', 'Laptop HP 240 G8 i3 1005G1/4GB/256GB/Win10 (519A7PA)', 12090000, 1000, 0, b'1', 2),
	(20, 'Intel NUC M15 i5 (BBC510EAUXBC1) thu hút mọi ánh nhìn nhờ vẻ ngoài tối giản mà sang trọng, cao cấp cùng sức mạnh của bộ vi xử lý Intel thế hệ 11 tân tiến, đảm bảo sẽ là một trong những chiếc laptop học tập - văn phòng lý tưởng dành cho bạn.', 5, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647786009/products/dvogbpnopuqejvj7lcai.jpg', 'Laptop Intel NUC M15 Kit i5 1135G7/16GB/512GB/Win10 (BBC510EAUXBC1)', 24990000, 997, 3, b'1', 2),
	(21, 'Gọn nhẹ nhưng đầy mạnh mẽ, Lenovo Yoga Duet 7 13ITL6 i5 1135G7 (82MA000PVN) xứng tầm người cộng sự đắc lực khi sở hữu cấu hình mạnh mẽ đến từ chip Intel Gen 11, sẵn sàng cùng bạn chinh phục thành công các tác vụ làm việc học tập và giải trí.', 2, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647786030/products/dw9gpyamij3v4yuqamkx.jpg', 'Laptop Lenovo Yoga Duet 7 13ITL6 i5 1135G7/8GB/512GB/Touch/Pen/Win10 (82MA000PVN)', 2560000, 997, 3, b'1', 2),
	(22, 'Phá vỡ mọi giới hạn với laptop Lenovo Yoga Slim 7 14ITL05 i7 1165G7 (82A300DQVN) khi sở hữu cấu hình vượt trội cùng kiểu dáng thiết kế thời thượng, xứng danh người cộng sự lý tưởng, sẵn sàng đồng hành cùng bạn trên mọi chiến trường, cả công việc hay giải ', 2, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647786079/products/mg9e3fyomdy150iuxqys.jpg', 'Laptop Lenovo Yoga Slim 7 14ITL05 i7 1165G7/8GB/512GB/Win10 (82A300DQVN)', 27990000, 997, 3, b'1', 2),
	(23, 'Laptop Lenovo ThinkBook 14p G2 ACH R5 (20YN001HVN) có hiệu năng mạnh mẽ đế từ CPU AMD, thiết kế hiện đại, sang trọng cùng các tính năng, công nghệ thông minh được bổ trợ, là sản phẩm mà bạn không thể bỏ lỡ.', 2, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647786168/products/npreegiv4ytn37lqi8lv.jpg', 'Laptop ThinkBook 14p G2 ACH R5 5600H/16GB/512GB/Win11 (20YN001HVN)', 25600000, 996, 4, b'1', 2),
	(24, 'Sản phẩm đồng hồ mang thương hiệu MVW với nhiều mẫu mã năng động, trẻ trung nhưng không kém phần tinh tế và sang trọng, phù hợp với tất cả mọi người hoạt động ở nhiều lĩnh vực từ dân văn phòng đến doanh nhân.', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647786381/products/xleslpwdb7jwwolyzrsy.jpg', 'Đồng hồ Nam MVW ML065-01', 716000, 1998, 2, b'1', 4),
	(25, 'Sản phẩm đồng hồ mang thương hiệu MVW với nhiều mẫu mã năng động, trẻ trung nhưng không kém phần tinh tế và sang trọng, phù hợp với tất cả mọi người hoạt động ở nhiều lĩnh vực từ dân văn phòng đến doanh nhân', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647786443/products/bnkcc4epxfokwhkg9ahn.jpg', 'Đồng hồ Nam MVW ML060-02', 716000, 996, 4, b'1', 4),
	(26, 'Sản phẩm đồng hồ mang thương hiệu MVW với nhiều mẫu mã năng động, trẻ trung nhưng không kém phần tinh tế và sang trọng, phù hợp với tất cả mọi người hoạt động ở nhiều lĩnh vực từ dân văn phòng đến doanh nhân', 1, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647786504/products/jnrtafwldbmknbdydja1.jpg', 'Đồng hồ Nam MVW ML061-01', 676000, 995, 5, b'1', 4),
	(27, 'Sản phẩm đồng hồ mang thương hiệu MVW với nhiều mẫu mã năng động, trẻ trung nhưng không kém phần tinh tế và sang trọng, phù hợp với tất cả mọi người hoạt động ở nhiều lĩnh vực từ dân văn phòng đến doanh nhân', 5, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647786553/products/amve9lyjan5ln25phy2t.jpg', 'Đồng hồ Nam MVW ML065-01', 716000, 995, 5, b'1', 4),
	(28, 'Sản phẩm đồng hồ mang thương hiệu MVW với nhiều mẫu mã năng động, trẻ trung nhưng không kém phần tinh tế và sang trọng, phù hợp với tất cả mọi người hoạt động ở nhiều lĩnh vực từ dân văn phòng đến doanh nhân', 4, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647786624/products/iiqmipuuz0rcahu7ptvm.jpg', 'Đồng hồ Nam MVW MS071-01', 1590000, 198, 2, b'1', 4),
	(29, 'Sản phẩm đồng hồ mang thương hiệu MVW với nhiều mẫu mã năng động, trẻ trung nhưng không kém phần tinh tế và sang trọng, phù hợp với tất cả mọi người hoạt động ở nhiều lĩnh vực từ dân văn phòng đến doanh nhân', 3, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647786688/products/i6trucr8emaxlgahwxfo.jpg', 'Đồng hồ Nam MVW MS074-01', 1750000, 2994, 6, b'1', 4),
	(30, 'Sản phẩm đồng hồ mang thương hiệu Elio với nhiều mẫu mã năng động, trẻ trung nhưng không kém phần tinh tế và sang trọng, phù hợp với tất cả mọi người hoạt động ở nhiều lĩnh vực từ dân văn phòng đến doanh nhân.', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647786777/products/teky6z1jw35rtgxescrf.jpg', 'Đồng hồ đôi Elio EL050-01/EL050-02', 1358000, 597, 3, b'1', 4),
	(31, 'Sản phẩm đồng hồ mang thương hiệu Elio với nhiều mẫu mã năng động, trẻ trung nhưng không kém phần tinh tế và sang trọng, phù hợp với tất cả mọi người hoạt động ở nhiều lĩnh vực từ dân văn phòng đến doanh nhân.', 1, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647786847/products/gbafyuzglubtnu0vyl5i.jpg', 'Đồng hồ đôi Elio EL069-01/EL069-02', 1089000, 795, 5, b'1', 4),
	(32, 'Sản phẩm đồng hồ mang thương hiệu Elio với nhiều mẫu mã năng động, trẻ trung nhưng không kém phần tinh tế và sang trọng, phù hợp với tất cả mọi người hoạt động ở nhiều lĩnh vực từ dân văn phòng đến doanh nhân.', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647786900/products/kiu3p58llk3ueozormad.jpg', 'Đồng hồ đôi Elio EL073-01/EL073-02', 1548000, 6860, 8, b'1', 4),
	(33, 'Sản phẩm đồng hồ mang thương hiệu Elio với nhiều mẫu mã năng động, trẻ trung nhưng không kém phần tinh tế và sang trọng, phù hợp với tất cả mọi người hoạt động ở nhiều lĩnh vực từ dân văn phòng đến doanh nhân.', 3, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647786978/products/plslwvu8poiu4cgnzpva.jpg', 'Đồng hồ đôi Elio EL075-01/EL075-02', 1424000, 8682, 4, b'1', 4),
	(34, 'Đồng hồ Orient đem đến những sản phẩm ấn tượng chinh phục người nhìn một cách nhanh chóng. Đồng hồ Orient với những chất liệu cao cấp bóng bẩy nâng tầm đẳng cấp cho người sở hữu, phù hợp với doanh nhân thành đạt, dân văn phòng hay các giám đốc công ty. Ph', 5, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647787043/products/fzxzc3xiyvkzmspxuvyy.jpg', 'Đồng hồ Nam Orient RA-AS0101S - Cơ tự động', 7137000, 197, 3, b'1', 4),
	(35, 'Đồng hồ Orient đem đến những sản phẩm ấn tượng chinh phục người nhìn một cách nhanh chóng. Đồng hồ Orient với những chất liệu cao cấp bóng bẩy nâng tầm đẳng cấp cho người sở hữu, phù hợp với doanh nhân thành đạt, dân văn phòng hay các giám đốc công ty. Ph', 1, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647787083/products/kohzc0tpbkpnw0g0z61a.jpg', 'Đồng hồ Nam Orient Star RE-AT0001L00B', 10890000, 397, 3, b'1', 4),
	(36, 'Đồng hồ Orient đem đến những sản phẩm ấn tượng chinh phục người nhìn một cách nhanh chóng. Đồng hồ Orient với những chất liệu cao cấp bóng bẩy nâng tầm đẳng cấp cho người sở hữu, phù hợp với doanh nhân thành đạt, dân văn phòng hay các giám đốc công ty. Ph', 35, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647787137/products/xb48ounby16n6m73tw8b.jpg', 'Đồng hồ Nam Orient Star RE-AT0108L00B', 21000000, 991, 9, b'1', 4),
	(37, 'Có 3 cách lấy nước gồm bơm tay, nút nhấn điện tử, chạm cốc lấy nước\nTùy theo nhu cầu, hoàn cảnh sử dụng mà bạn chọn cách lấy nước phù hợp', 45, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647787321/products/e2ysqnrbpaemk51vrbv3.png', 'Bình thủy điện Ava NK-A611 4 lít', 1200000, 1995, 5, b'1', 3),
	(38, 'Bàn ủi hơi nước Hommy HJ-8060 mang thiết kế hiện đại, sang trọng, công suất lớn 2200W ủi đồ nhanh, dung tích bình chứa lớn 300 ml ủi được nhiều quần áo hơn.\nThiết kế của sản phẩm\n- Thiết kế tinh tế, gọn đẹp, màu xanh dương bắt mắt với trọng lượng chỉ khoả', 30, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647787375/products/x4uv8nbn2ltf6p5kih9e.jpg', 'Bàn ủi hơi nước Hommy HJ-8060', 49000, 994, 6, b'1', 3),
	(39, 'Máy vắt cam Hommy đa dạng chức năng, thích hợp sử dụng vắt các loại quả có múi\nSản phẩm thích hợp sử dụng cho gia đình có nhu cầu thích uống nước cam, canh, quýt,... vắt khoảng 10 trái trở lên hoặc nhu cầu kinh doanh quy mô nhỏ.', 35, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647787456/products/qdqbc0gdmenzirhnff4a.jpg', 'Máy vắt cam Hommy GS-402', 63000, 1994, 6, b'1', 3),
	(40, 'Quạt điều hòa Kangaroo có 2 hộp đá khô kèm theo giúp làm mát hiệu quả hơn cho những ngày nắng nóng cao điểm\nĐá khô là 1 loại đá hóa học, khi muốn làm lạnh thì cho hộp đá khô vào ngăn đá tủ lạnh (đá này có thể tái sử dụng), sau đó cho vào bình chứa nước củ', 30, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647787495/products/dyvgtmhwtyvugenigbdx.jpg', 'Quạt điều hoà Kangaroo KG50F79', 6690000, 1994, 6, b'1', 3),
	(41, 'Máy xay sinh tố Sunhouse màu xanh lá cây nhẹ nhàng, có 3 cối xay thoải mái xay thực phẩm khác nhau mà không sợ bám mùi', 38, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647787544/products/ik9frzbpix0fceq6x9fh.jpg', 'Máy xay đa năng Sunhouse SHD5315G', 649000, 2993, 7, b'1', 3),
	(42, 'Nồi cơm điện nắp gài Kangaroo với kiểu dáng gọn gàng, tông màu tươi sáng', 32, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647787585/products/cvblbk7xvosc7t1855y4.jpg', 'Nồi cơm điện nắp gài Kangaroo 1.8 lít KG18RC3', 660000, 4494, 6, b'1', 3),
	(43, 'Sunhouse Mama SHD5505 sử dụng công nghệ ép chậm hiện đại, giữ trọn dưỡng chất trong nguyên liệu xay ép\nNước ép thành phẩm không bị biến đổi màu sắc và hao hụt dưỡng chất do nhiệt như khi xay ép bằng lực ly tâm, vì thế nước ép thật màu hơn, sánh mịn thơm n', 37, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647787633/products/qtyon1lnuey1nsuymaej.jpg', 'Máy ép chậm Sunhouse Mama SHD5505', 3190000, 3197, 3, b'1', 3),
	(44, 'Nồi chiên không dầu Joyoung có thể hẹn giờ lên đến 24 tiếng, chủ động thời gian chiên nướng thực phẩm\nNgười dùng chọn thời gian nấu phù hợp, sau đó rảnh tay để thuận tiện làm những công việc khác trong khi chờ món ăn chín, rất tiện lợi.', 38, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647787700/products/ecymkwbycki4c2rojg1x.jpg', 'Nồi chiên không dầu Joyoung KL35-D981 3.5 lít', 2916000, 997, 3, b'1', 3),
	(45, 'Làm mát với 2 hộp đá khô tặng kèm giúp quạt giải nhiệt hiệu quả hơn cho không gian sống gia đình những ngày nắng nóng', 25, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647787742/products/qjucg8haycn6brynl6dp.jpg', 'Quạt điều hòa Sunhouse SHD7727', 5890000, 993, 7, b'1', 3),
	(46, 'Thiết kế nhỏ gọn, chắc chắn\nSmart Tivi Casper 32 inch 32HX6200 thiết kế lịch lãm với gam màu đen sang trọng, màn hình tràn viền 3 cạnh, cho tầm nhìn của bạn "khóa chặt" vào nội dung đang được trình chiếu, hạn chế xao nhãng khi xem tivi. Chân đế chữ V úp n', 10, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647787912/products/v4jmkct2wv1ch4gp81cu.jpg', 'Smart Tivi Casper 32 inch 32HX6200', 4990000, 998, 2, b'1', 5),
	(47, 'Android Tivi Casper 43 inch 43FG5200 có kiểu dáng tối giản, sang trọng với gam màu đen thanh lịch, đứng vững vàng trên mặt bàn, kệ tivi nhờ có chân đế hình chữ V úp ngược cứng cáp. Nếu không thích kiểu bố trí để bàn, bạn cũng có thể chọn cách treo tường, ', 5, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647787952/products/ckfsygmd81oqv0pazzix.jpg', 'Android Tivi Casper 43 inch 43FG5200', 7790000, 996, 4, b'1', 5),
	(48, 'Thiết kế đơn giản, màn hình tràn viền sang trọng\nSmart Tivi Casper 43 inch 43FX6200 được thiết kế với màn hình tràn viền ba cạnh sang trọng, mang lại trải nghiệm vô cùng hoàn hảo và ấn tượng. Chân đế chữ V úp ngược giúp tivi đứng vững vàng và ổn định. \nTi', 9, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647788011/products/brujtacpttkloi7lmo51.jpg', 'Smart Tivi Casper 43 inch 43FX6200', 7040000, 300, 0, b'1', 5),
	(49, 'Thiết kế ấn tượng, sang trọng với màn hình tràn viền 3 cạnh\nAndroid Tivi AQUA 4K 50 inch LE50AQT6600UG tô điểm không gian lắp đặt nhờ thiết kế thanh mảnh, sang trọng, màn hình tràn viền độc đáo, tinh tế cả khi lắp đặt treo tường hay trên kệ tủ.\nTivi AQUA ', 21, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647788066/products/khwmx5vbjuoggtrwm0qw.png', 'Android Tivi AQUA 4K 50 inch LE50AQT6600UG', 12490000, 686, 0, b'1', 5),
	(50, 'Thiết kế đơn giản, thanh lịch\nSmart Tivi Casper 32 inch 32HG5200 được thiết kế với vóc dáng vô cùng đơn giản, viền tivi mỏng 0,8 mm kết hợp với chân đế hình chữ V úp ngược mang lại tổng thể chiếc tivi trở nên sang trọng.\nTivi Casper 32 inch phù hợp trưng ', 9, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647788111/products/ose69046ans0nunofnj7.jpg', 'Android Tivi Casper 32 inch 32HG5200', 5440000, 1998, 2, b'1', 5),
	(51, 'Adaptive PictureAmbient Mode+Brightness/Color DetectionQuantum AI 4KChuyển động mượt Motion Xcelerator Turbo+Chế độ Game Motion PlusChống chói Anti ReflectionChống xé hình FreeSync Premium ProCông nghệ kiểm soát đèn nền Quantum MatrixGiảm độ trễ chơi game', 30, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647788185/products/od9njyqkptzaehpc3cxr.jpg', 'Smart Tivi Neo QLED 4K 55 inch Samsung QA55QN85A ', 41990000, 997, 3, b'1', 5),
	(52, 'Thiết kế AirSlim thanh mảnh, hài hoà\nSmart Tivi QLED 4K 43 inch Samsung QA43Q65A được mang lên trên mình thiết kế không viền 3 cạnh loại bỏ cảm giác hình ảnh bị giới hạn, chân tivi có dạng hình chữ L đẹp mắt và vững vàng. \nTivi Samsung 43 inch phù hợp cho', 25, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647788242/products/ziy6jo5sh81sdhjzdfgw.jpg', 'Smart Tivi QLED 4K 43 inch Samsung QA43Q65A', 16900000, 998, 2, b'1', 5),
	(53, 'Thiết kế sang trọng, chân đế chắc chắn\nAndroid Tivi TCL 43 inch L43S5200 có thiết kế hiện đại, gọn gàng, khung viền được làm mỏng cho màn hình phủ trọn tầm nhìn của bạn, mang đến trải nghiệm tuyệt vời, không bị giới hạn.\nTivi TCL 43 inch có chân đến chữ V', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647788302/products/h22k6iscmwnp4gdzb70j.jpg', 'Android Tivi TCL 43 inch L43S5200', 8290000, 998, 2, b'1', 5),
	(54, 'Thiết kế tối giản, chân đế cứng cáp\nSmart Tivi Samsung 32 inch UA32T4500 gây ấn tượng mạnh với viền và chân đế màu đen tuyền cuốn hút, mạnh mẽ.\nKích cỡ tivi Samsung 32 inch nhỏ gọn, bố trí hài hòa trong các không gian có diện tích vừa và nhỏ như: phòng kh', 0, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647788354/products/y6kprse5lbohzfryfhup.jpg', 'Smart Tivi Samsung 32 inch UA32T4500', 8000000, 1000, 0, b'1', 5),
	(55, 'Thiết kế gọn gàng, sang trọng\nTivi LED Sony KD-43X75 là tivi màn hình phẳng, cạnh viền được làm mỏng tinh tế cho bạn hoàn toàn đắm chìm vào nội dung đang được trình chiếu trên tivi. \nMàn hình tivi 43 inch sử dụng chân đế hình chữ V ngược thanh mảnh nhưng ', 10, '2024-02-27', 'https://res.cloudinary.com/martfury/image/upload/v1647788426/products/j3diqobxmixdtow2jtci.jpg', 'Android Tivi Sony 4K 43 inch KD-43X75', 12900000, 998, 2, b'1', 5);

-- Dumping structure for table electric_shop.rates
CREATE TABLE IF NOT EXISTS `rates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `rate_date` datetime DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `order_detail_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKoesgfm245y1ula1pn74fw9mkk` (`order_detail_id`),
  KEY `FK4mdsmkrr7od84tpgxto2v3t2e` (`product_id`),
  KEY `FKanlgavwqngljux10mtly8qr6f` (`user_id`),
  CONSTRAINT `FK4mdsmkrr7od84tpgxto2v3t2e` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FKanlgavwqngljux10mtly8qr6f` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKoesgfm245y1ula1pn74fw9mkk` FOREIGN KEY (`order_detail_id`) REFERENCES `order_details` (`order_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table electric_shop.rates: ~41 rows (approximately)
DELETE FROM `rates`;
INSERT INTO `rates` (`id`, `comment`, `rate_date`, `rating`, `order_detail_id`, `product_id`, `user_id`) VALUES
	(1, 'Iphone 13 thích quá, phải bán thận mua thôi !!!', '2024-02-27 22:42:59', 5, 9, 7, 3),
	(2, 'mua về nấu cơm cho mẹ !!! cho 5sao', '2024-02-27 22:44:44', 5, 19, 42, 3),
	(3, 'đồng hồ đôi đẹp quá, nhưng không có người yêu !!! 1 sao', '2024-02-27 22:44:44', 1, 14, 32, 3),
	(4, 'tivi siêu nét, nét hơn người yêu cũ!', '2024-02-27 22:44:44', 4, 13, 55, 3),
	(5, 'Đẹp quá, nét hơn nyc!', '2024-02-27 22:48:13', 5, 20, 3, 3),
	(6, 'màu đẹp, có free ship không ạ', '2024-02-27 22:48:13', 5, 21, 4, 3),
	(7, 'đợi em bán thận đã nhé!', '2024-02-27 22:48:13', 5, 23, 6, 3),
	(8, 'cũ rồi không ai muốn dùng nữa, bán rẻ điii', '2024-02-27 22:48:13', 4, 27, 12, 3),
	(9, 'Quá đẹp, 2022 rồi không ai xài nữa.', '2024-02-27 22:57:49', 3, 28, 11, 3),
	(10, 'Chờ em bán thận rồi em quay lại nhé !', '2024-02-27 22:57:49', 5, 29, 7, 3),
	(11, 'Chờ em bán thận rồi em quay lại nhé !', '2024-02-27 22:57:49', 5, 30, 9, 3),
	(12, 'Chờ em bán thận rồi em quay lại nhé !', '2024-02-27 22:57:49', 5, 31, 8, 3),
	(13, 'Nét hơn người yêu cũ luôn !', '2024-02-27 22:57:49', 5, 32, 10, 3),
	(14, 'mua bàn ủi về mùa đông ủi cho ấm !', '2024-02-27 22:57:49', 5, 36, 38, 3),
	(15, 'máy hơi yếu, ae đừng mua ', '2024-02-27 22:57:49', 2, 37, 39, 3),
	(16, 'lắp điều hòa dùng đi, máy này chạy không mát gì cả.', '2024-02-27 22:57:49', 2, 38, 40, 3),
	(17, 'LOL quá mượt', '2024-02-27 22:57:49', 5, 39, 16, 3),
	(18, 'best lag, không nên mua nhé\n', '2024-02-27 22:57:49', 5, 40, 21, 3),
	(19, 'con này mà code thì sướng phải biết.', '2024-02-27 22:57:49', 5, 43, 23, 3),
	(20, 'quá vip, vừa code vừa chơi game, cân mọi thể loại game', '2024-02-27 22:57:49', 5, 42, 22, 3),
	(21, 'coi không nét, muốn trả lại quá !', '2024-02-27 22:57:49', 2, 45, 46, 3),
	(22, 'Nét hơn người yêu cũ', '2024-02-27 22:57:49', 5, 47, 51, 3),
	(23, 'google: "cách cướp tiền ngân hàng" :))', '2024-02-27 23:03:36', 5, 4, 9, 3),
	(24, 'đừng mua, có tiền thì thêm mà mua prm dùng cho nó sướng !', '2024-02-27 23:03:36', 3, 5, 7, 3),
	(25, 'tivi đểu, đừng mua', '2024-02-27 23:04:58', 5, 44, 47, 3),
	(26, 'full viền, coi đã mắt quá, nên mua', '2024-02-27 23:04:58', 5, 49, 53, 3),
	(27, 'cũng đẹp đấy, nhưng không mua!', '2024-02-27 23:10:07', 4, 16, 28, 3),
	(28, 'quá đẹp luôn, mua đi ae', '2024-02-27 23:10:07', 5, 17, 24, 3),
	(29, 'Đúng hết nước chấm luôn ! quá đẹp cho 5 sao!', '2024-02-27 23:11:35', 5, 50, 36, 3),
	(30, 'đồ đều, ae đừng mua nhé, vote 1 sao.', '2024-02-27 23:13:00', 1, 35, 37, 3),
	(31, 'Đẹp quá!', '2024-02-27 23:17:05', 5, 66, 33, 3),
	(32, 'Quá nét!', '2024-02-27 23:17:05', 5, 67, 32, 3),
	(33, 'Đẹp nhưng đắt quá!', '2024-02-27 23:17:05', 5, 68, 34, 3),
	(35, 'Quá nét cho 1 siêu phẩm!', '2024-02-27 23:17:05', 5, 70, 36, 3),
	(36, 'Best sản phẩm nên có ở trong nhà, quá tiện lợi, nên mua đi mọi người ơi', '2024-02-27 23:17:05', 5, 55, 44, 3),
	(37, 'cắm cơm nhớ bật nút nghe các bạn!', '2024-02-27 23:17:05', 5, 57, 42, 3),
	(38, 'Đắt quá, lắp điều hòa nó hợp lý hơn!', '2024-02-27 23:17:05', 5, 59, 45, 3),
	(39, 'Đéo có người yêu mà mua!!', '2024-02-27 23:17:05', 2, 64, 30, 3),
	(40, 'mua prm mà dùng, không nên mua ip12 mini nhé!', '2024-02-27 23:40:15', 3, 33, 14, 3),
	(41, 'Đồng hồ nam đẹp quá, mà đéo có ny mua tặng !!', '0000-00-00 00:00:00', 4, 73, 36, 4),
	(42, 'xấu quá cho 1 sao', '0000-00-00 00:00:00', 1, 78, 32, 4);

-- Dumping structure for table electric_shop.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table electric_shop.users: ~3 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`user_id`, `address`, `email`, `gender`, `image`, `name`, `password`, `phone`, `register_date`, `status`, `token`) VALUES
	(2, 'Thành phố Hồ Chí Minh', 'greenyshop.adm@gmail.com', b'1', 'https://i.pinimg.com/736x/b7/91/44/b79144e03dc4996ce319ff59118caf65.jpg', 'admin martfury', '$2a$10$yvcT5zT/lDrM89Lofss6GeF0icqluuVVxo2QX4BehAh75k.eAzFIe', '0966667895', '2024-02-27', b'1', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJncmVlbnlzaG9wLmFkbUBnbWFpbC5jb20iLCJzY29wZXMiOlt7ImF1dGhvcml0eSI6IlJPTEVfQURNSU4ifV0sImlzcyI6Imh0dHA6Ly9kZXZnbGFuLmNvbSIsImlhdCI6MTY0Nzc4MjE4MywiZXhwIjoxNjQ3ODAwMTgzfQ.cLQLN6HPjClhuJFdBro1WHKEKfA7wYbBa3Eg3uHfNAE'),
	(3, 'Thành phố Hồ Chí Minh', 'trantrongthiep2002@gmail.com', b'1', 'https://i.pinimg.com/736x/b7/91/44/b79144e03dc4996ce319ff59118caf65.jpg', 'Trần Trọng Thiệp', '$2a$10$FMNO9C77S9/Pae4.V11muuxKL0zKF1rdvJITCzZG61mKjygtMRhwu', '0968376202', '2024-02-27', b'1', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJodXVkb25nMjk3QGdtYWlsLmNvbSIsInNjb3BlcyI6W3siYXV0aG9yaXR5IjoiUk9MRV9BRE1JTiJ9XSwiaXNzIjoiaHR0cDovL2RldmdsYW4uY29tIiwiaWF0IjoxNjQ3Nzg5NDI5LCJleHAiOjE2NDc4MDc0Mjl9.JfbZQ2D8lRg8UPWhnnLMO9R-lFW_8-r2hxV9kOVZRZM'),
	(4, 'Thành phố Hồ Chí Minh', 'thieproc2002@gmail.com', b'1', 'https://i.pinimg.com/736x/b7/91/44/b79144e03dc4996ce319ff59118caf65.jpg', 'Trần Trọng Thông', '$2a$10$EWTp2tH0Rc1osvewWztXM.ba02wWffEupaG0.jziUul7b8WYUal3K', '0968376203', '2024-02-27', b'1', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0aGFvY2hpNjQwNEBnbWFpbC5jb20iLCJzY29wZXMiOlt7ImF1dGhvcml0eSI6IlJPTEVfQURNSU4ifV0sImlzcyI6Imh0dHA6Ly9kZXZnbGFuLmNvbSIsImlhdCI6MTY0ODA0MzUzNywiZXhwIjoxNjQ4MDYxNTM3fQ.589LqMNNJ-NiF0s425cR_tfAr3cfhqf7rpQ_QU1AEIw');

-- Dumping structure for table electric_shop.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKihg20vygk8qb8lw0s573lqsmq` (`role_id`),
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKihg20vygk8qb8lw0s573lqsmq` FOREIGN KEY (`role_id`) REFERENCES `app_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table electric_shop.user_roles: ~3 rows (approximately)
DELETE FROM `user_roles`;
INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
	(3, 1),
	(4, 1),
	(2, 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
