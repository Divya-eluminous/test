-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Aug 23, 2021 at 10:44 AM
-- Server version: 5.7.28
-- PHP Version: 7.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-api`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('09ec643d76b35ed10091c3a9f1db9067c3b8dada2f74bb61b3420554d671dcec8e61f1cf2d64c378', 1, 1, 'authToken', '[]', 0, '2021-08-06 03:26:08', '2021-08-06 03:26:08', '2022-08-06 08:56:08'),
('c35bdfef96f523b82b4f9417266b4c9f26a3bf614f50b42403c390b1291126fbf5cbaaae66434f47', 1, 1, 'authToken', '[]', 0, '2021-08-06 03:26:45', '2021-08-06 03:26:45', '2022-08-06 08:56:45'),
('e2a128d4522f1a9cd100b2334f9d8be3d60bab42623f09dde1dee79d73342a4091369a5153f6ee32', 1, 1, 'authToken', '[]', 0, '2021-08-06 03:27:11', '2021-08-06 03:27:11', '2022-08-06 08:57:11'),
('6634d19ed7fde22c748dd5e73c9c09db0807dbb0bec371897f1832f31dffef04f5ff0e0def939aa0', 2, 1, 'testtoken', '[]', 0, '2021-08-06 03:41:12', '2021-08-06 03:41:12', '2022-08-06 09:11:12'),
('b8be11457a16d684532b860a7ab8b39724120fd4b51ce816665d787fd3dbf832870896679577a622', 1, 1, 'testtoken', '[]', 0, '2021-08-06 03:56:30', '2021-08-06 03:56:30', '2022-08-06 09:26:30'),
('87776827ef91d697f1f25fda56d0d78b23435b5640b1cf165e5d122435c12883ec782e6ac538ad12', 1, 1, 'testtoken', '[]', 0, '2021-08-06 03:56:58', '2021-08-06 03:56:58', '2022-08-06 09:26:58'),
('cb543b047d9094582e0160dcc9976c3d14e1c328b48638fd2b9baafd965df605e1db883e4d096b4d', 1, 1, 'testtoken', '[]', 0, '2021-08-06 04:09:00', '2021-08-06 04:09:00', '2022-08-06 09:39:00'),
('0839614852dd4aa8f6727c358e1d84d99c2254134a0d7effe0bb665f68567fdc43c7cab696034704', 1, 1, 'testtoken', '[]', 0, '2021-08-06 04:56:32', '2021-08-06 04:56:32', '2022-08-06 10:26:32'),
('26ed58bb953137e7383fe0e19679aedac0fc64eb29f536794cd02e76f8751e9b39db59f78f8634f5', 1, 1, 'testtoken', '[]', 0, '2021-08-06 05:53:27', '2021-08-06 05:53:27', '2022-08-06 11:23:27'),
('db0d27c1d9a7781d841ba8b956f7c87a617bf78eca31e0567f373e0faaf0ab70d1dedc24e27db54f', 3, 1, 'testtoken', '[]', 0, '2021-08-06 06:23:35', '2021-08-06 06:23:35', '2022-08-06 11:53:35'),
('43acfdf9f5f1b372c0fe3aed0282d00491de5484b286b29f8b467df3dedff27ed72ef9d742e4ded9', 4, 1, 'testtoken', '[]', 0, '2021-08-06 06:23:47', '2021-08-06 06:23:47', '2022-08-06 11:53:47'),
('d5eb773d2c61159644b95860f62bfb146f0f88df4bc6020d36ce0ccb6c0f2521386fdabdb1fba80f', 5, 1, 'testtoken', '[]', 0, '2021-08-06 06:24:01', '2021-08-06 06:24:01', '2022-08-06 11:54:01'),
('9732d9a644ba8b708d75a4a540fb717d72bf3685fc4435b82c9a8ff8e657992c2e2d4f7157be5cf6', 6, 1, 'testtoken', '[]', 0, '2021-08-06 06:45:30', '2021-08-06 06:45:30', '2022-08-06 12:15:30'),
('edc6f15c3906ed311d72489f49bd230080412be0cc322b1439fe80e965b6433d17b72b1bfcb51b74', 7, 1, 'testtoken', '[]', 0, '2021-08-06 06:50:59', '2021-08-06 06:50:59', '2022-08-06 12:20:59'),
('69d58f20515a5bc1a3bc1c1bff0d5e90ed9fdf72f7b22950f05947e47598ff13ac8136c7ceedd3b8', 8, 1, 'testtoken', '[]', 0, '2021-08-06 06:51:52', '2021-08-06 06:51:52', '2022-08-06 12:21:52'),
('26e88bee1763364e146196422d0913e73af54c491953301c0e229423ce32a3a86df7bee02309ad05', 9, 1, 'testtoken', '[]', 0, '2021-08-06 07:16:16', '2021-08-06 07:16:16', '2022-08-06 12:46:16'),
('38d875147cb3afdd42fd8f60a29cd8b2c73208a661d77dfa86d17d71554b9864163306221209b657', 10, 1, 'testtoken', '[]', 0, '2021-08-06 07:16:28', '2021-08-06 07:16:28', '2022-08-06 12:46:28'),
('0b47ccdc92a5896f40f4b9a17183169364bfbff6329c2f1fe1da255065d79b5d17894aac6983dde7', 1, 1, 'testtoken', '[]', 0, '2021-08-09 00:04:10', '2021-08-09 00:04:10', '2022-08-09 05:34:10'),
('e4a6f89f58e0d9a298b4584dbca6c2fac6241a7c4b7c1830cb3d28d7a8d4136451643efe669ce0d9', 11, 1, 'testtoken', '[]', 0, '2021-08-09 00:05:34', '2021-08-09 00:05:34', '2022-08-09 05:35:34'),
('433295dca9b964f23afcd0e7997a06a07a9cd95f93f3a723abbc891aea4df1d460aff0efc0a91eb0', 1, 1, 'testtoken', '[]', 0, '2021-08-09 00:06:28', '2021-08-09 00:06:28', '2022-08-09 05:36:28'),
('c00ad93a3a677c01802d828345405d209a44129e559f61bbc28ae63f13fa012386005c08987d3c58', 1, 1, 'testtoken', '[]', 0, '2021-08-09 00:07:35', '2021-08-09 00:07:35', '2022-08-09 05:37:35'),
('b1a300ad3d8ebf5b3dcd2acd70b551a2a493effc12fa2cc94b0cafc197c10beaa673da4287dc163d', 1, 1, 'testtoken', '[]', 0, '2021-08-09 01:46:56', '2021-08-09 01:46:56', '2022-08-09 07:16:56'),
('241217dd6ba2cccdf9ef8c5e3312e0faef8b2fdd0b19de76b85234041774935ab96ac7d525a51ca3', 12, 1, 'testtoken', '[]', 0, '2021-08-09 03:54:45', '2021-08-09 03:54:45', '2022-08-09 09:24:45'),
('d9dbbcc24fd4fd94f454f657a43428571cfda89780179a14f3d00f380e6e675dc373e50acf6c6a47', 13, 1, 'testtoken', '[]', 0, '2021-08-09 03:55:48', '2021-08-09 03:55:48', '2022-08-09 09:25:48'),
('630522a092771aa1eea7f171eae5e82e35def7860edce0bb5bc27e009508fda6f3b963a25b9e56b2', 5, 1, 'authtoken', '[]', 0, '2021-08-09 04:57:05', '2021-08-09 04:57:05', '2022-08-09 10:27:05'),
('f1252da95a6389608a67fc43e2444f586044f7edb237c3f17e6d5c13c92443d09bbb059b6432f2eb', 1, 1, 'authtoken', '[]', 0, '2021-08-09 04:58:08', '2021-08-09 04:58:08', '2022-08-09 10:28:08'),
('5f6900cf6c091ba86bf4df479a26d85ffcc17dad1147c9deb1b3ef1dba33105d2b0243495eda2492', 12, 1, 'authtoken', '[]', 0, '2021-08-09 05:05:41', '2021-08-09 05:05:41', '2022-08-09 10:35:41'),
('3230d03959bf428952b241f5ca3c919664eaae90a51255fbbb2c8a67e125b2a7f0971a4de712a9eb', 12, 1, 'authtoken', '[]', 0, '2021-08-09 05:06:54', '2021-08-09 05:06:54', '2022-08-09 10:36:54'),
('8bee2498df0608e9209d22591e5c2d149dc3304d7f0d0e07e3dab92519bf7aeff870f9987fc621f7', 2, 1, 'authtoken', '[]', 0, '2021-08-09 05:34:17', '2021-08-09 05:34:17', '2022-08-09 11:04:17'),
('8fc76bad595b6edaa2e06e6805801d41897c7ace48053025fd3832b69d4cc0767a9c06f55ec1b6b3', 3, 1, 'authtoken', '[]', 0, '2021-08-09 05:34:41', '2021-08-09 05:34:41', '2022-08-09 11:04:41'),
('67e8704583e9267a381b123fd62698a69b8b03b1b9e0aaa08e425e3ed07aa4caafcad81e7a436d26', 4, 1, 'authtoken', '[]', 0, '2021-08-09 05:35:23', '2021-08-09 05:35:23', '2022-08-09 11:05:23'),
('a93b286e1abcb804c1a8c536310ba4c9f75570b5755dbc802fca57564c39d0973065c2937500e896', 12, 1, 'authtoken', '[]', 0, '2021-08-09 05:36:30', '2021-08-09 05:36:30', '2022-08-09 11:06:30'),
('34b1ee81fe4c66d0dc712c8fe666127b602fd49bed3fb6a0708d94443b6ff8cfadc688d52f899503', 5, 1, 'authtoken', '[]', 0, '2021-08-09 06:53:48', '2021-08-09 06:53:48', '2022-08-09 12:23:48'),
('76786472b53f7ddd67f46c1e9d8ab24bbfacb5869be1730b62578a0e417e905cbd064ad530150b56', 6, 1, 'authtoken', '[]', 0, '2021-08-09 06:54:02', '2021-08-09 06:54:02', '2022-08-09 12:24:02'),
('3d1c550d277dac9396dccb8ab9c59be87b007024b525e153f0f3e97a61829f5f9dfac54be26b6273', 7, 1, 'authtoken', '[]', 0, '2021-08-09 06:54:16', '2021-08-09 06:54:16', '2022-08-09 12:24:16'),
('973612835090ca2336b97f9c89f7a4084948e461c694c6fa42146bfa9e97f6e719fdfd5c05283e31', 8, 1, 'authtoken', '[]', 0, '2021-08-09 06:56:56', '2021-08-09 06:56:56', '2022-08-09 12:26:56'),
('e45aca28a277ed6763de7e88f1f50001895e6f3d89be0df32d8358785f2f0fb6d2c13ad2f11bf5bf', 9, 1, 'authtoken', '[]', 0, '2021-08-09 06:57:04', '2021-08-09 06:57:04', '2022-08-09 12:27:04'),
('271810a5f2c224c8878b52c19433df41f0788961bfa6b84cfc182ff25b633eb64784881aeb61747f', 12, 1, 'authtoken', '[]', 0, '2021-08-09 07:13:52', '2021-08-09 07:13:52', '2022-08-09 12:43:52'),
('1e0b610e8c46a941da26ca08174ed10980209fc93915b0a1d37a55403f6c7f4ad28901f7f85950bb', 12, 1, 'authtoken', '[]', 0, '2021-08-09 07:14:26', '2021-08-09 07:14:26', '2022-08-09 12:44:26');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'adBrJ6RYfnZGCA6vjRqi2T6W8HpKljC0IqYxIF3I', NULL, 'http://localhost', 1, 0, 0, '2021-08-06 01:36:17', '2021-08-06 01:36:17'),
(2, NULL, 'Laravel Password Grant Client', 'KehvtiInjdzhRVCDFYx8SS681hwPguQK4oaqGG3A', 'users', 'http://localhost', 0, 1, 0, '2021-08-06 01:36:17', '2021-08-06 01:36:17');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-08-06 01:36:17', '2021-08-06 01:36:17');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'divya', 'divs@gmail.com', '$2y$10$lFotyUncTx2289O7oVMLi.yI8n1dJszTRGO/nZUd0dCFfIrMWj6rm', '2021-08-09 04:58:08', '2021-08-09 04:58:08'),
(2, 'swati', 'swati@gmail.com', '$2y$10$n6NcbHyqsV6aMt/5YVdRB.3/Gu2bF1MPY.5PqXsppqnfiFAn66H0y', '2021-08-09 05:34:17', '2021-08-09 05:34:17'),
(3, 'seeya', 'seeya@gmail.com', '$2y$10$42bHPzxRFuCBYQwI3dsO5eOAvHvJRh3awgVmEQ3qSGvTqQkHvpAqm', '2021-08-09 05:34:41', '2021-08-09 11:05:15'),
(4, 'tarun', 'tarun@gmail.com', '$2y$10$cGepkk8u.lUdcq1Hm7P7XOvj4zQmhodi..4uodL9eY7fuwQ9EwMaa', '2021-08-09 05:35:23', '2021-08-09 05:35:23'),
(5, 'diya', 'diya@gmail.com', '$2y$10$BrdFoQw2gv5X7yDbP0wDeO/3CbJu6hvm1WcBc0RkQ9DoKxLBp65Py', '2021-08-09 06:53:48', '2021-08-09 06:53:48'),
(6, 'divyanka', 'divyanka@gmail.com', '$2y$10$OPgqDp.KOftOX5xR4hK5SOHsdKMGPYJnppzlPxU0xTPHJ5BNK7H8O', '2021-08-09 06:54:02', '2021-08-09 06:54:02'),
(7, 'divsena', 'divsena@gmail.com', '$2y$10$WO7ptPJDhbOE/mysiyzJqe/9A7bm0Uj2W1u0bsg2ctcZYI4AWyLOG', '2021-08-09 06:54:16', '2021-08-09 06:54:16'),
(8, 'divya', 'd121@gmail.com', '$2y$10$.1/MjBpCyA0A5GGrFE3nEOJAwWKN7js4GBFVQ.nJcqZOumY2GQr.S', '2021-08-09 06:56:56', '2021-08-09 06:56:56'),
(9, 'divya', 'diksha@gmail.com', '$2y$10$JubS4jwJEAOb6dJbc5uXhebrubzor7wIKxoW/df/I6w/4iZ9Iy/yq', '2021-08-09 06:57:04', '2021-08-09 06:57:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ema
                il_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `ema
                il_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'divya', 'divya@gmail.com', NULL, '$2y$10$wbw4hFuyDbxM4Rkrxz/3g.ejY80dvbELZZxgwhL16vgtKz5POdUWe', NULL, '2021-08-06 03:27:11', '2021-08-06 03:27:11'),
(2, 'seeya', 'seeya@gmail.com', NULL, '$2y$10$MD4UyzIVfpXL0oacrYQ1RujQdVat1IGrpT1ClmkF9h0.RJknbxlHG', NULL, '2021-08-06 03:41:12', '2021-08-06 03:41:12'),
(3, 'Neena', 'neena@gmail.com', NULL, '$2y$10$T0vO1T/CX2tT2d7pm8G/nuw44dyfGes72xyxEQZLN4uwhay4giPd6', NULL, '2021-08-06 06:23:35', '2021-08-06 06:23:35'),
(6, 'Priti', 'priti@gmail.com', NULL, '$2y$10$zWfVF2wir3tH9BjbCVXGze7hv2MoD043ZvFmMK5VMkoZMPXK9ind6', NULL, '2021-08-06 06:45:30', '2021-08-06 06:45:30'),
(7, 'sreya', 'sreya@gmail.com', NULL, '$2y$10$RZtA.yNe8xh77uqX3y/W6uh5tMOyfXyCSyhGNAvwuFgMn0J5P6nY6', NULL, '2021-08-06 06:50:59', '2021-08-06 06:50:59'),
(8, 'maru', 'maruni@gmail.com', NULL, '$2y$10$r4HuudNqlt75tMJEKbFvU.aFR3uLDZrzWRNvO4vYlFwvePw3A/1h.', NULL, '2021-08-06 06:51:52', '2021-08-06 06:51:52'),
(9, 'shital', 'shital@gmail.com', NULL, '$2y$10$MTniAXvyhLbmeAiFYMN7a.HSLlxmbXZ.pONVs1HbCVOBV3iIhmBcW', NULL, '2021-08-06 07:16:16', '2021-08-06 07:16:16'),
(10, 'harshada', 'harshada@gmail.com', NULL, '$2y$10$78y4wGcLIOi7xwWEKEqnpOs1/.rLXMro8FPqu7PJo/VEM9HtD1Ik.', NULL, '2021-08-06 07:16:28', '2021-08-06 07:16:28'),
(11, 'teena', 'teena@gmail.com', NULL, '$2y$10$Z8l/T8oo3Ydf1qFc54qy3eZyOePhr2MYp6AMq.fRonUAJrIqn2aSK', NULL, '2021-08-09 00:05:34', '2021-08-09 00:05:34'),
(12, 'divya Lokhande', 'divs@gmail.com', NULL, '$2y$10$5bIyM2mosF65UWoZffz.NebLcEazravZ9gh8pAHBBkKSXGLLitVRe', NULL, '2021-08-09 03:54:45', '2021-08-09 03:54:45'),
(13, 'Smita', 'smita@gmail.com', NULL, '$2y$10$Rt8eA7fs1tCSEstN6F8tE.lN6IONcBXjOj6siGzWgGvHBlk3O5oLm', NULL, '2021-08-09 03:55:48', '2021-08-09 03:55:48');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
