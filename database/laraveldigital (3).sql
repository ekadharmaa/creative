-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 21, 2025 at 11:49 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laraveldigital`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subdomain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `uuid`, `name`, `subdomain`, `password`, `email`, `phone`, `created_at`, `updated_at`, `remember_token`) VALUES
(1, '2065ec71-61c3-4f58-a07c-105d3dd4bf7f', 'ekadharma1', 'eka-dharma', '$2y$12$AUDRWjViVp4dwh06e1ach.S5IVChs9hD9bjFxU5DJ4d3RCxLx1exi', 'saputradharma390@gmail.com', '+628999400874', '2025-04-13 09:19:04', '2025-04-30 07:50:45', NULL),
(2, 'f59ad987-2468-4bfb-bf61-3ade8a3795fc', 'agus', 'agus', '$2y$12$9kAmQvz4b/kSY.cYh1I.2./vtlCvLyyYLYQSklWRgqxorUccTVySO', 'agusre@gmail.com', '088724587324', '2025-04-14 00:54:19', '2025-04-14 00:54:19', NULL),
(4, '6d11ad9d-c20c-4154-8a04-28b97328c286', 'akuntest1', 'akuntest', '$2y$12$Ev7xBPoi7TK7Z.Q8COVN5OZNnfBdv/H1IC.KW1ozUVsZd9OiW/EKu', 'akuntest@gmail.com', '087562354832', '2025-04-30 02:46:23', '2025-04-30 08:26:08', NULL),
(6, '143e3115-a71e-4970-88c8-b6dc637a5009', 'asep', 'asep', '$2y$12$ILGO1IPBh8dbvYsXcFpxfuVbfW6Vqy8C/zNsXpKaADCGt5kfZW3dO', 'asepvandal@gmail.com', '0813474975876', '2025-04-30 09:00:37', '2025-04-30 09:00:37', NULL),
(7, '2dff17a4-4f07-4e57-b328-09dee9cde23b', 'dwiasep', 'dwiasep', '$2y$12$HEivTMUVBAoxEuWeEImGPu9O.MgbeEorzMFuE.1DZDntDocsv0T3W', 'dwiasep@gmail.com', '08327462365234', '2025-05-01 21:22:57', '2025-05-01 21:22:57', NULL),
(8, '031a09b7-9006-4400-9b8d-d714026402a4', 'suju', 'suju', '$2y$12$ZEaUAnx5em9nbiNuLNoiKOd5fIX9LhbB.vCz3chmKxkBvrhSz7gCq', 'suju@gmail.com', '08473562142', '2025-05-07 07:28:15', '2025-05-07 07:28:15', NULL),
(10, '555d4c70-5a00-47e3-823c-3d4951e413a1', 'dwi', 'dwi', '$2y$12$yiIymSFp1XJZyrRD/qhXi.cejFct/XfriPkE9P/HKq65Ru0jdJta.', 'asep@gmail.com', '087624357', '2025-05-12 00:13:23', '2025-05-12 00:13:23', NULL),
(11, 'add4ccfa-39d5-4b16-8466-092c3e7f2cff', 'ody', 'ody', '$2y$12$lZXL4wGIDi2QO.bszsb8begjz87rZQ48.49i7IWGvdliC4D/tXB7i', 'stel@gmail.com', '087432637423432', '2025-05-21 11:19:13', '2025-05-21 11:19:13', NULL),
(12, '86e68775-2ef8-4cab-886e-4b0295ede119', 'new', 'new', '$2y$12$W2gdbv.QMaAYNeqMLtyD6OV37ZQnsCa/22fFNm5zRZb4cwOCKnexC', 'kjhsdf@gmail.com', '0834324778218', '2025-05-21 11:22:23', '2025-05-21 11:22:23', NULL),
(13, 'd216b2f4-f2ab-4b64-82e5-101f6593b5ec', 'user.test', 'usertest', '$2y$12$d42RlBXNmYMWvyw5M.yAheb5L.zva3fBnlg0zwZLuQPzuJZPVoZ.G', 'user@gmail.com', '08214273576', '2025-05-21 11:22:41', '2025-05-21 11:22:41', NULL),
(14, '9a4d0b11-2246-4c85-8097-604b078cf89d', 'demotest', 'demotest', '$2y$12$zAyPTbfgqVHHJtZZhwq64.VPIB1wwmbzRKZ4eF/ZMxErrnCIB01SW', 'demouser@gmail.com', '0877634623', '2025-05-21 11:22:59', '2025-05-21 11:22:59', NULL),
(15, '9cccae7c-de11-419e-8209-3bc4332b154c', 'Putu Eka Dharma Saputra', 'putu-eka-dharma-saputra', '$2y$12$i2nFNZYvchLVCohCiODSDeqMVH9kF8OMt9RlLIG0n9tBlsTBNzJfW', 'asimmgp999@gmail.com', '+628999430874', '2025-05-22 01:21:49', '2025-05-22 01:21:49', NULL),
(16, '443eb836-859f-4fd4-806f-4e2ea76c40be', 'yuju', 'yuju', '$2y$12$NCoxQqC2YFRU8Zu.z0gsGu13eulUKLOfBNfAJqM40qMZTSBhD2YHe', 'gfriend@gmail.com', '08552346237', '2025-06-13 01:28:38', '2025-06-13 01:28:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invitations`
--

CREATE TABLE `invitations` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `music` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `custom_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invitations`
--

INSERT INTO `invitations` (`id`, `uuid`, `customer_id`, `order_id`, `slug`, `template`, `music`, `created_at`, `updated_at`, `data`, `custom_domain`) VALUES
(10, '33c86161-d676-42f8-af81-4c18afdb45ef', 4, 'e9f95444-52f4-4fe5-be01-5f997afc791c', 'BmXMmpPUag-758', 'batik-jawa', NULL, '2025-04-30 02:46:35', '2025-04-30 02:46:35', NULL, NULL),
(12, '20319859-f25f-4fbe-9afe-095ab41b130c', 6, 'c935a425-8fcd-455b-9d11-f31310051850', 'jZDqsjcE9k-448', 'elegant-brown', NULL, '2025-04-30 09:01:22', '2025-04-30 09:02:05', '{\"date\":\"2025-04-30T17:01:54.501563Z\",\"location\":\"Jl. Raya Bogor, Jakarta\",\"navigation\":{\"primary\":\"#5d7499\",\"secondary\":\"#e6e9eb\"},\"opening\":{\"title\":{\"label\":\"Title\",\"component\":\"text\",\"value\":\"Gilang & Rizka\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#ba492b\",\"fontFamily\":\"inherit\"}},\"subtitle\":{\"label\":\"Subtitle\",\"component\":\"text\",\"value\":\"The Wedding\",\"style\":{\"fontSize\":\"18px\",\"color\":\"#000000\",\"fontFamily\":\"Merienda\"}},\"button\":{\"label\":\"Button\",\"component\":\"text\",\"value\":\"Open Invitation\",\"style\":{\"fontSize\":\"16px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"image\":{\"src\":\"http:\\/\\/balicreative.test\\/storage\\/images\\/2uue1haqXRGNRxph96BU.jpg\",\"style\":{\"width\":\"180px\",\"height\":\"230px\",\"margin\":\"2rem auto\",\"object-fit\":\"cover\",\"border-radius\":\"100px 100px 5px 5px\",\"padding\":\"10px\",\"border\":\"2px solid#ba492b\"}}},\"quotes\":{\"text\":{\"label\":\"Quotes\",\"component\":\"text\",\"value\":\"\\\"Dan di antara tanda-tanda (kebesaran)-Nya ialah Dia menciptakan pasangan-pasangan untukmu dari jenismu sendiri, agar kamu cenderung dan merasa tenteram kepadanya, dan Dia menjadikan di antaramu rasa kasih dan sayang. Sungguh, pada yang demikian itu benar-benar terdapat tanda-tanda (kebesaran Allah) bagi kaum yang berpikir.\\\"\",\"style\":{\"fontSize\":\"16px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"author\":{\"label\":\"Author\",\"component\":\"text\",\"value\":\"QS. Ar-Rum: 21\",\"style\":{\"fontSize\":\"12px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}}},\"couple\":{\"groom_photo\":\"\\/assets\\/partials\\/mempelai\\/pria.jpg\",\"groom_name\":{\"label\":\"Nama Pengantin\",\"component\":\"text\",\"value\":\"Gilang Rahardian Surya\",\"style\":{\"fontSize\":\"24px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"groom_description\":{\"label\":\"Deskripsi Pengantin\",\"component\":\"text\",\"value\":\"Putra pertama dari Bapak Budi dan Ibu Siti\",\"style\":{\"fontSize\":\"12px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"groom_link\":\"https:\\/\\/instagram.com\\/gilang\",\"bride_photo\":\"\\/assets\\/partials\\/mempelai\\/wanita.jpg\",\"bride_name\":{\"label\":\"Nama Pengantin\",\"component\":\"text\",\"value\":\"Rizka Nurul Azizah\",\"style\":{\"fontSize\":\"24px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"bride_description\":{\"label\":\"Deskripsi Pengantin\",\"component\":\"text\",\"value\":\"Putri pertama dari Bapak Joko dan Ibu Sari\",\"style\":{\"fontSize\":\"12px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"bride_link\":\"https:\\/\\/instagram.com\\/rizka\"},\"gift\":{\"account_number\":{\"label\":\"Account Number\",\"component\":\"text\",\"value\":\"12345678\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#ba492b\",\"fontFamily\":\"Kaushan Script\"}},\"account_name\":{\"label\":\"Account Name\",\"component\":\"text\",\"value\":\"BCA (Balicreative)\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#ba492b\",\"fontFamily\":\"Kaushan Script\"}}},\"background\":{\"background\":\"url(\\/assets\\/partials\\/template-04\\/bg.webp)\",\"opacity\":0.5,\"backgroundSize\":\"cover\",\"backgroundPosition\":\"center\"},\"gallery\":[\"\\/assets\\/partials\\/galeri\\/01.jpg\",\"\\/assets\\/partials\\/galeri\\/02.jpg\",\"\\/assets\\/partials\\/galeri\\/03.jpg\",\"\\/assets\\/partials\\/galeri\\/04.jpg\"],\"options\":{\"primaryColor\":\"#ba492b\",\"secondaryColor\":\"#000000\",\"backgroundColor\":\"#000000\",\"primaryFont\":\"Arial\",\"secondaryFont\":\"Arial\",\"fontPrimary\":\"Platypi\",\"fontSecondary\":\"Zilla Slab\",\"partials\":{\"top\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\",\"height\":\"50%\"}},\"bottom\":{\"src\":\"\\/assets\\/partials\\/template-04\\/tm-2.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\",\"transform\":\"rotate(180deg)\",\"opacity\":\"0.8\"}},\"left\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\",\"height\":\"100%\"},\"navigation\":\"h-full\"},\"right\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"right\":\"0\",\"height\":\"100%\"},\"navigation\":\"h-full\"},\"topLeft\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\"}},\"topRight\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"right\":\"0\"}},\"bottomLeft\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\"}},\"bottomRight\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"right\":\"0\"}}},\"music\":\"\\/assets\\/sound\\/lovestory.mp3\",\"button\":{\"label\":\"Button\",\"component\":\"button\",\"value\":\"Tombol\",\"type\":\"rounded-full\",\"style\":{\"fontSize\":\"12px\",\"color\":\"#ffffff\",\"background\":\"#ba492b\",\"fontFamily\":\"Arial\"}},\"containerColor\":\"#ffffff\"},\"music\":\"\\/assets\\/sound\\/lovestory.mp3\"}', NULL),
(13, '65549d82-9320-44d0-8664-37c87f69713b', 7, 'd37c7f63-46a5-4af6-a93d-5ea1d499ff84', 'Y6HqLhJz2b-342', 'elegant-brown', NULL, '2025-05-01 21:23:04', '2025-05-01 21:29:22', '{\"date\":\"2025-05-30T05:23:30.013852Z\",\"location\":\"Jl. Raya Bogor, Jakarta\",\"navigation\":{\"primary\":\"#5d7499\",\"secondary\":\"#e6e9eb\"},\"opening\":{\"title\":{\"label\":\"Title\",\"component\":\"text\",\"value\":\"Asep & Dwi\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#ba492b\",\"fontFamily\":\"inherit\"}},\"subtitle\":{\"label\":\"Subtitle\",\"component\":\"text\",\"value\":\"The Wedding\",\"style\":{\"fontSize\":\"18px\",\"color\":\"#000000\",\"fontFamily\":\"Merienda\"}},\"button\":{\"label\":\"Button\",\"component\":\"text\",\"value\":\"Open Invitation\",\"style\":{\"fontSize\":\"16px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"image\":{\"src\":\"http:\\/\\/balicreative.test\\/storage\\/images\\/lPBqfuDX81nlKF8rMWhY.png\",\"style\":{\"width\":\"180px\",\"height\":\"230px\",\"margin\":\"2rem auto\",\"object-fit\":\"cover\",\"border-radius\":\"100px 100px 5px 5px\",\"padding\":\"10px\",\"border\":\"2px solid#ba492b\"}}},\"quotes\":{\"text\":{\"label\":\"Quotes\",\"component\":\"text\",\"value\":\"\\\"Dan di antara tanda-tanda (kebesaran)-Nya ialah Dia menciptakan pasangan-pasangan untukmu dari jenismu sendiri, agar kamu cenderung dan merasa tenteram kepadanya, dan Dia menjadikan di antaramu rasa kasih dan sayang. Sungguh, pada yang demikian itu benar-benar terdapat tanda-tanda (kebesaran Allah) bagi kaum yang berpikir.\\\"\",\"style\":{\"fontSize\":\"16px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"author\":{\"label\":\"Author\",\"component\":\"text\",\"value\":\"QS. Ar-Rum: 21\",\"style\":{\"fontSize\":\"12px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}}},\"couple\":{\"groom_photo\":\"http:\\/\\/balicreative.test\\/storage\\/images\\/MLlt4OlRuZMUfNRtO8ql.jpg\",\"groom_name\":{\"label\":\"Nama Pengantin\",\"component\":\"text\",\"value\":\"ASEP\",\"style\":{\"fontSize\":\"24px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"groom_description\":{\"label\":\"Deskripsi Pengantin\",\"component\":\"text\",\"value\":\"Putra pertama dari Bapak Budi dan Ibu Siti\",\"style\":{\"fontSize\":\"12px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"groom_link\":\"https:\\/\\/instagram.com\\/gilang\",\"bride_photo\":\"http:\\/\\/balicreative.test\\/storage\\/images\\/Aagma4y7RMY3vMhXXG8r.jpg\",\"bride_name\":{\"label\":\"Nama Pengantin\",\"component\":\"text\",\"value\":\"DWI\",\"style\":{\"fontSize\":\"24px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"bride_description\":{\"label\":\"Deskripsi Pengantin\",\"component\":\"text\",\"value\":\"Putri pertama dari Bapak Joko dan Ibu Sari\",\"style\":{\"fontSize\":\"12px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"bride_link\":\"https:\\/\\/instagram.com\\/rizka\"},\"gift\":{\"account_number\":{\"label\":\"Account Number\",\"component\":\"text\",\"value\":\"12345678\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#ba492b\",\"fontFamily\":\"Kaushan Script\"}},\"account_name\":{\"label\":\"Account Name\",\"component\":\"text\",\"value\":\"BCA (Balicreative)\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#ba492b\",\"fontFamily\":\"Kaushan Script\"}}},\"background\":{\"background\":\"url(\\/assets\\/partials\\/template-04\\/bg.webp)\",\"opacity\":0.5,\"backgroundSize\":\"cover\",\"backgroundPosition\":\"center\"},\"gallery\":[\"\\/assets\\/partials\\/galeri\\/01.jpg\",\"\\/assets\\/partials\\/galeri\\/02.jpg\",\"\\/assets\\/partials\\/galeri\\/03.jpg\",\"\\/assets\\/partials\\/galeri\\/04.jpg\"],\"options\":{\"primaryColor\":\"#ba492b\",\"secondaryColor\":\"#000000\",\"backgroundColor\":\"#000000\",\"primaryFont\":\"Arial\",\"secondaryFont\":\"Arial\",\"fontPrimary\":\"Platypi\",\"fontSecondary\":\"Zilla Slab\",\"partials\":{\"top\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\",\"height\":\"50%\"}},\"bottom\":{\"src\":\"\\/assets\\/partials\\/template-04\\/tm-2.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\",\"transform\":\"rotate(180deg)\",\"opacity\":\"0.8\"}},\"left\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\",\"height\":\"100%\"},\"navigation\":\"h-full\"},\"right\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"right\":\"0\",\"height\":\"100%\"},\"navigation\":\"h-full\"},\"topLeft\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\"}},\"topRight\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"right\":\"0\"}},\"bottomLeft\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\"}},\"bottomRight\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"right\":\"0\"}}},\"music\":\"\\/assets\\/sound\\/lovestory.mp3\",\"button\":{\"label\":\"Button\",\"component\":\"button\",\"value\":\"Tombol\",\"type\":\"rounded-full\",\"style\":{\"fontSize\":\"12px\",\"color\":\"#ffffff\",\"background\":\"#ba492b\",\"fontFamily\":\"Arial\"}},\"containerColor\":\"#ffffff\"},\"music\":\"\\/assets\\/sound\\/lovestory.mp3\"}', NULL),
(21, '2fd5edfd-4210-4e7f-a775-29608eb0ac31', 8, '245fe07b-1a11-4b59-8cdd-77ae81832577', '2iR0dkZVyk-669', 'adat-jawa', NULL, '2025-05-07 09:16:22', '2025-05-10 04:14:11', '{\"date\":\"2025-05-30T18:04:20.801759Z\",\"location\":\"Jl. Raya Bogor, Jakarta\",\"navigation\":{\"primary\":\"#a88e47\",\"secondary\":\"#000000\"},\"opening\":{\"title\":{\"label\":\"Title\",\"component\":\"text\",\"value\":\"Gilang & Rizka\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#a88e47\",\"fontFamily\":\"inherit\"}},\"button\":{\"label\":\"Button\",\"component\":\"text\",\"value\":\"Open Invitation\",\"style\":{\"fontSize\":\"16px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"image\":{\"src\":\"http:\\/\\/balicreative.test\\/storage\\/images\\/eVKU3bwC2EMvYg1NBZxk.jpg\",\"style\":{\"width\":\"180px\",\"height\":\"230px\",\"margin\":\"2rem auto\",\"object-fit\":\"cover\",\"border-radius\":\"100px 100px 20px 20px\"}}},\"quotes\":{\"text\":{\"label\":\"Quotes\",\"component\":\"text\",\"value\":\"\\\"Dan di antara tanda-tanda (kebesaran)-Nya ialah Dia menciptakan pasangan-pasangan untukmu dari jenismu sendiri, agar kamu cenderung dan merasa tenteram kepadanya, dan Dia menjadikan di antaramu rasa kasih dan sayang. Sungguh, pada yang demikian itu benar-benar terdapat tanda-tanda (kebesaran Allah) bagi kaum yang berpikir.\\\"\",\"style\":{\"fontSize\":\"16px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"author\":{\"label\":\"Author\",\"component\":\"text\",\"value\":\"QS. Ar-Rum: 21\",\"style\":{\"fontSize\":\"12px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}}},\"couple\":{\"groom_photo\":\"\\/assets\\/partials\\/mempelai\\/pria.jpg\",\"groom_name\":{\"label\":\"Nama Pengantin\",\"component\":\"text\",\"value\":\"Gilang Rahardian Surya\",\"style\":{\"fontSize\":\"24px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"groom_description\":{\"label\":\"Deskripsi Pengantin\",\"component\":\"text\",\"value\":\"Putra pertama dari Bapak Budi dan Ibu Siti\",\"style\":{\"fontSize\":\"12px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"groom_link\":\"https:\\/\\/instagram.com\\/gilang\",\"bride_photo\":\"\\/assets\\/partials\\/mempelai\\/wanita.jpg\",\"bride_name\":{\"label\":\"Nama Pengantin\",\"component\":\"text\",\"value\":\"Rizka Nurul Azizah\",\"style\":{\"fontSize\":\"24px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"bride_description\":{\"label\":\"Deskripsi Pengantin\",\"component\":\"text\",\"value\":\"Putri pertama dari Bapak Joko dan Ibu Sari\",\"style\":{\"fontSize\":\"12px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"bride_link\":\"https:\\/\\/instagram.com\\/rizka\"},\"background\":{\"background\":\"url()\",\"opacity\":0.5,\"backgroundSize\":\"cover\",\"backgroundPosition\":\"center\"},\"gift\":{\"account_number\":{\"label\":\"Account Number\",\"component\":\"text\",\"value\":\"12345678\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#a88e47\",\"fontFamily\":\"Kaushan Script\"}},\"account_name\":{\"label\":\"Account Name\",\"component\":\"text\",\"value\":\"BCA (Balicreative)\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#a88e47\",\"fontFamily\":\"Kaushan Script\"}}},\"gallery\":[\"\\/assets\\/partials\\/galeri\\/01.jpg\",\"\\/assets\\/partials\\/galeri\\/02.jpg\",\"\\/assets\\/partials\\/galeri\\/03.jpg\",\"\\/assets\\/partials\\/galeri\\/04.jpg\"],\"options\":{\"primaryColor\":\"#a88e47\",\"secondaryColor\":\"#ffffff\",\"backgroundColor\":\"#000000\",\"primaryFont\":\"Arial\",\"secondaryFont\":\"Arial\",\"fontPrimary\":\"Dancing Script\",\"fontSecondary\":\"Merienda\",\"partials\":{\"top\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-tm.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\"}},\"bottom\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-bm.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\"}},\"left\":{\"src\":\"\\/assets\\/partials\\/template-01\\/left.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\",\"height\":\"100%\"},\"navigation\":\"h-full\"},\"right\":{\"src\":\"\\/assets\\/partials\\/template-01\\/right.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"right\":\"0\",\"height\":\"100%\"},\"navigation\":\"h-full\"},\"topLeft\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-tl.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\"}},\"topRight\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-tr.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"right\":\"0\"}},\"bottomLeft\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-bl.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\"}},\"bottomRight\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-br.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"right\":\"0\"}}},\"music\":\"\\/assets\\/sound\\/lagu-jawa.mp3\",\"button\":{\"label\":\"Button\",\"component\":\"button\",\"value\":\"Tombol\",\"type\":\"rounded-full\",\"style\":{\"fontSize\":\"12px\",\"color\":\"#000000\",\"background\":\"#a88e47\",\"fontFamily\":\"Arial\"}}},\"music\":\"http:\\/\\/balicreative.test\\/storage\\/files\\/Y5aktzTdFxNdjoKwYvyJ.mp3\"}', NULL),
(24, '8eadb83f-842b-4e9c-afa7-f4d84a9b3982', 8, '183a5075-5d64-4d3e-896a-dad5258330a0', 'OMCZyGD1Tx-982', 'halal-bihalal', NULL, '2025-05-07 09:25:30', '2025-05-07 09:25:30', NULL, NULL),
(27, '1e213abf-a6e1-409f-85d2-cee897979687', 1, '916fae50-79d3-4584-8f38-efcd6d62d087', 'giBGuXuWvB-414', 'elegant-brown', NULL, '2025-05-08 21:08:38', '2025-05-08 22:21:01', '{\"date\":\"2025-05-30T05:09:22.791230Z\",\"location\":\"Jl. Raya Bogor, Jakarta\",\"navigation\":{\"primary\":\"#5d7499\",\"secondary\":\"#e6e9eb\"},\"opening\":{\"title\":{\"label\":\"Title\",\"component\":\"text\",\"value\":\"Gilang & Rizka\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#ba492b\",\"fontFamily\":\"inherit\"}},\"subtitle\":{\"label\":\"Subtitle\",\"component\":\"text\",\"value\":\"The Wedding\",\"style\":{\"fontSize\":\"18px\",\"color\":\"#000000\",\"fontFamily\":\"Merienda\"}},\"button\":{\"label\":\"Button\",\"component\":\"text\",\"value\":\"Open Invitation\",\"style\":{\"fontSize\":\"16px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"image\":{\"src\":\"http:\\/\\/balicreative.test\\/storage\\/images\\/sEcDo8HiYbSdPgLnJxNF.JPG\",\"style\":{\"width\":\"180px\",\"height\":\"230px\",\"margin\":\"2rem auto\",\"object-fit\":\"cover\",\"border-radius\":\"100px 100px 5px 5px\",\"padding\":\"10px\",\"border\":\"2px solid#ba492b\"}}},\"quotes\":{\"text\":{\"label\":\"Quotes\",\"component\":\"text\",\"value\":\"\\\"Dan di antara tanda-tanda (kebesaran)-Nya ialah Dia menciptakan pasangan-pasangan untukmu dari jenismu sendiri, agar kamu cenderung dan merasa tenteram kepadanya, dan Dia menjadikan di antaramu rasa kasih dan sayang. Sungguh, pada yang demikian itu benar-benar terdapat tanda-tanda (kebesaran Allah) bagi kaum yang berpikir.\\\"\",\"style\":{\"fontSize\":\"16px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"author\":{\"label\":\"Author\",\"component\":\"text\",\"value\":\"QS. Ar-Rum: 21\",\"style\":{\"fontSize\":\"12px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}}},\"couple\":{\"groom_photo\":\"\\/assets\\/partials\\/mempelai\\/pria.jpg\",\"groom_name\":{\"label\":\"Nama Pengantin\",\"component\":\"text\",\"value\":\"Gilang Rahardian Surya\",\"style\":{\"fontSize\":\"24px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"groom_description\":{\"label\":\"Deskripsi Pengantin\",\"component\":\"text\",\"value\":\"Putra pertama dari Bapak Budi dan Ibu Siti\",\"style\":{\"fontSize\":\"12px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"groom_link\":\"https:\\/\\/instagram.com\\/gilang\",\"bride_photo\":\"\\/assets\\/partials\\/mempelai\\/wanita.jpg\",\"bride_name\":{\"label\":\"Nama Pengantin\",\"component\":\"text\",\"value\":\"Rizka Nurul Azizah\",\"style\":{\"fontSize\":\"24px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"bride_description\":{\"label\":\"Deskripsi Pengantin\",\"component\":\"text\",\"value\":\"Putri pertama dari Bapak Joko dan Ibu Sari\",\"style\":{\"fontSize\":\"12px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"bride_link\":\"https:\\/\\/instagram.com\\/rizka\"},\"gift\":{\"account_number\":{\"label\":\"Account Number\",\"component\":\"text\",\"value\":\"12345678\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#ba492b\",\"fontFamily\":\"Kaushan Script\"}},\"account_name\":{\"label\":\"Account Name\",\"component\":\"text\",\"value\":\"BCA (Balicreative)\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#ba492b\",\"fontFamily\":\"Kaushan Script\"}}},\"background\":{\"background\":\"url(\\/assets\\/partials\\/template-04\\/bg.webp)\",\"opacity\":0.5,\"backgroundSize\":\"cover\",\"backgroundPosition\":\"center\"},\"gallery\":[\"\\/assets\\/partials\\/galeri\\/01.jpg\",\"\\/assets\\/partials\\/galeri\\/03.jpg\",\"\\/assets\\/partials\\/galeri\\/04.jpg\",\"http:\\/\\/balicreative.test\\/storage\\/images\\/hX7XGSjdZEfAQcrQW0dg.jpg\"],\"options\":{\"primaryColor\":\"#ba492b\",\"secondaryColor\":\"#000000\",\"backgroundColor\":\"#000000\",\"primaryFont\":\"Arial\",\"secondaryFont\":\"Arial\",\"fontPrimary\":\"Platypi\",\"fontSecondary\":\"Zilla Slab\",\"partials\":{\"top\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\",\"height\":\"50%\"}},\"bottom\":{\"src\":\"\\/assets\\/partials\\/template-04\\/tm-2.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\",\"transform\":\"rotate(180deg)\",\"opacity\":\"0.8\"}},\"left\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\",\"height\":\"100%\"},\"navigation\":\"h-full\"},\"right\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"right\":\"0\",\"height\":\"100%\"},\"navigation\":\"h-full\"},\"topLeft\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\"}},\"topRight\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"right\":\"0\"}},\"bottomLeft\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\"}},\"bottomRight\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"right\":\"0\"}}},\"music\":\"http:\\/\\/balicreative.test\\/storage\\/files\\/hs816gh1LVFKAf9WCZ7R.mp3\",\"button\":{\"label\":\"Button\",\"component\":\"button\",\"value\":\"Tombol\",\"type\":\"rounded-full\",\"style\":{\"fontSize\":\"12px\",\"color\":\"#ffffff\",\"background\":\"#ba492b\",\"fontFamily\":\"Arial\"}},\"containerColor\":\"#ffffff\"},\"music\":\"\\/assets\\/sound\\/lovestory.mp3\"}', NULL),
(32, '57ff7610-1c0a-4a17-945b-92f7a21656fa', 15, '4ac1ed68-8770-4866-a61b-dc2272fa5cb0', 'OcjpLi3LW2-907', 'batik-jawa', NULL, '2025-05-22 01:21:59', '2025-05-22 09:36:15', '{\"date\":\"2025-06-20T16:00\",\"location\":\"https:\\/\\/maps.app.goo.gl\\/LnT1bvwimUfTxwad8\",\"navigation\":{\"primary\":\"#506c99\",\"secondary\":\"#dfe6f2\"},\"opening\":{\"title\":{\"label\":\"Title\",\"component\":\"text\",\"value\":\"Gilang & Rizka\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#d16bb7\",\"fontFamily\":\"Kaushan Script\"}},\"subtitle\":{\"label\":\"Subtitle\",\"component\":\"text\",\"value\":\"The Wedding\",\"style\":{\"fontSize\":\"18px\",\"color\":\"#000000\",\"fontFamily\":\"Merienda\"}},\"button\":{\"label\":\"Open Button\",\"component\":\"button\",\"value\":\"Open Invitation\",\"type\":\"rounded-full\",\"style\":{\"fontSize\":\"12px\",\"color\":\"#ffffff\",\"background\":\"#d16bb7\",\"fontFamily\":\"Arial\"}},\"image\":{\"src\":\"\\/assets\\/partials\\/galeri\\/01.jpg\",\"style\":{\"width\":\"180px\",\"height\":\"230px\",\"margin\":\"2rem auto\",\"object-fit\":\"cover\",\"border-radius\":\"100px 100px 20px 20px\"}}},\"quotes\":{\"text\":{\"label\":\"Quotes\",\"component\":\"text\",\"value\":\"\\\"Dan di antara tanda-tanda (kebesaran)-Nya ialah Dia menciptakan pasangan-pasangan untukmu dari jenismu sendiri, agar kamu cenderung dan merasa tenteram kepadanya, dan Dia menjadikan di antaramu rasa kasih dan sayang. Sungguh, pada yang demikian itu benar-benar terdapat tanda-tanda (kebesaran Allah) bagi kaum yang berpikir.\\\"\",\"style\":{\"fontSize\":\"16px\",\"color\":\"#000000\",\"fontFamily\":\"Merienda\"}},\"author\":{\"label\":\"Author\",\"component\":\"text\",\"value\":\"QS. Ar-Rum: 21\",\"style\":{\"fontSize\":\"12px\",\"color\":\"#000000\",\"fontFamily\":\"Merienda\"}}},\"couple\":{\"groom_photo\":\"\\/assets\\/partials\\/mempelai\\/pria.jpg\",\"groom_name\":{\"label\":\"Nama Pengantin\",\"component\":\"text\",\"value\":\"Gilang Rahardian Surya\",\"style\":{\"fontSize\":\"24px\",\"color\":\"#d16bb7\",\"fontFamily\":\"Dancing Script\"}},\"groom_description\":{\"label\":\"Deskripsi Pengantin\",\"component\":\"text\",\"value\":\"Putra pertama dari Bapak Budi dan Ibu Siti\",\"style\":{\"fontSize\":\"12px\",\"color\":\"#000000\",\"fontFamily\":\"Merienda\"}},\"groom_link\":\"https:\\/\\/instagram.com\\/gilang\",\"bride_photo\":\"\\/assets\\/partials\\/mempelai\\/wanita.jpg\",\"bride_name\":{\"label\":\"Nama Pengantin\",\"component\":\"text\",\"value\":\"Rizka Nurul Azizah\",\"style\":{\"fontSize\":\"24px\",\"color\":\"#d16bb7\",\"fontFamily\":\"Dancing Script\"}},\"bride_description\":{\"label\":\"Deskripsi Pengantin\",\"component\":\"text\",\"value\":\"Putri pertama dari Bapak Joko dan Ibu Sari\",\"style\":{\"fontSize\":\"12px\",\"color\":\"#000000\",\"fontFamily\":\"Merienda\"}},\"bride_link\":\"https:\\/\\/instagram.com\\/rizka\",\"social_button\":{\"label\":\"Social Button\",\"component\":\"button\",\"value\":\"Tombol Instagram\",\"type\":\"rounded-full\",\"style\":{\"fontSize\":\"12px\",\"color\":\"#000000\",\"background\":\"#d16bb7\",\"fontFamily\":\"Arial\"}}},\"background\":{\"background\":\"url(\\/assets\\/partials\\/template-03\\/bg.webp)\",\"opacity\":1,\"backgroundSize\":\"cover\",\"backgroundPosition\":\"center\"},\"gift\":{\"account_number\":{\"label\":\"Account Number\",\"component\":\"text\",\"value\":\"12345678\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#d16bb7\",\"fontFamily\":\"Kaushan Script\"}},\"account_name\":{\"label\":\"Account Name\",\"component\":\"text\",\"value\":\"BCA (Balicreative)\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#d16bb7\",\"fontFamily\":\"Kaushan Script\"}}},\"options\":{\"primaryColor\":\"#d16bb7\",\"secondaryColor\":\"#000000\",\"backgroundColor\":\"#e6ecf5\",\"primaryFont\":\"Arial\",\"secondaryFont\":\"Arial\",\"fontPrimary\":\"Dancing Script\",\"fontSecondary\":\"Merienda\",\"partials\":{\"top\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-tm.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\"}},\"bottom\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-bm.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\"}},\"left\":{\"src\":\"\\/assets\\/partials\\/template-01\\/left.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\",\"height\":\"100%\"},\"navigation\":\"h-full\"},\"right\":{\"src\":\"\\/assets\\/partials\\/template-01\\/right.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"right\":\"0\",\"height\":\"100%\"},\"navigation\":\"h-full\"},\"topLeft\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-tl.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\"}},\"topRight\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-tr.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"right\":\"0\"}},\"bottomLeft\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-bl.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\"}},\"bottomRight\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-br.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"right\":\"0\"}}},\"music\":\"\\/assets\\/sound\\/lagu-jawa.mp3\",\"button\":{\"label\":\"Button\",\"component\":\"button\",\"value\":\"Tombol\",\"type\":\"rounded-full\",\"style\":{\"fontSize\":\"12px\",\"color\":\"#000000\",\"background\":\"#a88e47\",\"fontFamily\":\"Arial\"}},\"containerColor\":\"#ffffff\"},\"gallery\":[\"\\/assets\\/partials\\/galeri\\/01.jpg\",\"\\/assets\\/partials\\/galeri\\/02.jpg\",\"\\/assets\\/partials\\/galeri\\/03.jpg\",\"\\/assets\\/partials\\/galeri\\/04.jpg\"],\"partials\":{\"top\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\"}},\"bottom\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\"}},\"left\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\",\"height\":\"100%\"},\"navigation\":\"h-full\"},\"right\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"right\":\"0\",\"height\":\"100%\"},\"navigation\":\"h-full\"},\"topLeft\":{\"src\":\"\\/assets\\/partials\\/template-03\\/tl.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\"}},\"topRight\":{\"src\":\"\\/assets\\/partials\\/template-03\\/tr.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"right\":\"0\"}},\"bottomLeft\":{\"src\":\"\\/assets\\/partials\\/template-03\\/bl.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\"}},\"bottomRight\":{\"src\":\"\\/assets\\/partials\\/template-03\\/br.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"right\":\"0\"}}},\"music\":\"\\/assets\\/sound\\/lovestory.mp3\"}', NULL),
(33, 'd1379475-35d4-4d27-a255-a3ad63782852', 15, 'cc295d89-51c3-472d-bcee-e3a582244a96', 'cQA7zCOiln-824', 'adat-jawa', NULL, '2025-05-22 09:11:40', '2025-05-22 09:19:09', '{\"date\":\"2025-05-30T17:12:56.621504Z\",\"location\":\"https:\\/\\/maps.app.goo.gl\\/DexursnAAjcUpyQf9\",\"navigation\":{\"primary\":\"#a88e47\",\"secondary\":\"#000000\"},\"opening\":{\"title\":{\"label\":\"Title\",\"component\":\"text\",\"value\":\"Rizky & Mahalini\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#a88e47\",\"fontFamily\":\"inherit\"}},\"button\":{\"label\":\"Button\",\"component\":\"text\",\"value\":\"Open Invitation\",\"style\":{\"fontSize\":\"16px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"image\":{\"src\":\"\\/assets\\/partials\\/galeri\\/01.jpg\",\"style\":{\"width\":\"180px\",\"height\":\"230px\",\"margin\":\"2rem auto\",\"object-fit\":\"cover\",\"border-radius\":\"100px 100px 20px 20px\"}}},\"quotes\":{\"text\":{\"label\":\"Quotes\",\"component\":\"text\",\"value\":\"\\\"Dan di antara tanda-tanda (kebesaran)-Nya ialah Dia menciptakan pasangan-pasangan untukmu dari jenismu sendiri, agar kamu cenderung dan merasa tenteram kepadanya, dan Dia menjadikan di antaramu rasa kasih dan sayang. Sungguh, pada yang demikian itu benar-benar terdapat tanda-tanda (kebesaran Allah) bagi kaum yang berpikir.\\\"\",\"style\":{\"fontSize\":\"16px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"author\":{\"label\":\"Author\",\"component\":\"text\",\"value\":\"QS. Ar-Rum: 21\",\"style\":{\"fontSize\":\"12px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}}},\"couple\":{\"groom_photo\":\"\\/assets\\/partials\\/mempelai\\/pria.jpg\",\"groom_name\":{\"label\":\"Nama Pengantin\",\"component\":\"text\",\"value\":\"Gilang Rahardian Surya\",\"style\":{\"fontSize\":\"24px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"groom_description\":{\"label\":\"Deskripsi Pengantin\",\"component\":\"text\",\"value\":\"Putra pertama dari Bapak Budi dan Ibu Siti\",\"style\":{\"fontSize\":\"12px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"groom_link\":\"https:\\/\\/instagram.com\\/gilang\",\"bride_photo\":\"\\/assets\\/partials\\/mempelai\\/wanita.jpg\",\"bride_name\":{\"label\":\"Nama Pengantin\",\"component\":\"text\",\"value\":\"Rizka Nurul Azizah\",\"style\":{\"fontSize\":\"24px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"bride_description\":{\"label\":\"Deskripsi Pengantin\",\"component\":\"text\",\"value\":\"Putri pertama dari Bapak Joko dan Ibu Sari\",\"style\":{\"fontSize\":\"12px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"bride_link\":\"https:\\/\\/instagram.com\\/rizka\"},\"background\":{\"background\":\"url()\",\"opacity\":0.5,\"backgroundSize\":\"cover\",\"backgroundPosition\":\"center\"},\"gift\":{\"account_number\":{\"label\":\"Account Number\",\"component\":\"text\",\"value\":\"12345678\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#a88e47\",\"fontFamily\":\"Kaushan Script\"}},\"account_name\":{\"label\":\"Account Name\",\"component\":\"text\",\"value\":\"BCA (Balicreative)\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#a88e47\",\"fontFamily\":\"Kaushan Script\"}}},\"gallery\":[\"\\/assets\\/partials\\/galeri\\/01.jpg\",\"\\/assets\\/partials\\/galeri\\/02.jpg\",\"\\/assets\\/partials\\/galeri\\/03.jpg\",\"http:\\/\\/balicreative.test\\/storage\\/images\\/ImdcKIAhoDgeAFJUDYnZ.jpg\"],\"options\":{\"primaryColor\":\"#a88e47\",\"secondaryColor\":\"#ffffff\",\"backgroundColor\":\"#000000\",\"primaryFont\":\"Arial\",\"secondaryFont\":\"Arial\",\"fontPrimary\":\"Dancing Script\",\"fontSecondary\":\"Merienda\",\"partials\":{\"top\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-tm.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\"}},\"bottom\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-bm.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\"}},\"left\":{\"src\":\"\\/assets\\/partials\\/template-01\\/left.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\",\"height\":\"100%\"},\"navigation\":\"h-full\"},\"right\":{\"src\":\"\\/assets\\/partials\\/template-01\\/right.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"right\":\"0\",\"height\":\"100%\"},\"navigation\":\"h-full\"},\"topLeft\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-tl.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\"}},\"topRight\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-tr.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"right\":\"0\"}},\"bottomLeft\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-bl.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\"}},\"bottomRight\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-br.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"right\":\"0\"}}},\"music\":\"\\/assets\\/sound\\/lagu-jawa.mp3\",\"button\":{\"label\":\"Button\",\"component\":\"button\",\"value\":\"Tombol\",\"type\":\"rounded-full\",\"style\":{\"fontSize\":\"12px\",\"color\":\"#000000\",\"background\":\"#a88e47\",\"fontFamily\":\"Arial\"}}},\"music\":\"http:\\/\\/balicreative.test\\/storage\\/files\\/uJLZSnUyIxNNt0BQp3JW.mp3\"}', NULL),
(34, '28356867-f957-4a10-aa32-33c4a1e89bd4', 15, '6f785aad-9edc-460e-af10-111bbd5968c8', '8EQ4MZGm2n-579', 'halal-bihalal', NULL, '2025-05-22 09:19:48', '2025-05-22 09:23:01', '{\"date\":\"2025-05-30T17:21:04.174696Z\",\"location\":\"https:\\/\\/maps.app.goo.gl\\/DexursnAAjcUpyQf9\",\"navigation\":{\"primary\":\"#ffffff\",\"secondary\":\"#306481\"},\"opening\":{\"title\":{\"label\":\"Title\",\"component\":\"text\",\"value\":\"Halal Bihalal\",\"style\":{\"fontSize\":\"72px\",\"color\":\"#306481\",\"fontFamily\":\"Kaushan Script\",\"width\":\"90%\",\"text-align\":\"center\",\"marginRight\":\"20px\",\"lineHeight\":\"1.2em\",\"marginBottom\":\"15%\",\"font-weight\":\"bold\"}},\"subtitle\":{\"label\":\"Subtitle\",\"component\":\"text\",\"value\":\"Eid Mubarak\",\"style\":{\"fontSize\":\"16px\",\"color\":\"#306481\",\"fontFamily\":\"Merienda\",\"marginBottom\":\"2rem\",\"marginTop\":\"2rem\"}},\"button\":{\"label\":\"Open Button\",\"component\":\"button\",\"value\":\"Open Invitation\",\"type\":\"rounded-full\",\"style\":{\"fontSize\":\"12px\",\"color\":\"white\",\"background\":\"#306481\",\"fontFamily\":\"Arial\"}}},\"rsvp\":{\"wish\":{\"label\":\"Ucapan\",\"component\":\"text\",\"value\":\"Semoga Ramadan yang telah kita lalui telah meningkatkan keimanan dan ketakwaan kita kepada Allah SWT. Dalam semangat persaudaraan dan kebersamaan, mari kita bersilaturahmi dan memaafkan satu sama lain dalam acara halal bihalal ini.\",\"style\":{\"fontSize\":\"14px\",\"color\":\"black\",\"fontFamily\":\"Merienda\"}},\"thanks\":{\"label\":\"Thanks\",\"component\":\"text\",\"value\":\"Terima kasih atas kehadiran anda. Semoga silaturahmi kita terus terjaga dan diberkahi Allah SWT.\",\"style\":{\"fontSize\":\"14px\",\"color\":\"black\",\"fontFamily\":\"Merienda\"}}},\"background\":{\"background\":\"url(\\/assets\\/partials\\/template-02\\/bg.webp)\",\"opacity\":0.8,\"backgroundSize\":\"cover\",\"backgroundPosition\":\"center\"},\"options\":{\"primaryColor\":\"#306481\",\"secondaryColor\":\"#ffffff\",\"backgroundColor\":\"#306481\",\"primaryFont\":\"Arial\",\"secondaryFont\":\"Arial\",\"fontPrimary\":\"Dancing Script\",\"fontSecondary\":\"Merienda\",\"partials\":{\"top\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-tm.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\"}},\"bottom\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-bm.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\"}},\"left\":{\"src\":\"\\/assets\\/partials\\/template-01\\/left.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\",\"height\":\"100%\"},\"navigation\":\"h-full\"},\"right\":{\"src\":\"\\/assets\\/partials\\/template-01\\/right.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"right\":\"0\",\"height\":\"100%\"},\"navigation\":\"h-full\"},\"topLeft\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-tl.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\"}},\"topRight\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-tr.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"right\":\"0\"}},\"bottomLeft\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-bl.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\"}},\"bottomRight\":{\"src\":\"\\/assets\\/partials\\/template-01\\/frame-br.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"right\":\"0\"}}},\"music\":\"\\/assets\\/sound\\/lagu-jawa.mp3\",\"button\":{\"label\":\"Button\",\"component\":\"button\",\"value\":\"Tombol\",\"type\":\"rounded-full\",\"style\":{\"fontSize\":\"12px\",\"color\":\"#000000\",\"background\":\"#a88e47\",\"fontFamily\":\"Arial\"}},\"containerColor\":\"#ffffff\"},\"partials\":{\"top\":{\"src\":\"\\/assets\\/partials\\/template-02\\/tm.webp\",\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\"}},\"bottom\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\"}},\"left\":{\"src\":\"\\/assets\\/partials\\/template-02\\/bl-1.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\",\"height\":\"50%\"},\"navigation\":\"h-full\"},\"right\":{\"src\":\"\\/assets\\/partials\\/template-02\\/br-1.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"right\":\"0\",\"height\":\"50%\"},\"navigation\":\"h-full\"},\"topLeft\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\"}},\"topRight\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"right\":\"0\"}},\"bottomLeft\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\"}},\"bottomRight\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"right\":\"0\"}}},\"music\":\"\\/assets\\/sound\\/halal-bihalal.mp3\"}', NULL),
(35, 'e6166fb4-23f4-4587-9e40-b23ec57ea496', 15, '07f10ee4-18b2-4d78-b072-3682aa9f20ff', 'fiAylMcmN9-216', 'elegant-brown', NULL, '2025-05-22 09:37:40', '2025-05-22 09:38:58', '{\"date\":\"2025-05-30T17:38:44.094395Z\",\"location\":\"https:\\/\\/maps.app.goo.gl\\/NBwYeNWKVKA7uTAY7\",\"navigation\":{\"primary\":\"#5d7499\",\"secondary\":\"#e6e9eb\"},\"opening\":{\"title\":{\"label\":\"Title\",\"component\":\"text\",\"value\":\"Gilang & Rizka\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#ba492b\",\"fontFamily\":\"inherit\"}},\"subtitle\":{\"label\":\"Subtitle\",\"component\":\"text\",\"value\":\"The Wedding\",\"style\":{\"fontSize\":\"18px\",\"color\":\"#000000\",\"fontFamily\":\"Merienda\"}},\"button\":{\"label\":\"Button\",\"component\":\"text\",\"value\":\"Open Invitation\",\"style\":{\"fontSize\":\"16px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"image\":{\"src\":\"\\/assets\\/partials\\/galeri\\/01.jpg\",\"style\":{\"width\":\"180px\",\"height\":\"230px\",\"margin\":\"2rem auto\",\"object-fit\":\"cover\",\"border-radius\":\"100px 100px 5px 5px\",\"padding\":\"10px\",\"border\":\"2px solid#ba492b\"}}},\"quotes\":{\"text\":{\"label\":\"Quotes\",\"component\":\"text\",\"value\":\"\\\"Dan di antara tanda-tanda (kebesaran)-Nya ialah Dia menciptakan pasangan-pasangan untukmu dari jenismu sendiri, agar kamu cenderung dan merasa tenteram kepadanya, dan Dia menjadikan di antaramu rasa kasih dan sayang. Sungguh, pada yang demikian itu benar-benar terdapat tanda-tanda (kebesaran Allah) bagi kaum yang berpikir.\\\"\",\"style\":{\"fontSize\":\"16px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"author\":{\"label\":\"Author\",\"component\":\"text\",\"value\":\"QS. Ar-Rum: 21\",\"style\":{\"fontSize\":\"12px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}}},\"couple\":{\"groom_photo\":\"\\/assets\\/partials\\/mempelai\\/pria.jpg\",\"groom_name\":{\"label\":\"Nama Pengantin\",\"component\":\"text\",\"value\":\"Gilang Rahardian Surya\",\"style\":{\"fontSize\":\"24px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"groom_description\":{\"label\":\"Deskripsi Pengantin\",\"component\":\"text\",\"value\":\"Putra pertama dari Bapak Budi dan Ibu Siti\",\"style\":{\"fontSize\":\"12px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"groom_link\":\"https:\\/\\/instagram.com\\/gilang\",\"bride_photo\":\"\\/assets\\/partials\\/mempelai\\/wanita.jpg\",\"bride_name\":{\"label\":\"Nama Pengantin\",\"component\":\"text\",\"value\":\"Rizka Nurul Azizah\",\"style\":{\"fontSize\":\"24px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"bride_description\":{\"label\":\"Deskripsi Pengantin\",\"component\":\"text\",\"value\":\"Putri pertama dari Bapak Joko dan Ibu Sari\",\"style\":{\"fontSize\":\"12px\",\"color\":\"inherit\",\"fontFamily\":\"inherit\"}},\"bride_link\":\"https:\\/\\/instagram.com\\/rizka\"},\"gift\":{\"account_number\":{\"label\":\"Account Number\",\"component\":\"text\",\"value\":\"12345678\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#ba492b\",\"fontFamily\":\"Kaushan Script\"}},\"account_name\":{\"label\":\"Account Name\",\"component\":\"text\",\"value\":\"BCA (Balicreative)\",\"style\":{\"fontSize\":\"36px\",\"color\":\"#ba492b\",\"fontFamily\":\"Kaushan Script\"}}},\"background\":{\"background\":\"url(\\/assets\\/partials\\/template-04\\/bg.webp)\",\"opacity\":0.5,\"backgroundSize\":\"cover\",\"backgroundPosition\":\"center\"},\"gallery\":[\"\\/assets\\/partials\\/galeri\\/01.jpg\",\"\\/assets\\/partials\\/galeri\\/02.jpg\",\"\\/assets\\/partials\\/galeri\\/03.jpg\",\"\\/assets\\/partials\\/galeri\\/04.jpg\"],\"options\":{\"primaryColor\":\"#ba492b\",\"secondaryColor\":\"#000000\",\"backgroundColor\":\"#000000\",\"primaryFont\":\"Arial\",\"secondaryFont\":\"Arial\",\"fontPrimary\":\"Platypi\",\"fontSecondary\":\"Zilla Slab\",\"partials\":{\"top\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\",\"height\":\"50%\"}},\"bottom\":{\"src\":\"\\/assets\\/partials\\/template-04\\/tm-2.webp\",\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\",\"transform\":\"rotate(180deg)\",\"opacity\":\"0.8\"}},\"left\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\",\"height\":\"100%\"},\"navigation\":\"h-full\"},\"right\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"right\":\"0\",\"height\":\"100%\"},\"navigation\":\"h-full\"},\"topLeft\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"left\":\"0\"}},\"topRight\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"top\":\"0\",\"right\":\"0\"}},\"bottomLeft\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"left\":\"0\"}},\"bottomRight\":{\"src\":null,\"style\":{\"position\":\"absolute\",\"bottom\":\"0\",\"right\":\"0\"}}},\"music\":\"\\/assets\\/sound\\/lovestory.mp3\",\"button\":{\"label\":\"Button\",\"component\":\"button\",\"value\":\"Tombol\",\"type\":\"rounded-full\",\"style\":{\"fontSize\":\"12px\",\"color\":\"#ffffff\",\"background\":\"#ba492b\",\"fontFamily\":\"Arial\"}},\"containerColor\":\"#ffffff\"},\"music\":\"\\/assets\\/sound\\/lovestory.mp3\"}', NULL),
(36, 'f47969f8-197c-4989-bf52-7b7ceb8ab59c', 16, 'b67edfc3-4d40-43da-9a58-1dc039cd4dec', 'bIJNRKa1Xz-291', 'elegant-brown', NULL, '2025-06-13 01:30:35', '2025-06-13 01:30:35', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invitation_guests`
--

CREATE TABLE `invitation_guests` (
  `id` bigint UNSIGNED NOT NULL,
  `invitation_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wish` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invitation_guests`
--

INSERT INTO `invitation_guests` (`id`, `invitation_id`, `name`, `wish`, `attendance`, `created_at`, `updated_at`) VALUES
(5, 12, 'eka', NULL, 'pending', '2025-04-30 09:02:12', '2025-04-30 09:02:12'),
(6, 13, '80% JAWA', NULL, 'pending', '2025-05-01 21:29:35', '2025-05-01 21:29:35'),
(8, 21, 'yesy', 'selamat', 'yes', '2025-05-08 21:07:59', '2025-05-21 10:45:33'),
(9, 27, 'test', 'maaf\n-eka', 'no', '2025-05-08 21:09:38', '2025-05-08 21:34:01'),
(10, 27, 'demouser', NULL, 'pending', '2025-05-08 21:47:33', '2025-05-08 21:47:33'),
(11, 21, '34324', NULL, 'pending', '2025-05-21 10:40:41', '2025-05-21 10:40:41'),
(12, 21, 'sdf', NULL, 'pending', '2025-05-21 10:40:46', '2025-05-21 10:40:46'),
(13, 21, '324324', NULL, 'pending', '2025-05-21 10:40:49', '2025-05-21 10:40:49'),
(14, 21, 'eka', NULL, 'pending', '2025-05-21 10:56:13', '2025-05-21 10:56:13'),
(15, 21, '324', NULL, 'pending', '2025-05-21 10:56:57', '2025-05-21 10:56:57'),
(16, 21, 'eka=', NULL, 'pending', '2025-05-21 10:57:02', '2025-05-21 10:57:02'),
(17, 21, 'eka', NULL, 'pending', '2025-05-21 10:57:06', '2025-05-21 10:57:06'),
(18, 21, 'sdf', NULL, 'pending', '2025-05-21 10:57:11', '2025-05-21 10:57:11'),
(19, 21, 'sdf', NULL, 'pending', '2025-05-21 10:57:15', '2025-05-21 10:57:15'),
(20, 21, 'sdf', NULL, 'pending', '2025-05-21 10:57:21', '2025-05-21 10:57:21'),
(21, 21, 'admin', NULL, 'pending', '2025-05-21 11:13:56', '2025-05-21 11:13:56'),
(22, 32, 'dfdf', NULL, 'pending', '2025-05-22 08:30:14', '2025-05-22 08:30:14'),
(23, 33, 'demouser', 'as', 'yes', '2025-05-22 09:12:56', '2025-05-22 09:17:48'),
(24, 34, 'test', 'hadirr', 'yes', '2025-05-22 09:21:03', '2025-05-22 09:31:13'),
(25, 32, 'demouser', NULL, 'pending', '2025-05-22 09:35:01', '2025-05-22 09:35:01'),
(26, 35, 'wakwik', NULL, 'pending', '2025-05-22 09:39:04', '2025-05-22 09:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_04_11_115849_add_avatar_column_to_users_table', 1),
(5, '2024_04_12_070442_create_orders_table', 1),
(6, '2024_04_12_122108_add_order_id_column_to_orders_table', 1),
(7, '2024_04_14_085046_create_customers_table', 1),
(8, '2024_04_14_085259_add_customer_id_column_to_orders_table', 1),
(9, '2024_04_14_090412_remove_name_email_and_phone_from_orders_table', 1),
(10, '2024_04_14_165928_create_invitations_table', 1),
(11, '2024_04_15_061829_change_wedding_date_type_to_timestamp_from_invitations_table', 1),
(12, '2024_04_15_091316_create_invitation_guests_table', 1),
(13, '2024_04_16_151336_refactor_invitations_table', 1),
(14, '2024_04_19_140644_add_payment_token_to_orders_table', 1),
(15, '2025_01_18_200804_add_custom_domain_to_invitations_table', 1),
(16, '2025_01_26_151703_add_subdomain_and_password_to_customers_table', 1),
(17, '2025_01_26_175419_create_web_settings_table', 1),
(18, '2025_02_01_020719_add_remember_token_to_customer', 1),
(20, '2025_05_22_093341_add_favicon_to_web_settings_table', 2),
(21, '2025_05_22_135011_add_prices_to_web_settings_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total` int NOT NULL,
  `payment_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `status`, `total`, `payment_token`, `notes`, `created_at`, `updated_at`, `order_id`, `customer_id`) VALUES
('07f10ee4-18b2-4d78-b072-3682aa9f20ff', 'success', 100000, '5a6ba24d-5149-4669-ba30-666902e5b77a', NULL, '2025-05-22 09:37:40', '2025-05-22 09:37:54', 'INV-250522-3993', 15),
('183a5075-5d64-4d3e-896a-dad5258330a0', 'success', 50000, 'c07552e3-0210-4485-a57d-a3be632cb653', NULL, '2025-05-07 09:25:30', '2025-05-07 09:25:38', 'INV-250507-9486', 8),
('245fe07b-1a11-4b59-8cdd-77ae81832577', 'success', 80000, '2fd57c57-b213-4dca-875f-505f53b7a196', NULL, '2025-05-07 09:16:22', '2025-05-07 09:24:57', 'INV-250507-2024', 8),
('4ac1ed68-8770-4866-a61b-dc2272fa5cb0', 'success', 80000, '2b33673a-d7a4-427f-b23e-c17da4c11d80', NULL, '2025-05-22 01:21:59', '2025-05-22 01:24:03', 'INV-250522-8471', 15),
('6f785aad-9edc-460e-af10-111bbd5968c8', 'success', 40000, '961fb614-d227-4cf9-97ac-cf1efb4afb4c', NULL, '2025-05-22 09:19:48', '2025-05-22 09:20:00', 'INV-250522-0713', 15),
('916fae50-79d3-4584-8f38-efcd6d62d087', 'success', 80000, '29849b9c-3bed-4beb-881e-982c67d3fe8e', NULL, '2025-05-08 21:08:38', '2025-05-08 21:09:17', 'INV-250509-5185', 1),
('b67edfc3-4d40-43da-9a58-1dc039cd4dec', 'success', 100000, 'cc5b603f-0cfa-4649-a80b-5b6c37a2dcf5', NULL, '2025-06-13 01:30:35', '2025-06-13 01:31:19', 'INV-250613-0199', 16),
('c935a425-8fcd-455b-9d11-f31310051850', 'success', 80000, '8e316793-c572-4383-b449-98bbe8d05e4c', NULL, '2025-04-30 09:01:22', '2025-04-30 09:01:49', 'INV-250430-1562', 6),
('cc295d89-51c3-472d-bcee-e3a582244a96', 'success', 100000, '84a66082-0cc7-4f78-85ec-b750cfcbf37f', NULL, '2025-05-22 09:11:40', '2025-05-22 09:12:09', 'INV-250522-5194', 15),
('d37c7f63-46a5-4af6-a93d-5ea1d499ff84', 'success', 80000, '92284104-c250-4241-abb4-29ce87e65e39', NULL, '2025-05-01 21:23:04', '2025-05-01 21:23:27', 'INV-250502-6683', 7),
('e9f95444-52f4-4fe5-be01-5f997afc791c', 'expired', 80000, '0d312621-3d52-45da-9073-21d6dcacdf77', NULL, '2025-04-30 02:46:35', '2025-05-07 09:14:26', 'INV-250430-0165', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('oKUu7Na4zd5XtNn2LDyZkTRoNdl209efuHe1i6zp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmRHV0J5Q2JNeDI5Vkd2bmVQaVVueFhDUWRpV0JXMURhWGhOUDRGOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly9iYWxpY3JlYXRpdmUudGVzdCI7fX0=', 1749813295);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `avatar`) VALUES
(1, 'admin', 'admin@admin.com', '2025-04-13 09:18:30', '$2y$12$6Dch6fjQ8961pFf0WPh1BetURy5k63zYR4d9abPrfyTDbA7EQWZ.q', '9ixG2eam4T', '2025-04-13 09:18:30', '2025-04-30 08:48:47', 'https://media.tenor.com/zLFrBs-2_h8AAAAM/counterside-sigma.gif'),
(2, 'admineka', 'admineka@admin.com', NULL, '$2y$12$0i9hC.OFK91OndTNAkAVO.Ttq.ezKdLucDY5WynADx97J65I2VE0.', NULL, '2025-04-13 20:19:04', '2025-04-30 08:35:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `web_settings`
--

CREATE TABLE `web_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `app_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `basic_price` int NOT NULL DEFAULT '50000',
  `premium_price` int NOT NULL DEFAULT '80000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `web_settings`
--

INSERT INTO `web_settings` (`id`, `app_name`, `logo`, `favicon`, `created_at`, `updated_at`, `basic_price`, `premium_price`) VALUES
(1, 'Bali Creative', 'logos/Vm20sQ6QYO9ed0TIwIlN3TfolhzJYeBn8CjGn3ve.jpg', 'favicons/H6MboMyBCEXZCWD9sODBuZchnPuGDz7nMQL8Yapo.png', '2025-04-13 20:20:18', '2025-05-22 06:11:49', 40000, 100000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`),
  ADD UNIQUE KEY `customers_subdomain_unique` (`subdomain`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invitations`
--
ALTER TABLE `invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invitations_slug_unique` (`slug`),
  ADD KEY `invitations_customer_id_foreign` (`customer_id`),
  ADD KEY `invitations_order_id_foreign` (`order_id`);

--
-- Indexes for table `invitation_guests`
--
ALTER TABLE `invitation_guests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invitation_guests_invitation_id_foreign` (`invitation_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_id_unique` (`order_id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `web_settings`
--
ALTER TABLE `web_settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invitations`
--
ALTER TABLE `invitations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `invitation_guests`
--
ALTER TABLE `invitation_guests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `web_settings`
--
ALTER TABLE `web_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invitations`
--
ALTER TABLE `invitations`
  ADD CONSTRAINT `invitations_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invitations_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invitation_guests`
--
ALTER TABLE `invitation_guests`
  ADD CONSTRAINT `invitation_guests_invitation_id_foreign` FOREIGN KEY (`invitation_id`) REFERENCES `invitations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
