/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100316
 Source Host           : localhost:3306
 Source Schema         : noithathuynhgia

 Target Server Type    : MySQL
 Target Server Version : 100316
 File Encoding         : 65001

 Date: 11/12/2019 16:08:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` VALUES (1, NULL, 2, 'Sàn Gỗ', 'san-go', '2019-12-05 03:06:43', '2019-12-09 05:05:37');
INSERT INTO `categories` VALUES (2, NULL, 3, 'Vật liệu ngoài trời', 'vat-lieu-ngoai-troi', '2019-12-05 03:06:43', '2019-12-09 05:06:15');
INSERT INTO `categories` VALUES (4, 2, 1, 'Sàn nhựa hãng B', 'san-nhua-aimaru', '2019-12-05 06:53:10', '2019-12-06 07:12:57');
INSERT INTO `categories` VALUES (5, 2, 1, 'Sàn nhựa hãng A', 'san-nhua-galaxy', '2019-12-05 06:58:16', '2019-12-06 07:12:26');
INSERT INTO `categories` VALUES (6, NULL, 1, 'Sàn nhựa', 'san-nhua', '2019-12-05 06:59:00', '2019-12-09 05:05:21');
INSERT INTO `categories` VALUES (7, 6, 1, 'Sàn Gỗ Ban Công', 'san-go-ban-cong', '2019-12-06 07:04:14', '2019-12-06 07:04:14');
INSERT INTO `categories` VALUES (8, NULL, 4, 'Ốp tường - Ốp Trần', 'op-tuong-op-tran', '2019-12-09 05:06:56', '2019-12-09 05:06:56');
INSERT INTO `categories` VALUES (9, NULL, 5, 'Cửa nhựa ABS', 'cua-nhua-abs', '2019-12-09 05:07:44', '2019-12-09 05:07:44');
INSERT INTO `categories` VALUES (10, NULL, 6, 'Đồ nội thất', 'do-noi-that', '2019-12-09 05:08:02', '2019-12-09 05:08:02');
INSERT INTO `categories` VALUES (11, NULL, 7, 'Phụ kiện', 'phu-kien', '2019-12-09 05:08:19', '2019-12-09 05:08:19');
COMMIT;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name_unique` (`name`),
  UNIQUE KEY `category_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (1, 'Laptops', 'laptops', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `category` VALUES (2, 'Desktops', 'desktops', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `category` VALUES (3, 'Mobile Phones', 'mobile-phones', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `category` VALUES (4, 'Tablets', 'tablets', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `category` VALUES (5, 'TVs', 'tvs', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `category` VALUES (6, 'Digital Cameras', 'digital-cameras', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `category` VALUES (7, 'Appliances', 'appliances', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
COMMIT;

-- ----------------------------
-- Table structure for category_product
-- ----------------------------
DROP TABLE IF EXISTS `category_product`;
CREATE TABLE `category_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_product_product_id_foreign` (`product_id`),
  KEY `category_product_category_id_foreign` (`category_id`),
  CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of category_product
-- ----------------------------
BEGIN;
INSERT INTO `category_product` VALUES (41, 33, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (42, 34, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (43, 35, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (44, 36, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (45, 37, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (46, 38, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (47, 39, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (48, 40, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (49, 41, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (50, 42, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (51, 43, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (52, 44, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (53, 45, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (54, 46, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (55, 47, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (56, 48, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (57, 49, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (58, 50, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (59, 51, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (60, 52, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (61, 53, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (62, 54, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (63, 55, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (64, 56, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (65, 57, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (66, 58, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (67, 59, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (68, 60, 1, NULL, NULL);
INSERT INTO `category_product` VALUES (73, 32, 1, '2019-12-06 10:25:31', '2019-12-06 10:25:31');
INSERT INTO `category_product` VALUES (84, 31, 2, '2019-12-09 16:00:03', '2019-12-09 16:00:03');
INSERT INTO `category_product` VALUES (85, 31, 5, '2019-12-09 16:00:03', '2019-12-09 16:00:03');
COMMIT;

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) DEFAULT NULL,
  `percent_off` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of coupons
-- ----------------------------
BEGIN;
INSERT INTO `coupons` VALUES (1, 'ABC123', 'fixed', 3000, NULL, '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `coupons` VALUES (2, 'DEF456', 'percent', NULL, 50, '2019-12-05 03:06:43', '2019-12-05 03:06:43');
COMMIT;

-- ----------------------------
-- Table structure for data_rows
-- ----------------------------
DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of data_rows
-- ----------------------------
BEGIN;
INSERT INTO `data_rows` VALUES (1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '\"\"', 1);
INSERT INTO `data_rows` VALUES (2, 1, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, '\"\"', 2);
INSERT INTO `data_rows` VALUES (3, 1, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, '\"\"', 3);
INSERT INTO `data_rows` VALUES (4, 1, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '\"\"', 4);
INSERT INTO `data_rows` VALUES (5, 1, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '\"\"', 5);
INSERT INTO `data_rows` VALUES (6, 1, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '\"\"', 6);
INSERT INTO `data_rows` VALUES (7, 1, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '\"{\\\"resize\\\":{\\\"width\\\":\\\"1000\\\",\\\"height\\\":\\\"null\\\"},\\\"quality\\\":\\\"70%\\\",\\\"upsize\\\":true,\\\"thumbnails\\\":[{\\\"name\\\":\\\"medium\\\",\\\"scale\\\":\\\"50%\\\"},{\\\"name\\\":\\\"small\\\",\\\"scale\\\":\\\"25%\\\"},{\\\"name\\\":\\\"cropped\\\",\\\"crop\\\":{\\\"width\\\":\\\"300\\\",\\\"height\\\":\\\"250\\\"}}]}\"', 7);
INSERT INTO `data_rows` VALUES (8, 1, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '\"{\\\"slugify\\\":{\\\"origin\\\":\\\"title\\\",\\\"forceUpdate\\\":true}}\"', 8);
INSERT INTO `data_rows` VALUES (9, 1, 'meta_description', 'text_area', 'meta_description', 1, 0, 1, 1, 1, 1, '\"\"', 9);
INSERT INTO `data_rows` VALUES (10, 1, 'meta_keywords', 'text_area', 'meta_keywords', 1, 0, 1, 1, 1, 1, '\"\"', 10);
INSERT INTO `data_rows` VALUES (11, 1, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '\"{\\\"default\\\":\\\"DRAFT\\\",\\\"options\\\":{\\\"PUBLISHED\\\":\\\"published\\\",\\\"DRAFT\\\":\\\"draft\\\",\\\"PENDING\\\":\\\"pending\\\"}}\"', 11);
INSERT INTO `data_rows` VALUES (12, 1, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, '\"\"', 12);
INSERT INTO `data_rows` VALUES (13, 1, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '\"\"', 13);
INSERT INTO `data_rows` VALUES (14, 2, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '\"\"', 1);
INSERT INTO `data_rows` VALUES (15, 2, 'author_id', 'text', 'author_id', 1, 0, 0, 0, 0, 0, '\"\"', 2);
INSERT INTO `data_rows` VALUES (16, 2, 'title', 'text', 'title', 1, 1, 1, 1, 1, 1, '\"\"', 3);
INSERT INTO `data_rows` VALUES (17, 2, 'excerpt', 'text_area', 'excerpt', 0, 0, 1, 1, 1, 1, '\"\"', 4);
INSERT INTO `data_rows` VALUES (18, 2, 'body', 'rich_text_box', 'body', 0, 0, 1, 1, 1, 1, '\"\"', 5);
INSERT INTO `data_rows` VALUES (19, 2, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"}}', 6);
INSERT INTO `data_rows` VALUES (20, 2, 'meta_description', 'text', 'meta_description', 0, 0, 1, 1, 1, 1, '\"\"', 7);
INSERT INTO `data_rows` VALUES (21, 2, 'meta_keywords', 'text', 'meta_keywords', 0, 0, 1, 1, 1, 1, '\"\"', 8);
INSERT INTO `data_rows` VALUES (22, 2, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9);
INSERT INTO `data_rows` VALUES (23, 2, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, '\"\"', 10);
INSERT INTO `data_rows` VALUES (24, 2, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '\"\"', 11);
INSERT INTO `data_rows` VALUES (25, 2, 'image', 'image', 'image', 0, 1, 1, 1, 1, 1, '\"\"', 12);
INSERT INTO `data_rows` VALUES (26, 3, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '\"\"', 1);
INSERT INTO `data_rows` VALUES (27, 3, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '\"\"', 2);
INSERT INTO `data_rows` VALUES (28, 3, 'email', 'text', 'email', 1, 1, 1, 1, 1, 1, '\"\"', 3);
INSERT INTO `data_rows` VALUES (29, 3, 'password', 'password', 'password', 0, 0, 0, 1, 1, 0, '\"\"', 4);
INSERT INTO `data_rows` VALUES (30, 3, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10);
INSERT INTO `data_rows` VALUES (31, 3, 'remember_token', 'text', 'remember_token', 0, 0, 0, 0, 0, 0, '\"\"', 5);
INSERT INTO `data_rows` VALUES (32, 3, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, '\"\"', 6);
INSERT INTO `data_rows` VALUES (33, 3, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '\"\"', 7);
INSERT INTO `data_rows` VALUES (34, 3, 'avatar', 'image', 'avatar', 0, 1, 1, 1, 1, 1, '\"\"', 8);
INSERT INTO `data_rows` VALUES (35, 5, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '\"\"', 1);
INSERT INTO `data_rows` VALUES (36, 5, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '\"\"', 2);
INSERT INTO `data_rows` VALUES (37, 5, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '\"\"', 3);
INSERT INTO `data_rows` VALUES (38, 5, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '\"\"', 4);
INSERT INTO `data_rows` VALUES (39, 4, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '\"\"', 1);
INSERT INTO `data_rows` VALUES (40, 4, 'parent_id', 'select_dropdown', 'parent_id', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2);
INSERT INTO `data_rows` VALUES (41, 4, 'order', 'text', 'order', 1, 0, 0, 0, 0, 0, '\"{\\\"default\\\":1}\"', 3);
INSERT INTO `data_rows` VALUES (42, 4, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '\"\"', 4);
INSERT INTO `data_rows` VALUES (43, 4, 'slug', 'text', 'slug', 1, 1, 1, 1, 1, 1, '\"{\\\"slugify\\\":{\\\"origin\\\":\\\"name\\\"}}\"', 5);
INSERT INTO `data_rows` VALUES (44, 4, 'created_at', 'timestamp', 'created_at', 0, 0, 1, 0, 0, 0, '\"\"', 6);
INSERT INTO `data_rows` VALUES (45, 4, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '\"\"', 7);
INSERT INTO `data_rows` VALUES (46, 6, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '\"\"', 1);
INSERT INTO `data_rows` VALUES (47, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '\"\"', 2);
INSERT INTO `data_rows` VALUES (48, 6, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '\"\"', 3);
INSERT INTO `data_rows` VALUES (49, 6, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '\"\"', 4);
INSERT INTO `data_rows` VALUES (50, 6, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '\"\"', 5);
INSERT INTO `data_rows` VALUES (51, 1, 'seo_title', 'text', 'seo_title', 0, 1, 1, 1, 1, 1, '\"\"', 14);
INSERT INTO `data_rows` VALUES (52, 1, 'featured', 'checkbox', 'featured', 1, 1, 1, 1, 1, 1, '\"\"', 15);
INSERT INTO `data_rows` VALUES (53, 3, 'role_id', 'text', 'role_id', 1, 1, 1, 1, 1, 1, '\"\"', 9);
INSERT INTO `data_rows` VALUES (54, 3, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11);
INSERT INTO `data_rows` VALUES (55, 7, 'id', 'hidden', 'Id', 1, 1, 1, 1, 1, 0, '\"\"', 1);
INSERT INTO `data_rows` VALUES (56, 7, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '\"{\\\"validation\\\":{\\\"rule\\\":\\\"max:100\\\"}}\"', 2);
INSERT INTO `data_rows` VALUES (57, 7, 'slug', 'text', 'slug', 1, 1, 1, 1, 1, 1, '\"\"', 3);
INSERT INTO `data_rows` VALUES (58, 7, 'details', 'rich_text_box', 'Details', 0, 1, 1, 1, 1, 1, '\"\"', 6);
INSERT INTO `data_rows` VALUES (59, 7, 'price', 'number', 'price', 1, 1, 1, 1, 1, 1, '\"{\\\"validation\\\":{\\\"rule\\\":\\\"required|regex:\\/^\\\\\\\\d*(\\\\\\\\.\\\\\\\\d{1,2})?$\\/\\\"}}\"', 4);
INSERT INTO `data_rows` VALUES (60, 7, 'description', 'rich_text_box', 'Description', 1, 1, 1, 1, 1, 1, '\"\"', 7);
INSERT INTO `data_rows` VALUES (61, 7, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, '\"{\\\"on\\\":\\\"Yes\\\",\\\"off\\\":\\\"No\\\"}\"', 5);
INSERT INTO `data_rows` VALUES (62, 7, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '\"{\\\"quality\\\":\\\"70%\\\",\\\"thumbnails\\\":[{\\\"name\\\":\\\"medium\\\",\\\"scale\\\":\\\"50%\\\"},{\\\"name\\\":\\\"small\\\",\\\"scale\\\":\\\"25%\\\"},{\\\"name\\\":\\\"cropped\\\",\\\"crop\\\":{\\\"width\\\":\\\"300\\\",\\\"height\\\":\\\"250\\\"}}]}\"', 8);
INSERT INTO `data_rows` VALUES (63, 7, 'images', 'multiple_images', 'Images', 0, 1, 1, 1, 1, 1, '\"\"', 10);
INSERT INTO `data_rows` VALUES (64, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 1, 1, '\"\"', 11);
INSERT INTO `data_rows` VALUES (65, 7, 'updated_at', 'timestamp', 'Updated At', 0, 1, 1, 1, 1, 1, '\"\"', 12);
INSERT INTO `data_rows` VALUES (66, 7, 'quantity', 'number', 'Quantity', 1, 1, 1, 1, 1, 1, '\"\"', 9);
INSERT INTO `data_rows` VALUES (67, 8, 'id', 'hidden', 'Id', 1, 1, 1, 0, 0, 0, '\"\"', 1);
INSERT INTO `data_rows` VALUES (68, 8, 'code', 'text', 'code', 1, 1, 1, 1, 1, 1, '\"\"', 2);
INSERT INTO `data_rows` VALUES (69, 8, 'type', 'select_dropdown', 'Type', 1, 1, 1, 1, 1, 1, '\"{\\\"default\\\":\\\"fixed\\\",\\\"options\\\":{\\\"fixed\\\":\\\"Fixed Value\\\",\\\"percent\\\":\\\"Percent Off\\\"}}\"', 3);
INSERT INTO `data_rows` VALUES (70, 8, 'value', 'number', 'Value', 0, 1, 1, 1, 1, 1, '\"{\\\"null\\\":\\\"\\\"}\"', 4);
INSERT INTO `data_rows` VALUES (71, 8, 'percent_off', 'number', 'Percent Off', 0, 1, 1, 1, 1, 1, '\"{\\\"null\\\":\\\"\\\"}\"', 5);
INSERT INTO `data_rows` VALUES (72, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '\"\"', 6);
INSERT INTO `data_rows` VALUES (73, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '\"\"', 7);
INSERT INTO `data_rows` VALUES (74, 9, 'id', 'hidden', 'Id', 1, 1, 1, 0, 0, 0, '\"\"', 1);
INSERT INTO `data_rows` VALUES (75, 9, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '\"\"', 3);
INSERT INTO `data_rows` VALUES (76, 9, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '\"\"', 4);
INSERT INTO `data_rows` VALUES (77, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '\"\"', 6);
INSERT INTO `data_rows` VALUES (78, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '\"\"', 7);
INSERT INTO `data_rows` VALUES (79, 10, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '\"\"', 1);
INSERT INTO `data_rows` VALUES (80, 10, 'product_id', 'number', 'Product Id', 1, 1, 1, 1, 1, 1, '\"\"', 2);
INSERT INTO `data_rows` VALUES (81, 10, 'category_id', 'number', 'Category Id', 1, 1, 1, 1, 1, 1, '\"\"', 3);
INSERT INTO `data_rows` VALUES (82, 10, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '\"\"', 4);
INSERT INTO `data_rows` VALUES (83, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '\"\"', 5);
INSERT INTO `data_rows` VALUES (84, 11, 'id', 'hidden', 'Id', 1, 1, 1, 0, 0, 0, '\"\"', 1);
INSERT INTO `data_rows` VALUES (85, 11, 'user_id', 'number', 'User Id', 1, 1, 1, 0, 0, 0, '\"\"', 2);
INSERT INTO `data_rows` VALUES (86, 11, 'billing_email', 'text', 'Billing Email', 1, 1, 1, 1, 1, 0, '\"\"', 3);
INSERT INTO `data_rows` VALUES (87, 11, 'billing_name', 'text', 'Billing Name', 1, 1, 1, 1, 1, 0, '\"\"', 4);
INSERT INTO `data_rows` VALUES (88, 11, 'billing_address', 'text', 'Billing Address', 1, 1, 1, 1, 1, 0, '\"\"', 5);
INSERT INTO `data_rows` VALUES (89, 11, 'billing_city', 'text', 'Billing City', 1, 1, 1, 1, 1, 0, '\"\"', 6);
INSERT INTO `data_rows` VALUES (90, 11, 'billing_province', 'text', 'Billing Province', 1, 0, 1, 1, 1, 0, '\"\"', 7);
INSERT INTO `data_rows` VALUES (91, 11, 'billing_postalcode', 'text', 'Billing Postalcode', 1, 0, 1, 1, 1, 0, '\"\"', 8);
INSERT INTO `data_rows` VALUES (92, 11, 'billing_phone', 'text', 'Billing Phone', 1, 0, 1, 1, 1, 0, '\"\"', 9);
INSERT INTO `data_rows` VALUES (93, 11, 'billing_name_on_card', 'text', 'Billing Name On Card', 1, 1, 1, 1, 1, 0, '\"\"', 10);
INSERT INTO `data_rows` VALUES (94, 11, 'billing_discount', 'number', 'Discount', 1, 1, 1, 0, 0, 0, '\"\"', 11);
INSERT INTO `data_rows` VALUES (95, 11, 'billing_discount_code', 'text', 'Discount Code', 0, 0, 1, 0, 0, 0, '\"\"', 12);
INSERT INTO `data_rows` VALUES (96, 11, 'billing_subtotal', 'number', 'Subtotal', 1, 1, 1, 0, 0, 0, '\"\"', 13);
INSERT INTO `data_rows` VALUES (97, 11, 'billing_tax', 'number', 'Tax', 1, 1, 1, 0, 0, 0, '\"\"', 14);
INSERT INTO `data_rows` VALUES (98, 11, 'billing_total', 'number', 'Total', 1, 1, 1, 0, 0, 0, '\"\"', 15);
INSERT INTO `data_rows` VALUES (99, 11, 'payment_gateway', 'text', 'Payment Gateway', 1, 0, 1, 0, 0, 0, '\"\"', 16);
INSERT INTO `data_rows` VALUES (100, 11, 'shipped', 'checkbox', 'Shipped', 1, 1, 1, 1, 0, 0, '\"{\\\"on\\\":\\\"Yes\\\",\\\"off\\\":\\\"No\\\"}\"', 17);
INSERT INTO `data_rows` VALUES (101, 11, 'error', 'text', 'Error', 0, 1, 1, 0, 0, 0, '\"\"', 18);
INSERT INTO `data_rows` VALUES (102, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '\"\"', 19);
INSERT INTO `data_rows` VALUES (103, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '\"\"', 20);
INSERT INTO `data_rows` VALUES (104, 9, 'parent_id', 'select_dropdown', 'Parent Id', 0, 1, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2);
INSERT INTO `data_rows` VALUES (105, 9, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{}', 5);
INSERT INTO `data_rows` VALUES (106, 4, 'category_hasone_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Category\",\"table\":\"categories\",\"type\":\"hasOne\",\"column\":\"id\",\"key\":\"id\",\"label\":\"parent_id\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8);
INSERT INTO `data_rows` VALUES (109, 9, 'category_hasone_category_relationship_1', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Category\",\"table\":\"categories\",\"type\":\"hasOne\",\"column\":\"id\",\"key\":\"id\",\"label\":\"parent_id\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8);
INSERT INTO `data_rows` VALUES (110, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (111, 12, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 2);
COMMIT;

-- ----------------------------
-- Table structure for data_types
-- ----------------------------
DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of data_types
-- ----------------------------
BEGIN;
INSERT INTO `data_types` VALUES (1, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `data_types` VALUES (2, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-12-05 03:06:43', '2019-12-09 08:13:19');
INSERT INTO `data_types` VALUES (3, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '\\App\\Http\\Controllers\\Voyager\\UsersController', '', 1, 0, NULL, '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `data_types` VALUES (4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-12-05 03:06:43', '2019-12-05 06:24:30');
INSERT INTO `data_types` VALUES (5, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `data_types` VALUES (6, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `data_types` VALUES (7, 'products', 'products', 'Product', 'Products', 'voyager-bag', 'App\\Product', NULL, '\\App\\Http\\Controllers\\Voyager\\ProductsController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-12-05 03:06:43', '2019-12-07 08:11:46');
INSERT INTO `data_types` VALUES (8, 'coupons', 'coupons', 'Coupon', 'Coupons', 'voyager-dollar', 'App\\Coupon', NULL, '', '', 1, 0, NULL, '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `data_types` VALUES (9, 'category', 'category', 'Category', 'Categories', 'voyager-tag', 'App\\Category', NULL, 'App\\Http\\Controllers\\Voyager\\CategoryController', NULL, 1, 0, '{\"order_column\":\"parent_id\",\"order_display_column\":\"parent_id\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-12-05 03:06:43', '2019-12-09 05:09:03');
INSERT INTO `data_types` VALUES (10, 'category-product', 'category-product', 'Category Product', 'Category Products', 'voyager-categories', 'App\\CategoryProduct', NULL, '', '', 1, 0, NULL, '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `data_types` VALUES (11, 'orders', 'orders', 'Order', 'Orders', 'voyager-documentation', 'App\\Order', NULL, '\\App\\Http\\Controllers\\Voyager\\OrdersController', '', 1, 0, NULL, '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `data_types` VALUES (12, 'email_customer', 'email-customer', 'Email Customer', 'Email Customers', NULL, 'App\\EmailCustomer', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-12-09 07:54:37', '2019-12-09 07:54:37');
COMMIT;

-- ----------------------------
-- Table structure for email_customer
-- ----------------------------
DROP TABLE IF EXISTS `email_customer`;
CREATE TABLE `email_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of email_customer
-- ----------------------------
BEGIN;
INSERT INTO `email_customer` VALUES (1, 'cau2binhdinh@gmail.com');
COMMIT;

-- ----------------------------
-- Table structure for menu_items
-- ----------------------------
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menu_items
-- ----------------------------
BEGIN;
INSERT INTO `menu_items` VALUES (1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-12-05 03:06:43', '2019-12-05 03:06:43', 'voyager.dashboard', NULL);
INSERT INTO `menu_items` VALUES (2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 9, '2019-12-05 03:06:43', '2019-12-05 03:06:43', 'voyager.media.index', NULL);
INSERT INTO `menu_items` VALUES (3, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 10, '2019-12-05 03:06:43', '2019-12-05 03:06:43', 'voyager.posts.index', NULL);
INSERT INTO `menu_items` VALUES (4, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 8, '2019-12-05 03:06:43', '2019-12-05 03:06:43', 'voyager.users.index', NULL);
INSERT INTO `menu_items` VALUES (5, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 15, '2019-12-05 03:06:43', '2019-12-09 07:52:45', 'voyager.categories.index', NULL);
INSERT INTO `menu_items` VALUES (6, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 13, '2019-12-05 03:06:43', '2019-12-09 07:52:54', 'voyager.pages.index', NULL);
INSERT INTO `menu_items` VALUES (7, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 7, '2019-12-05 03:06:43', '2019-12-05 03:06:43', 'voyager.roles.index', NULL);
INSERT INTO `menu_items` VALUES (8, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 14, '2019-12-05 03:06:43', '2019-12-09 07:52:54', NULL, NULL);
INSERT INTO `menu_items` VALUES (9, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 8, 1, '2019-12-05 03:06:43', '2019-12-05 03:06:43', 'voyager.menus.index', NULL);
INSERT INTO `menu_items` VALUES (10, 1, 'Database', '', '_self', 'voyager-data', NULL, 8, 2, '2019-12-05 03:06:43', '2019-12-05 03:06:43', 'voyager.database.index', NULL);
INSERT INTO `menu_items` VALUES (11, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 8, 3, '2019-12-05 03:06:43', '2019-12-05 03:06:43', 'voyager.compass.index', NULL);
INSERT INTO `menu_items` VALUES (12, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 12, '2019-12-05 03:06:43', '2019-12-09 07:52:54', 'voyager.settings.index', NULL);
INSERT INTO `menu_items` VALUES (13, 1, 'Orders', '/admin/orders', '_self', 'voyager-documentation', NULL, NULL, 2, '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL, NULL);
INSERT INTO `menu_items` VALUES (14, 1, 'Products', '/admin/products', '_self', 'voyager-bag', NULL, NULL, 3, '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL, NULL);
INSERT INTO `menu_items` VALUES (15, 1, 'Categories', '/admin/category', '_self', 'voyager-tag', NULL, NULL, 4, '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL, NULL);
INSERT INTO `menu_items` VALUES (16, 1, 'Coupons', '/admin/coupons', '_self', 'voyager-dollar', NULL, NULL, 5, '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL, NULL);
INSERT INTO `menu_items` VALUES (17, 1, 'Category Products', '/admin/category-product', '_self', 'voyager-categories', NULL, NULL, 6, '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL, NULL);
INSERT INTO `menu_items` VALUES (21, 3, 'Follow Me:', '', '_self', NULL, NULL, NULL, 1, '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL, NULL);
INSERT INTO `menu_items` VALUES (22, 3, 'fa-globe', 'http://andremadarang.com', '_self', NULL, NULL, NULL, 2, '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL, NULL);
INSERT INTO `menu_items` VALUES (23, 3, 'fa-youtube', 'http://youtube.com/drehimself', '_self', NULL, NULL, NULL, 2, '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL, NULL);
INSERT INTO `menu_items` VALUES (24, 3, 'fa-github', 'http://github.com/drehimself', '_self', NULL, NULL, NULL, 2, '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL, NULL);
INSERT INTO `menu_items` VALUES (25, 3, 'fa-twitter', 'http://twitter.com/drehimself', '_self', NULL, NULL, NULL, 2, '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL, NULL);
INSERT INTO `menu_items` VALUES (26, 1, 'Email khách hàng', 'admin/email-customer', '_self', 'voyager-person', '#000000', NULL, 11, '2019-12-09 07:51:33', '2019-12-09 07:53:58', NULL, '');
INSERT INTO `menu_items` VALUES (28, 2, 'Trang Chủ', '', '_self', NULL, '#000000', NULL, 1, '2019-12-09 09:42:42', '2019-12-09 09:42:50', 'landing-page', NULL);
COMMIT;

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menus
-- ----------------------------
BEGIN;
INSERT INTO `menus` VALUES (1, 'admin', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `menus` VALUES (2, 'main', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `menus` VALUES (3, 'footer', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_01_000000_add_voyager_user_fields', 1);
INSERT INTO `migrations` VALUES (4, '2016_01_01_000000_create_data_types_table', 1);
INSERT INTO `migrations` VALUES (5, '2016_01_01_000000_create_pages_table', 1);
INSERT INTO `migrations` VALUES (6, '2016_01_01_000000_create_posts_table', 1);
INSERT INTO `migrations` VALUES (7, '2016_02_15_204651_create_categories_table', 1);
INSERT INTO `migrations` VALUES (8, '2016_05_19_173453_create_menu_table', 1);
INSERT INTO `migrations` VALUES (9, '2016_10_21_190000_create_roles_table', 1);
INSERT INTO `migrations` VALUES (10, '2016_10_21_190000_create_settings_table', 1);
INSERT INTO `migrations` VALUES (11, '2016_11_30_135954_create_permission_table', 1);
INSERT INTO `migrations` VALUES (12, '2016_11_30_141208_create_permission_role_table', 1);
INSERT INTO `migrations` VALUES (13, '2016_12_26_201236_data_types__add__server_side', 1);
INSERT INTO `migrations` VALUES (14, '2017_01_13_000000_add_route_to_menu_items_table', 1);
INSERT INTO `migrations` VALUES (15, '2017_01_14_005015_create_translations_table', 1);
INSERT INTO `migrations` VALUES (16, '2017_01_15_000000_add_permission_group_id_to_permissions_table', 1);
INSERT INTO `migrations` VALUES (17, '2017_01_15_000000_create_permission_groups_table', 1);
INSERT INTO `migrations` VALUES (18, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1);
INSERT INTO `migrations` VALUES (19, '2017_03_06_000000_add_controller_to_data_types_table', 1);
INSERT INTO `migrations` VALUES (20, '2017_04_11_000000_alter_post_nullable_fields_table', 1);
INSERT INTO `migrations` VALUES (21, '2017_04_21_000000_add_order_to_data_rows_table', 1);
INSERT INTO `migrations` VALUES (22, '2017_07_05_210000_add_policyname_to_data_types_table', 1);
INSERT INTO `migrations` VALUES (23, '2017_08_05_000000_add_group_to_settings_table', 1);
INSERT INTO `migrations` VALUES (24, '2017_11_26_013050_add_user_role_relationship', 1);
INSERT INTO `migrations` VALUES (25, '2017_11_26_015000_create_user_roles_table', 1);
INSERT INTO `migrations` VALUES (26, '2017_12_11_054653_create_products_table', 1);
INSERT INTO `migrations` VALUES (27, '2018_01_11_060124_create_category_table', 1);
INSERT INTO `migrations` VALUES (28, '2018_01_11_060548_create_category_product_table', 1);
INSERT INTO `migrations` VALUES (29, '2018_01_14_215535_create_coupons_table', 1);
INSERT INTO `migrations` VALUES (30, '2018_02_08_021546_add_image_to_products_table', 1);
INSERT INTO `migrations` VALUES (31, '2018_02_08_032544_add_images_to_products_table', 1);
INSERT INTO `migrations` VALUES (32, '2018_02_25_005243_create_orders_table', 1);
INSERT INTO `migrations` VALUES (33, '2018_02_25_010522_create_order_product_table', 1);
INSERT INTO `migrations` VALUES (34, '2018_03_11_000000_add_user_settings', 1);
INSERT INTO `migrations` VALUES (35, '2018_03_14_000000_add_details_to_data_types_table', 1);
INSERT INTO `migrations` VALUES (36, '2018_03_16_000000_make_settings_value_nullable', 1);
INSERT INTO `migrations` VALUES (37, '2018_04_23_011947_add_user_role_relationship_fix', 1);
INSERT INTO `migrations` VALUES (38, '2018_04_23_012009_create_user_roles_table_fix', 1);
INSERT INTO `migrations` VALUES (39, '2018_06_29_032914_add_quantity_to_products_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_product_order_id_foreign` (`order_id`),
  KEY `order_product_product_id_foreign` (`product_id`),
  CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_product
-- ----------------------------
BEGIN;
INSERT INTO `order_product` VALUES (1, 1, NULL, 1, '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `order_product` VALUES (2, 1, NULL, 1, '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `order_product` VALUES (3, 2, NULL, 1, '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `order_product` VALUES (4, 2, NULL, 1, '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `order_product` VALUES (5, 3, NULL, 1, '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `order_product` VALUES (6, 3, NULL, 1, '2019-12-05 03:06:43', '2019-12-05 03:06:43');
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `billing_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_postalcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_name_on_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_discount` int(11) NOT NULL DEFAULT 0,
  `billing_discount_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_subtotal` int(11) NOT NULL,
  `billing_tax` int(11) NOT NULL,
  `billing_total` int(11) NOT NULL,
  `payment_gateway` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stripe',
  `shipped` tinyint(1) NOT NULL DEFAULT 0,
  `error` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES (1, NULL, 'email@email.com', 'Fake Order', 'Fake Address', 'Fake City', 'Fake Province', 'L5B4U2', '9052145636', 'Fake Name on Card', 0, NULL, 12345, 1605, 13950, 'stripe', 0, NULL, '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `orders` VALUES (2, NULL, 'another@another.com', 'Fake Order 2', 'Fake Address 2', 'Fake City 2', 'Fake Province 2', 'L5B4U2', '9052145636', 'Fake Name on Card', 0, NULL, 12345, 1605, 13950, 'stripe', 0, 'Card was declined', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `orders` VALUES (3, NULL, 'fake@fake.com', 'Fake Order 3', 'Fake Address 3', 'Fake City 3', 'Fake Province 3', 'L5B4U2', '9052145636', 'Fake Name on Card', 0, NULL, 12345, 1605, 13950, 'stripe', 1, NULL, '2019-12-05 03:06:43', '2019-12-05 03:06:43');
COMMIT;

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pages
-- ----------------------------
BEGIN;
INSERT INTO `pages` VALUES (1, 1, 'Liên hệ', 'Vui long liên hệ', '<p>Vui long li&ecirc;n hệ&nbsp;</p>\r\n<p>Trung t&acirc;m hỗ trợ kh&aacute;ch h&agrave;ng</p>\r\n<p><em><strong>Địa chỉ:</strong></em></p>', NULL, 'lien-he', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2019-12-05 03:06:43', '2019-12-09 08:14:58');
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for permission_groups
-- ----------------------------
DROP TABLE IF EXISTS `permission_groups`;
CREATE TABLE `permission_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_groups_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
BEGIN;
INSERT INTO `permission_role` VALUES (1, 1);
INSERT INTO `permission_role` VALUES (1, 3);
INSERT INTO `permission_role` VALUES (2, 1);
INSERT INTO `permission_role` VALUES (2, 3);
INSERT INTO `permission_role` VALUES (3, 1);
INSERT INTO `permission_role` VALUES (4, 1);
INSERT INTO `permission_role` VALUES (5, 1);
INSERT INTO `permission_role` VALUES (6, 1);
INSERT INTO `permission_role` VALUES (7, 1);
INSERT INTO `permission_role` VALUES (8, 1);
INSERT INTO `permission_role` VALUES (9, 1);
INSERT INTO `permission_role` VALUES (10, 1);
INSERT INTO `permission_role` VALUES (11, 1);
INSERT INTO `permission_role` VALUES (11, 3);
INSERT INTO `permission_role` VALUES (12, 1);
INSERT INTO `permission_role` VALUES (12, 3);
INSERT INTO `permission_role` VALUES (13, 1);
INSERT INTO `permission_role` VALUES (13, 3);
INSERT INTO `permission_role` VALUES (14, 1);
INSERT INTO `permission_role` VALUES (15, 1);
INSERT INTO `permission_role` VALUES (16, 1);
INSERT INTO `permission_role` VALUES (17, 1);
INSERT INTO `permission_role` VALUES (18, 1);
INSERT INTO `permission_role` VALUES (19, 1);
INSERT INTO `permission_role` VALUES (20, 1);
INSERT INTO `permission_role` VALUES (21, 1);
INSERT INTO `permission_role` VALUES (22, 1);
INSERT INTO `permission_role` VALUES (22, 3);
INSERT INTO `permission_role` VALUES (23, 1);
INSERT INTO `permission_role` VALUES (24, 1);
INSERT INTO `permission_role` VALUES (25, 1);
INSERT INTO `permission_role` VALUES (26, 1);
INSERT INTO `permission_role` VALUES (26, 3);
INSERT INTO `permission_role` VALUES (27, 1);
INSERT INTO `permission_role` VALUES (27, 3);
INSERT INTO `permission_role` VALUES (28, 1);
INSERT INTO `permission_role` VALUES (28, 3);
INSERT INTO `permission_role` VALUES (29, 1);
INSERT INTO `permission_role` VALUES (29, 3);
INSERT INTO `permission_role` VALUES (30, 1);
INSERT INTO `permission_role` VALUES (30, 3);
INSERT INTO `permission_role` VALUES (31, 1);
INSERT INTO `permission_role` VALUES (32, 1);
INSERT INTO `permission_role` VALUES (33, 1);
INSERT INTO `permission_role` VALUES (34, 1);
INSERT INTO `permission_role` VALUES (35, 1);
INSERT INTO `permission_role` VALUES (36, 1);
INSERT INTO `permission_role` VALUES (36, 3);
INSERT INTO `permission_role` VALUES (37, 1);
INSERT INTO `permission_role` VALUES (37, 3);
INSERT INTO `permission_role` VALUES (38, 1);
INSERT INTO `permission_role` VALUES (38, 3);
INSERT INTO `permission_role` VALUES (39, 1);
INSERT INTO `permission_role` VALUES (39, 3);
INSERT INTO `permission_role` VALUES (40, 1);
INSERT INTO `permission_role` VALUES (41, 1);
INSERT INTO `permission_role` VALUES (41, 3);
INSERT INTO `permission_role` VALUES (42, 1);
INSERT INTO `permission_role` VALUES (42, 3);
INSERT INTO `permission_role` VALUES (43, 1);
INSERT INTO `permission_role` VALUES (43, 3);
INSERT INTO `permission_role` VALUES (44, 1);
INSERT INTO `permission_role` VALUES (44, 3);
INSERT INTO `permission_role` VALUES (45, 1);
INSERT INTO `permission_role` VALUES (45, 3);
INSERT INTO `permission_role` VALUES (46, 1);
INSERT INTO `permission_role` VALUES (46, 3);
INSERT INTO `permission_role` VALUES (47, 1);
INSERT INTO `permission_role` VALUES (47, 3);
INSERT INTO `permission_role` VALUES (48, 1);
INSERT INTO `permission_role` VALUES (48, 3);
INSERT INTO `permission_role` VALUES (49, 1);
INSERT INTO `permission_role` VALUES (49, 3);
INSERT INTO `permission_role` VALUES (50, 1);
INSERT INTO `permission_role` VALUES (50, 3);
INSERT INTO `permission_role` VALUES (51, 1);
INSERT INTO `permission_role` VALUES (51, 3);
INSERT INTO `permission_role` VALUES (52, 1);
INSERT INTO `permission_role` VALUES (52, 3);
INSERT INTO `permission_role` VALUES (53, 1);
INSERT INTO `permission_role` VALUES (53, 3);
INSERT INTO `permission_role` VALUES (54, 1);
INSERT INTO `permission_role` VALUES (54, 3);
INSERT INTO `permission_role` VALUES (55, 1);
INSERT INTO `permission_role` VALUES (56, 1);
INSERT INTO `permission_role` VALUES (56, 3);
INSERT INTO `permission_role` VALUES (57, 1);
INSERT INTO `permission_role` VALUES (57, 3);
INSERT INTO `permission_role` VALUES (58, 1);
INSERT INTO `permission_role` VALUES (58, 3);
INSERT INTO `permission_role` VALUES (59, 1);
INSERT INTO `permission_role` VALUES (59, 3);
INSERT INTO `permission_role` VALUES (60, 1);
INSERT INTO `permission_role` VALUES (60, 3);
INSERT INTO `permission_role` VALUES (61, 1);
INSERT INTO `permission_role` VALUES (61, 3);
INSERT INTO `permission_role` VALUES (62, 1);
INSERT INTO `permission_role` VALUES (62, 3);
INSERT INTO `permission_role` VALUES (63, 1);
INSERT INTO `permission_role` VALUES (63, 3);
INSERT INTO `permission_role` VALUES (64, 1);
INSERT INTO `permission_role` VALUES (64, 3);
INSERT INTO `permission_role` VALUES (65, 1);
INSERT INTO `permission_role` VALUES (65, 3);
INSERT INTO `permission_role` VALUES (66, 1);
INSERT INTO `permission_role` VALUES (66, 3);
INSERT INTO `permission_role` VALUES (67, 1);
INSERT INTO `permission_role` VALUES (67, 3);
INSERT INTO `permission_role` VALUES (68, 1);
INSERT INTO `permission_role` VALUES (68, 3);
INSERT INTO `permission_role` VALUES (69, 1);
INSERT INTO `permission_role` VALUES (69, 3);
INSERT INTO `permission_role` VALUES (70, 1);
INSERT INTO `permission_role` VALUES (70, 3);
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
INSERT INTO `permissions` VALUES (1, 'browse_admin', NULL, '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (2, 'browse_bread', NULL, '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (3, 'browse_database', NULL, '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (4, 'browse_media', NULL, '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (5, 'browse_compass', NULL, '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (6, 'browse_menus', 'menus', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (7, 'read_menus', 'menus', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (8, 'edit_menus', 'menus', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (9, 'add_menus', 'menus', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (10, 'delete_menus', 'menus', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (11, 'browse_pages', 'pages', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (12, 'read_pages', 'pages', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (13, 'edit_pages', 'pages', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (14, 'add_pages', 'pages', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (15, 'delete_pages', 'pages', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (16, 'browse_roles', 'roles', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (17, 'read_roles', 'roles', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (18, 'edit_roles', 'roles', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (19, 'add_roles', 'roles', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (20, 'delete_roles', 'roles', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (21, 'browse_users', 'users', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (22, 'read_users', 'users', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (23, 'edit_users', 'users', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (24, 'add_users', 'users', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (25, 'delete_users', 'users', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (26, 'browse_posts', 'posts', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (27, 'read_posts', 'posts', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (28, 'edit_posts', 'posts', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (29, 'add_posts', 'posts', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (30, 'delete_posts', 'posts', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (31, 'browse_categories', 'categories', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (32, 'read_categories', 'categories', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (33, 'edit_categories', 'categories', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (34, 'add_categories', 'categories', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (35, 'delete_categories', 'categories', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (36, 'browse_settings', 'settings', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (37, 'read_settings', 'settings', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (38, 'edit_settings', 'settings', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (39, 'add_settings', 'settings', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (40, 'delete_settings', 'settings', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (41, 'browse_products', 'products', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (42, 'read_products', 'products', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (43, 'edit_products', 'products', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (44, 'add_products', 'products', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (45, 'delete_products', 'products', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (46, 'browse_coupons', 'coupons', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (47, 'read_coupons', 'coupons', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (48, 'edit_coupons', 'coupons', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (49, 'add_coupons', 'coupons', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (50, 'delete_coupons', 'coupons', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (51, 'browse_category', 'category', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (52, 'read_category', 'category', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (53, 'edit_category', 'category', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (54, 'add_category', 'category', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (55, 'delete_category', 'category', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (56, 'browse_category-product', 'category-product', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (57, 'read_category-product', 'category-product', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (58, 'edit_category-product', 'category-product', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (59, 'add_category-product', 'category-product', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (60, 'delete_category-product', 'category-product', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (61, 'browse_orders', 'orders', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (62, 'read_orders', 'orders', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (63, 'edit_orders', 'orders', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (64, 'add_orders', 'orders', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (65, 'delete_orders', 'orders', '2019-12-05 03:06:43', '2019-12-05 03:06:43', NULL);
INSERT INTO `permissions` VALUES (66, 'browse_email_customer', 'email_customer', '2019-12-09 07:54:37', '2019-12-09 07:54:37', NULL);
INSERT INTO `permissions` VALUES (67, 'read_email_customer', 'email_customer', '2019-12-09 07:54:37', '2019-12-09 07:54:37', NULL);
INSERT INTO `permissions` VALUES (68, 'edit_email_customer', 'email_customer', '2019-12-09 07:54:37', '2019-12-09 07:54:37', NULL);
INSERT INTO `permissions` VALUES (69, 'add_email_customer', 'email_customer', '2019-12-09 07:54:37', '2019-12-09 07:54:37', NULL);
INSERT INTO `permissions` VALUES (70, 'delete_email_customer', 'email_customer', '2019-12-09 07:54:37', '2019-12-09 07:54:37', NULL);
COMMIT;

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
BEGIN;
INSERT INTO `posts` VALUES (1, 1, 1, 'Thi công vỉ gỗ nhựa ngoài trời iWood DT300x300 tại Q7', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\">Vỉ gỗ nhựa iWood DT300x300 Wood l&agrave; một trong những vật liệu được c&ocirc;ng ty Mạnh Tr&iacute; thi c&ocirc;ng, lắp đặt rất nhiều trong thời gian gần đ&acirc;y. Sở hữu sắc gỗ v&agrave;ng sang trọng, c&ugrave;ng cấu tạo 2 lớp chắc chắn, sản phẩm sẽ mang đến nhưng kh&ocirc;ng gian ngoại thất đơn giản, hiện đại nhưng kh&ocirc;ng k&eacute;m phần tinh tế.</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Một số h&igrave;nh ảnh thi c&ocirc;ng ho&agrave;n thiện vỉ gỗ nhựa iWood tại Q7:&nbsp;</span></p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\"><img src=\"http://localhost:8000/storage/posts/December2019/67121449_2311390112457813_603885179345305600_o.jpg\" alt=\"\" width=\"533\" height=\"533\" /></span></p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\"><span style=\"font-size: 14.4px; font-style: italic; font-weight: 400; text-align: center; background-color: rgba(0, 0, 0, 0.05);\">Vỉ gỗ nhựa dễ d&agrave;ng thi c&ocirc;ng, lắp đặt tại nh&agrave; nhờ hệ thống h&egrave;m kh&oacute;a.</span></span></p>', 'posts/December2019/uSQiHNPvNna1rsOPqulx.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-12-05 03:06:43', '2019-12-09 10:31:54');
INSERT INTO `posts` VALUES (2, 1, 1, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n<h2>We can use all kinds of format!</h2>\r\n<p>And include a bunch of other stuff.</p>', 'posts/December2019/xNfY6yt7Lwusygomf2vm.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-12-05 03:06:43', '2019-12-09 10:17:31');
INSERT INTO `posts` VALUES (3, 1, 1, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/December2019/dWufLPh6Lcdlkb9eSpRi.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-12-05 03:06:43', '2019-12-09 10:17:44');
INSERT INTO `posts` VALUES (4, 1, 1, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/December2019/yyub15wRR5iiRfTfahhI.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-12-05 03:06:43', '2019-12-09 10:18:03');
COMMIT;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(10) unsigned NOT NULL DEFAULT 10,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_name_unique` (`name`),
  UNIQUE KEY `products_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
BEGIN;
INSERT INTO `products` VALUES (31, 'Sàn nhựa 1', 'san-nhua1', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 223783, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 1, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:00', '2019-12-07 08:04:00');
INSERT INTO `products` VALUES (32, 'Sàn nhựa 2', 'san-nhua2', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 178263, '<p>Lorem 2 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!</p>', 1, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:00', '2019-12-05 07:26:00');
INSERT INTO `products` VALUES (33, 'Sàn nhựa 3', 'san-nhua3', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 209409, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 0, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (34, 'Sàn nhựa 4', 'san-nhua4', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 228454, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 1, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (35, 'Sàn nhựa 5', 'san-nhua5', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 161813, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 0, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (36, 'Sàn nhựa 6', 'san-nhua6', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 199541, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 1, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (37, 'Sàn nhựa 7', 'san-nhua7', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 161462, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 0, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (38, 'Sàn nhựa 8', 'san-nhua8', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 158444, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 1, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (39, 'Sàn nhựa 9', 'san-nhua9', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 239200, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 0, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (40, 'Sàn nhựa 10', 'san-nhua10', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 153004, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 1, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (41, 'Sàn nhựa 11', 'san-nhua11', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 235770, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 0, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (42, 'Sàn nhựa 12', 'san-nhua12', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 215660, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 1, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (43, 'Sàn nhựa 13', 'san-nhua13', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 211270, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 0, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (44, 'Sàn nhựa 14', 'san-nhua14', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 229179, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 1, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (45, 'Sàn nhựa 15', 'san-nhua15', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 162740, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 0, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (46, 'Sàn nhựa 16', 'san-nhua16', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 244855, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 1, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (47, 'Sàn nhựa 17', 'san-nhua17', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 228994, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 0, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (48, 'Sàn nhựa 18', 'san-nhua18', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 246961, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 1, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (49, 'Sàn nhựa 19', 'san-nhua19', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 154988, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 0, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (50, 'Sàn nhựa 20', 'san-nhua20', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 172915, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 1, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (51, 'Sàn nhựa 21', 'san-nhua21', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 242676, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 0, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (52, 'Sàn nhựa 22', 'san-nhua22', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 200762, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 1, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (53, 'Sàn nhựa 23', 'san-nhua23', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 199569, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 0, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (54, 'Sàn nhựa 24', 'san-nhua24', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 208782, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 1, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (55, 'Sàn nhựa 25', 'san-nhua25', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 233465, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 0, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (56, 'Sàn nhựa 26', 'san-nhua26', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 222956, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 1, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (57, 'Sàn nhựa 27', 'san-nhua27', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 241338, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 0, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (58, 'Sàn nhựa 28', 'san-nhua28', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 214347, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 1, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (59, 'Sàn nhựa 29', 'san-nhua29', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 197011, '<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&ecirc;n sản phẩm:</span>&nbsp;iWood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&atilde; sản phẩm:</span>&nbsp;HD140x25-4S<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">M&agrave;u sắc:</span>&nbsp;Wood<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Quy c&aacute;ch:</span>&nbsp;140 x 25 x 2200 mm<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ưu điểm:</span>&nbsp;Chịu mưa, nắng, c&oacute; thể sử dụng ngo&agrave;i trời, dễ d&agrave;ng vệ sinh, lau ch&ugrave;i. M&agrave;u sắc mới mẻ, đa dạng về mẫu m&atilde;, bền m&agrave;u.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: bolder;\">Ứng dụng:</span>&nbsp;Sản phẩm ph&ugrave; hợp l&oacute;t s&agrave;n ở những nơi ẩm ướt như s&acirc;n vườn, hồ bơi, ban c&ocirc;ng, h&agrave;nh lang, ph&ograve;ng tắm&hellip;</p>\r\n<p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; color: #000000; font-family: Roboto, sans-serif; font-size: medium;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">iWood HD140x25-4S Wood&nbsp;</span>sở hữu bề mặt v&acirc;n gỗ nổi c&ugrave;ng đường v&acirc;n xoắn lượn đẹp mắt tạo n&ecirc;n một bức tranh nghệ thuật sống động ngay giữa ng&ocirc;i nh&agrave; của bạn. Ngo&agrave;i ra, vật liệu c&ograve;n c&oacute; nhiều ưu điểm nổi bật, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống.</p>', 0, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
INSERT INTO `products` VALUES (60, 'Sàn nhựa 30', 'san-nhua30', '<p>K&iacute;ch thước: 140 x 25 x 2200 mm</p>\r\n<p>Trọng lượng: 5.5 kg/thanh</p>', 210992, 'Lorem 30 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 1, 10, 'products/dummy/san.jpg', '[\"products\\/dummy\\/san-2.jpg\",\"products\\/dummy\\/san-3.jpg\",\"products\\/dummy\\/san-4.jpg\"]', '2019-12-05 07:26:41', '2019-12-05 07:26:41');
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES (1, 'admin', 'Administrator', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `roles` VALUES (2, 'user', 'Normal User', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `roles` VALUES (3, 'adminweb', 'Admin Web', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
COMMIT;

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of settings
-- ----------------------------
BEGIN;
INSERT INTO `settings` VALUES (1, 'site.title', 'Site Title', 'Nội thất Huỳnh Gia', '', 'text', 1, 'Site');
INSERT INTO `settings` VALUES (2, 'site.description', 'Site Description', 'Sàn gỗ công nghiệp ngoài đặc điểm lót sàn còn đa dạng trong nhiều cách thiết kế làm cho không gian nội thất sinh động hơn, bắt mắt và sang trọng hơn.', '', 'text', 2, 'Site');
INSERT INTO `settings` VALUES (3, 'site.logo', 'Site Logo', 'settings/December2019/hbfX7vqkz5pWDGilhLUs.png', '', 'image', 7, 'Site');
INSERT INTO `settings` VALUES (4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 8, 'Site');
INSERT INTO `settings` VALUES (5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin');
INSERT INTO `settings` VALUES (6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin');
INSERT INTO `settings` VALUES (7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin');
INSERT INTO `settings` VALUES (8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin');
INSERT INTO `settings` VALUES (9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin');
INSERT INTO `settings` VALUES (10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');
INSERT INTO `settings` VALUES (11, 'site.stock_threshold', 'Stock Threshold', '5', '', 'text', 9, 'Site');
INSERT INTO `settings` VALUES (13, 'site.hotline', 'Số điện thoại hotline', '+84 9365 2114', NULL, 'text', 4, 'Site');
INSERT INTO `settings` VALUES (14, 'site.facebook', 'Facebook', NULL, NULL, 'text', 10, 'Site');
INSERT INTO `settings` VALUES (15, 'site.pinterest', 'pinterest', NULL, NULL, 'text', 11, 'Site');
INSERT INTO `settings` VALUES (16, 'site.twitter', 'twitter', NULL, NULL, 'text', 12, 'Site');
INSERT INTO `settings` VALUES (17, 'site.linkedin', 'linkedin', NULL, NULL, 'text', 13, 'Site');
INSERT INTO `settings` VALUES (18, 'site.slogan', 'slogan', 'Sàn gỗ làm cho không gian nội thất sinh động hơn, bắt mắt và sang trọng hơn.', NULL, 'text', 6, 'Site');
INSERT INTO `settings` VALUES (19, 'site.keywords', 'site keywords', 'Sàn gỗ công nghiệp ngoài đặc điểm lót sàn còn đa dạng trong nhiều cách thiết kế làm cho không gian nội thất sinh động hơn, bắt mắt và sang trọng hơn.', NULL, 'text', 3, 'Site');
COMMIT;

-- ----------------------------
-- Table structure for translations
-- ----------------------------
DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of translations
-- ----------------------------
BEGIN;
INSERT INTO `translations` VALUES (1, 'data_types', 'display_name_singular', 1, 'pt', 'Post', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (2, 'data_types', 'display_name_singular', 2, 'pt', 'Página', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (3, 'data_types', 'display_name_singular', 3, 'pt', 'Utilizador', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (5, 'data_types', 'display_name_singular', 5, 'pt', 'Menu', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (6, 'data_types', 'display_name_singular', 6, 'pt', 'Função', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (7, 'data_types', 'display_name_plural', 1, 'pt', 'Posts', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (8, 'data_types', 'display_name_plural', 2, 'pt', 'Páginas', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (9, 'data_types', 'display_name_plural', 3, 'pt', 'Utilizadores', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (11, 'data_types', 'display_name_plural', 5, 'pt', 'Menus', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (12, 'data_types', 'display_name_plural', 6, 'pt', 'Funções', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (22, 'menu_items', 'title', 3, 'pt', 'Publicações', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (23, 'menu_items', 'title', 4, 'pt', 'Utilizadores', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (24, 'menu_items', 'title', 5, 'pt', 'Categorias', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (25, 'menu_items', 'title', 6, 'pt', 'Páginas', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (26, 'menu_items', 'title', 7, 'pt', 'Funções', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (27, 'menu_items', 'title', 8, 'pt', 'Ferramentas', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (28, 'menu_items', 'title', 9, 'pt', 'Menus', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (29, 'menu_items', 'title', 10, 'pt', 'Base de dados', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `translations` VALUES (30, 'menu_items', 'title', 12, 'pt', 'Configurações', '2019-12-05 03:06:43', '2019-12-05 03:06:43');
COMMIT;

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 1, 'Admin', 'admin@admin.com', 'users/default.png', '$2y$10$zGvcMnNF9xOOOnA3GfjoX.My5GzRahT.B.5yXnftskwpk1vaHWaYC', 'LSJlv5CqfiXjqBM0RtkKxVRfGOgQCDw7xlaempHQOSPSGxAmklXHzTpb7tqr', NULL, '2019-12-05 03:06:43', '2019-12-05 03:06:43');
INSERT INTO `users` VALUES (2, 3, 'Admin Web', 'adminweb@adminweb.com', 'users/default.png', '$2y$10$rVXo9Zn76MJlSAQKhMkj7.tl9f4.xcseBq6dYzI6uMT8Q.YLGrF6a', 'S1fQViPcKDXLYzavgAMekbwZ1eOJUbv71Bm9GUu6N2nBryuzWXgkHgUGWXMv', NULL, '2019-12-05 03:06:43', '2019-12-05 03:06:43');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
