/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.14-MariaDB-log : Database - perhitungan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`perhitungan` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `perhitungan`;

/*Table structure for table `akar` */

DROP TABLE IF EXISTS `akar`;

CREATE TABLE `akar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `input` double NOT NULL,
  `angka` double NOT NULL,
  `waktu` double NOT NULL,
  `jenis` enum('API','PL-SQL') COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `akar` */

insert  into `akar`(`id`,`input`,`angka`,`waktu`,`jenis`,`last_used_at`,`created_at`,`updated_at`) values 
(1,5,2,0,'API',NULL,'2023-09-18 07:46:17','2023-09-18 07:46:17'),
(2,2,1.4142156862745,0.0059604644775391,'API',NULL,'2023-09-18 07:50:53','2023-09-18 07:50:53'),
(3,6,2.4494897959184,0.0081062316894531,'API',NULL,'2023-09-18 07:52:06','2023-09-18 07:52:06'),
(4,120,10.954451151295,0.010013580322266,'API',NULL,'2023-09-18 07:52:49','2023-09-18 07:52:49'),
(5,100,10.000000000107,0.0090599060058594,'API',NULL,'2023-09-18 07:54:18','2023-09-18 07:54:18'),
(6,100,10.000000000107,0.0090599060058594,'API',NULL,'2023-09-18 08:14:06','2023-09-18 08:14:06'),
(7,100,10.000000000107,0.010013580322266,'API',NULL,'2023-09-18 08:14:37','2023-09-18 08:14:37'),
(8,100,10.000000000107,0.0090599060058594,'API',NULL,'2023-09-18 08:15:54','2023-09-18 08:15:54'),
(9,100,10.000000000107,0.010013580322266,'API',NULL,'2023-09-18 08:16:14','2023-09-18 08:16:14'),
(10,100,10.000000000107,0.010013580322266,'API',NULL,'2023-09-18 08:18:12','2023-09-18 08:18:12'),
(11,5,2.2360679779158,0.0078678131103516,'API',NULL,'2023-09-18 08:18:43','2023-09-18 08:18:43'),
(12,100,10.000000000107,0.011205673217773,'API',NULL,'2023-09-18 08:19:21','2023-09-18 08:19:21'),
(13,300,17.320508075693,0.010013580322266,'API',NULL,'2023-09-18 08:20:10','2023-09-18 08:20:10'),
(14,400,20.00000000028,0.010013580322266,'API',NULL,'2023-09-18 08:20:27','2023-09-18 08:20:27'),
(15,700,26.457513311622,0.010013580322266,'API',NULL,'2023-09-18 08:20:54','2023-09-18 08:20:54'),
(16,100,10.000000000107445,0,'PL-SQL',NULL,NULL,NULL),
(17,100,10.000000000107445,0,'PL-SQL',NULL,'2023-09-18 17:48:08','2023-09-18 17:48:08');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2023_09_18_072549_akar',2);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

/* Procedure structure for procedure `akar` */

/*!50003 DROP PROCEDURE IF EXISTS  `akar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `akar`()
BEGIN
    DECLARE times_mulai DOUBLE;
    DECLARE angka DOUBLE;
    DECLARE hasil DOUBLE;
    DECLARE epsilon DOUBLE;
    DECLARE times_selesai DOUBLE;
    DECLARE selisih_milidetik INT;
    DECLARE selisih TIME;
    -- declare selisih  double;
    -- declare selisih_milidetik double;
    
    SET angka := bil;
    SET hasil := angka / 2; 
    SET epsilon := 0.00001; 
  
    -- Iterasi hingga mendapatkan akurasi yang memadai
    SET times_mulai = NOW(6)+0;
    simple_loop: LOOP
        SET hasil := (hasil + angka / hasil) / 2;
        
        IF ABS(hasil * hasil - angka) < epsilon THEN
            LEAVE simple_loop;
        END IF;
    END LOOP;
    
    SET times_selesai = NOW(6)+0;
    -- set times_mulai = unix_TIMESTAMP(times_mulai) * 1000;
    -- SET times_selesai = unix_TIMESTAMP(times_selesai) * 1000;
    -- set selisih = times_selesai - times_mulai;
  
    
    -- Menghitung selisih waktu hingga milidetik
    SET selisih = TIMEDIFF(times_selesai, times_mulai);
    
    -- Mengonversi selisih waktu dalam milidetik
    SET selisih_milidetik = (
        HOUR(selisih) * 3600 + MINUTE(selisih) * 60 + SECOND(selisih)
    ) * 1000 + MICROSECOND(selisih) / 1000;
    
    -- Hasil akar kuadrat
    SELECT MICROSECOND(selisih) /1000 AS result;
    -- SELECT  concat('hasil perhitungan : ',hasil,' selisih waktu :',selisih_milidetik/1000) AS result;
    INSERT INTO akar (input, angka, waktu,jenis)
    VALUES (bil,hasil,selisih_milidetik/1000,'PL-SQL');
END */$$
DELIMITER ;

/* Procedure structure for procedure `hitungAkar` */

/*!50003 DROP PROCEDURE IF EXISTS  `hitungAkar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `hitungAkar`(IN bil DECIMAL(10,2))
BEGIN
    DECLARE times_mulai DOUBLE;
    DECLARE angka DOUBLE;
    DECLARE hasil DOUBLE;
    DECLARE epsilon DOUBLE;
    DECLARE times_selesai DOUBLE;
    DECLARE selisih_milidetik INT;
    DECLARE selisih TIME;
    -- declare selisih  double;
    -- declare selisih_milidetik double;
    
    SET angka := bil;
    SET hasil := angka / 2; 
    SET epsilon := 0.00001; 
  
    -- Iterasi hingga mendapatkan akurasi yang memadai
    SET times_mulai = NOW(6)+0;
    simple_loop: LOOP
        SET hasil := (hasil + angka / hasil) / 2;
        
        IF ABS(hasil * hasil - angka) < epsilon THEN
            LEAVE simple_loop;
        END IF;
    END LOOP;
    
    SET times_selesai = NOW(6)+0;
    -- set times_mulai = unix_TIMESTAMP(times_mulai) * 1000;
    -- SET times_selesai = unix_TIMESTAMP(times_selesai) * 1000;
    -- set selisih = times_selesai - times_mulai;
  
    
    -- Menghitung selisih waktu hingga milidetik
    SET selisih = TIMEDIFF(times_selesai, times_mulai);
    
    -- Mengonversi selisih waktu dalam milidetik
    SET selisih_milidetik = (
        HOUR(selisih) * 3600 + MINUTE(selisih) * 60 + SECOND(selisih)
    ) * 1000 + MICROSECOND(selisih) / 1000;
    
    -- Hasil akar kuadrat
    SELECT MICROSECOND(selisih) /1000 AS result;
    -- SELECT  concat('hasil perhitungan : ',hasil,' selisih waktu :',selisih_milidetik/1000) AS result;
    INSERT INTO akar (input, angka, waktu,jenis,created_at, updated_at)
    VALUES (bil,hasil,selisih_milidetik/1000,'PL-SQL',now(),now());
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
