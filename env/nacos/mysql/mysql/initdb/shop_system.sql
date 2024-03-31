/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 192.168.88.128:3306
 Source Schema         : shop_system

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 01/05/2023 00:55:45
*/
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop_system` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `shop_system`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dts_system
-- ----------------------------
DROP TABLE IF EXISTS `dts_system`;
CREATE TABLE `dts_system`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `key_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统配置名',
  `key_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统配置值',
  `add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dts_system
-- ----------------------------
INSERT INTO `dts_system` VALUES (1, 'dts.system.banner.new.title', '大家都在买的', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_system` VALUES (2, 'dts.system.banner.new.imageurl', 'http://yanxuan.nosdn.127.net/8976116db321744084774643a933c5ce.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_system` VALUES (3, 'dts.system.banner.hot.title', '大家都在买的', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_system` VALUES (4, 'dts.system.banner.hot.imageurl', 'http://yanxuan.nosdn.127.net/8976116db321744084774643a933c5ce.png', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_system` VALUES (5, 'dts.system.freight.value', '6', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_system` VALUES (6, 'dts.system.freight.limit', '40', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_system` VALUES (7, 'dts.system.indexlimit.new', '20', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_system` VALUES (8, 'dts.system.indexlimit.hot', '20', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_system` VALUES (9, 'dts.system.indexlimit.brand', '6', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_system` VALUES (10, 'dts.system.indexlimit.topic', '6', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_system` VALUES (11, 'dts.system.indexlimit.catloglist', '8', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_system` VALUES (12, 'dts.system.indexlimit.catloggood', '20', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_system` VALUES (13, 'dts.system.mallname', '科大商城', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_system` VALUES (14, 'dts.system.shareimage.autocreate', '1', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_system` VALUES (15, 'dts.system.multi.order.model', '1', '2019-08-07 18:11:02', '2019-08-07 18:11:07', 0);
INSERT INTO `dts_system` VALUES (16, 'dts.system.notify.model', 'mail', '2020-02-27 20:53:48', '2020-02-27 20:53:52', 0);
INSERT INTO `dts_system` VALUES (17, 'dts.system.agency.model', '0', '2020-03-14 20:53:48', '2020-03-14 20:53:52', 0);

SET FOREIGN_KEY_CHECKS = 1;
