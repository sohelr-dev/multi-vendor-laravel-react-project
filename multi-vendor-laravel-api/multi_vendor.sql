-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2025 at 08:23 PM
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
(2, 'ORD-10002', 2, 3, 2, 870.00, 25.00, 0.00, 895.00, 'paid', 'shipped', '2025-10-03 12:15:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(3, 'ORD-10003', 3, 5, 3, 250.00, 15.00, 0.00, 265.00, 'pending', 'processing', '2025-10-05 09:40:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(4, 'ORD-10004', 4, 2, 4, 1150.00, 30.00, 50.00, 1130.00, 'paid', 'delivered', '2025-10-07 13:10:00', '2025-10-10 18:00:00', NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(5, 'ORD-10005', 5, 4, 5, 670.00, 20.00, 0.00, 690.00, 'paid', 'confirmed', '2025-10-09 11:00:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(6, 'ORD-10006', 6, 6, 6, 320.00, 10.00, 0.00, 330.00, 'paid', 'delivered', '2025-10-10 15:30:00', '2025-10-12 17:45:00', 'Left at doorstep', '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(7, 'ORD-10007', 7, 8, 7, 220.00, 15.00, 0.00, 235.00, 'failed', 'cancelled', '2025-10-11 10:00:00', NULL, 'Payment failed', '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(8, 'ORD-10008', 8, 9, 8, 1440.00, 50.00, 100.00, 1390.00, 'paid', 'processing', '2025-10-12 09:25:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(9, 'ORD-10009', 9, 7, 9, 550.00, 10.00, 0.00, 560.00, 'paid', 'delivered', '2025-10-13 08:15:00', '2025-10-16 14:30:00', NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(10, 'ORD-10010', 10, 10, 10, 800.00, 25.00, 20.00, 805.00, 'paid', 'confirmed', '2025-10-15 12:00:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(11, 'ORD-10011', 11, 11, 11, 310.00, 15.00, 0.00, 325.00, 'paid', 'delivered', '2025-10-16 09:00:00', '2025-10-18 15:00:00', NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(12, 'ORD-10012', 12, 12, 12, 640.00, 20.00, 40.00, 620.00, 'paid', 'shipped', '2025-10-17 10:45:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(13, 'ORD-10013', 13, 13, 13, 480.00, 15.00, 0.00, 495.00, 'pending', 'pending', '2025-10-18 08:40:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(14, 'ORD-10014', 14, 14, 14, 1200.00, 35.00, 100.00, 1135.00, 'paid', 'delivered', '2025-10-19 16:00:00', '2025-10-23 11:00:00', NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(15, 'ORD-10015', 15, 15, 15, 210.00, 10.00, 0.00, 220.00, 'failed', 'cancelled', '2025-10-20 10:10:00', NULL, 'Card declined', '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(16, 'ORD-10016', 16, 16, 16, 890.00, 25.00, 0.00, 915.00, 'paid', 'processing', '2025-10-21 12:00:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(17, 'ORD-10017', 17, 17, 17, 330.00, 15.00, 0.00, 345.00, 'paid', 'shipped', '2025-10-22 09:30:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(18, 'ORD-10018', 18, 18, 18, 620.00, 20.00, 10.00, 630.00, 'paid', 'delivered', '2025-10-23 11:45:00', '2025-10-27 17:00:00', NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(19, 'ORD-10019', 19, 19, 19, 1400.00, 50.00, 200.00, 1250.00, 'paid', 'delivered', '2025-10-24 15:00:00', '2025-10-30 19:00:00', 'Delivered to office', '2025-11-13 19:15:36', '2025-11-13 19:15:36'),
(20, 'ORD-10020', 20, 20, 20, 500.00, 10.00, 0.00, 510.00, 'paid', 'confirmed', '2025-10-25 09:15:00', NULL, NULL, '2025-11-13 19:15:36', '2025-11-13 19:15:36');

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
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `vendor_id`, `quantity`, `price`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 200.00, 200.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(2, 1, 2, 1, 1, 150.00, 150.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(3, 1, 3, 1, 1, 100.00, 100.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(4, 2, 4, 3, 2, 300.00, 600.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(5, 2, 5, 3, 1, 270.00, 270.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(6, 2, 6, 3, 1, 25.00, 25.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(7, 3, 7, 5, 2, 100.00, 200.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(8, 3, 8, 5, 1, 50.00, 50.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(9, 3, 9, 5, 1, 15.00, 15.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(10, 4, 10, 2, 1, 400.00, 400.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(11, 4, 11, 2, 2, 200.00, 400.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(12, 4, 12, 2, 1, 350.00, 350.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(13, 5, 13, 4, 2, 250.00, 500.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(14, 5, 14, 4, 1, 170.00, 170.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(15, 5, 15, 4, 1, 20.00, 20.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(16, 6, 16, 6, 1, 120.00, 120.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(17, 6, 17, 6, 2, 100.00, 200.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(18, 6, 18, 6, 1, 10.00, 10.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(19, 7, 19, 8, 1, 220.00, 220.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(20, 7, 20, 8, 1, 15.00, 15.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(21, 7, 21, 8, 1, 0.00, 0.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(22, 8, 22, 9, 1, 800.00, 800.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(23, 8, 23, 9, 2, 295.00, 590.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(24, 8, 24, 9, 1, 50.00, 50.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(25, 9, 25, 7, 1, 250.00, 250.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(26, 9, 26, 7, 2, 150.00, 300.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(27, 9, 27, 7, 1, 10.00, 10.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(28, 10, 28, 10, 2, 300.00, 600.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(29, 10, 29, 10, 1, 200.00, 200.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(30, 10, 30, 10, 1, 0.00, 0.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(31, 11, 31, 11, 1, 150.00, 150.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(32, 11, 32, 11, 2, 75.00, 150.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(33, 11, 33, 11, 1, 25.00, 25.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(34, 12, 34, 12, 2, 300.00, 600.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(35, 12, 35, 12, 1, 40.00, 40.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(36, 12, 36, 12, 1, 0.00, 0.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(37, 13, 37, 13, 2, 200.00, 400.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(38, 13, 38, 13, 1, 80.00, 80.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(39, 13, 39, 13, 1, 15.00, 15.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(40, 14, 40, 14, 1, 400.00, 400.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(41, 14, 41, 14, 2, 350.00, 700.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(42, 14, 42, 14, 1, 100.00, 100.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(43, 15, 43, 15, 1, 210.00, 210.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(44, 15, 44, 15, 1, 10.00, 10.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(45, 15, 45, 15, 1, 0.00, 0.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(46, 16, 46, 16, 1, 500.00, 500.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(47, 16, 47, 16, 1, 400.00, 400.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(48, 16, 48, 16, 1, 15.00, 15.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(49, 17, 49, 17, 1, 110.00, 110.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(50, 17, 50, 17, 2, 120.00, 240.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(51, 17, 51, 17, 1, 0.00, 0.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(52, 18, 52, 18, 1, 200.00, 200.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(53, 18, 53, 18, 2, 210.00, 420.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(54, 18, 54, 18, 1, 10.00, 10.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(55, 19, 55, 19, 2, 500.00, 1000.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(56, 19, 56, 19, 1, 400.00, 400.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(57, 19, 57, 19, 1, 0.00, 0.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(58, 20, 58, 20, 2, 250.00, 500.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(59, 20, 59, 20, 1, 10.00, 10.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00'),
(60, 20, 60, 20, 1, 0.00, 0.00, '2025-11-13 19:16:00', '2025-11-13 19:16:00');

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
  `status` enum('active','inactive','draft') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `vendor_id`, `category_id`, `brand_id`, `name`, `slug`, `sku`, `price`, `discount_price`, `quantity`, `unit`, `short_description`, `description`, `thumbnail`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 'iPhone 15 Pro Max', 'iphone-15-pro-max', 'APL-15PM', 1499.00, 1399.00, 30, 'pcs', 'Apple flagship smartphone.', 'Latest A17 Pro chip with titanium frame.', 'iphone15promax.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(2, 2, 2, 2, 'Samsung Galaxy S24 Ultra', 'samsung-galaxy-s24-ultra', 'SAM-S24U', 1399.00, 1299.00, 40, 'pcs', 'Premium Android flagship.', 'S Pen support and 200MP camera.', 'galaxys24ultra.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(3, 3, 3, 5, 'Dell XPS 15', 'dell-xps-15', 'DLL-XPS15', 1899.00, 1799.00, 25, 'pcs', 'High performance ultrabook.', 'Intel i7 13th Gen with 32GB RAM.', 'dellxps15.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(4, 3, 3, 6, 'HP Envy x360', 'hp-envy-x360', 'HP-ENVY360', 1299.00, 1199.00, 18, 'pcs', 'Convertible touchscreen laptop.', 'AMD Ryzen 7 7840U, 16GB RAM.', 'hpenvyx360.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(5, 3, 3, 7, 'Lenovo ThinkPad X1 Carbon', 'lenovo-x1-carbon', 'LNV-X1C', 1699.00, 1599.00, 12, 'pcs', 'Lightweight business laptop.', 'Carbon fiber body, 14” QHD screen.', 'thinkpadx1.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(6, 4, 8, 4, 'LG OLED TV 65 Inch', 'lg-oled-65', 'LG-OLED65', 2499.00, 2299.00, 15, 'pcs', '4K Smart OLED TV.', 'Ultra HD display with AI ThinQ.', 'lgoled65.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(7, 4, 8, 3, 'Sony Bravia 55 Inch', 'sony-bravia-55', 'SNY-BR55', 1199.00, 1099.00, 20, 'pcs', 'Smart LED TV with HDR.', 'Dolby Vision, Android TV OS.', 'sonybravia55.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(8, 5, 15, NULL, 'Men Formal Shirt', 'men-formal-shirt', 'FSH-MEN-01', 35.00, 29.00, 100, 'pcs', 'Comfortable formal cotton shirt.', 'Ideal for office wear.', 'menshirt.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(9, 5, 16, NULL, 'Women Summer Dress', 'women-summer-dress', 'FSH-WOM-01', 45.00, 39.00, 90, 'pcs', 'Light and colorful summer dress.', 'Cotton fabric, multiple sizes.', 'womendress.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(10, 5, 17, NULL, 'Kids Hoodie', 'kids-hoodie', 'FSH-KID-01', 25.00, 19.00, 60, 'pcs', 'Warm and soft hoodie for kids.', 'Available in 5 colors.', 'kidshoodie.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(11, 6, 5, 19, 'Canon EOS R6 II', 'canon-eos-r6-ii', 'CAN-R6II', 2499.00, 2399.00, 10, 'pcs', 'Professional mirrorless camera.', '24MP full-frame sensor with dual pixel AF.', 'canonr6ii.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(12, 6, 5, 20, 'Nikon Z6 II', 'nikon-z6-ii', 'NIK-Z6II', 1999.00, 1899.00, 10, 'pcs', 'Mirrorless full-frame camera.', 'Dual EXPEED processor with 4K video.', 'nikonz6ii.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
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
(28, 12, 1, 10, 'Microsoft Surface Pro 9', 'surface-pro-9', 'MS-SURF9', 1699.00, 1599.00, 15, 'pcs', '2-in-1 detachable tablet PC.', 'Intel Evo i7 processor, 16GB RAM.', 'surfacepro9.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(29, 13, 5, 20, 'Nikon Coolpix B600', 'nikon-coolpix-b600', 'NIK-B600', 499.00, 459.00, 25, 'pcs', 'Compact superzoom camera.', '60x optical zoom, full HD video.', 'nikonb600.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(30, 14, 25, NULL, 'Treadmill X200', 'treadmill-x200', 'FIT-TM200', 899.00, 849.00, 12, 'pcs', 'Automatic foldable treadmill.', 'Speed range 0–16 km/h.', 'treadmill.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(31, 14, 27, NULL, 'Camping Tent 4 Person', 'camping-tent-4p', 'SPT-TENT4', 149.00, 129.00, 30, 'pcs', 'Weather-proof family tent.', 'Easy setup and ventilation.', 'tent.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(32, 15, 2, 13, 'Xiaomi Redmi Note 13', 'redmi-note-13', 'XIA-N13', 299.00, 269.00, 100, 'pcs', 'Midrange smartphone.', 'AMOLED 120Hz display.', 'redmi13.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(33, 16, 2, 11, 'Google Pixel 8', 'google-pixel-8', 'GOO-PX8', 899.00, 849.00, 60, 'pcs', 'Pure Android experience.', 'Tensor G3, 120Hz OLED.', 'pixel8.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(34, 17, 11, 17, 'Prestige Electric Kettle', 'prestige-kettle', 'KIT-KET01', 35.00, 29.00, 80, 'pcs', 'Stainless steel body.', '1.8L auto-shutoff kettle.', 'kettle.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(35, 18, 12, 18, 'Panasonic Microwave Oven', 'panasonic-microwave', 'MIC-OVEN01', 199.00, 179.00, 25, 'pcs', '23L solo microwave oven.', 'Touch panel and defrost option.', 'microwave.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(36, 19, 41, 23, 'TP-Link WiFi Router AX3000', 'tplink-router-ax3000', 'TPL-AX3K', 99.00, 89.00, 40, 'pcs', 'Dual band WiFi 6 router.', 'Up to 3000 Mbps speed.', 'tplinkax3000.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55'),
(37, 20, 15, NULL, 'Leather Jacket', 'leather-jacket', 'FSH-MEN-JKT', 120.00, 99.00, 70, 'pcs', 'Genuine leather winter jacket.', 'Slim fit design.', 'leatherjacket.jpg', 'active', '2025-11-13 19:06:55', '2025-11-13 19:06:55');

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
(30, 27, 'catfood_1.jpg');

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
(41, 28, 'Color', 'Black', 0.00, 10);

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
('dCqCWD9fcSgJKyaOPzmVZvUEngzsbVoFE1Gri2gR', 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidEwwVmp1cDAzRWVSWEN5WGY4Z2FrM2VocEh1TUQ1eGpSS0Rib2lJRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO3M6NToicm91dGUiO3M6OToiZGFzaGJvYXJkIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTg7fQ==', 1763061742);

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
(17, 'Sohel Rana', 'admin@gmil.com', NULL, '$2y$12$EKCACCSbzMvzD6oXp1VPCe1uYEOClbwq2HtIBcM9t48QyMreZKOBW', 1, NULL, 'active', NULL, '2025-11-13 13:21:29', '2025-11-13 13:21:29'),
(18, 'Sulov Sorkar', 'vendor@gmail.com', NULL, '$2y$12$OIet/ye0Ukw.8uTdtRq8SOqfCt1ZGH2bfJgXAJ0irx.bHHUHXXo7y', 2, NULL, 'active', NULL, '2025-11-13 13:22:21', '2025-11-13 13:22:21');

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
(1, 1, 'TechZone', 'techzone.png', 'techzone_banner.jpg', 'Your one-stop gadget store.', 'contact@techzone.com', '+8801700000001', 'Road 12, Banani', 'Dhaka', 'Bangladesh', 1520.50, 10.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(2, 2, 'MobileMart', 'mobilemart.png', 'mobilemart_banner.jpg', 'All brands of smartphones available.', 'info@mobilemart.com', '+8801700000002', 'Mirpur 10', 'Dhaka', 'Bangladesh', 980.00, 8.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(3, 3, 'Laptop World', 'laptopworld.png', 'laptopworld_banner.jpg', 'Premium laptops at great prices.', 'sales@laptopworld.com', '+8801700000003', 'Uttara', 'Dhaka', 'Bangladesh', 2200.00, 12.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(4, 4, 'SmartHome BD', 'smarthome.png', 'smarthome_banner.jpg', 'Smart devices for modern living.', 'support@smarthomebd.com', '+8801700000004', 'Dhanmondi', 'Dhaka', 'Bangladesh', 870.75, 10.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(5, 5, 'FashionHub', 'fashionhub.png', 'fashionhub_banner.jpg', 'Latest fashion trends and accessories.', 'hello@fashionhub.com', '+8801700000005', 'New Market', 'Dhaka', 'Bangladesh', 560.40, 9.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(6, 6, 'Gadget Gallery', 'gadgetgallery.png', 'gadgetgallery_banner.jpg', 'All your favorite tech brands.', 'shop@gadgetgallery.com', '+8801700000006', 'Chawkbazar', 'Chittagong', 'Bangladesh', 1300.90, 10.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(7, 7, 'BeautySpot', 'beautyspot.png', 'beautyspot_banner.jpg', 'Cosmetics and personal care products.', 'care@beautyspot.com', '+8801700000007', 'Mohakhali', 'Dhaka', 'Bangladesh', 430.00, 7.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(8, 8, 'BookNest', 'booknest.png', 'booknest_banner.jpg', 'A paradise for book lovers.', 'read@booknest.com', '+8801700000008', 'Nilkhet', 'Dhaka', 'Bangladesh', 720.00, 5.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(9, 9, 'HomeStyle', 'homestyle.png', 'homestyle_banner.jpg', 'Modern furniture and home decor.', 'design@homestyle.com', '+8801700000009', 'Agrabad', 'Chittagong', 'Bangladesh', 1840.00, 11.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(10, 10, 'Sporto', 'sporto.png', 'sporto_banner.jpg', 'Everything sports and outdoors.', 'play@sporto.com', '+8801700000010', 'Gulshan', 'Dhaka', 'Bangladesh', 1500.00, 9.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(11, 11, 'PetCare BD', 'petcare.png', 'petcare_banner.jpg', 'Supplies for your furry friends.', 'pets@petcare.com', '+8801700000011', 'Khulna', 'Bangladesh', 'Bangladesh', 420.00, 7.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(12, 12, 'Digital Planet', 'digitalplanet.png', 'digitalplanet_banner.jpg', 'Digital solutions and gadgets.', 'hello@digitalplanet.com', '+8801700000012', 'Motijheel', 'Dhaka', 'Bangladesh', 1750.50, 10.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(13, 13, 'Camera House', 'camerahouse.png', 'camerahouse_banner.jpg', 'Professional cameras and gear.', 'lens@camerahouse.com', '+8801700000013', 'Bashundhara', 'Dhaka', 'Bangladesh', 1650.00, 8.50, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(14, 14, 'FitnessPro', 'fitnesspro.png', 'fitnesspro_banner.jpg', 'Fitness gear and supplements.', 'fit@fitnesspro.com', '+8801700000014', 'Sylhet', 'Bangladesh', 'Bangladesh', 970.25, 8.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(15, 15, 'Gadget World', 'gadgetworld.png', 'gadgetworld_banner.jpg', 'All in one gadget marketplace.', 'team@gadgetworld.com', '+8801700000015', 'Mohammadpur', 'Dhaka', 'Bangladesh', 1450.75, 10.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(16, 16, 'SmartTech', 'smarttech.png', 'smarttech_banner.jpg', 'Smartphones and accessories.', 'sales@smarttech.com', '+8801700000016', 'Rajshahi', 'Bangladesh', 'Bangladesh', 1320.40, 9.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(17, 17, 'KitchenKing', 'kitchenking.png', 'kitchenking_banner.jpg', 'Kitchen appliances and cookware.', 'info@kitchenking.com', '+8801700000017', 'Barisal', 'Bangladesh', 'Bangladesh', 790.60, 7.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(18, 18, 'MegaMart', 'megamart.png', 'megamart_banner.jpg', 'All categories under one roof.', 'support@megamart.com', '+8801700000018', 'Narayanganj', 'Bangladesh', 'Bangladesh', 2550.00, 12.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(19, 19, 'TechLink', 'techlink.png', 'techlink_banner.jpg', 'Computer accessories and networking.', 'connect@techlink.com', '+8801700000019', 'Chittagong', 'Bangladesh', 'Bangladesh', 880.00, 8.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(20, 20, 'StylePoint', 'stylepoint.png', 'stylepoint_banner.jpg', 'Trendy fashion apparel.', 'contact@stylepoint.com', '+8801700000020', 'Dhaka', 'Bangladesh', 'Bangladesh', 600.50, 6.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(21, 50, 'AutoParts BD', 'autoparts.png', 'autoparts_banner.jpg', 'All car accessories and tools.', 'auto@autoparts.com', '+8801700000050', 'Dhaka', 'Bangladesh', 'Bangladesh', 780.00, 9.00, 'approved', '2025-11-13 19:04:52', '2025-11-13 19:04:52'),
(22, 1, 'TechWorld Electronics', 'techworld_logo.png', 'techworld_banner.jpg', 'Authorized reseller of smartphones, laptops, and gadgets.', 'support@techworld.com', '+1-555-1010', '123 Silicon Avenue', 'San Francisco', 'USA', 15000.00, 5.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(23, 2, 'Galaxy Gadgets', 'galaxygadgets_logo.png', 'galaxygadgets_banner.jpg', 'Samsung and Android device retailer.', 'info@galaxygadgets.com', '+1-555-2020', '88 Main Street', 'New York', 'USA', 12500.00, 4.50, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(24, 3, 'Laptop Zone', 'laptopzone_logo.png', 'laptopzone_banner.jpg', 'Laptops and computer accessories store.', 'sales@laptopzone.com', '+44-20-4000-3000', '45 Oxford Street', 'London', 'UK', 8700.00, 6.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(25, 4, 'HomeView Electronics', 'homeview_logo.png', 'homeview_banner.jpg', 'Electronics and home appliances distributor.', 'contact@homeview.com', '+61-2-1111-2222', '27 King Street', 'Sydney', 'Australia', 11200.00, 5.50, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(26, 5, 'StyleKart', 'stylekart_logo.png', 'stylekart_banner.jpg', 'Trendy clothing and fashion accessories for all.', 'help@stylekart.com', '+91-9876543210', '55 Fashion Road', 'Mumbai', 'India', 9600.00, 7.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(27, 6, 'CameraHub', 'camerahub_logo.png', 'camerahub_banner.jpg', 'Cameras, lenses, and photography gear.', 'info@camerahub.com', '+1-555-3030', '23 Photo Street', 'Chicago', 'USA', 7800.00, 5.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(28, 7, 'BeautyNest', 'beautynest_logo.png', 'beautynest_banner.jpg', 'Beauty and skincare products for men and women.', 'support@beautynest.com', '+1-555-4040', '19 Rose Avenue', 'Los Angeles', 'USA', 5400.00, 8.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(29, 8, 'BookVerse', 'bookverse_logo.png', 'bookverse_banner.jpg', 'Online bookstore with global shipping.', 'orders@bookverse.com', '+44-20-5555-6666', '8 Library Road', 'London', 'UK', 4100.00, 4.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(30, 9, 'FurniCraft', 'furnicraft_logo.png', 'furnicraft_banner.jpg', 'Home and office furniture at affordable prices.', 'contact@furnicraft.com', '+1-555-5050', '777 Maple Street', 'Toronto', 'Canada', 6900.00, 6.50, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(31, 10, 'FitFlex', 'fitflex_logo.png', 'fitflex_banner.jpg', 'Sports, gym, and fitness equipment supplier.', 'info@fitflex.com', '+49-30-123456', '22 Arena Road', 'Berlin', 'Germany', 5800.00, 5.50, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(32, 11, 'PetWorld', 'petworld_logo.png', 'petworld_banner.jpg', 'Pet food, accessories, and grooming supplies.', 'hello@petworld.com', '+1-555-6060', '99 Paw Street', 'Austin', 'USA', 4700.00, 7.50, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(33, 12, 'SmartTech Hub', 'smarttech_logo.png', 'smarttech_banner.jpg', 'Latest smart gadgets and accessories.', 'sales@smarttech.com', '+1-555-7070', '500 Innovation Ave', 'San Jose', 'USA', 15200.00, 5.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(34, 13, 'PhotoLand', 'photoland_logo.png', 'photoland_banner.jpg', 'Digital cameras and studio lighting gear.', 'info@photoland.com', '+1-555-8080', '47 Studio Road', 'Los Angeles', 'USA', 7200.00, 6.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(35, 14, 'ActiveLife', 'activelife_logo.png', 'activelife_banner.jpg', 'Outdoor and gym equipment store.', 'support@activelife.com', '+1-555-9090', '89 Energy Street', 'Boston', 'USA', 6300.00, 5.50, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(36, 15, 'MobileMart', 'mobilemart_logo.png', 'mobilemart_banner.jpg', 'Authorized reseller of smartphones and accessories.', 'info@mobilemart.com', '+1-555-1112', '12 Tech Lane', 'San Diego', 'USA', 9800.00, 4.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(37, 16, 'PixelPlanet', 'pixelplanet_logo.png', 'pixelplanet_banner.jpg', 'Google, Xiaomi and Android devices.', 'sales@pixelplanet.com', '+1-555-2212', '90 Cloud Avenue', 'Seattle', 'USA', 8800.00, 5.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(38, 17, 'KitchenKing', 'kitchenking_logo.png', 'kitchenking_banner.jpg', 'Kitchen appliances and cookware supplier.', 'orders@kitchenking.com', '+91-7896541230', '5 Spice Road', 'Delhi', 'India', 5200.00, 6.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(39, 18, 'HomeMate', 'homemate_logo.png', 'homemate_banner.jpg', 'Appliances and electronic devices for home.', 'info@homemate.com', '+1-555-3334', '48 Comfort Street', 'Houston', 'USA', 8600.00, 6.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(40, 19, 'NetConnect', 'netconnect_logo.png', 'netconnect_banner.jpg', 'Routers, networking, and computer accessories.', 'contact@netconnect.com', '+1-555-4444', '200 Link Road', 'New York', 'USA', 6900.00, 4.50, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(41, 20, 'LeatherCraft', 'leathercraft_logo.png', 'leathercraft_banner.jpg', 'Genuine leather goods manufacturer.', 'sales@leathercraft.com', '+44-20-9999-8888', '12 Oxford Plaza', 'London', 'UK', 4300.00, 7.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(42, 21, 'GadgetZone', 'gadgetzone_logo.png', 'gadgetzone_banner.jpg', 'All types of electronics and accessories.', 'info@gadgetzone.com', '+1-555-5454', '31 Tech Market', 'Los Angeles', 'USA', 7300.00, 4.50, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(43, 22, 'WearHouse', 'wearhouse_logo.png', 'wearhouse_banner.jpg', 'Modern clothing brand for all genders.', 'support@wearhouse.com', '+1-555-6565', '14 Fashion Blvd', 'Paris', 'France', 5800.00, 6.50, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(44, 23, 'BookHub', 'bookhub_logo.png', 'bookhub_banner.jpg', 'Online bookstore for new and used books.', 'hello@bookhub.com', '+1-555-7676', '321 Read Lane', 'Toronto', 'Canada', 4100.00, 4.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(45, 24, 'SportsWorld', 'sportsworld_logo.png', 'sportsworld_banner.jpg', 'Sports and outdoor gear.', 'sales@sportsworld.com', '+1-555-8787', '9 Stadium Road', 'Chicago', 'USA', 7900.00, 5.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(46, 25, 'BabyJoy', 'babyjoy_logo.png', 'babyjoy_banner.jpg', 'Baby products, toys, and accessories.', 'info@babyjoy.com', '+1-555-9898', '25 Happy Street', 'Orlando', 'USA', 5300.00, 6.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(47, 26, 'GameSpot', 'gamespot_logo.png', 'gamespot_banner.jpg', 'Consoles, games, and accessories.', 'contact@gamespot.com', '+1-555-1212', '100 Play Avenue', 'New York', 'USA', 8800.00, 5.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(48, 27, 'AutoMart', 'automart_logo.png', 'automart_banner.jpg', 'Automotive parts and car care products.', 'info@automart.com', '+1-555-1313', '80 Motor Road', 'Detroit', 'USA', 9500.00, 6.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(49, 28, 'WatchStop', 'watchstop_logo.png', 'watchstop_banner.jpg', 'Watches and accessories for all brands.', 'support@watchstop.com', '+44-20-1212-3434', '65 Time Street', 'London', 'UK', 6200.00, 7.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(50, 29, 'ToyTown', 'toytown_logo.png', 'toytown_banner.jpg', 'Toys and games for all ages.', 'orders@toytown.com', '+1-555-1414', '33 Fun Lane', 'Miami', 'USA', 4800.00, 6.00, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01'),
(51, 30, 'GreenGarden', 'greengarden_logo.png', 'greengarden_banner.jpg', 'Plants, seeds, and gardening tools.', 'info@greengarden.com', '+1-555-1515', '66 Garden Road', 'Seattle', 'USA', 5400.00, 6.50, 'approved', '2025-11-13 19:10:01', '2025-11-13 19:10:01');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
