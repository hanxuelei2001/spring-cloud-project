/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 192.168.88.128:3306
 Source Schema         : shop_search

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 01/05/2023 00:55:40
*/
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop_search` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `shop_search`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dts_keyword
-- ----------------------------
DROP TABLE IF EXISTS `dts_keyword`;
CREATE TABLE `dts_keyword`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `keyword` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键字的跳转链接',
  `is_hot` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是热门关键字',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是默认关键字',
  `sort_order` int NOT NULL DEFAULT 100 COMMENT '排序',
  `add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '关键字表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dts_keyword
-- ----------------------------
INSERT INTO `dts_keyword` VALUES (1, '男鞋', '', 0, 0, 100, '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_keyword` VALUES (2, '洗发水', '', 0, 0, 100, '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_keyword` VALUES (3, '童装', '', 0, 0, 100, '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_keyword` VALUES (4, '男装', '', 0, 0, 100, '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_keyword` VALUES (5, '中老年', '', 0, 0, 5, '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_keyword` VALUES (6, '女装', '', 1, 1, 1, '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_keyword` VALUES (7, '单鞋', '', 0, 0, 8, '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_keyword` VALUES (8, '童鞋', '', 0, 0, 8, '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_keyword` VALUES (9, '女鞋', '', 0, 0, 8, '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);

-- ----------------------------
-- Table structure for dts_search_history
-- ----------------------------
DROP TABLE IF EXISTS `dts_search_history`;
CREATE TABLE `dts_search_history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户表的用户ID',
  `keyword` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '搜索关键字',
  `from` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '搜索来源，如pc、wx、app',
  `add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 307 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '搜索历史表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dts_search_history
-- ----------------------------
INSERT INTO `dts_search_history` VALUES (1, 1, '图荣', 'wx', '2019-06-15 20:15:16', '2019-06-15 20:15:16', 1);
INSERT INTO `dts_search_history` VALUES (2, 1, '支架', 'wx', '2019-06-15 21:03:06', '2019-06-15 21:03:06', 1);
INSERT INTO `dts_search_history` VALUES (3, 2, '手机支架', 'wx', '2019-06-15 21:04:40', '2019-06-15 21:04:40', 0);
INSERT INTO `dts_search_history` VALUES (4, 1, '纸', 'wx', '2019-06-17 21:35:41', '2019-06-17 21:35:41', 1);
INSERT INTO `dts_search_history` VALUES (5, 9, '520元礼包抢先领', 'wx', '2019-06-18 18:30:45', '2019-06-18 18:30:45', 0);
INSERT INTO `dts_search_history` VALUES (6, 2, '玩具', 'wx', '2019-06-20 06:54:35', '2019-06-20 06:54:35', 0);
INSERT INTO `dts_search_history` VALUES (7, 2, '玩具', 'wx', '2019-06-20 06:54:35', '2019-06-20 06:54:35', 0);
INSERT INTO `dts_search_history` VALUES (8, 5, '牙膏', 'wx', '2019-06-20 18:40:56', '2019-06-20 18:40:56', 0);
INSERT INTO `dts_search_history` VALUES (9, 1, '笔记本', 'wx', '2019-06-20 19:44:32', '2019-06-20 19:44:32', 1);
INSERT INTO `dts_search_history` VALUES (10, 5, '友狼', 'wx', '2019-06-20 21:42:26', '2019-06-20 21:42:26', 0);
INSERT INTO `dts_search_history` VALUES (11, 5, '耳机', 'wx', '2019-06-20 21:42:53', '2019-06-20 21:42:53', 0);
INSERT INTO `dts_search_history` VALUES (12, 1, '耳机', 'wx', '2019-06-21 08:23:27', '2019-06-21 08:23:27', 1);
INSERT INTO `dts_search_history` VALUES (13, 13, '520元礼包抢先领', 'wx', '2019-06-21 23:13:09', '2019-06-21 23:13:09', 0);
INSERT INTO `dts_search_history` VALUES (14, 18, '中药面膜', 'wx', '2019-06-22 21:19:17', '2019-06-22 21:19:17', 0);
INSERT INTO `dts_search_history` VALUES (15, 18, '中药面膜', 'wx', '2019-06-22 21:19:17', '2019-06-22 21:19:17', 0);
INSERT INTO `dts_search_history` VALUES (16, 1, '壳', 'wx', '2019-06-23 00:22:29', '2019-06-23 00:22:29', 1);
INSERT INTO `dts_search_history` VALUES (17, 1, '小苏打', 'wx', '2019-06-30 09:59:10', '2019-06-30 09:59:10', 1);
INSERT INTO `dts_search_history` VALUES (18, 2, '植护', 'wx', '2019-06-30 16:11:23', '2019-06-30 16:11:23', 0);
INSERT INTO `dts_search_history` VALUES (19, 1, '公主裙', 'wx', '2019-07-01 13:04:33', '2019-07-01 13:04:33', 1);
INSERT INTO `dts_search_history` VALUES (20, 1, '老爹小白鞋', 'wx', '2019-07-02 22:50:15', '2019-07-02 22:50:15', 1);
INSERT INTO `dts_search_history` VALUES (21, 21, '520元礼包抢先领', 'wx', '2019-07-12 07:36:10', '2019-07-12 07:36:10', 0);
INSERT INTO `dts_search_history` VALUES (22, 1, '儿童短袜', 'wx', '2019-07-15 20:26:24', '2019-07-15 20:26:24', 1);
INSERT INTO `dts_search_history` VALUES (23, 1, '儿童毛球', 'wx', '2019-07-15 20:30:56', '2019-07-15 20:30:56', 1);
INSERT INTO `dts_search_history` VALUES (24, 1, '刊', 'wx', '2019-07-16 11:50:14', '2019-07-16 11:50:14', 1);
INSERT INTO `dts_search_history` VALUES (25, 1, '裙子', 'wx', '2019-07-16 12:11:09', '2019-07-16 12:11:09', 1);
INSERT INTO `dts_search_history` VALUES (26, 1, '公主裙', 'wx', '2019-07-16 12:11:39', '2019-07-16 12:11:39', 1);
INSERT INTO `dts_search_history` VALUES (27, 2, '男装', 'wx', '2019-07-19 19:03:56', '2019-07-19 19:03:56', 0);
INSERT INTO `dts_search_history` VALUES (28, 2, '男装', 'wx', '2019-07-20 00:12:27', '2019-07-20 00:12:27', 0);
INSERT INTO `dts_search_history` VALUES (29, 1, '妈妈', 'wx', '2019-07-20 17:32:09', '2019-07-20 17:32:09', 1);
INSERT INTO `dts_search_history` VALUES (30, 1, '裙子', 'wx', '2019-07-21 08:36:53', '2019-07-21 08:36:53', 1);
INSERT INTO `dts_search_history` VALUES (31, 2, '束脚裤', 'wx', '2019-07-24 22:59:58', '2019-07-24 22:59:58', 0);
INSERT INTO `dts_search_history` VALUES (32, 2, '可调节束脚裤', 'wx', '2019-07-24 23:00:19', '2019-07-24 23:00:19', 0);
INSERT INTO `dts_search_history` VALUES (33, 2, '束脚裤', 'wx', '2019-07-24 23:00:25', '2019-07-24 23:00:25', 0);
INSERT INTO `dts_search_history` VALUES (34, 2, '2019春夏多袋飘带扣可调节抽绳束脚男式工装百搭款休闲裤', 'wx', '2019-07-24 23:00:51', '2019-07-24 23:00:51', 0);
INSERT INTO `dts_search_history` VALUES (35, 2, '梦幻小鹿', 'wx', '2019-07-25 01:25:28', '2019-07-25 01:25:28', 0);
INSERT INTO `dts_search_history` VALUES (36, 2, '老人装', 'wx', '2019-08-01 23:10:59', '2019-08-01 23:10:59', 0);
INSERT INTO `dts_search_history` VALUES (37, 2, '中年装', 'wx', '2019-08-01 23:11:12', '2019-08-01 23:11:12', 0);
INSERT INTO `dts_search_history` VALUES (38, 2, '妈妈装', 'wx', '2019-08-01 23:11:58', '2019-08-01 23:11:58', 0);
INSERT INTO `dts_search_history` VALUES (39, 2, '玩具', 'wx', '2019-08-01 23:12:57', '2019-08-01 23:12:57', 0);
INSERT INTO `dts_search_history` VALUES (40, 2, '棋', 'wx', '2019-08-01 23:13:24', '2019-08-01 23:13:24', 0);
INSERT INTO `dts_search_history` VALUES (41, 2, '沙滩', 'wx', '2019-08-01 23:13:49', '2019-08-01 23:13:49', 0);
INSERT INTO `dts_search_history` VALUES (42, 2, '铲子', 'wx', '2019-08-01 23:14:03', '2019-08-01 23:14:03', 0);
INSERT INTO `dts_search_history` VALUES (43, 2, '内衣', 'wx', '2019-08-01 23:14:21', '2019-08-01 23:14:21', 0);
INSERT INTO `dts_search_history` VALUES (44, 2, '胸罩', 'wx', '2019-08-01 23:14:37', '2019-08-01 23:14:37', 0);
INSERT INTO `dts_search_history` VALUES (45, 2, '束脚裤', 'wx', '2019-08-01 23:17:14', '2019-08-01 23:17:14', 0);
INSERT INTO `dts_search_history` VALUES (46, 2, '牛仔', 'wx', '2019-08-01 23:17:21', '2019-08-01 23:17:21', 0);
INSERT INTO `dts_search_history` VALUES (47, 2, '牛仔女', 'wx', '2019-08-01 23:17:31', '2019-08-01 23:17:31', 0);
INSERT INTO `dts_search_history` VALUES (48, 2, '裙子', 'wx', '2019-08-01 23:17:40', '2019-08-01 23:17:40', 0);
INSERT INTO `dts_search_history` VALUES (49, 2, '内裤', 'wx', '2019-08-01 23:17:54', '2019-08-01 23:17:54', 0);
INSERT INTO `dts_search_history` VALUES (50, 2, '内衣', 'wx', '2019-08-01 23:18:09', '2019-08-01 23:18:09', 0);
INSERT INTO `dts_search_history` VALUES (51, 2, '文胸', 'wx', '2019-08-01 23:18:24', '2019-08-01 23:18:24', 0);
INSERT INTO `dts_search_history` VALUES (52, 2, '洗发水', 'wx', '2019-08-01 23:18:58', '2019-08-01 23:18:58', 0);
INSERT INTO `dts_search_history` VALUES (53, 2, '香皂', 'wx', '2019-08-01 23:19:20', '2019-08-01 23:19:20', 0);
INSERT INTO `dts_search_history` VALUES (54, 2, '洗衣液', 'wx', '2019-08-01 23:19:35', '2019-08-01 23:19:35', 0);
INSERT INTO `dts_search_history` VALUES (55, 2, '画笔', 'wx', '2019-08-01 23:19:48', '2019-08-01 23:19:48', 0);
INSERT INTO `dts_search_history` VALUES (56, 2, '女鞋', 'wx', '2019-08-01 23:20:08', '2019-08-01 23:20:08', 0);
INSERT INTO `dts_search_history` VALUES (57, 2, '高跟鞋', 'wx', '2019-08-01 23:20:18', '2019-08-01 23:20:18', 0);
INSERT INTO `dts_search_history` VALUES (58, 2, '运动鞋', 'wx', '2019-08-01 23:20:33', '2019-08-01 23:20:33', 0);
INSERT INTO `dts_search_history` VALUES (59, 2, '纸巾', 'wx', '2019-08-01 23:21:27', '2019-08-01 23:21:27', 0);
INSERT INTO `dts_search_history` VALUES (60, 2, '女装', 'wx', '2019-08-01 23:21:56', '2019-08-01 23:21:56', 0);
INSERT INTO `dts_search_history` VALUES (61, 2, '女童打底裤', 'wx', '2019-08-01 23:26:02', '2019-08-01 23:26:02', 0);
INSERT INTO `dts_search_history` VALUES (62, 2, '汉服', 'wx', '2019-08-01 23:31:28', '2019-08-01 23:31:28', 0);
INSERT INTO `dts_search_history` VALUES (63, 2, '旗袍', 'wx', '2019-08-01 23:33:29', '2019-08-01 23:33:29', 0);
INSERT INTO `dts_search_history` VALUES (64, 2, '灯', 'wx', '2019-08-02 23:52:35', '2019-08-02 23:52:35', 0);
INSERT INTO `dts_search_history` VALUES (65, 2, '补光灯', 'wx', '2019-08-02 23:57:45', '2019-08-02 23:57:45', 0);
INSERT INTO `dts_search_history` VALUES (66, 13, '520元礼包抢先领', 'wx', '2019-08-17 23:38:10', '2019-08-17 23:38:10', 0);
INSERT INTO `dts_search_history` VALUES (67, 35, '520元礼包抢先领', 'wx', '2019-08-18 07:26:07', '2019-08-18 07:26:07', 0);
INSERT INTO `dts_search_history` VALUES (68, 36, '520元礼包抢先领', 'wx', '2019-08-19 08:38:15', '2019-08-19 08:38:15', 0);
INSERT INTO `dts_search_history` VALUES (69, 2, '宝宝内裤', 'wx', '2019-08-29 21:46:03', '2019-08-29 21:46:03', 0);
INSERT INTO `dts_search_history` VALUES (70, 2, '内衣', 'wx', '2019-08-29 21:47:11', '2019-08-29 21:47:11', 0);
INSERT INTO `dts_search_history` VALUES (71, 2, '胸罩', 'wx', '2019-08-29 21:47:22', '2019-08-29 21:47:22', 0);
INSERT INTO `dts_search_history` VALUES (72, 2, '文胸', 'wx', '2019-08-29 21:47:42', '2019-08-29 21:47:42', 0);
INSERT INTO `dts_search_history` VALUES (73, 2, '经典非凡喷雾剂', 'wx', '2019-09-30 09:20:06', '2019-09-30 09:20:06', 0);
INSERT INTO `dts_search_history` VALUES (74, 2, '经典非凡', 'wx', '2019-09-30 09:20:11', '2019-09-30 09:20:11', 0);
INSERT INTO `dts_search_history` VALUES (75, 39, '520元礼包抢先领', 'wx', '2019-10-04 12:56:22', '2019-10-04 12:56:22', 0);
INSERT INTO `dts_search_history` VALUES (76, 2, '老爹鞋', 'wx', '2019-10-05 22:43:55', '2019-10-05 22:43:55', 0);
INSERT INTO `dts_search_history` VALUES (77, 1, '秒杀', 'wx', '2019-10-06 23:36:46', '2019-10-06 23:36:46', 1);
INSERT INTO `dts_search_history` VALUES (78, 45, '520元礼包抢先领', 'wx', '2019-10-09 08:51:28', '2019-10-09 08:51:28', 0);
INSERT INTO `dts_search_history` VALUES (79, 2, '直播', 'wx', '2019-10-13 23:35:19', '2019-10-13 23:35:19', 0);
INSERT INTO `dts_search_history` VALUES (80, 2, '秒杀', 'wx', '2019-10-13 23:35:50', '2019-10-13 23:35:50', 0);
INSERT INTO `dts_search_history` VALUES (81, 1, '小米步', 'wx', '2019-10-17 17:57:03', '2019-10-17 17:57:03', 1);
INSERT INTO `dts_search_history` VALUES (82, 1, '小米步女童板鞋2019秋冬季新款韩版儿童加绒休闲鞋幼儿园小白鞋潮', 'wx', '2019-10-17 18:01:58', '2019-10-17 18:01:58', 1);
INSERT INTO `dts_search_history` VALUES (83, 55, '520元礼包抢先领', 'wx', '2019-10-20 10:21:20', '2019-10-20 10:21:20', 0);
INSERT INTO `dts_search_history` VALUES (84, 1, '女装', 'wx', '2019-10-27 17:46:27', '2019-10-27 17:46:27', 0);
INSERT INTO `dts_search_history` VALUES (85, 1, '女装', 'wx', '2019-10-27 17:46:33', '2019-10-27 17:46:33', 0);
INSERT INTO `dts_search_history` VALUES (86, 1, '女装', 'wx', '2019-10-27 17:46:39', '2019-10-27 17:46:39', 0);
INSERT INTO `dts_search_history` VALUES (87, 1, '女装', 'wx', '2019-10-27 17:46:40', '2019-10-27 17:46:40', 0);
INSERT INTO `dts_search_history` VALUES (88, 1, '女装', 'wx', '2019-10-27 17:46:43', '2019-10-27 17:46:43', 0);
INSERT INTO `dts_search_history` VALUES (89, 1, '女装', 'wx', '2019-10-27 17:46:44', '2019-10-27 17:46:44', 0);
INSERT INTO `dts_search_history` VALUES (90, 1, '女装', 'wx', '2019-10-27 17:46:48', '2019-10-27 17:46:48', 0);
INSERT INTO `dts_search_history` VALUES (91, 1, '女装', 'wx', '2019-10-27 17:46:53', '2019-10-27 17:46:53', 0);
INSERT INTO `dts_search_history` VALUES (92, 1, '男鞋', 'wx', '2019-10-27 17:50:34', '2019-10-27 17:50:34', 0);
INSERT INTO `dts_search_history` VALUES (93, 1, '男鞋', 'wx', '2019-10-27 17:50:39', '2019-10-27 17:50:39', 0);
INSERT INTO `dts_search_history` VALUES (94, 1, '男鞋', 'wx', '2019-10-27 17:50:43', '2019-10-27 17:50:43', 0);
INSERT INTO `dts_search_history` VALUES (95, 1, '男鞋', 'wx', '2019-10-27 17:50:53', '2019-10-27 17:50:53', 0);
INSERT INTO `dts_search_history` VALUES (96, 1, '男鞋', 'wx', '2019-10-27 17:51:00', '2019-10-27 17:51:00', 0);
INSERT INTO `dts_search_history` VALUES (97, 1, '男鞋', 'wx', '2019-10-27 17:51:02', '2019-10-27 17:51:02', 0);
INSERT INTO `dts_search_history` VALUES (98, 1, '男鞋', 'wx', '2019-10-27 17:51:07', '2019-10-27 17:51:07', 0);
INSERT INTO `dts_search_history` VALUES (99, 1, '男鞋', 'wx', '2019-10-27 17:51:14', '2019-10-27 17:51:14', 0);
INSERT INTO `dts_search_history` VALUES (100, 1, '男鞋', 'wx', '2019-10-27 17:51:16', '2019-10-27 17:51:16', 0);
INSERT INTO `dts_search_history` VALUES (101, 1, '男鞋', 'wx', '2019-10-27 17:51:17', '2019-10-27 17:51:17', 0);
INSERT INTO `dts_search_history` VALUES (102, 1, '男鞋', 'wx', '2019-10-27 17:51:18', '2019-10-27 17:51:18', 0);
INSERT INTO `dts_search_history` VALUES (103, 1, '男鞋', 'wx', '2019-10-27 17:51:23', '2019-10-27 17:51:23', 0);
INSERT INTO `dts_search_history` VALUES (104, 1, '男鞋', 'wx', '2019-10-27 17:51:30', '2019-10-27 17:51:30', 0);
INSERT INTO `dts_search_history` VALUES (105, 1, '男鞋', 'wx', '2019-10-27 17:51:40', '2019-10-27 17:51:40', 0);
INSERT INTO `dts_search_history` VALUES (106, 1, '男鞋', 'wx', '2019-10-27 17:51:49', '2019-10-27 17:51:49', 0);
INSERT INTO `dts_search_history` VALUES (107, 1, '男鞋', 'wx', '2019-10-27 17:51:51', '2019-10-27 17:51:51', 0);
INSERT INTO `dts_search_history` VALUES (108, 1, '男鞋', 'wx', '2019-10-27 17:51:56', '2019-10-27 17:51:56', 0);
INSERT INTO `dts_search_history` VALUES (109, 1, '男鞋', 'wx', '2019-10-27 17:51:56', '2019-10-27 17:51:56', 0);
INSERT INTO `dts_search_history` VALUES (110, 1, '男鞋', 'wx', '2019-10-27 17:51:58', '2019-10-27 17:51:58', 0);
INSERT INTO `dts_search_history` VALUES (111, 1, '男鞋', 'wx', '2019-10-27 17:52:03', '2019-10-27 17:52:03', 0);
INSERT INTO `dts_search_history` VALUES (112, 1, '男鞋', 'wx', '2019-10-27 17:52:04', '2019-10-27 17:52:04', 0);
INSERT INTO `dts_search_history` VALUES (113, 1, '男鞋', 'wx', '2019-10-27 17:52:13', '2019-10-27 17:52:13', 0);
INSERT INTO `dts_search_history` VALUES (114, 1, '男鞋', 'wx', '2019-10-27 17:52:14', '2019-10-27 17:52:14', 0);
INSERT INTO `dts_search_history` VALUES (115, 1, '男鞋', 'wx', '2019-10-27 17:52:17', '2019-10-27 17:52:17', 0);
INSERT INTO `dts_search_history` VALUES (116, 1, '男鞋', 'wx', '2019-10-27 17:52:23', '2019-10-27 17:52:23', 0);
INSERT INTO `dts_search_history` VALUES (117, 1, '男鞋', 'wx', '2019-10-27 17:52:24', '2019-10-27 17:52:24', 0);
INSERT INTO `dts_search_history` VALUES (118, 1, '男鞋', 'wx', '2019-10-27 17:52:25', '2019-10-27 17:52:25', 0);
INSERT INTO `dts_search_history` VALUES (119, 1, '男鞋', 'wx', '2019-10-27 17:52:26', '2019-10-27 17:52:26', 0);
INSERT INTO `dts_search_history` VALUES (120, 1, '男鞋', 'wx', '2019-10-27 17:52:34', '2019-10-27 17:52:34', 0);
INSERT INTO `dts_search_history` VALUES (121, 1, '男鞋', 'wx', '2019-10-27 17:53:52', '2019-10-27 17:53:52', 0);
INSERT INTO `dts_search_history` VALUES (122, 1, '男鞋', 'wx', '2019-10-27 17:53:54', '2019-10-27 17:53:54', 0);
INSERT INTO `dts_search_history` VALUES (123, 1, '男鞋', 'wx', '2019-10-27 17:53:57', '2019-10-27 17:53:57', 0);
INSERT INTO `dts_search_history` VALUES (124, 1, '男鞋', 'wx', '2019-10-27 17:54:05', '2019-10-27 17:54:05', 0);
INSERT INTO `dts_search_history` VALUES (125, 1, '男鞋', 'wx', '2019-10-27 17:54:10', '2019-10-27 17:54:10', 0);
INSERT INTO `dts_search_history` VALUES (126, 1, '男鞋', 'wx', '2019-10-27 17:54:12', '2019-10-27 17:54:12', 0);
INSERT INTO `dts_search_history` VALUES (127, 1, '男装', 'wx', '2019-10-27 17:54:31', '2019-10-27 17:54:31', 0);
INSERT INTO `dts_search_history` VALUES (128, 1, '男装', 'wx', '2019-10-27 17:54:34', '2019-10-27 17:54:34', 0);
INSERT INTO `dts_search_history` VALUES (129, 1, '男装', 'wx', '2019-10-27 17:54:37', '2019-10-27 17:54:37', 0);
INSERT INTO `dts_search_history` VALUES (130, 1, '男装', 'wx', '2019-10-27 17:54:39', '2019-10-27 17:54:39', 0);
INSERT INTO `dts_search_history` VALUES (131, 1, '男装', 'wx', '2019-10-27 17:54:40', '2019-10-27 17:54:40', 0);
INSERT INTO `dts_search_history` VALUES (132, 1, '男装', 'wx', '2019-10-27 17:54:40', '2019-10-27 17:54:40', 0);
INSERT INTO `dts_search_history` VALUES (133, 1, '男装', 'wx', '2019-10-27 17:54:47', '2019-10-27 17:54:47', 0);
INSERT INTO `dts_search_history` VALUES (134, 1, '男装', 'wx', '2019-10-27 17:55:11', '2019-10-27 17:55:11', 0);
INSERT INTO `dts_search_history` VALUES (135, 1, '男装', 'wx', '2019-10-27 17:55:27', '2019-10-27 17:55:27', 0);
INSERT INTO `dts_search_history` VALUES (136, 1, '男装', 'wx', '2019-10-27 17:55:56', '2019-10-27 17:55:56', 0);
INSERT INTO `dts_search_history` VALUES (137, 1, '男装', 'wx', '2019-10-27 17:56:03', '2019-10-27 17:56:03', 0);
INSERT INTO `dts_search_history` VALUES (138, 1, '男装', 'wx', '2019-10-27 17:56:05', '2019-10-27 17:56:05', 0);
INSERT INTO `dts_search_history` VALUES (139, 1, '男装', 'wx', '2019-10-27 17:56:07', '2019-10-27 17:56:07', 0);
INSERT INTO `dts_search_history` VALUES (140, 1, '男装', 'wx', '2019-10-27 17:56:11', '2019-10-27 17:56:11', 0);
INSERT INTO `dts_search_history` VALUES (141, 1, '男装', 'wx', '2019-10-27 17:56:16', '2019-10-27 17:56:16', 0);
INSERT INTO `dts_search_history` VALUES (142, 1, '男装', 'wx', '2019-10-27 17:56:21', '2019-10-27 17:56:21', 0);
INSERT INTO `dts_search_history` VALUES (143, 1, '男装', 'wx', '2019-10-27 17:56:27', '2019-10-27 17:56:27', 0);
INSERT INTO `dts_search_history` VALUES (144, 1, '男装', 'wx', '2019-10-27 17:56:35', '2019-10-27 17:56:35', 0);
INSERT INTO `dts_search_history` VALUES (145, 1, '男装', 'wx', '2019-10-27 17:57:19', '2019-10-27 17:57:19', 0);
INSERT INTO `dts_search_history` VALUES (146, 1, '男装', 'wx', '2019-10-27 17:57:31', '2019-10-27 17:57:31', 0);
INSERT INTO `dts_search_history` VALUES (147, 1, '男装', 'wx', '2019-10-27 17:57:32', '2019-10-27 17:57:32', 0);
INSERT INTO `dts_search_history` VALUES (148, 1, '男装', 'wx', '2019-10-27 17:57:34', '2019-10-27 17:57:34', 0);
INSERT INTO `dts_search_history` VALUES (149, 1, '男装', 'wx', '2019-10-27 17:57:42', '2019-10-27 17:57:42', 0);
INSERT INTO `dts_search_history` VALUES (150, 1, '男装', 'wx', '2019-10-27 17:57:48', '2019-10-27 17:57:48', 0);
INSERT INTO `dts_search_history` VALUES (151, 1, '男装', 'wx', '2019-10-27 17:57:53', '2019-10-27 17:57:53', 0);
INSERT INTO `dts_search_history` VALUES (152, 1, '旗袍', 'wx', '2019-10-27 17:59:11', '2019-10-27 17:59:11', 0);
INSERT INTO `dts_search_history` VALUES (153, 1, '旗袍', 'wx', '2019-10-27 17:59:15', '2019-10-27 17:59:15', 0);
INSERT INTO `dts_search_history` VALUES (154, 1, '旗袍', 'wx', '2019-10-27 17:59:19', '2019-10-27 17:59:19', 0);
INSERT INTO `dts_search_history` VALUES (155, 1, '旗袍', 'wx', '2019-10-27 17:59:24', '2019-10-27 17:59:24', 0);
INSERT INTO `dts_search_history` VALUES (156, 1, '旗袍', 'wx', '2019-10-27 18:18:40', '2019-10-27 18:18:40', 0);
INSERT INTO `dts_search_history` VALUES (157, 2, '手机支架', 'wx', '2019-10-27 20:53:07', '2019-10-27 20:53:07', 0);
INSERT INTO `dts_search_history` VALUES (158, 2, '女装', 'wx', '2019-10-27 20:53:22', '2019-10-27 20:53:22', 0);
INSERT INTO `dts_search_history` VALUES (159, 2, '女装', 'wx', '2019-10-27 20:53:24', '2019-10-27 20:53:24', 0);
INSERT INTO `dts_search_history` VALUES (160, 2, '女装', 'wx', '2019-10-27 20:53:25', '2019-10-27 20:53:25', 0);
INSERT INTO `dts_search_history` VALUES (161, 2, '女装', 'wx', '2019-10-27 20:53:27', '2019-10-27 20:53:27', 0);
INSERT INTO `dts_search_history` VALUES (162, 2, '女装', 'wx', '2019-10-27 20:53:29', '2019-10-27 20:53:29', 0);
INSERT INTO `dts_search_history` VALUES (163, 2, '女装', 'wx', '2019-10-27 20:53:32', '2019-10-27 20:53:32', 0);
INSERT INTO `dts_search_history` VALUES (164, 2, '女装', 'wx', '2019-10-27 20:53:35', '2019-10-27 20:53:35', 0);
INSERT INTO `dts_search_history` VALUES (165, 2, '女装', 'wx', '2019-10-27 20:53:37', '2019-10-27 20:53:37', 0);
INSERT INTO `dts_search_history` VALUES (166, 2, '女装', 'wx', '2019-10-27 20:53:40', '2019-10-27 20:53:40', 0);
INSERT INTO `dts_search_history` VALUES (167, 2, '女装', 'wx', '2019-10-27 20:53:44', '2019-10-27 20:53:44', 0);
INSERT INTO `dts_search_history` VALUES (168, 2, '女装', 'wx', '2019-10-27 20:53:49', '2019-10-27 20:53:49', 0);
INSERT INTO `dts_search_history` VALUES (169, 2, '女装', 'wx', '2019-10-27 20:53:55', '2019-10-27 20:53:55', 0);
INSERT INTO `dts_search_history` VALUES (170, 2, '女装', 'wx', '2019-10-27 20:54:02', '2019-10-27 20:54:02', 0);
INSERT INTO `dts_search_history` VALUES (171, 2, '女装', 'wx', '2019-10-27 20:54:04', '2019-10-27 20:54:04', 0);
INSERT INTO `dts_search_history` VALUES (172, 66, '女装', 'wx', '2019-10-27 21:58:50', '2019-10-27 21:58:50', 1);
INSERT INTO `dts_search_history` VALUES (173, 68, '女装', 'wx', '2019-10-28 06:34:43', '2019-10-28 06:34:43', 0);
INSERT INTO `dts_search_history` VALUES (174, 68, '女装', 'wx', '2019-10-28 06:34:46', '2019-10-28 06:34:46', 0);
INSERT INTO `dts_search_history` VALUES (175, 68, '女装', 'wx', '2019-10-28 06:34:50', '2019-10-28 06:34:50', 0);
INSERT INTO `dts_search_history` VALUES (176, 68, '女装', 'wx', '2019-10-28 06:35:45', '2019-10-28 06:35:45', 0);
INSERT INTO `dts_search_history` VALUES (177, 60, '冬天旗袍', 'wx', '2019-10-28 20:39:58', '2019-10-28 20:39:58', 0);
INSERT INTO `dts_search_history` VALUES (178, 2, '四件套', 'wx', '2019-10-28 20:47:29', '2019-10-28 20:47:29', 0);
INSERT INTO `dts_search_history` VALUES (179, 2, '四件套', 'wx', '2019-10-28 20:47:36', '2019-10-28 20:47:36', 0);
INSERT INTO `dts_search_history` VALUES (180, 2, '四件套', 'wx', '2019-10-28 20:47:39', '2019-10-28 20:47:39', 0);
INSERT INTO `dts_search_history` VALUES (181, 63, '气垫', 'wx', '2019-10-31 18:02:38', '2019-10-31 18:02:38', 0);
INSERT INTO `dts_search_history` VALUES (182, 1, '男鞋', 'wx', '2019-11-03 18:00:35', '2019-11-03 18:00:35', 0);
INSERT INTO `dts_search_history` VALUES (183, 1, '男鞋', 'wx', '2019-11-03 18:00:53', '2019-11-03 18:00:53', 0);
INSERT INTO `dts_search_history` VALUES (184, 1, '男鞋', 'wx', '2019-11-03 18:00:55', '2019-11-03 18:00:55', 0);
INSERT INTO `dts_search_history` VALUES (185, 1, '男鞋', 'wx', '2019-11-03 18:00:57', '2019-11-03 18:00:57', 0);
INSERT INTO `dts_search_history` VALUES (186, 1, '男鞋', 'wx', '2019-11-03 18:03:43', '2019-11-03 18:03:43', 0);
INSERT INTO `dts_search_history` VALUES (187, 1, '男鞋', 'wx', '2019-11-03 18:03:44', '2019-11-03 18:03:44', 0);
INSERT INTO `dts_search_history` VALUES (188, 1, '男鞋', 'wx', '2019-11-03 18:03:45', '2019-11-03 18:03:45', 0);
INSERT INTO `dts_search_history` VALUES (189, 1, '男鞋', 'wx', '2019-11-03 18:03:47', '2019-11-03 18:03:47', 0);
INSERT INTO `dts_search_history` VALUES (190, 1, '男鞋', 'wx', '2019-11-03 18:03:49', '2019-11-03 18:03:49', 0);
INSERT INTO `dts_search_history` VALUES (191, 1, '男鞋', 'wx', '2019-11-03 18:03:51', '2019-11-03 18:03:51', 0);
INSERT INTO `dts_search_history` VALUES (192, 1, '男装', 'wx', '2019-11-03 18:09:24', '2019-11-03 18:09:24', 0);
INSERT INTO `dts_search_history` VALUES (193, 66, '女装', 'wx', '2019-11-03 18:17:16', '2019-11-03 18:17:16', 1);
INSERT INTO `dts_search_history` VALUES (194, 66, '女装', 'wx', '2019-11-03 18:17:16', '2019-11-03 18:17:16', 0);
INSERT INTO `dts_search_history` VALUES (195, 2, '美太C4982风火轮合金小跑车 正品轨道车跑车模型男孩玩具厂家', 'wx', '2019-11-03 20:46:00', '2019-11-03 20:46:00', 0);
INSERT INTO `dts_search_history` VALUES (196, 77, '女装', 'wx', '2019-11-04 14:20:24', '2019-11-04 14:20:24', 0);
INSERT INTO `dts_search_history` VALUES (197, 77, '女装', 'wx', '2019-11-04 14:20:27', '2019-11-04 14:20:27', 0);
INSERT INTO `dts_search_history` VALUES (198, 77, '女装', 'wx', '2019-11-04 14:20:30', '2019-11-04 14:20:30', 0);
INSERT INTO `dts_search_history` VALUES (199, 77, '女装', 'wx', '2019-11-04 14:21:20', '2019-11-04 14:21:20', 0);
INSERT INTO `dts_search_history` VALUES (200, 64, '丁腈手套', 'wx', '2019-11-07 15:04:48', '2019-11-07 15:04:48', 0);
INSERT INTO `dts_search_history` VALUES (201, 60, '秋季长风衣', 'wx', '2019-11-09 15:11:57', '2019-11-09 15:11:57', 0);
INSERT INTO `dts_search_history` VALUES (202, 88, '人本', 'wx', '2019-11-12 09:01:01', '2019-11-12 09:01:01', 0);
INSERT INTO `dts_search_history` VALUES (203, 88, '人本', 'wx', '2019-11-12 09:01:09', '2019-11-12 09:01:09', 0);
INSERT INTO `dts_search_history` VALUES (204, 2, '厂家直销乐乐鱼', 'wx', '2019-11-12 18:16:18', '2019-11-12 18:16:18', 0);
INSERT INTO `dts_search_history` VALUES (205, 50, '女装', 'wx', '2019-11-14 16:03:13', '2019-11-14 16:03:13', 0);
INSERT INTO `dts_search_history` VALUES (206, 50, '女装', 'wx', '2019-11-14 16:03:14', '2019-11-14 16:03:14', 0);
INSERT INTO `dts_search_history` VALUES (207, 97, '哈哈', 'wx', '2019-11-14 18:08:09', '2019-11-14 18:08:09', 0);
INSERT INTO `dts_search_history` VALUES (208, 105, '女装', 'wx', '2019-11-17 21:20:30', '2019-11-17 21:20:30', 0);
INSERT INTO `dts_search_history` VALUES (209, 107, '女装', 'wx', '2019-11-18 09:18:47', '2019-11-18 09:18:47', 0);
INSERT INTO `dts_search_history` VALUES (210, 108, '女装', 'wx', '2019-11-19 06:35:30', '2019-11-19 06:35:30', 0);
INSERT INTO `dts_search_history` VALUES (211, 108, '女装', 'wx', '2019-11-19 06:35:33', '2019-11-19 06:35:33', 0);
INSERT INTO `dts_search_history` VALUES (212, 108, '女装', 'wx', '2019-11-19 06:35:37', '2019-11-19 06:35:37', 0);
INSERT INTO `dts_search_history` VALUES (213, 108, '女装', 'wx', '2019-11-19 06:37:04', '2019-11-19 06:37:04', 0);
INSERT INTO `dts_search_history` VALUES (214, 84, '小天鹅洗衣机', 'wx', '2019-11-26 20:50:32', '2019-11-26 20:50:32', 0);
INSERT INTO `dts_search_history` VALUES (215, 1, '保温杯', 'wx', '2019-11-27 15:21:14', '2019-11-27 15:21:14', 0);
INSERT INTO `dts_search_history` VALUES (216, 1, '保温杯', 'wx', '2019-11-27 15:21:22', '2019-11-27 15:21:22', 0);
INSERT INTO `dts_search_history` VALUES (217, 1, '保温杯', 'wx', '2019-11-27 15:21:26', '2019-11-27 15:21:26', 0);
INSERT INTO `dts_search_history` VALUES (218, 1, '保温杯', 'wx', '2019-11-27 15:21:30', '2019-11-27 15:21:30', 0);
INSERT INTO `dts_search_history` VALUES (219, 1, '保温杯', 'wx', '2019-11-27 15:21:46', '2019-11-27 15:21:46', 0);
INSERT INTO `dts_search_history` VALUES (220, 1, '保温杯', 'wx', '2019-11-27 15:21:49', '2019-11-27 15:21:49', 0);
INSERT INTO `dts_search_history` VALUES (221, 20, '围巾', 'wx', '2019-11-27 15:32:36', '2019-11-27 15:32:36', 0);
INSERT INTO `dts_search_history` VALUES (222, 2, '水杯', 'wx', '2019-11-27 21:19:24', '2019-11-27 21:19:24', 0);
INSERT INTO `dts_search_history` VALUES (223, 2, '水杯', 'wx', '2019-11-27 21:19:36', '2019-11-27 21:19:36', 0);
INSERT INTO `dts_search_history` VALUES (224, 2, '水杯', 'wx', '2019-11-27 21:19:45', '2019-11-27 21:19:45', 0);
INSERT INTO `dts_search_history` VALUES (225, 2, '水杯', 'wx', '2019-11-27 21:19:51', '2019-11-27 21:19:51', 0);
INSERT INTO `dts_search_history` VALUES (226, 2, '水杯', 'wx', '2019-11-27 21:20:02', '2019-11-27 21:20:02', 0);
INSERT INTO `dts_search_history` VALUES (227, 2, '睡衣', 'wx', '2019-11-28 11:19:38', '2019-11-28 11:19:38', 0);
INSERT INTO `dts_search_history` VALUES (228, 2, '围脖', 'wx', '2019-11-28 12:38:36', '2019-11-28 12:38:36', 0);
INSERT INTO `dts_search_history` VALUES (229, 2, '保暖内衣', 'wx', '2019-11-28 22:16:07', '2019-11-28 22:16:07', 0);
INSERT INTO `dts_search_history` VALUES (230, 2, '保暖内衣', 'wx', '2019-11-28 22:16:11', '2019-11-28 22:16:11', 0);
INSERT INTO `dts_search_history` VALUES (231, 2, '睡衣', 'wx', '2019-11-29 08:48:51', '2019-11-29 08:48:51', 0);
INSERT INTO `dts_search_history` VALUES (232, 2, '睡衣', 'wx', '2019-11-29 08:48:57', '2019-11-29 08:48:57', 0);
INSERT INTO `dts_search_history` VALUES (233, 2, '睡衣', 'wx', '2019-11-29 08:49:01', '2019-11-29 08:49:01', 0);
INSERT INTO `dts_search_history` VALUES (234, 2, '睡衣', 'wx', '2019-11-29 08:49:06', '2019-11-29 08:49:06', 0);
INSERT INTO `dts_search_history` VALUES (235, 2, '睡衣', 'wx', '2019-11-29 08:49:15', '2019-11-29 08:49:15', 0);
INSERT INTO `dts_search_history` VALUES (236, 2, '睡衣', 'wx', '2019-11-29 08:49:20', '2019-11-29 08:49:20', 0);
INSERT INTO `dts_search_history` VALUES (237, 2, '睡衣', 'wx', '2019-11-29 08:49:22', '2019-11-29 08:49:22', 0);
INSERT INTO `dts_search_history` VALUES (238, 2, '睡衣', 'wx', '2019-11-29 08:49:24', '2019-11-29 08:49:24', 0);
INSERT INTO `dts_search_history` VALUES (239, 2, '睡衣', 'wx', '2019-11-29 08:49:26', '2019-11-29 08:49:26', 0);
INSERT INTO `dts_search_history` VALUES (240, 2, '睡衣', 'wx', '2019-11-29 08:49:28', '2019-11-29 08:49:28', 0);
INSERT INTO `dts_search_history` VALUES (241, 2, '睡衣', 'wx', '2019-11-29 08:49:30', '2019-11-29 08:49:30', 0);
INSERT INTO `dts_search_history` VALUES (242, 2, '睡衣', 'wx', '2019-11-29 08:49:34', '2019-11-29 08:49:34', 0);
INSERT INTO `dts_search_history` VALUES (243, 2, '睡衣', 'wx', '2019-11-29 08:49:37', '2019-11-29 08:49:37', 0);
INSERT INTO `dts_search_history` VALUES (244, 2, '睡衣', 'wx', '2019-11-29 08:49:40', '2019-11-29 08:49:40', 0);
INSERT INTO `dts_search_history` VALUES (245, 2, '睡衣', 'wx', '2019-11-29 08:49:43', '2019-11-29 08:49:43', 0);
INSERT INTO `dts_search_history` VALUES (246, 2, '睡衣', 'wx', '2019-11-29 08:49:46', '2019-11-29 08:49:46', 0);
INSERT INTO `dts_search_history` VALUES (247, 2, '睡衣', 'wx', '2019-11-29 08:49:49', '2019-11-29 08:49:49', 0);
INSERT INTO `dts_search_history` VALUES (248, 2, '睡衣', 'wx', '2019-11-29 08:49:51', '2019-11-29 08:49:51', 0);
INSERT INTO `dts_search_history` VALUES (249, 2, '睡衣', 'wx', '2019-11-29 08:49:54', '2019-11-29 08:49:54', 0);
INSERT INTO `dts_search_history` VALUES (250, 2, '睡衣', 'wx', '2019-11-29 08:49:56', '2019-11-29 08:49:56', 0);
INSERT INTO `dts_search_history` VALUES (251, 2, '睡衣', 'wx', '2019-11-29 08:49:58', '2019-11-29 08:49:58', 0);
INSERT INTO `dts_search_history` VALUES (252, 84, '男装鞋子', 'wx', '2019-11-29 19:11:06', '2019-11-29 19:11:06', 0);
INSERT INTO `dts_search_history` VALUES (253, 2, '森马', 'wx', '2019-11-30 11:15:11', '2019-11-30 11:15:11', 0);
INSERT INTO `dts_search_history` VALUES (254, 2, '森马', 'wx', '2019-11-30 11:15:34', '2019-11-30 11:15:34', 0);
INSERT INTO `dts_search_history` VALUES (255, 2, '森马', 'wx', '2019-11-30 11:15:46', '2019-11-30 11:15:46', 0);
INSERT INTO `dts_search_history` VALUES (256, 2, '森马', 'wx', '2019-11-30 11:15:51', '2019-11-30 11:15:51', 0);
INSERT INTO `dts_search_history` VALUES (257, 2, '森马', 'wx', '2019-11-30 11:41:13', '2019-11-30 11:41:13', 0);
INSERT INTO `dts_search_history` VALUES (258, 117, '亲子装', 'wx', '2019-12-01 22:21:01', '2019-12-01 22:21:01', 0);
INSERT INTO `dts_search_history` VALUES (259, 117, '亲子装', 'wx', '2019-12-01 22:21:08', '2019-12-01 22:21:08', 0);
INSERT INTO `dts_search_history` VALUES (260, 117, '亲子装', 'wx', '2019-12-01 22:21:11', '2019-12-01 22:21:11', 0);
INSERT INTO `dts_search_history` VALUES (261, 117, '亲子装', 'wx', '2019-12-01 22:21:19', '2019-12-01 22:21:19', 0);
INSERT INTO `dts_search_history` VALUES (262, 117, '亲子装', 'wx', '2019-12-01 22:21:21', '2019-12-01 22:21:21', 0);
INSERT INTO `dts_search_history` VALUES (263, 117, '电热毯', 'wx', '2019-12-01 22:21:40', '2019-12-01 22:21:40', 0);
INSERT INTO `dts_search_history` VALUES (264, 117, '热水袋', 'wx', '2019-12-01 22:21:48', '2019-12-01 22:21:48', 0);
INSERT INTO `dts_search_history` VALUES (265, 135, 'wanjuche', 'wx', '2019-12-03 17:28:37', '2019-12-03 17:28:37', 0);
INSERT INTO `dts_search_history` VALUES (266, 135, '玩具', 'wx', '2019-12-03 17:28:48', '2019-12-03 17:28:48', 0);
INSERT INTO `dts_search_history` VALUES (267, 135, '玩具车', 'wx', '2019-12-03 17:29:00', '2019-12-03 17:29:00', 0);
INSERT INTO `dts_search_history` VALUES (268, 135, '玩具车', 'wx', '2019-12-03 17:29:06', '2019-12-03 17:29:06', 0);
INSERT INTO `dts_search_history` VALUES (269, 135, '玩具车', 'wx', '2019-12-03 17:29:12', '2019-12-03 17:29:12', 0);
INSERT INTO `dts_search_history` VALUES (270, 135, '玩具车', 'wx', '2019-12-03 17:29:25', '2019-12-03 17:29:25', 0);
INSERT INTO `dts_search_history` VALUES (271, 13, '冇心', 'wx', '2019-12-04 09:43:30', '2019-12-04 09:43:30', 0);
INSERT INTO `dts_search_history` VALUES (272, 13, '冇心', 'wx', '2019-12-04 09:43:34', '2019-12-04 09:43:34', 0);
INSERT INTO `dts_search_history` VALUES (273, 13, '冇心', 'wx', '2019-12-04 09:43:36', '2019-12-04 09:43:36', 0);
INSERT INTO `dts_search_history` VALUES (274, 13, '冇心', 'wx', '2019-12-04 09:43:42', '2019-12-04 09:43:42', 0);
INSERT INTO `dts_search_history` VALUES (275, 13, '森马', 'wx', '2019-12-04 09:43:57', '2019-12-04 09:43:57', 0);
INSERT INTO `dts_search_history` VALUES (276, 13, '森马', 'wx', '2019-12-04 09:44:02', '2019-12-04 09:44:02', 0);
INSERT INTO `dts_search_history` VALUES (277, 13, '森马', 'wx', '2019-12-04 09:44:04', '2019-12-04 09:44:04', 0);
INSERT INTO `dts_search_history` VALUES (278, 13, '森马', 'wx', '2019-12-04 09:44:05', '2019-12-04 09:44:05', 0);
INSERT INTO `dts_search_history` VALUES (279, 13, '森马', 'wx', '2019-12-04 09:44:07', '2019-12-04 09:44:07', 0);
INSERT INTO `dts_search_history` VALUES (280, 13, '森马', 'wx', '2019-12-04 09:44:09', '2019-12-04 09:44:09', 0);
INSERT INTO `dts_search_history` VALUES (281, 13, '森马', 'wx', '2019-12-04 09:44:13', '2019-12-04 09:44:13', 0);
INSERT INTO `dts_search_history` VALUES (282, 13, '森马', 'wx', '2019-12-04 09:44:14', '2019-12-04 09:44:14', 0);
INSERT INTO `dts_search_history` VALUES (283, 63, '长靴', 'wx', '2019-12-04 19:45:09', '2019-12-04 19:45:09', 0);
INSERT INTO `dts_search_history` VALUES (284, 63, '长靴', 'wx', '2019-12-04 19:45:17', '2019-12-04 19:45:17', 0);
INSERT INTO `dts_search_history` VALUES (285, 117, '艾维诺', 'wx', '2019-12-05 17:57:06', '2019-12-05 17:57:06', 0);
INSERT INTO `dts_search_history` VALUES (286, 63, '长靴', 'wx', '2019-12-06 18:41:17', '2019-12-06 18:41:17', 0);
INSERT INTO `dts_search_history` VALUES (287, 63, '长靴', 'wx', '2019-12-06 18:41:56', '2019-12-06 18:41:56', 0);
INSERT INTO `dts_search_history` VALUES (288, 63, '长靴', 'wx', '2019-12-06 18:42:03', '2019-12-06 18:42:03', 0);
INSERT INTO `dts_search_history` VALUES (289, 144, '女装', 'wx', '2019-12-08 06:17:17', '2019-12-08 06:17:17', 0);
INSERT INTO `dts_search_history` VALUES (290, 144, '女装', 'wx', '2019-12-08 06:17:20', '2019-12-08 06:17:20', 0);
INSERT INTO `dts_search_history` VALUES (291, 144, '女装', 'wx', '2019-12-08 06:17:23', '2019-12-08 06:17:23', 0);
INSERT INTO `dts_search_history` VALUES (292, 144, '女装', 'wx', '2019-12-08 06:18:22', '2019-12-08 06:18:22', 0);
INSERT INTO `dts_search_history` VALUES (293, 18, '火烈鸟', 'wx', '2019-12-11 21:01:04', '2019-12-11 21:01:04', 0);
INSERT INTO `dts_search_history` VALUES (294, 18, '火烈鸟', 'wx', '2019-12-11 21:01:11', '2019-12-11 21:01:11', 0);
INSERT INTO `dts_search_history` VALUES (295, 18, '火烈鸟', 'wx', '2019-12-11 21:01:22', '2019-12-11 21:01:22', 0);
INSERT INTO `dts_search_history` VALUES (296, 18, '火烈鸟', 'wx', '2019-12-11 21:01:29', '2019-12-11 21:01:29', 0);
INSERT INTO `dts_search_history` VALUES (297, 18, '火烈鸟', 'wx', '2019-12-11 21:02:18', '2019-12-11 21:02:18', 0);
INSERT INTO `dts_search_history` VALUES (298, 18, '火烈鸟', 'wx', '2019-12-11 21:02:21', '2019-12-11 21:02:21', 0);
INSERT INTO `dts_search_history` VALUES (299, 18, '火烈鸟眉笔双头', 'wx', '2019-12-11 21:02:36', '2019-12-11 21:02:36', 0);
INSERT INTO `dts_search_history` VALUES (300, 18, '火烈鸟眉笔', 'wx', '2019-12-11 21:02:42', '2019-12-11 21:02:42', 0);
INSERT INTO `dts_search_history` VALUES (301, 188, '好', 'wx', '2019-12-19 14:29:31', '2019-12-19 14:29:31', 0);
INSERT INTO `dts_search_history` VALUES (302, 189, '女装', 'wx', '2019-12-19 18:37:24', '2019-12-19 18:37:24', 0);
INSERT INTO `dts_search_history` VALUES (303, 189, '女装', 'wx', '2019-12-19 18:37:26', '2019-12-19 18:37:26', 0);
INSERT INTO `dts_search_history` VALUES (304, 189, '女装', 'wx', '2019-12-19 18:37:26', '2019-12-19 18:37:26', 0);
INSERT INTO `dts_search_history` VALUES (305, 189, '女装', 'wx', '2019-12-19 18:37:27', '2019-12-19 18:37:27', 0);
INSERT INTO `dts_search_history` VALUES (306, 192, '女装', 'wx', '2019-12-20 14:55:42', '2019-12-20 14:55:42', 0);
INSERT INTO `dts_search_history` VALUES (307, 192, '女装', 'wx', '2019-12-20 14:55:46', '2019-12-20 14:55:46', 0);

SET FOREIGN_KEY_CHECKS = 1;
