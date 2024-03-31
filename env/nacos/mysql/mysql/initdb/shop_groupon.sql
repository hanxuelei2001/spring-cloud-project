/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 192.168.88.128:3306
 Source Schema         : shop_groupon

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 01/05/2023 00:55:22
*/
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop_groupon` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `shop_groupon`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dts_groupon
-- ----------------------------
DROP TABLE IF EXISTS `dts_groupon`;
CREATE TABLE `dts_groupon`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL COMMENT '关联的订单ID',
  `groupon_id` int NULL DEFAULT 0 COMMENT '参与的团购ID，仅当user_type不是1',
  `rules_id` int NOT NULL COMMENT '团购规则ID，关联dts_groupon_rules表ID字段',
  `user_id` int NOT NULL COMMENT '用户ID',
  `creator_user_id` int NOT NULL COMMENT '创建者ID',
  `add_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `share_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '团购分享图片地址',
  `payed` tinyint(1) NOT NULL COMMENT '是否已经支付',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dts_groupon
-- ----------------------------
INSERT INTO `dts_groupon` VALUES (1, 3, 0, 2, 14, 14, '2019-06-20 20:32:43', '2019-06-20 20:32:43', NULL, 0, 0);
INSERT INTO `dts_groupon` VALUES (2, 24, 0, 8, 1, 1, '2019-08-14 23:09:11', '2019-08-14 23:09:11', NULL, 0, 0);
INSERT INTO `dts_groupon` VALUES (3, 25, 0, 8, 1, 1, '2019-08-14 23:12:17', '2019-08-15 00:16:42', 'http://47.106.211.25/dts/storage/4olfg1ngrtfwim4h4bbh.jpg', 1, 0);
INSERT INTO `dts_groupon` VALUES (4, 26, 0, 8, 1, 1, '2019-08-14 23:30:07', '2019-08-15 00:04:25', 'http://47.106.211.25/dts/storage/9ex5cuh9vntnjjyuijv2.jpg', 1, 0);
INSERT INTO `dts_groupon` VALUES (5, 27, 0, 8, 1, 1, '2019-08-14 23:54:21', '2019-08-15 00:08:39', 'http://47.106.211.25/dts/storage/seeth6wutv4bdgbfbwtj.jpg', 1, 0);
INSERT INTO `dts_groupon` VALUES (6, 43, 0, 8, 1, 1, '2019-08-15 00:01:29', '2019-08-15 00:01:39', 'http://47.106.211.25/dts/storage/0n6f4wcegpkhugf2x1pw.jpg', 1, 0);
INSERT INTO `dts_groupon` VALUES (7, 56, 0, 8, 1, 1, '2019-08-15 01:47:37', '2019-08-15 01:47:53', 'http://47.106.211.25/dts/storage/u95e7f4inp7uib4ceqo9.jpg', 1, 0);
INSERT INTO `dts_groupon` VALUES (8, 59, 0, 4, 2, 2, '2019-08-16 00:00:06', '2019-08-16 00:00:19', 'http://47.106.211.25/dts/storage/7yg6uc55fc1p0mhsz72f.jpg', 1, 0);
INSERT INTO `dts_groupon` VALUES (9, 65, 0, 4, 2, 2, '2019-08-17 00:12:06', '2019-08-17 00:12:18', 'http://47.106.211.25/dts/storage/2n66grqnqammqo6heckt.jpg', 1, 0);
INSERT INTO `dts_groupon` VALUES (10, 68, 0, 4, 2, 2, '2019-08-17 14:34:38', '2019-08-17 14:34:50', 'http://47.106.211.25/dts/storage/1q4no6279ju44swmfk8s.jpg', 1, 0);
INSERT INTO `dts_groupon` VALUES (11, 71, 0, 5, 13, 13, '2019-08-17 23:58:37', '2019-08-17 23:58:37', NULL, 0, 0);
INSERT INTO `dts_groupon` VALUES (12, 121, 0, 8, 91, 91, '2019-11-15 14:38:11', '2019-11-15 14:38:11', NULL, 0, 0);
INSERT INTO `dts_groupon` VALUES (13, 138, 0, 15, 122, 122, '2019-12-02 17:26:50', '2019-12-02 17:26:50', NULL, 0, 0);
INSERT INTO `dts_groupon` VALUES (14, 141, 0, 10, 134, 134, '2019-12-03 15:08:40', '2019-12-03 15:08:40', NULL, 0, 0);
INSERT INTO `dts_groupon` VALUES (15, 154, 0, 15, 147, 147, '2019-12-09 14:09:53', '2019-12-09 14:09:53', NULL, 0, 0);
INSERT INTO `dts_groupon` VALUES (16, 158, 0, 15, 175, 175, '2019-12-16 14:02:49', '2019-12-16 14:02:49', NULL, 0, 0);

-- ----------------------------
-- Table structure for dts_groupon_rules
-- ----------------------------
DROP TABLE IF EXISTS `dts_groupon_rules`;
CREATE TABLE `dts_groupon_rules`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `goods_id` bigint NOT NULL COMMENT '商品表的商品ID',
  `goods_name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片或者商品货品图片',
  `discount` decimal(63, 0) NOT NULL COMMENT '优惠金额',
  `discount_member` int NOT NULL COMMENT '达到优惠条件的人数',
  `add_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '团购过期时间',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dts_groupon_rules
-- ----------------------------
INSERT INTO `dts_groupon_rules` VALUES (16, 23847, '飞科电动剃须刀男士刮胡刀全身水洗智能充电式胡须刀正品FS339', 'https://cbu01.alicdn.com/img/ibank/2019/688/984/12458489886_490508976.400x400.jpg', 3, 3, '2019-12-20 10:18:24', '2019-12-20 10:18:24', '2019-12-25 00:00:00', 0);

SET FOREIGN_KEY_CHECKS = 1;
