-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2025 at 06:31 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `multi_vendor`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `country` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `full_name`, `phone`, `address`, `city`, `district`, `postal_code`, `country`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sohel Rana', '01700000001', 'House 12, Road 4, Dhanmondi', 'Dhaka', 'Dhaka', '1209', 'Bangladesh', 1, '2025-11-02 18:23:17', '2025-11-02 18:23:17'),
(2, 2, 'Rana', '01700000002', 'House 22, Block B, Mirpur', 'Dhaka', 'Dhaka', '1216', 'Bangladesh', 1, '2025-11-02 18:23:17', '2025-11-02 18:23:17'),
(3, 3, 'Sulov', '01700000003', 'Flat 5B, Road 10, Gulshan', 'Dhaka', 'Dhaka', '1212', 'Bangladesh', 1, '2025-11-02 18:23:17', '2025-11-02 18:23:17'),
(4, 4, 'Ali', '01700000004', 'Village: Modhupur, Post: Modhupur', 'Tangail', 'Dhaka', '1996', 'Bangladesh', 1, '2025-11-02 18:23:17', '2025-11-02 18:23:17'),
(5, 5, 'Madani', '01700000005', 'Holding 34, Station Road', 'Chittagong', 'Chittagong', '4000', 'Bangladesh', 1, '2025-11-02 18:23:17', '2025-11-02 18:23:17'),
(6, 6, 'Ahad', '01700000006', 'Purbo Bazar, Sylhet Sadar', 'Sylhet', 'Sylhet', '3100', 'Bangladesh', 1, '2025-11-02 18:23:17', '2025-11-02 18:23:17'),
(7, 7, 'Rahim Uddin', '01800000001', 'House 15, Road 7, Mohammadpur', 'Dhaka', 'Dhaka', '1207', 'Bangladesh', 1, '2025-11-02 18:24:10', '2025-11-02 18:24:10'),
(8, 8, 'Karim Hossain', '01800000002', 'Holding 22, College Road', 'Narsingdi', 'Dhaka', '1600', 'Bangladesh', 1, '2025-11-02 18:24:10', '2025-11-02 18:24:10'),
(9, 9, 'Nusrat Jahan', '01800000003', 'Flat 3A, Green View Apartment', 'Chittagong', 'Chittagong', '4000', 'Bangladesh', 1, '2025-11-02 18:24:10', '2025-11-02 18:24:10'),
(10, 10, 'Sadia Akter', '01800000004', 'House 18, Road 9, Uttara', 'Dhaka', 'Dhaka', '1230', 'Bangladesh', 1, '2025-11-02 18:24:10', '2025-11-02 18:24:10'),
(11, 11, 'Hasan Ali', '01800000005', 'Village: Charpara, Post: Mymensingh', 'Mymensingh', 'Mymensingh', '2200', 'Bangladesh', 1, '2025-11-02 18:24:10', '2025-11-02 18:24:10'),
(12, 12, 'Tania Rahman', '01800000006', 'Holding 45, Lake View', 'Rajshahi', 'Rajshahi', '6000', 'Bangladesh', 1, '2025-11-02 18:24:10', '2025-11-02 18:24:10'),
(13, 13, 'Jahidul Islam', '01800000007', 'Village: Kashipur, Post: Barisal Sadar', 'Barisal', 'Barisal', '8200', 'Bangladesh', 1, '2025-11-02 18:24:10', '2025-11-02 18:24:10'),
(14, 14, 'Farhana Mim', '01800000008', 'House 10, Road 3, Halishahar', 'Chittagong', 'Chittagong', '4003', 'Bangladesh', 1, '2025-11-02 18:24:10', '2025-11-02 18:24:10'),
(15, 15, 'Arif Chowdhury', '01800000009', 'Holding 90, Station Road', 'Sylhet', 'Sylhet', '3100', 'Bangladesh', 1, '2025-11-02 18:24:10', '2025-11-02 18:24:10'),
(16, 16, 'Rina Begum', '01800000010', 'Village: Boroitala, Post: Comilla Sadar', 'Comilla', 'Comilla', '3500', 'Bangladesh', 1, '2025-11-02 18:24:10', '2025-11-02 18:24:10');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `logo`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Apple', 'apple', 'apple.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(2, 'Samsung', 'samsung', 'samsung.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(3, 'Sony', 'sony', 'sony.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(4, 'LG', 'lg', 'lg.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(5, 'Dell', 'dell', 'dell.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(6, 'HP', 'hp', 'hp.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(7, 'Lenovo', 'lenovo', 'lenovo.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(8, 'Asus', 'asus', 'asus.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(9, 'Acer', 'acer', 'acer.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(10, 'Microsoft', 'microsoft', 'microsoft.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(11, 'Google', 'google', 'google.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(12, 'OnePlus', 'oneplus', 'oneplus.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(13, 'Xiaomi', 'xiaomi', 'xiaomi.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(14, 'Realme', 'realme', 'realme.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(15, 'Oppo', 'oppo', 'oppo.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(16, 'Vivo', 'vivo', 'vivo.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(17, 'Motorola', 'motorola', 'motorola.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(18, 'Nokia', 'nokia', 'nokia.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(19, 'Canon', 'canon', 'canon.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(20, 'Nikon', 'nikon', 'nikon.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(21, 'Panasonic', 'panasonic', 'panasonic.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(22, 'Philips', 'philips', 'philips.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(23, 'Toshiba', 'toshiba', 'toshiba.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(24, 'Sharp', 'sharp', 'sharp.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(25, 'Intel', 'intel', 'intel.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(26, 'AMD', 'amd', 'amd.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(27, 'Corsair', 'corsair', 'corsair.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(28, 'Kingston', 'kingston', 'kingston.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(29, 'SanDisk', 'sandisk', 'sandisk.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(30, 'Western Digital', 'western-digital', 'wd.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(31, 'Seagate', 'seagate', 'seagate.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(32, 'Razer', 'razer', 'razer.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(33, 'Logitech', 'logitech', 'logitech.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(34, 'BenQ', 'benq', 'benq.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(35, 'Alienware', 'alienware', 'alienware.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(36, 'MSI', 'msi', 'msi.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(37, 'Gigabyte', 'gigabyte', 'gigabyte.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(38, 'Cooler Master', 'cooler-master', 'coolermaster.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(39, 'Beats', 'beats', 'beats.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(40, 'JBL', 'jbl', 'jbl.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(41, 'Anker', 'anker', 'anker.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(42, 'TP-Link', 'tp-link', 'tplink.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(43, 'Ugreen', 'ugreen', 'ugreen.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(44, 'Baseus', 'baseus', 'baseus.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(45, 'Havit', 'havit', 'havit.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(46, 'Dell Alienware', 'dell-alienware', 'dellalienware.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(47, 'Xerox', 'xerox', 'xerox.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(48, 'Huawei', 'huawei', 'huawei.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(49, 'TCL', 'tcl', 'tcl.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(50, 'Hisense', 'hisense', 'hisense.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38'),
(51, 'Zebronics', 'zebronics', 'zebronics.png', 'active', '2025-11-13 19:03:38', '2025-11-13 19:03:38');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-admin@gmai.com|127.0.0.1', 'i:2;', 1763459890),
('laravel-cache-admin@gmai.com|127.0.0.1:timer', 'i:1763459890;', 1763459890);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `parent_id`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Electronics', 'electronics', NULL, 'fa-tv', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(2, 'Mobile Phones', 'mobile-phones', 1, 'fa-mobile', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(3, 'Laptops', 'laptops', 1, 'fa-laptop', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(4, 'Tablets', 'tablets', 1, 'fa-tablet', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(5, 'Cameras', 'cameras', 1, 'fa-camera', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(6, 'Accessories', 'accessories', 1, 'fa-headphones', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(7, 'Home Appliances', 'home-appliances', NULL, 'fa-home', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(8, 'Televisions', 'televisions', 7, 'fa-tv', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(9, 'Refrigerators', 'refrigerators', 7, 'fa-snowflake', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(10, 'Washing Machines', 'washing-machines', 7, 'fa-water', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(11, 'Kitchen Appliances', 'kitchen-appliances', 7, 'fa-blender', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(12, 'Microwaves', 'microwaves', 11, 'fa-microchip', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(13, 'Cookers', 'cookers', 11, 'fa-utensils', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(14, 'Fashion', 'fashion', NULL, 'fa-tshirt', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(15, 'Men Clothing', 'men-clothing', 14, 'fa-male', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(16, 'Women Clothing', 'women-clothing', 14, 'fa-female', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(17, 'Kids Clothing', 'kids-clothing', 14, 'fa-child', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(18, 'Shoes', 'shoes', 14, 'fa-shoe-prints', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(19, 'Beauty & Personal Care', 'beauty-personal-care', NULL, 'fa-heart', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(20, 'Makeup', 'makeup', 19, 'fa-magic', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(21, 'Skincare', 'skincare', 19, 'fa-leaf', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(22, 'Hair Care', 'hair-care', 19, 'fa-cut', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(23, 'Fragrances', 'fragrances', 19, 'fa-spray-can', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(24, 'Sports & Outdoors', 'sports-outdoors', NULL, 'fa-football-ball', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(25, 'Gym Equipment', 'gym-equipment', 24, 'fa-dumbbell', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(26, 'Cycling', 'cycling', 24, 'fa-bicycle', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(27, 'Camping', 'camping', 24, 'fa-campground', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(28, 'Toys & Games', 'toys-games', NULL, 'fa-gamepad', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(29, 'Baby Toys', 'baby-toys', 28, 'fa-baby', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(30, 'Board Games', 'board-games', 28, 'fa-chess', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(31, 'Books', 'books', NULL, 'fa-book', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(32, 'Fiction', 'fiction', 31, 'fa-feather', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(33, 'Non-fiction', 'non-fiction', 31, 'fa-lightbulb', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(34, 'Education', 'education', 31, 'fa-graduation-cap', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(35, 'Comics', 'comics', 31, 'fa-smile', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(36, 'Furniture', 'furniture', NULL, 'fa-couch', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(37, 'Living Room', 'living-room', 36, 'fa-tv', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(38, 'Bedroom', 'bedroom', 36, 'fa-bed', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(39, 'Office Furniture', 'office-furniture', 36, 'fa-chair', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(40, 'Garden', 'garden', 36, 'fa-leaf', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(41, 'Automotive', 'automotive', NULL, 'fa-car', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(42, 'Car Accessories', 'car-accessories', 41, 'fa-car-battery', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(43, 'Motorcycles', 'motorcycles', 41, 'fa-motorcycle', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(44, 'Tools', 'tools', 41, 'fa-wrench', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(45, 'Health & Wellness', 'health-wellness', NULL, 'fa-heartbeat', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(46, 'Medicines', 'medicines', 45, 'fa-capsules', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(47, 'Supplements', 'supplements', 45, 'fa-vial', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(48, 'Medical Equipment', 'medical-equipment', 45, 'fa-stethoscope', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(49, 'Pet Supplies', 'pet-supplies', NULL, 'fa-paw', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(50, 'Dog Supplies', 'dog-supplies', 49, 'fa-dog', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04'),
(51, 'Cat Supplies', 'cat-supplies', 49, 'fa-cat', 'active', '2025-11-13 19:04:04', '2025-11-13 19:04:04');

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_amount` decimal(10,2) NOT NULL,
  `vendor_amount` decimal(10,2) NOT NULL,
  `rate` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` enum('percentage','fixed') NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `min_order` decimal(10,2) NOT NULL DEFAULT 0.00,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `usage_limit` int(11) NOT NULL DEFAULT 0,
  `status` enum('active','expired') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_staff_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_charge` decimal(10,2) NOT NULL,
  `status` enum('assigned','picked','delivered','failed') NOT NULL DEFAULT 'assigned',
  `assigned_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_01_194405_create_roles_table', 1),
(5, '2025_11_01_200044_create_vendors_table', 1),
(6, '2025_11_01_200049_create_categories_table', 1),
(7, '2025_11_01_200144_create_brands_table', 1),
(8, '2025_11_01_200303_create_products_table', 1),
(9, '2025_11_01_200356_create_product_images_table', 1),
(10, '2025_11_01_200510_create_product_variants_table', 1),
(11, '2025_11_01_200525_create_coupons_table', 1),
(12, '2025_11_01_200536_create_addresses_table', 1),
(13, '2025_11_01_200558_create_orders_table', 1),
(14, '2025_11_01_200629_create_order_items_table', 1),
(15, '2025_11_01_200643_create_payments_table', 1),
(16, '2025_11_01_200657_create_commissions_table', 1),
(17, '2025_11_01_200711_create_payouts_table', 1),
(18, '2025_11_01_200721_create_deliveries_table', 1),
(19, '2025_11_01_200730_create_reviews_table', 1),
(20, '2025_11_01_200743_create_refunds_table', 1),
(21, '2025_11_01_200752_create_notifications_table', 1),
(22, '2025_11_01_200804_create_settings_table', 1),
(23, '2025_11_01_200813_create_wishlists_table', 1),
(24, '2025_11_01_200824_create_messages_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL,
  `payment_status` enum('pending','paid','failed','refunded') NOT NULL DEFAULT 'pending',
  `order_status` enum('pending','confirmed','processing','shipped','delivered','cancelled','returned') NOT NULL DEFAULT 'pending',
  `order_date` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `vendor_id`, `address_id`, `subtotal`, `shipping_cost`, `discount`, `total`, `payment_status`, `order_status`, `order_date`, `delivered_at`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'ORD-10001', 1, 1, 1, 450.00, 20.00, 10.00, 460.00, 'paid', 'delivered', '2025-10-01 10:30:00', '2025-10-05 16:00:00', 'Delivered successfully', '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(2, 'ORD-10002', 2, 3, 2, 870.00, 25.00, 0.00, 895.00, 'paid', 'pending', '2025-10-03 12:15:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(3, 'ORD-10003', 3, 5, 3, 250.00, 15.00, 0.00, 265.00, 'pending', 'confirmed', '2025-10-05 09:40:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-15 02:21:43'),
(4, 'ORD-10004', 4, 2, 4, 1150.00, 30.00, 50.00, 1130.00, 'paid', 'delivered', '2025-10-07 13:10:00', '2025-10-10 18:00:00', NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(5, 'ORD-10005', 5, 4, 5, 670.00, 20.00, 0.00, 690.00, 'paid', 'pending', '2025-10-09 11:00:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(6, 'ORD-10006', 6, 6, 6, 320.00, 10.00, 0.00, 330.00, 'paid', 'delivered', '2025-10-10 15:30:00', '2025-10-12 17:45:00', 'Left at doorstep', '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(7, 'ORD-10007', 7, 8, 7, 220.00, 15.00, 0.00, 235.00, 'failed', 'confirmed', '2025-10-11 10:00:00', NULL, 'Payment failed', '2025-11-13 19:15:36', '2025-11-15 02:28:26'),
(8, 'ORD-10008', 8, 9, 8, 1440.00, 50.00, 100.00, 1390.00, 'paid', 'processing', '2025-10-12 09:25:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-15 02:15:29'),
(9, 'ORD-10009', 9, 7, 9, 550.00, 10.00, 0.00, 560.00, 'paid', 'confirmed', '2025-10-13 08:15:00', '2025-10-16 14:30:00', NULL, '2025-11-13 19:15:36', '2025-11-15 06:50:19'),
(10, 'ORD-10010', 10, 10, 10, 800.00, 25.00, 20.00, 805.00, 'paid', 'confirmed', '2025-10-15 12:00:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(11, 'ORD-10011', 11, 11, 11, 310.00, 15.00, 0.00, 325.00, 'paid', 'delivered', '2025-10-16 09:00:00', '2025-10-18 15:00:00', NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(12, 'ORD-10012', 12, 12, 12, 640.00, 20.00, 40.00, 620.00, 'paid', 'shipped', '2025-10-17 10:45:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(13, 'ORD-10013', 13, 13, 13, 480.00, 15.00, 0.00, 495.00, 'pending', 'confirmed', '2025-10-18 08:40:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-15 02:13:00'),
(14, 'ORD-10014', 14, 14, 14, 1200.00, 35.00, 100.00, 1135.00, 'paid', 'delivered', '2025-10-19 16:00:00', '2025-10-23 11:00:00', NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(15, 'ORD-10015', 15, 15, 15, 210.00, 10.00, 0.00, 220.00, 'failed', 'cancelled', '2025-10-20 10:10:00', NULL, 'Card declined', '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(16, 'ORD-10016', 16, 16, 16, 890.00, 25.00, 0.00, 915.00, 'paid', 'processing', '2025-10-21 12:00:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(17, 'ORD-10017', 17, 17, 17, 330.00, 15.00, 0.00, 345.00, 'paid', 'shipped', '2025-10-22 09:30:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(18, 'ORD-10018', 18, 18, 18, 620.00, 20.00, 10.00, 630.00, 'paid', 'delivered', '2025-10-23 11:45:00', '2025-10-27 17:00:00', NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(19, 'ORD-10019', 19, 19, 19, 1400.00, 50.00, 200.00, 1250.00, 'paid', 'delivered', '2025-10-24 15:00:00', '2025-10-30 19:00:00', 'Delivered to office', '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(20, 'ORD-10020', 20, 20, 20, 500.00, 10.00, 0.00, 510.00, 'paid', 'confirmed', '2025-10-25 09:15:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(21, 'ORD-NCOFJ655JB', 19, NULL, NULL, 60000.00, 0.00, 0.00, 60000.00, 'pending', 'pending', '2025-11-17 10:16:24', NULL, NULL, '2025-11-17 04:16:24', '2025-11-17 04:16:24'),
(22, 'ORD-945VLWXNZF', 19, NULL, NULL, 85000.00, 0.00, 0.00, 85000.00, 'pending', 'pending', '2025-11-17 10:22:41', NULL, NULL, '2025-11-17 04:22:41', '2025-11-17 04:22:41'),
(23, 'ORD-QRVH3IA6VJ', 19, 18, NULL, 75000.00, 0.00, 0.00, 75000.00, 'pending', 'confirmed', '2025-11-17 10:28:54', NULL, NULL, '2025-11-17 04:28:54', '2025-11-17 12:16:42'),
(24, 'ORD-0GFDG4DBRV', 19, 18, NULL, 5000.00, 0.00, 0.00, 5000.00, 'pending', 'confirmed', '2025-11-17 11:20:03', NULL, NULL, '2025-11-17 05:20:04', '2025-11-17 12:16:41'),
(25, 'ORD-PMNOLXYSIN', 19, 18, NULL, 12000.00, 0.00, 3500.00, 8500.00, 'pending', 'pending', '2025-11-17 11:43:09', NULL, NULL, '2025-11-17 05:43:09', '2025-11-17 11:55:00'),
(26, 'ORD-IQ2B4CWSIG', 19, 18, NULL, 15500.00, 0.00, 3500.00, 12000.00, 'pending', 'confirmed', '2025-11-17 11:50:35', NULL, NULL, '2025-11-17 05:50:36', '2025-11-17 11:54:58'),
(27, 'ORD-CDVZPOHKMI', 19, 17, NULL, 18229.00, 0.00, 29.00, 18200.00, 'pending', 'pending', '2025-11-17 11:55:55', NULL, NULL, '2025-11-17 05:55:55', '2025-11-17 11:54:56'),
(28, 'ORD-YVUROPQHKS', 19, 16, NULL, 10700.00, 0.00, 200.00, 10500.00, 'pending', 'confirmed', '2025-11-17 12:16:40', NULL, NULL, '2025-11-17 06:16:40', '2025-11-17 11:54:44'),
(29, 'ORD-1YRTLAU9KO', 19, 18, NULL, 3000.00, 0.00, 1000.00, 87000.00, 'pending', 'pending', '2025-11-17 15:30:01', NULL, NULL, '2025-11-17 09:30:02', '2025-11-17 11:54:39'),
(30, 'ORD-KSQVOD9FZM', 19, 18, NULL, 6000.00, 0.00, 1000.00, 1314000.00, 'pending', 'confirmed', '2025-11-17 16:32:38', NULL, NULL, '2025-11-17 10:32:38', '2025-11-17 11:54:33');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `per_product_discount` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `vendor_id`, `quantity`, `price`, `per_product_discount`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 200.00, NULL, 200.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(2, 1, 2, 1, 1, 150.00, NULL, 150.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(3, 1, 3, 1, 1, 100.00, NULL, 100.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(4, 2, 4, 3, 2, 300.00, NULL, 600.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(5, 2, 5, 3, 1, 270.00, NULL, 270.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(6, 2, 6, 3, 1, 25.00, NULL, 25.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(7, 3, 7, 5, 2, 100.00, NULL, 200.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(8, 3, 8, 5, 1, 50.00, NULL, 50.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(9, 3, 9, 5, 1, 15.00, NULL, 15.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(10, 4, 10, 2, 1, 400.00, NULL, 400.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(11, 4, 11, 2, 2, 200.00, NULL, 400.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(12, 4, 12, 2, 1, 350.00, NULL, 350.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(13, 5, 13, 4, 2, 250.00, NULL, 500.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(14, 5, 14, 4, 1, 170.00, NULL, 170.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(15, 5, 15, 4, 1, 20.00, NULL, 20.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(16, 6, 16, 6, 1, 120.00, NULL, 120.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(17, 6, 17, 6, 2, 100.00, NULL, 200.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(18, 6, 18, 6, 1, 10.00, NULL, 10.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(19, 7, 19, 8, 1, 220.00, NULL, 220.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(20, 7, 20, 8, 1, 15.00, NULL, 15.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(21, 7, 21, 8, 1, 0.00, NULL, 0.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(22, 8, 22, 9, 1, 800.00, NULL, 800.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(23, 8, 23, 9, 2, 295.00, NULL, 590.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(24, 8, 24, 9, 1, 50.00, NULL, 50.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(25, 9, 25, 7, 1, 250.00, NULL, 250.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(26, 9, 26, 7, 2, 150.00, NULL, 300.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(27, 9, 27, 7, 1, 10.00, NULL, 10.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(28, 10, 28, 10, 2, 300.00, NULL, 600.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(29, 10, 29, 10, 1, 200.00, NULL, 200.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(30, 10, 30, 10, 1, 0.00, NULL, 0.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(31, 11, 31, 11, 1, 150.00, NULL, 150.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(32, 11, 32, 11, 2, 75.00, NULL, 150.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(33, 11, 33, 11, 1, 25.00, NULL, 25.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(34, 12, 34, 12, 2, 300.00, NULL, 600.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(35, 12, 35, 12, 1, 40.00, NULL, 40.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(36, 12, 36, 12, 1, 0.00, NULL, 0.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(37, 13, 37, 13, 2, 200.00, NULL, 400.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(38, 13, 38, 13, 1, 80.00, NULL, 80.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(39, 13, 39, 13, 1, 15.00, NULL, 15.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(40, 14, 40, 14, 1, 400.00, NULL, 400.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(41, 14, 41, 14, 2, 350.00, NULL, 700.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(42, 14, 42, 14, 1, 100.00, NULL, 100.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(43, 15, 43, 15, 1, 210.00, NULL, 210.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(44, 15, 44, 15, 1, 10.00, NULL, 10.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(45, 15, 45, 15, 1, 0.00, NULL, 0.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(46, 16, 46, 16, 1, 500.00, NULL, 500.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(47, 16, 47, 16, 1, 400.00, NULL, 400.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(48, 16, 48, 16, 1, 15.00, NULL, 15.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(49, 17, 49, 17, 1, 110.00, NULL, 110.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(50, 17, 50, 17, 2, 120.00, NULL, 240.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(51, 17, 51, 17, 1, 0.00, NULL, 0.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(52, 18, 52, 18, 1, 200.00, NULL, 200.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(53, 18, 53, 18, 2, 210.00, NULL, 420.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(54, 18, 54, 18, 1, 10.00, NULL, 10.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(55, 19, 55, 19, 2, 500.00, NULL, 1000.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(56, 19, 56, 19, 1, 400.00, NULL, 400.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(57, 19, 57, 19, 1, 0.00, NULL, 0.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(58, 20, 58, 20, 2, 250.00, NULL, 500.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(59, 20, 59, 20, 1, 10.00, NULL, 10.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(60, 20, 60, 20, 1, 0.00, NULL, 0.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(61, 21, 54, NULL, 1, 600000.00, NULL, 600000.00, '2025-11-17 04:16:24', '2025-11-17 04:16:24'),
(62, 22, 54, NULL, 1, 600000.00, NULL, 600000.00, '2025-11-17 04:22:42', '2025-11-17 04:22:42'),
(63, 22, 52, NULL, 1, 30000.00, NULL, 30000.00, '2025-11-17 04:22:42', '2025-11-17 04:22:42'),
(64, 23, 52, 18, 3, 30000.00, NULL, 90000.00, '2025-11-17 04:28:54', '2025-11-17 04:28:54'),
(65, 24, 49, 18, 2, 44444.00, NULL, 88888.00, '2025-11-17 05:20:04', '2025-11-17 05:20:04'),
(66, 25, 49, 18, 2, 44444.00, NULL, 88888.00, '2025-11-17 05:43:09', '2025-11-17 05:43:09'),
(67, 25, 42, 18, 2, 6500.00, NULL, 13000.00, '2025-11-17 05:43:09', '2025-11-17 05:43:09'),
(68, 26, 49, 18, 2, 44444.00, NULL, 88888.00, '2025-11-17 05:50:36', '2025-11-17 05:50:36'),
(69, 26, 42, 18, 3, 6500.00, NULL, 19500.00, '2025-11-17 05:50:36', '2025-11-17 05:50:36'),
(70, 27, 49, 18, 3, 44444.00, 2500.00, 133332.00, '2025-11-17 05:55:55', '2025-11-17 05:55:55'),
(71, 27, 42, 18, 3, 6500.00, 3500.00, 19500.00, '2025-11-17 05:55:56', '2025-11-17 05:55:56'),
(72, 27, 33, 16, 1, 899.00, 200.00, 899.00, '2025-11-17 05:55:56', '2025-11-17 05:55:56'),
(73, 27, 34, 17, 1, 35.00, 29.00, 35.00, '2025-11-17 05:55:56', '2025-11-17 05:55:56'),
(74, 28, 42, 18, 3, 6500.00, 3500.00, 19500.00, '2025-11-17 06:16:40', '2025-11-17 06:16:40'),
(75, 28, 33, 16, 1, 899.00, 200.00, 899.00, '2025-11-17 06:16:40', '2025-11-17 06:16:40'),
(76, 29, 52, 18, 3, 30000.00, 1000.00, 90000.00, '2025-11-17 09:30:03', '2025-11-17 09:30:03'),
(77, 30, 53, 19, 2, 600000.00, 1000.00, 1200000.00, '2025-11-17 10:32:38', '2025-11-17 10:32:38'),
(78, 30, 52, 18, 4, 30000.00, 1000.00, 120000.00, '2025-11-17 10:32:38', '2025-11-17 10:32:38');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `method` enum('sslcommerz','stripe','paypal','cod') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'BDT',
  `status` enum('pending','success','failed','refunded') NOT NULL DEFAULT 'pending',
  `payment_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payouts`
--

CREATE TABLE `payouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payout_method` enum('manual','bank','mobile') NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `status` enum('pending','paid','failed') NOT NULL DEFAULT 'pending',
  `requested_at` datetime NOT NULL,
  `paid_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `unit` varchar(50) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `status` enum('active','pending','inactive','draft') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `vendor_id`, `category_id`, `brand_id`, `name`, `slug`, `sku`, `price`, `discount_price`, `quantity`, `unit`, `short_description`, `description`, `thumbnail`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 'iPhone 15 Pro Max', 'iphone-15-pro-max', 'APL-15PM', 1499.00, 1500.00, 30, 'pcs', 'Apple flagship smartphone.', 'Latest A17 Pro chip with titanium frame.', 'iphone15promax.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(2, 2, 2, 2, 'Samsung Galaxy S24 Ultra', 'samsung-galaxy-s24-ultra', 'SAM-S24U', 1399.00, 230.00, 40, 'pcs', 'Premium Android flagship.', 'S Pen support and 200MP camera.', 'galaxys24ultra.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(3, 3, 3, 5, 'Dell XPS 15', 'dell-xps-15', 'DLL-XPS15', 1899.00, 200.00, 25, 'pcs', 'High performance ultrabook.', 'Intel i7 13th Gen with 32GB RAM.', 'dellxps15.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(4, 3, 3, 6, 'HP Envy x360', 'hp-envy-x360', 'HP-ENVY360', 1299.00, 100.00, 18, 'pcs', 'Convertible touchscreen laptop.', 'AMD Ryzen 7 7840U, 16GB RAM.', 'hpenvyx360.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(5, 3, 3, 7, 'Lenovo ThinkPad X1 Carbon', 'lenovo-x1-carbon', 'LNV-X1C', 1699.00, 500.00, 12, 'pcs', 'Lightweight business laptop.', 'Carbon fiber body, 14” QHD screen.', 'thinkpadx1.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(6, 4, 8, 4, 'LG OLED TV 65 Inch', 'lg-oled-65', 'LG-OLED65', 2499.00, 100.00, 15, 'pcs', '4K Smart OLED TV.', 'Ultra HD display with AI ThinQ.', 'lgoled65.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(7, 4, 8, 3, 'Sony Bravia 55 Inch', 'sony-bravia-55', 'SNY-BR55', 1199.00, 1099.00, 20, 'pcs', 'Smart LED TV with HDR.', 'Dolby Vision, Android TV OS.', 'sonybravia55.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(8, 5, 15, NULL, 'Men Formal Shirt', 'men-formal-shirt', 'FSH-MEN-01', 35.00, 29.00, 100, 'pcs', 'Comfortable formal cotton shirt.', 'Ideal for office wear.', 'menshirt.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(9, 5, 16, NULL, 'Women Summer Dress', 'women-summer-dress', 'FSH-WOM-01', 45.00, 39.00, 90, 'pcs', 'Light and colorful summer dress.', 'Cotton fabric, multiple sizes.', 'womendress.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(10, 5, 17, NULL, 'Kids Hoodie', 'kids-hoodie', 'FSH-KID-01', 25.00, 19.00, 60, 'pcs', 'Warm and soft hoodie for kids.', 'Available in 5 colors.', 'kidshoodie.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(11, 6, 5, 19, 'Canon EOS R6 II', 'canon-eos-r6-ii', 'CAN-R6II', 2499.00, 100.00, 10, 'pcs', 'Professional mirrorless camera.', '24MP full-frame sensor with dual pixel AF.', 'canonr6ii.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(12, 6, 5, 20, 'Nikon Z6 II', 'nikon-z6-ii', 'NIK-Z6II', 1999.00, 100.00, 10, 'pcs', 'Mirrorless full-frame camera.', 'Dual EXPEED processor with 4K video.', 'nikonz6ii.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(13, 6, 6, 40, 'Anker Soundcore Headphones', 'anker-soundcore', 'ANK-HD01', 89.00, 69.00, 200, 'pcs', 'Wireless Bluetooth headphones.', 'Noise cancellation and deep bass.', 'ankersoundcore.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(14, 7, 20, NULL, 'Maybelline Lipstick', 'maybelline-lipstick', 'MAY-LIP01', 12.99, 9.99, 200, 'pcs', 'Smooth and long lasting.', 'Variety of shades available.', 'lipstick.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(15, 7, 21, NULL, 'Nivea Face Wash', 'nivea-face-wash', 'NIV-FW01', 7.99, 5.99, 150, 'pcs', 'Refreshing and gentle cleanser.', 'Suitable for all skin types.', 'facewash.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(16, 7, 22, NULL, 'Dove Shampoo 500ml', 'dove-shampoo', 'DOV-SH500', 8.99, 7.49, 300, 'pcs', 'Moisturizing shampoo for silky hair.', 'Infused with argan oil.', 'doveshampoo.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(17, 8, 31, NULL, 'Harry Potter Box Set', 'harry-potter-box', 'BOOK-HP', 59.00, 49.00, 80, 'set', 'All 7 Harry Potter novels.', 'Collector’s hardcover edition.', 'hpbooks.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(18, 8, 32, NULL, 'The Great Gatsby', 'the-great-gatsby', 'BOOK-GG', 15.00, 12.00, 120, 'pcs', 'Classic fiction novel.', 'By F. Scott Fitzgerald.', 'greatgatsby.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(19, 8, 33, NULL, 'Educated by Tara Westover', 'educated-tara-westover', 'BOOK-EDU', 20.00, 17.00, 110, 'pcs', 'Bestselling autobiography.', 'A journey of self-discovery.', 'educated.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(20, 9, 36, 9, 'Wooden Sofa Set', 'wooden-sofa', 'FUR-SOFA01', 650.00, 599.00, 8, 'set', 'Elegant living room sofa set.', 'Made with high quality teak wood.', 'sofa.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(21, 9, 37, 9, 'Queen Size Bed', 'queen-size-bed', 'FUR-BED01', 499.00, 449.00, 10, 'set', 'Modern queen bed with storage.', 'Made of engineered wood.', 'bed.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(22, 9, 39, NULL, 'Garden Chair Set', 'garden-chair-set', 'FUR-GAR01', 199.00, 179.00, 20, 'set', 'Outdoor rattan chair set.', 'Weather-resistant design.', 'gardenchair.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(23, 10, 24, NULL, 'Football Adidas Tango', 'football-tango', 'SPT-FT01', 35.00, 29.00, 150, 'pcs', 'Official size 5 football.', 'High-quality leather material.', 'football.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(24, 10, 25, NULL, 'Dumbbell Set 20kg', 'dumbbell-set-20kg', 'GYM-DB20', 120.00, 99.00, 50, 'set', 'Rubber coated dumbbell set.', 'Durable and ergonomic grip.', 'dumbbell.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(25, 10, 26, NULL, 'Mountain Bike X300', 'mountain-bike-x300', 'SPT-BIKEX', 499.00, 449.00, 10, 'pcs', '21-speed mountain bike.', 'Aluminium frame with dual disc brakes.', 'mountainbike.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(26, 11, 49, NULL, 'Pedigree Dog Food 10kg', 'pedigree-dog-food', 'PET-DOG01', 49.00, 44.00, 100, 'bag', 'Nutritious food for adult dogs.', 'Made with real chicken and rice.', 'dogfood.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(27, 11, 50, NULL, 'Whiskas Cat Food 5kg', 'whiskas-cat-food', 'PET-CAT01', 39.00, 34.00, 90, 'bag', 'Tasty and healthy cat food.', 'Rich in salmon and vitamins.', 'catfood.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(28, 12, 1, 10, 'Microsoft Surface Pro 9', 'surface-pro-9', 'MS-SURF9', 1699.00, 100.00, 15, 'pcs', '2-in-1 detachable tablet PC.', 'Intel Evo i7 processor, 16GB RAM.', 'surfacepro9.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(29, 13, 5, 20, 'Nikon Coolpix B600', 'nikon-coolpix-b600', 'NIK-B600', 499.00, 120.00, 25, 'pcs', 'Compact superzoom camera.', '60x optical zoom, full HD video.', 'nikonb600.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(30, 14, 25, NULL, 'Treadmill X200', 'treadmill-x200', 'FIT-TM200', 899.00, 110.00, 12, 'pcs', 'Automatic foldable treadmill.', 'Speed range 0–16 km/h.', 'treadmill.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(31, 14, 27, NULL, 'Camping Tent 4 Person', 'camping-tent-4p', 'SPT-TENT4', 149.00, 129.00, 30, 'pcs', 'Weather-proof family tent.', 'Easy setup and ventilation.', 'tent.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(32, 15, 2, 13, 'Xiaomi Redmi Note 13', 'redmi-note-13', 'XIA-N13', 299.00, 269.00, 100, 'pcs', 'Midrange smartphone.', 'AMOLED 120Hz display.', 'redmi13.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(33, 16, 2, 11, 'Google Pixel 8', 'google-pixel-8', 'GOO-PX8', 899.00, 200.00, 60, 'pcs', 'Pure Android experience.', 'Tensor G3, 120Hz OLED.', 'pixel8.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(34, 17, 11, 17, 'Prestige Electric Kettle', 'prestige-kettle', 'KIT-KET01', 35.00, 29.00, 80, 'pcs', 'Stainless steel body.', '1.8L auto-shutoff kettle.', 'kettle.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(35, 18, 12, 18, 'Panasonic Microwave Oven', 'panasonic-microwave', 'MIC-OVEN01', 199.00, 10.00, 25, 'pcs', '23L solo microwave oven.', 'Touch panel and defrost option.', 'microwave.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(36, 19, 41, 23, 'TP-Link WiFi Router AX3000', 'tplink-router-ax3000', 'TPL-AX3K', 99.00, 89.00, 40, 'pcs', 'Dual band WiFi 6 router.', 'Up to 3000 Mbps speed.', 'tplinkax3000.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(37, 20, 15, NULL, 'Leather Jacket', 'leather-jacket', 'FSH-MEN-JKT', 120.00, 5.00, 70, 'pcs', 'Genuine leather winter jacket.', 'Slim fit design.', 'leatherjacket.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(38, 18, 3, 5, 'laptop 352', 'laptop-352', 'sku-25', 45000.00, 4000.00, 30, '350 g', NULL, '<p>NA</p>', NULL, 'pending', '2025-11-14 09:15:49', '2025-11-14 09:15:49'),
(39, 18, 3, 7, 'Lavono -356', 'lavono--356', 'sku-265', 65000.00, 6000.00, 30, '350 g', NULL, '<h3>powerful performance, and<strong> varied designs to suit d</strong>ifferent needs, from everyday use to professional tasks and gaming. They feature a wide array of specifications, including Intel or AMD processors, high-resolution displ<strong>ays, and features like enhan</strong>ced security, long battery life, and ergonomic keyboards.&nbsp;</h3>', 'images/product_thumbnail/lavono_-356.1763133894.jpg', 'pending', '2025-11-14 09:24:54', '2025-11-14 09:24:54'),
(41, 18, 2, 2, 'Samsung s25', 'samsung-s25', 'sku-2p5', 60000.00, 5000.00, 30, '350 g', NULL, '<p>N/A</p>', NULL, 'active', '2025-11-14 09:50:46', '2025-11-14 23:00:46'),
(42, 18, 2, 2, 'Samsung s65', 'samsung-s65', 'sku-2op5', 6500.00, 3500.00, 20, '350 g', NULL, '<p>naaa</p>', NULL, 'active', '2025-11-14 10:03:48', '2025-11-14 23:00:42'),
(43, 18, 2, 6, 'Samsung t25', 'ddff', 'sku-25a', 222222.00, 111111.00, 10, '350 g', NULL, '<p>dfgd</p>', NULL, 'active', '2025-11-14 10:07:49', '2025-11-14 23:00:40'),
(45, 18, 13, 12, 'laptop 352', '665', 'sku-25iii', 666.00, 60.00, 20, '350 g', 'kkkkk', '<p>gfffff</p>', 'F:\\Practtise_for_Idb\\PHP\\XAMMP\\tmp\\phpA65.tmp', 'draft', '2025-11-14 10:21:01', '2025-11-14 10:21:01'),
(47, 18, 13, 12, 'laptop 352', 'f665', 'sku-25issd', 666.00, 60.00, 20, '350 g', 'kkkkk', '<p>dsssssssss</p>', 'F:\\Practtise_for_Idb\\PHP\\XAMMP\\tmp\\php55FD.tmp', 'draft', '2025-11-14 10:23:33', '2025-11-14 10:23:33'),
(48, 18, 14, 14, 'abc', 'acee', 'acd', 123.00, 10.00, 30, '121212', 'hhhhhhhhhhh', '<p>dfffffffffff</p>', 'images/product_thumbnail/abc_1763142566.jpg', 'pending', '2025-11-14 11:49:26', '2025-11-14 11:49:26'),
(49, 18, 15, 14, 'laptoooo', 'rdffff', 'sddr', 44444.00, 2500.00, 4334, '121212', '4444444sdddddddddddddd', '<p>yyyyyyyyyyyyyy</p>', 'images/product_thumbnail/laptoooo_1763143279.jpg', 'active', '2025-11-14 12:01:19', '2025-11-14 22:23:40'),
(50, 18, 15, 14, 'laptoooo', 'rtfff', 'wq3r', 44444.00, 1000.00, 4334, '121212', '4444444sdddddddddddddd', '<p>efrgttttttttttt</p>', 'images/product_thumbnail/laptoooo_1763143366.jpg', 'active', '2025-11-14 12:02:46', '2025-11-14 15:01:37'),
(51, 18, 10, 12, 'hggggggg', 'gggggggg', 'gggh', 54554.00, 2000.00, 44, '545', 'rrrredgdgd', '<p>sertgsdg</p>', 'images/product_thumbnail/hggggggg_1763143488.jpg', 'pending', '2025-11-14 12:04:48', '2025-11-14 22:23:47'),
(52, 18, 2, 3, 'Sonny s54', 'sonny-s54', 'sku-sony-65', 30000.00, 1000.00, 10, '250g', 'SOny new Phone', NULL, 'images/product_thumbnail/sonny_s54_1763144188.jpg', 'active', '2025-11-14 12:16:28', '2025-11-14 22:09:47'),
(53, 19, 3, 5, 'Dell-3501', 'del-65', 'sku-del-65', 600000.00, 1000.00, 10, '250g', 'Brand New Laptop', '<p>ful display&nbsp;<br>size : 35inc</p><p>display: 6inc</p><p>battery -3600 mv</p>', 'images/product_thumbnail/dell-3501_1763190956.jpg', 'active', '2025-11-15 01:15:56', '2025-11-15 01:18:11'),
(54, 19, 3, 5, 'Dell-3501', 'oel-65', 'sku-del-p5', 600000.00, 60000.00, 10, '250g', 'Brand New Laptop', '<p>ful display&nbsp;<br>size : 35inc</p><p>display: 6inc</p><p>battery -3600 mv</p>', 'images/product_thumbnail/dell-3501_1763191028.jpg', 'active', '2025-11-15 01:17:08', '2025-11-15 01:17:54'),
(55, 19, 2, 3, 'fgfgfgfgfgfgt', 'dffddf', 'dffd', 2550000.00, 10200.00, 11, '111', 'ghfgbdfgdfgddf', '<p>fddfgffdfd</p>', 'images/product_thumbnail/fgfgfgfgfgfgt_1763461018.jpg', 'active', '2025-11-18 04:16:58', '2025-11-18 04:19:26'),
(56, 9, 3, 5, 'Dell Inspiron 15 3000 Series', 'dell-inspiron-15-3000', 'sku-dell-15', 65999.00, 2500.00, 10, '250g', 'Dell Inspiron 15 3000 Series\r\nA reliable 15.6-inch laptop with Intel Core i5 processor, 8GB RAM, 512GB SSD, and Intel Iris Xe graphics. Runs Windows 11, features HD display, multiple ports, and long-lasting battery—ideal for everyday tasks and project demos.', '<h3><strong>Laptop Name:</strong> Dell Inspiron 15 3000 Series</h3><p><strong>1. Processor (CPU):</strong></p><p>Intel Core i5 11th Gen (i5-1135G7)</p><p>Quad-core, 2.4 GHz base frequency, up to 4.2 GHz turbo</p><p><strong>2. RAM:</strong></p><p>8GB DDR4 (expandable up to 16GB)</p><p><strong>3. Storage:</strong></p><p>512GB SSD (fast boot and load times)</p><p><strong>4. Display:</strong></p><p>15.6-inch FHD (1920 x 1080) Anti-Glare LED-backlit</p><p>Wide viewing angles, good for presentations</p><p><strong>5. Graphics:</strong></p><p>Intel Iris Xe integrated graphics</p><p><strong>6. Operating System:</strong></p><p>Windows 11 Home</p><p><strong>7. Ports &amp; Connectivity:</strong></p><p>2 × USB 3.2</p><p>1 × USB 2.0</p><p>1 × HDMI 1.4b</p><p>SD card reader</p><p>Wi-Fi 6, Bluetooth 5.1</p><p><strong>8. Battery:</strong></p><p>3-cell, 41 Whr, up to 7–8 hours typical usage</p><p><strong>9. Weight:</strong></p><p>Approx 1.83 kg</p><p><strong>10. Additional Features:</strong></p><p>HD webcam</p><p>Backlit keyboard (on some models)</p><p>Stereo speakers with Waves MaxxAudio</p>', 'images/product_thumbnail/dell_inspiron_15_3000_series_1764087051.jpg', 'active', '2025-11-25 10:10:51', '2025-11-25 10:17:55'),
(57, 52, 5, 44, 'Canon EOS 5D Mark IV', 'canon-eos-5d-mark-iv', 'sku-cemera-e0s', 90599.00, 5000.00, 20, '1000gm', 'The camera description explains the type of camera you are using in your project, its features, and capabilities.', '<p><strong>Name:</strong> Canon EOS 5D Mark IV</p><p><strong>Type:</strong> DSLR</p><p><strong>Resolution:</strong> 30.4 MP</p><p><strong>Video Capability:</strong> 4K video recording</p><p><strong>Focus System:</strong> 61-point AF</p><p><strong>Special Features:</strong> Wi-Fi, Touch Screen, High ISO Range</p>', 'images/product_thumbnail/canon_eos_5d_mark_iv_1764088901.jpg', 'active', '2025-11-25 10:41:41', '2025-11-25 11:08:57'),
(58, 52, 6, 28, 'Logitech Ink Plus', 'logitech-ink-plus', 'sku-pen-e0s', 50.00, 5.00, 100, '20g', 'This pen is a high-precision digital stylus with tilt recognition and customizable buttons. It connects via Bluetooth and works seamlessly with our software for real-time writing and drawing.', '<ul><li><strong>Name:</strong> Logitech Ink Plus / Wacom Bamboo Ink (or your pen model)</li><li><strong>Type:</strong> Digital Stylus / Smart Pen</li><li><strong>Pressure Sensitivity:</strong> 4096–8192 levels (high precision for smooth strokes)</li><li><strong>Connectivity:</strong> Bluetooth / USB-C</li><li><strong>Compatibility:</strong> Works with tablets, laptops, or smart screens</li><li><strong>Special Features:</strong></li><li>Tilt recognition for natural drawing</li><li>Customizable shortcut buttons</li><li>Palm rejection for comfortable writing</li><li>Lightweight and ergonomic design</li></ul>', 'images/product_thumbnail/logitech_ink_plus_1764089246.jpg', 'active', '2025-11-25 10:47:26', '2025-11-25 11:08:41'),
(59, 52, 16, 39, 'Elegant Evening Gown', 'elegant-evening-gown', 'sku-dress-01', 6000.00, 500.00, 40, '1 pcs', 'This is an elegant evening gown made of soft silk with a flowing A-line design. It features delicate embroidery and is perfect for formal events or parties.', '<ul><li><strong>Name/Model:</strong> Elegant Evening Gown / Summer Casual Dress (replace with your model)</li><li><strong>Type:</strong> Evening Wear / Casual / Formal / Party Dress</li><li><strong>Fabric:</strong> Silk, Cotton, Chiffon, or Linen (adjust to your dress)</li><li><strong>Color:</strong> Deep Blue / Pastel Pink / Classic Black (specify actual color)</li><li><strong>Size:</strong> Available in S, M, L, XL</li><li><strong>Design Features:</strong></li><li>Sleeveless / Long Sleeve / Off-Shoulder</li><li>Floor-length / Knee-length</li><li>Embroidery / Sequins / Lace detailing</li><li>Flowing silhouette or A-line / Bodycon fit</li><li><strong>Special Features:</strong></li><li>Comfortable lining</li><li>Breathable fabric</li><li>Adjustable straps or waist tie</li></ul>', 'images/product_thumbnail/elegant_evening_gown_1764089552.jpg', 'active', '2025-11-25 10:52:32', '2025-11-25 11:08:39'),
(60, 9, 7, 13, 'KEY AND HOUSE KEYCHAIN ​​IN HIGH SECURITY DOOR LOCK.', 'key-and-house-keychain-​​in-high-security-door-lock.', 'sku-door-65', 6500.00, 200.00, 15, '1.2 kg', 'CLOSE UP OF KEY AND HOUSE KEYCHAIN ​​IN HIGH SECURITY DOOR LOCK. HOME INSURANCE CONCEPT. COPY SPACE.', '<ol><li><strong>Largest size</strong>:6000 x 4000 px (20.00 x 13.33 in.) - 300 dpi - RGB</li><li><strong>Stock photo ID</strong>:1432322776</li><li><strong>Upload date</strong>:October 14, 2022</li><li><strong>Location</strong>:Spain</li></ol>', 'images/product_thumbnail/key_and_house_keychain_______in_high_security_door_lock__1764090955.jpg', 'active', '2025-11-25 11:15:55', '2025-11-25 11:27:10'),
(61, 9, 13, 41, 'Cook stove', 'cook-stove', 'sku-cooker-65', 3000.00, NULL, 20, '4kg', 'This is a modern electric multi-cooker with a 5-liter capacity. It offers multiple cooking modes like steaming, slow cooking, and sautéing, with a non-stick pot, timer, and auto shut-off for safety.', '<h2>Cooker Description (New Version)</h2><ul><li><strong>Name/Model:</strong> Philips Viva Collection / Prestige Smart Cooker (replace with your model)</li><li><strong>Type:</strong> Electric Cooker / Multi-Cooker / Pressure Cooker</li><li><strong>Capacity:</strong> 3–6 liters (specify your model)</li><li><strong>Power:</strong> 800–1200 Watts</li><li><strong>Cooking Modes:</strong><ul><li>Rice, Steam, Slow Cook, Sauté, Soup, Cake, etc.</li></ul></li><li><strong>Special Features:</strong><ul><li>Timer &amp; Auto Shut-Off for safety</li><li>Non-stick inner pot for easy cleaning</li><li>Keep Warm function</li><li>LED display with intuitive controls</li><li>Compact and energy-efficient design</li></ul></li></ul>', 'images/product_thumbnail/cook_stove_1764091246.jpg', 'active', '2025-11-25 11:20:46', '2025-11-25 11:27:07'),
(62, 9, 8, 48, 'Modern TV Wall Mockup', 'modern-tv-wall-mockup', 'sku-televeion-65', 30599.00, 999.00, 10, '3kg', 'A sleek and modern TV wall with floating shelves, cabinets, LED backlighting, and concealed wiring, offering both style and functionality for your living space.', '<p>This is a modern TV wall designed for both style and functionality. The TV is centered at an optimal viewing height, mounted on a textured accent wall made of wood or stone. The setup includes floating shelves and built-in cabinets for media devices and decorative items, with integrated LED backlighting for ambiance. The design emphasizes minimalism with concealed wiring, ensuring a clean, clutter-free look. Additional features include accent lighting, space for speakers or soundbars, and optional décor elements such as plants or photo frames, making it perfect for living rooms or entertainment areas.</p>', 'images/product_thumbnail/modern_tv_wall_mockup_1764091560.jpg', 'active', '2025-11-25 11:26:00', '2025-11-25 11:27:06'),
(63, 9, 4, 7, 'Tablet -652m', 'tablet--652m', 'sku-tablet-65', 40999.00, 3500.00, 30, '900 gm', 'High-performance 10.5-inch tablet with full HD display, fast processor, dual cameras, and long-lasting battery for work and entertainment.', '<figure class=\"table\"><table><thead><tr><th><strong>Item</strong></th><th><strong>Full Description</strong></th></tr></thead><tbody><tr><td><strong>Camera</strong></td><td>“A high-resolution DSLR camera with 30.4 MP sensor, 4K video recording, 61-point autofocus system, and Wi-Fi connectivity. Ideal for capturing high-quality photos and videos in real-time for your projects.”</td></tr><tr><td><strong>Pen</strong></td><td>“A digital stylus with 8192 levels of pressure sensitivity, tilt recognition, and customizable buttons. Connects via Bluetooth and works seamlessly with tablets or smart screens for precise handwriting and drawing.”</td></tr><tr><td><strong>Dress</strong></td><td>“An elegant evening gown made of soft silk with a flowing A-line design. Features delicate embroidery, comfortable lining, and a perfect fit for formal events or parties.”</td></tr><tr><td><strong>Cooker</strong></td><td>“A modern electric multi-cooker with a 5-liter capacity, multiple cooking modes (steam, slow cook, sauté), non-stick inner pot, timer, and auto shut-off. Perfect for versatile and safe cooking.”</td></tr><tr><td><strong>TV Wall</strong></td><td>“A modern TV wall with TV mounted at optimal height on a textured accent wall. Includes floating shelves, built-in cabinets, LED backlighting, concealed wiring, and space for speakers and décor. Combines style and functionality for any living space.”</td></tr><tr><td><strong>Tablet</strong></td><td>“A high-performance tablet featuring a 10.5-inch IPS display with full HD resolution, fast octa-core processor, and 4GB RAM for smooth multitasking. It comes with 64GB internal storage, expandable via microSD, and runs on the latest Android/iOS version. The tablet includes dual cameras for video calls and photography, long-lasting battery life, and Wi-Fi/Bluetooth connectivity, making it ideal for work, study, and entertainment.”</td></tr></tbody></table></figure>', 'images/product_thumbnail/tablet_-652m_1764092122.jpg', 'active', '2025-11-25 11:35:22', '2025-11-25 11:40:16'),
(64, 9, 20, 51, 'Make-up Box', 'make-up-box', 'sku-makup-65', 999.00, 20.00, 10, '100 gm', 'Premium makeup kit with foundation, eyeshadow, blush, lipstick, and brushes for versatile, skin-friendly looks.', '<h3><strong>Makeup Description</strong></h3><blockquote><p><strong>Full Description:</strong><br>“This is a premium makeup kit including foundation, eyeshadow palette, blush, lipstick, and brushes. The products are formulated with skin-friendly ingredients suitable for all skin types. The eyeshadow palette offers a variety of matte and shimmer shades, while the foundation provides smooth coverage. Compact, stylish, and travel-friendly, this kit allows for creating both natural and glamorous looks effortlessly.”</p></blockquote>', 'images/product_thumbnail/make-up_box_1764092384.jpg', 'pending', '2025-11-25 11:39:44', '2025-11-25 11:39:44');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`) VALUES
(1, 1, 'iphone15promax_1.jpg'),
(2, 1, 'iphone15promax_2.jpg'),
(3, 2, 'galaxys24ultra_1.jpg'),
(4, 2, 'galaxys24ultra_2.jpg'),
(5, 3, 'dellxps15_1.jpg'),
(6, 4, 'hpenvyx360_1.jpg'),
(7, 5, 'thinkpadx1_1.jpg'),
(8, 6, 'lgoled65_1.jpg'),
(9, 6, 'lgoled65_2.jpg'),
(10, 7, 'sonybravia55_1.jpg'),
(11, 8, 'menshirt_1.jpg'),
(12, 9, 'womendress_1.jpg'),
(13, 10, 'kidshoodie_1.jpg'),
(14, 11, 'canonr6ii_1.jpg'),
(15, 12, 'nikonz6ii_1.jpg'),
(16, 13, 'ankersoundcore_1.jpg'),
(17, 14, 'lipstick_1.jpg'),
(18, 15, 'facewash_1.jpg'),
(19, 16, 'doveshampoo_1.jpg'),
(20, 17, 'harrypotter_1.jpg'),
(21, 18, 'greatgatsby_1.jpg'),
(22, 19, 'educated_1.jpg'),
(23, 20, 'sofa_1.jpg'),
(24, 21, 'bed_1.jpg'),
(25, 22, 'gardenchair_1.jpg'),
(26, 23, 'football_1.jpg'),
(27, 24, 'dumbbell_1.jpg'),
(28, 25, 'mountainbike_1.jpg'),
(29, 26, 'dogfood_1.jpg'),
(30, 27, 'catfood_1.jpg'),
(31, 39, 'images/product_images/lavono_-356_1763133894.jpg'),
(32, 39, 'images/product_images/lavono_-356_1763133894.jpg'),
(33, 50, 'images/product_images/laptoooo_1763143366_9874.jpg'),
(34, 50, 'images/product_images/laptoooo_1763143366_4781.jpg'),
(35, 50, 'images/product_images/laptoooo_1763143367_7820.jpg'),
(36, 50, 'images/product_images/laptoooo_1763143367_7276.jpg'),
(37, 50, 'images/product_images/laptoooo_1763143367_6717.jpg'),
(38, 51, 'images/product_images/hggggggg_1763143488_1161.jpg'),
(39, 51, 'images/product_images/hggggggg_1763143488_3275.jpg'),
(40, 51, 'images/product_images/hggggggg_1763143488_8712.jpg'),
(41, 51, 'images/product_images/hggggggg_1763143488_4961.jpg'),
(42, 51, 'images/product_images/hggggggg_1763143488_8225.jpg'),
(43, 52, 'images/product_images/sonny_s54_1763144188_9936.jpg'),
(44, 52, 'images/product_images/sonny_s54_1763144188_6959.jpg'),
(45, 52, 'images/product_images/sonny_s54_1763144188_9771.jpg'),
(46, 52, 'images/product_images/sonny_s54_1763144189_6997.jpg'),
(47, 53, 'images/product_images/dell-3501_1763190956_1635.jpg'),
(48, 53, 'images/product_images/dell-3501_1763190956_9315.jpg'),
(49, 53, 'images/product_images/dell-3501_1763190956_7492.jpg'),
(50, 53, 'images/product_images/dell-3501_1763190956_3956.jpg'),
(51, 54, 'images/product_images/dell-3501_1763191028_3643.jpg'),
(52, 54, 'images/product_images/dell-3501_1763191028_2167.jpg'),
(53, 54, 'images/product_images/dell-3501_1763191028_2970.jpg'),
(54, 54, 'images/product_images/dell-3501_1763191028_3181.jpg'),
(55, 55, 'images/product_images/fgfgfgfgfgfgt_1763461018_4495.jpg'),
(56, 55, 'images/product_images/fgfgfgfgfgfgt_1763461018_9402.jpg'),
(57, 55, 'images/product_images/fgfgfgfgfgfgt_1763461018_1330.jpg'),
(58, 55, 'images/product_images/fgfgfgfgfgfgt_1763461018_1402.jpg'),
(59, 55, 'images/product_images/fgfgfgfgfgfgt_1763461018_3274.jpg'),
(60, 56, 'images/product_images/dell_inspiron_15_3000_series_1764087051_3630.jpg'),
(61, 56, 'images/product_images/dell_inspiron_15_3000_series_1764087051_6792.jpg'),
(62, 56, 'images/product_images/dell_inspiron_15_3000_series_1764087052_3297.jpg'),
(63, 57, 'images/product_images/canon_eos_5d_mark_iv_1764088901_1313.jpg'),
(64, 57, 'images/product_images/canon_eos_5d_mark_iv_1764088901_6956.jpg'),
(65, 57, 'images/product_images/canon_eos_5d_mark_iv_1764088901_1896.jpg'),
(66, 57, 'images/product_images/canon_eos_5d_mark_iv_1764088902_3075.jpg'),
(67, 58, 'images/product_images/logitech_ink_plus_1764089246_2263.jpg'),
(68, 58, 'images/product_images/logitech_ink_plus_1764089246_4424.jpg'),
(69, 58, 'images/product_images/logitech_ink_plus_1764089246_7004.jpg'),
(70, 58, 'images/product_images/logitech_ink_plus_1764089246_3324.jpg'),
(71, 59, 'images/product_images/elegant_evening_gown_1764089552_3730.jpg'),
(72, 59, 'images/product_images/elegant_evening_gown_1764089552_1853.jpg'),
(73, 59, 'images/product_images/elegant_evening_gown_1764089552_7692.jpg'),
(74, 59, 'images/product_images/elegant_evening_gown_1764089552_6376.jpg'),
(75, 60, 'images/product_images/key_and_house_keychain_______in_high_security_door_lock__1764090956_7483.jpg'),
(76, 60, 'images/product_images/key_and_house_keychain_______in_high_security_door_lock__1764090956_5638.jpg'),
(77, 60, 'images/product_images/key_and_house_keychain_______in_high_security_door_lock__1764090956_1072.jpg'),
(78, 60, 'images/product_images/key_and_house_keychain_______in_high_security_door_lock__1764090956_6862.jpg'),
(79, 61, 'images/product_images/cook_stove_1764091247_2310.jpg'),
(80, 61, 'images/product_images/cook_stove_1764091247_2435.jpg'),
(81, 61, 'images/product_images/cook_stove_1764091247_5083.jpg'),
(82, 62, 'images/product_images/modern_tv_wall_mockup_1764091560_3263.jpg'),
(83, 62, 'images/product_images/modern_tv_wall_mockup_1764091560_5160.jpg'),
(84, 62, 'images/product_images/modern_tv_wall_mockup_1764091560_6816.jpg'),
(85, 63, 'images/product_images/tablet_-652m_1764092122_9366.jpg'),
(86, 63, 'images/product_images/tablet_-652m_1764092122_5347.jpg'),
(87, 63, 'images/product_images/tablet_-652m_1764092122_6615.jpg'),
(88, 63, 'images/product_images/tablet_-652m_1764092122_5808.jpg'),
(89, 64, 'images/product_images/make-up_box_1764092384_5004.jpg'),
(90, 64, 'images/product_images/make-up_box_1764092384_2776.jpg'),
(91, 64, 'images/product_images/make-up_box_1764092384_4097.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `variant_type` varchar(255) NOT NULL,
  `variant_name` varchar(255) NOT NULL,
  `additional_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `variant_type`, `variant_name`, `additional_price`, `stock`) VALUES
(1, 1, 'Storage', '128GB', 0.00, 10),
(2, 1, 'Storage', '256GB', 100.00, 8),
(3, 1, 'Color', 'Titanium Blue', 0.00, 12),
(4, 2, 'Storage', '512GB', 150.00, 10),
(5, 2, 'Color', 'Graphite Black', 0.00, 20),
(6, 3, 'RAM', '16GB', 0.00, 10),
(7, 3, 'RAM', '32GB', 200.00, 8),
(8, 4, 'RAM', '8GB', 0.00, 12),
(9, 4, 'RAM', '16GB', 150.00, 6),
(10, 5, 'Display', '14-inch', 0.00, 10),
(11, 5, 'Display', '16-inch', 200.00, 5),
(12, 6, 'Screen Size', '65 Inch', 0.00, 10),
(13, 6, 'Screen Size', '77 Inch', 300.00, 5),
(14, 7, 'Screen Size', '55 Inch', 0.00, 12),
(15, 7, 'Screen Size', '65 Inch', 200.00, 8),
(16, 8, 'Size', 'M', 0.00, 30),
(17, 8, 'Size', 'L', 0.00, 25),
(18, 9, 'Size', 'S', 0.00, 20),
(19, 9, 'Size', 'M', 0.00, 20),
(20, 10, 'Color', 'Red', 0.00, 30),
(21, 10, 'Color', 'Blue', 0.00, 30),
(22, 11, 'Lens Kit', '24-70mm', 500.00, 5),
(23, 11, 'Lens Kit', 'Body Only', 0.00, 5),
(24, 12, 'Lens Kit', '24-120mm', 400.00, 5),
(25, 13, 'Color', 'Black', 0.00, 50),
(26, 13, 'Color', 'Blue', 0.00, 50),
(27, 14, 'Shade', 'Red Passion', 0.00, 60),
(28, 14, 'Shade', 'Nude Beige', 0.00, 40),
(29, 15, 'Type', 'Oil Control', 0.00, 70),
(30, 16, 'Volume', '250ml', 0.00, 50),
(31, 16, 'Volume', '500ml', 2.00, 50),
(32, 20, 'Material', 'Teak Wood', 0.00, 5),
(33, 20, 'Material', 'Sheesham Wood', 50.00, 3),
(34, 23, 'Weight', '400g', 0.00, 80),
(35, 24, 'Weight', '20kg', 0.00, 40),
(36, 25, 'Color', 'Red', 0.00, 8),
(37, 25, 'Color', 'Black', 0.00, 8),
(38, 27, 'Flavor', 'Salmon', 0.00, 40),
(39, 27, 'Flavor', 'Tuna', 0.00, 50),
(40, 28, 'Color', 'Silver', 0.00, 10),
(41, 28, 'Color', 'Black', 0.00, 10),
(42, 39, 'color', 'Black', 0.00, 20),
(43, 39, 'color', 'w', 0.00, 10),
(44, 52, 'color', 'black', 434.00, 3),
(45, 52, 'color', 'red', 4343.00, 4),
(46, 54, 'color', 'black', 200.00, 20),
(47, 54, 'color', 'white', 4500.00, 20),
(48, 55, 'color', 'black', 0.00, 10),
(49, 56, 'color', 'black', 0.00, 5),
(50, 56, 'color', 'white', 0.00, 5),
(51, 57, 'color', 'white', 0.00, 10),
(52, 57, 'color', 'black', 0.00, 10),
(53, 58, 'color', 'black', 0.00, 30),
(54, 58, 'color', 'black', 0.00, 50),
(55, 58, 'color', 'perpel', 0.00, 20),
(56, 60, 'color', 'black', 0.00, 5),
(57, 60, 'color', 'white', 0.00, 10),
(58, 61, 'color', 'black', 0.00, 10),
(59, 61, 'color', 'white', 0.00, 0),
(60, 62, 'color', 'black', 0.00, 10),
(61, 63, 'color', 'black', 0.00, 20),
(62, 63, 'color', 'white', 0.00, 10);

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reason` text NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('requested','approved','rejected','refunded') NOT NULL DEFAULT 'requested',
  `requested_at` datetime NOT NULL,
  `refunded_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rating` tinyint(4) NOT NULL,
  `comment` text DEFAULT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2025-11-13 19:19:47', '2025-11-13 19:19:47'),
(2, 'vendor', '2025-11-13 19:19:47', '2025-11-13 19:19:47'),
(3, 'user', '2025-11-13 19:19:47', '2025-11-13 19:19:47'),
(4, 'delivery boy', '2025-11-13 19:19:47', '2025-11-13 19:19:47');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2T4DNEYcs5tVO43N3TkE94pI9xnvOOpq4bzBocQJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:145.0) Gecko/20100101 Firefox/145.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiM2paQWlvUHdUVGczbmNtRHRUMGhGQ2FZYjlkMmNlSnhTMk5WSmIzRyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGFzaGJvYXJkIjtzOjU6InJvdXRlIjtzOjk6ImRhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1764091661),
('RuWkUNmX8GEetn5HW8egyoyv1sHzq5xIvzq1CHGu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:145.0) Gecko/20100101 Firefox/145.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0xDVkZidGR3YUNERkE4TUFWaW9jS1lDRWcya0k2WmdGWnhKaEpBSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1764091662),
('tx20iaJDmIWQQPyA4d53Fphg3ohn7RmYGtZkmos4', 17, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:145.0) Gecko/20100101 Firefox/145.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiN1hRSHJKUzBZUVkzcVBVY05rM2lhREdpY3cxVFFWdEVpdHFYNlhBdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9pbmRleCI7czo1OiJyb3V0ZSI7czo1OiJpbmRleCI7fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxNzt9', 1764093024),
('YIu2CqX1hK3RlZVuzUsayBLQqHDKsCCjyfiSeTit', 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVnFNMlFQcllHVmdvU1VMODFpZnZkc0NnZk1jWWlXSGE2RmVJOFFBTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cyI7czo1OiJyb3V0ZSI7czoxNDoicHJvZHVjdHMuaW5kZXgiO31zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTg7fQ==', 1764092390);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `type` enum('general','payment','email','commission') NOT NULL DEFAULT 'general',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `status` enum('active','inactive','banned') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `role_id`, `email_verified_at`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rahim Uddin', 'rahim@multivendor.com', '01800000001', '', 4, NULL, 'active', NULL, '2025-11-02 18:19:10', '2025-11-02 18:19:10'),
(2, 'Karim Hossain', 'karim@multivendor.com', '01800000002', '', 4, NULL, 'active', NULL, '2025-11-02 18:19:10', '2025-11-02 18:19:10'),
(3, 'Nusrat Jahan', 'nusrat@multivendor.com', '01800000003', '', 4, NULL, 'active', NULL, '2025-11-02 18:19:10', '2025-11-02 18:19:10'),
(4, 'Sadia Akter', 'sadia@multivendor.com', '01800000004', '', 4, NULL, 'active', NULL, '2025-11-02 18:19:10', '2025-11-02 18:19:10'),
(5, 'Hasan Ali', 'hasan@multivendor.com', '01800000005', '', 4, NULL, 'active', NULL, '2025-11-02 18:19:10', '2025-11-02 18:19:10'),
(6, 'Tania Rahman', 'tania@multivendor.com', '01800000006', '', 4, NULL, 'active', NULL, '2025-11-02 18:19:10', '2025-11-02 18:19:10'),
(7, 'Jahidul Islam', 'jahid@multivendor.com', '01800000007', '', 4, NULL, 'active', NULL, '2025-11-02 18:19:10', '2025-11-02 18:19:10'),
(8, 'Farhana Mim', 'farhana@multivendor.com', '01800000008', '', 4, NULL, 'active', NULL, '2025-11-02 18:19:10', '2025-11-02 18:19:10'),
(9, 'Arif Chowdhury', 'arif@multivendor.com', '01800000009', '', 4, NULL, 'active', NULL, '2025-11-02 18:19:10', '2025-11-02 18:19:10'),
(10, 'Rina Begum', 'rina@multivendor.com', '01800000010', '', 4, NULL, 'active', NULL, '2025-11-02 18:19:10', '2025-11-02 18:19:10'),
(11, 'Sohel Rana', 'sohel@multivendor.com', '01700000001', '', 1, NULL, 'active', NULL, '2025-11-02 18:20:44', '2025-11-02 18:20:44'),
(12, 'Rana', 'rana@multivendor.com', '01700000002', '', 2, NULL, 'active', NULL, '2025-11-02 18:20:44', '2025-11-02 18:20:44'),
(13, 'Sulov', 'sulov@multivendor.com', '01700000003', '', 3, NULL, 'active', NULL, '2025-11-02 18:20:44', '2025-11-02 18:20:44'),
(14, 'Ali', 'ali@multivendor.com', '01700000004', '', 4, NULL, 'active', NULL, '2025-11-02 18:20:44', '2025-11-02 18:20:44'),
(15, 'Madani', 'madani@multivendor.com', '01700000005', '', 5, NULL, 'active', NULL, '2025-11-02 18:20:44', '2025-11-02 18:20:44'),
(16, 'Ahad', 'ahad@multivendor.com', '01700000006', '', 5, NULL, 'active', NULL, '2025-11-02 18:20:44', '2025-11-02 18:20:44'),
(17, 'Sohel Rana', 'admin@gmail.com', NULL, '$2y$12$EKCACCSbzMvzD6oXp1VPCe1uYEOClbwq2HtIBcM9t48QyMreZKOBW', 1, NULL, 'active', NULL, '2025-11-13 13:21:29', '2025-11-13 13:21:29'),
(18, 'Sulov Sorkar', 'vendor@gmail.com', '+8801700000009', '$2y$12$OIet/ye0Ukw.8uTdtRq8SOqfCt1ZGH2bfJgXAJ0irx.bHHUHXXo7y', 2, NULL, 'active', NULL, '2025-11-13 13:22:21', '2025-11-13 13:22:21'),
(19, 'Ahad Islam', 'customer@gmail.com', '+8801700000009', '$2y$12$cViF4Nz2getHe5YG0u4jNOurN5WACk2uGGHznoyw2QJZuxtjAki5a', 3, NULL, 'active', NULL, '2025-11-17 00:10:06', '2025-11-17 00:10:06'),
(20, 'Rayhen Islam', 'rayhen123@gmail.com', '01985875485', '$2y$12$Q9LUqPhfMdZ.8Q.FFtQKw.qyEmskASfAbvVY1btNLGXolowr1XPfm', 2, NULL, 'active', NULL, '2025-11-25 09:14:57', '2025-11-25 09:14:57');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shop_name` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `business_email` varchar(255) DEFAULT NULL,
  `business_phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `commission_rate` decimal(5,2) NOT NULL DEFAULT 0.00,
  `status` enum('pending','approved','rejected','suspended') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `user_id`, `shop_name`, `logo`, `banner`, `description`, `business_email`, `business_phone`, `address`, `city`, `country`, `balance`, `commission_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'TechZone', 'techzone.png', 'techzone_banner.jpg', 'Your one-stop gadget store.', 'contact@techzone.com', '+8801700000001', 'Road 12, Banani', 'Dhaka', 'Bangladesh', 1520.50, 10.00, 'suspended', '2025-11-13 19:04:52', '2025-11-25 08:06:44'),
(2, 2, 'MobileMart', 'mobilemart.png', 'mobilemart_banner.jpg', 'All brands of smartphones available.', 'info@mobilemart.com', '+8801700000002', 'Mirpur 10', 'Dhaka', 'Bangladesh', 980.00, 8.00, 'suspended', '2025-11-13 19:04:52', '2025-11-25 08:20:06'),
(3, 3, 'Laptop World', 'laptopworld.png', 'laptopworld_banner.jpg', 'Premium laptops at great prices.', 'sales@laptopworld.com', '+8801700000003', 'Uttara', 'Dhaka', 'Bangladesh', 2200.00, 12.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(4, 4, 'SmartHome BD', 'smarthome.png', 'smarthome_banner.jpg', 'Smart devices for modern living.', 'support@smarthomebd.com', '+8801700000004', 'Dhanmondi', 'Dhaka', 'Bangladesh', 870.75, 10.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(5, 5, 'FashionHub', 'fashionhub.png', 'fashionhub_banner.jpg', 'Latest fashion trends and accessories.', 'hello@fashionhub.com', '+8801700000005', 'New Market', 'Dhaka', 'Bangladesh', 560.40, 9.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(6, 6, 'Gadget Gallery', 'gadgetgallery.png', 'gadgetgallery_banner.jpg', 'All your favorite tech brands.', 'shop@gadgetgallery.com', '+8801700000006', 'Chawkbazar', 'Chittagong', 'Bangladesh', 1300.90, 10.00, 'pending', '2025-11-13 19:04:52', '2025-11-25 08:21:07'),
(7, 7, 'BeautySpot', 'beautyspot.png', 'beautyspot_banner.jpg', 'Cosmetics and personal care products.', 'care@beautyspot.com', '+8801700000007', 'Mohakhali', 'Dhaka', 'Bangladesh', 430.00, 7.00, 'approved', '2025-11-13 19:04:52', '2025-11-25 08:06:24'),
(8, 8, 'BookNest', 'booknest.png', 'booknest_banner.jpg', 'A paradise for book lovers.', 'read@booknest.com', '+8801700000008', 'Nilkhet', 'Dhaka', 'Bangladesh', 720.00, 5.00, 'approved', '2025-11-13 19:04:52', '2025-11-25 08:20:58'),
(9, 18, 'HomeStyle', 'homestyle.png', 'homestyle_banner.jpg', 'Modern furniture and home decor.', 'design@homestyle.com', '+8801700000009', 'Agrabad', 'Chittagong', 'Bangladesh', 1840.00, 11.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(52, 20, 'My Shop BD', 'images/vendor/logo/rayhen_islam_logo_20251125_151456.jpg', 'images/vendor/banner/rayhen_islam_banner_20251125_151456.jpg', 'Your go-to destination for the best Bangladeshi brands and products. Fashion, gadgets, home décor, and more—quality you can trust at prices you’ll love. Easy ordering, fast delivery!', 'rayhen123@gmail.com', '01985875485', 'Narayangonj', 'Narayangonj', 'Bangladesh', 0.00, 0.00, 'approved', '2025-11-25 09:14:57', '2025-11-25 09:30:38');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

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
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payouts`
--
ALTER TABLE `payouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payouts`
--
ALTER TABLE `payouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
