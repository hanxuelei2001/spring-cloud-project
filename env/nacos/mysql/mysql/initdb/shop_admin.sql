/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 192.168.88.128:3306
 Source Schema         : shop_admin

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 01/05/2023 00:54:58
*/
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop_admin` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `shop_admin`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dts_admin
-- ----------------------------
DROP TABLE IF EXISTS `dts_admin`;
CREATE TABLE `dts_admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理员名称',
  `password` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理员密码',
  `last_login_ip` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最近一次登录IP地址',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最近一次登录时间',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'' COMMENT '头像图片',
  `add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `role_ids` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '[]' COMMENT '角色列表',
  `desc` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户描述',
  `tel` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `mail` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dts_admin
-- ----------------------------
INSERT INTO `dts_admin` VALUES (1, 'dtsadmin', '$2a$10$lHs59iD3Yt8qBbGmJcopo.LwOJwB0AzF6JE/zVcEUIYJlvSw1raQ.', NULL, NULL, 'https://juhuixing-public.oss-cn-shenzhen.aliyuncs.com/luq950dq4wzhsn54eq1y.jpeg', '2018-02-01 00:00:00', '2019-12-21 13:21:18', 0, '[1]', NULL, NULL, NULL);
INSERT INTO `dts_admin` VALUES (4, 'promotion123', '$2a$10$wDZLOLLnzZ1EFZ3ldZ1XFOUWDEX6TnQCUFdJz4g.PoMaLTzS8TjWq', '', NULL, '\'', '2019-01-07 15:16:59', '2019-01-07 15:17:34', 1, '[3]', NULL, NULL, NULL);
INSERT INTO `dts_admin` VALUES (5, 'dtsdemo', '$2a$10$zhzZI1jKYFSE/uLfKC0Mo.V0F1EhYFEJqx4UAvDkrFFK3zf69K08K', '', NULL, 'https://juhuixing-dts.oss-cn-shenzhen.aliyuncs.com/lb4z86x7mr735sy91ys9.jpeg', '2019-01-07 15:17:25', '2019-12-21 13:21:43', 0, '[4]', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for dts_article
-- ----------------------------
DROP TABLE IF EXISTS `dts_article`;
CREATE TABLE `dts_article`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信息类型',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '信息内容,富文本格式',
  `add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dts_article
-- ----------------------------
INSERT INTO `dts_article` VALUES (1, '1', '平台1.0版本正式发布上线', '<p>&nbsp;&nbsp;感谢广大用户长期以来对聚惠星商城的支持和信赖，为了更好的服务于广大购物用户，经过数月的开发和内测，新升级版本将于2019年7月1日全面上线试运行。商城在整体风格、交易模式、版块设置、商品种类、用户体验、使用功能等方面全面升级，更好的为商家和用户提供商品批发和零售服务。现将有关事项公告如下：</p>\n<p>&nbsp;&nbsp; <strong>一． 试运行期间推出优惠活动，诚邀各种商品批发商，希望能与提供物美价廉的商家一同合作</strong></p>\n<p>&nbsp;&nbsp; <strong>二． 试运行期间诚邀各种推广代理商及个人，平台提供商品批发及零售，平台提供佣金服务，具体请联系客服了解。</strong></p>\n<p>&nbsp;&nbsp; 欢迎各位朋友关注本小程序，同时各位用户可以关注本平台的服务号\"长沙市聚惠星信息科技\"，聚惠星运行期间欢迎广大用户提供宝贵意见和建议，以便给广大参与者提供更加优质的服务和用户体验。</p>\n<center><strong>长沙市聚惠星信息科技有限责任公司</strong></center>', '2019-05-17 22:23:13', '2019-10-21 23:53:32', 0);
INSERT INTO `dts_article` VALUES (2, '1', '全场优惠券大放送,敬请关注', '<ul style=\"list-style-type: square;\">\n<li><span style=\"text-decoration: underline;\"><strong><span style=\"color: #00ccff; text-decoration: underline;\">平台将从试运行阶段开始，提供各种优惠券领取活动，敬请广大用户关注。</span></strong></span></li>\n</ul>', '2019-05-16 22:24:02', '2019-10-21 23:56:56', 0);

-- ----------------------------
-- Table structure for dts_feedback
-- ----------------------------
DROP TABLE IF EXISTS `dts_feedback`;
CREATE TABLE `dts_feedback`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT 0 COMMENT '用户表的用户ID',
  `username` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名称',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `feed_type` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '反馈类型',
  `content` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '反馈内容',
  `status` int NOT NULL DEFAULT 0 COMMENT '状态',
  `has_picture` tinyint(1) NULL DEFAULT 0 COMMENT '是否含有图片',
  `pic_urls` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址列表，采用JSON数组格式',
  `add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_value`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '意见反馈表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dts_feedback
-- ----------------------------
INSERT INTO `dts_feedback` VALUES (1, 5, 'oVpFH4z_b9387zZOln2jVNJ8MO5g', '13480278372', '优化建议', '样式', 1, 0, '[]', '2019-06-12 01:39:46', '2019-06-12 01:39:46', 0);

-- ----------------------------
-- Table structure for dts_issue
-- ----------------------------
DROP TABLE IF EXISTS `dts_issue`;
CREATE TABLE `dts_issue`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题标题',
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题答案',
  `add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '常见问题表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dts_issue
-- ----------------------------
INSERT INTO `dts_issue` VALUES (1, '购买运费如何收取？', '单笔订单金额（不含运费）满40元免邮费；不满40元，每单收取6元运费（多个店铺因会发多个快递按店铺计算）。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_issue` VALUES (2, '使用什么快递发货？', '快递随机。配送范围覆盖全国大部分地区。', '2018-02-01 00:00:00', '2019-10-27 19:57:50', 0);
INSERT INTO `dts_issue` VALUES (3, '如何申请退货？', '自收到商品之日起7日内，顾客可申请无忧退货，退款将原路返还，不同的银行处理时间不同。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `dts_issue` VALUES (4, '如何开具发票？', '如需开具普通发票，请在下单时选择“我要开发票”并填写相关信息。', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);

-- ----------------------------
-- Table structure for dts_permission
-- ----------------------------
DROP TABLE IF EXISTS `dts_permission`;
CREATE TABLE `dts_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NULL DEFAULT NULL COMMENT '角色ID',
  `permission` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限',
  `add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dts_permission
-- ----------------------------
INSERT INTO `dts_permission` VALUES (1, 1, '*', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0);
INSERT INTO `dts_permission` VALUES (2, 2, 'admin:category:read', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `dts_permission` VALUES (3, 2, 'admin:category:update', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `dts_permission` VALUES (4, 2, 'admin:category:delete', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `dts_permission` VALUES (5, 2, 'admin:category:create', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `dts_permission` VALUES (6, 2, 'admin:category:list', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `dts_permission` VALUES (7, 2, 'admin:brand:create', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `dts_permission` VALUES (8, 2, 'admin:brand:list', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `dts_permission` VALUES (9, 2, 'admin:brand:delete', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `dts_permission` VALUES (10, 2, 'admin:brand:read', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `dts_permission` VALUES (11, 2, 'admin:brand:update', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `dts_permission` VALUES (12, 3, 'admin:ad:list', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (13, 3, 'admin:ad:delete', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (14, 3, 'admin:ad:create', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (15, 3, 'admin:ad:update', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (16, 3, 'admin:ad:read', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (17, 3, 'admin:groupon:list', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (18, 3, 'admin:groupon:update', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (19, 3, 'admin:groupon:create', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (20, 3, 'admin:groupon:read', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (21, 3, 'admin:groupon:delete', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (22, 3, 'admin:topic:create', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (23, 3, 'admin:topic:read', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (24, 3, 'admin:topic:list', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (25, 3, 'admin:topic:delete', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (26, 3, 'admin:topic:update', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (27, 3, 'admin:coupon:list', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (28, 3, 'admin:coupon:delete', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (29, 3, 'admin:coupon:read', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (30, 3, 'admin:coupon:create', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (31, 3, 'admin:coupon:update', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 0);
INSERT INTO `dts_permission` VALUES (32, 4, 'admin:groupon:update', '2019-12-15 12:30:30', '2019-12-15 12:30:30', 0);
INSERT INTO `dts_permission` VALUES (33, 4, 'admin:groupon:delete', '2019-12-15 12:30:30', '2019-12-15 12:30:30', 0);
INSERT INTO `dts_permission` VALUES (34, 4, 'admin:groupon:create', '2019-12-15 12:30:30', '2019-12-15 12:30:30', 0);
INSERT INTO `dts_permission` VALUES (35, 4, 'admin:groupon:list', '2019-12-15 12:30:30', '2019-12-15 12:30:30', 0);
INSERT INTO `dts_permission` VALUES (36, 4, 'admin:groupon:read', '2019-12-15 12:30:30', '2019-12-15 12:30:30', 0);
INSERT INTO `dts_permission` VALUES (37, 4, 'admin:order:list', '2019-12-15 12:30:31', '2019-12-15 12:30:31', 0);
INSERT INTO `dts_permission` VALUES (38, 4, 'admin:order:reply', '2019-12-15 12:30:31', '2019-12-15 12:30:31', 0);
INSERT INTO `dts_permission` VALUES (39, 4, 'admin:order:ship', '2019-12-15 12:30:31', '2019-12-15 12:30:31', 0);
INSERT INTO `dts_permission` VALUES (40, 4, 'admin:order:refund', '2019-12-15 12:30:31', '2019-12-15 12:30:31', 0);
INSERT INTO `dts_permission` VALUES (41, 4, 'admin:order:listShip', '2019-12-15 12:30:31', '2019-12-15 12:30:31', 0);
INSERT INTO `dts_permission` VALUES (42, 4, 'admin:order:read', '2019-12-15 12:30:31', '2019-12-15 12:30:31', 0);
INSERT INTO `dts_permission` VALUES (43, 4, 'admin:comment:list', '2019-12-15 12:30:31', '2019-12-15 12:30:31', 0);
INSERT INTO `dts_permission` VALUES (44, 4, 'admin:goods:update', '2019-12-15 12:30:31', '2019-12-15 12:30:31', 0);
INSERT INTO `dts_permission` VALUES (45, 4, 'admin:goods:delete', '2019-12-15 12:30:31', '2019-12-15 12:30:31', 0);
INSERT INTO `dts_permission` VALUES (46, 4, 'admin:goods:create', '2019-12-15 12:30:31', '2019-12-15 12:30:31', 0);
INSERT INTO `dts_permission` VALUES (47, 4, 'admin:goods:list', '2019-12-15 12:30:31', '2019-12-15 12:30:31', 0);
INSERT INTO `dts_permission` VALUES (48, 4, 'admin:goods:read', '2019-12-15 12:30:31', '2019-12-15 12:30:31', 0);
INSERT INTO `dts_permission` VALUES (49, 4, 'admin:stat:user', '2019-12-15 12:30:32', '2019-12-15 12:30:32', 0);
INSERT INTO `dts_permission` VALUES (50, 4, 'admin:stat:order', '2019-12-15 12:30:32', '2019-12-15 12:30:32', 0);
INSERT INTO `dts_permission` VALUES (51, 4, 'admin:stat:goods', '2019-12-15 12:30:32', '2019-12-15 12:30:32', 0);

-- ----------------------------
-- Table structure for dts_role
-- ----------------------------
DROP TABLE IF EXISTS `dts_role`;
CREATE TABLE `dts_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `desc` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `enabled` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用',
  `add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name_UNIQUE`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dts_role
-- ----------------------------
INSERT INTO `dts_role` VALUES (1, '超级管理员', '所有模块的权限', 1, '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0);
INSERT INTO `dts_role` VALUES (2, '商场管理员', '只有商场模块的操作权限', 1, '2019-01-01 00:00:00', '2019-01-07 15:15:12', 0);
INSERT INTO `dts_role` VALUES (3, '推广管理员', '只有推广模块的操作权限', 1, '2019-01-01 00:00:00', '2019-01-07 15:15:24', 0);
INSERT INTO `dts_role` VALUES (4, '品牌制造商', '普通商户', 1, '2019-06-22 21:28:19', '2019-06-22 21:54:45', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置表' ROW_FORMAT = COMPACT;

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

-- ----------------------------
-- Table structure for dts_topic
-- ----------------------------
DROP TABLE IF EXISTS `dts_topic`;
CREATE TABLE `dts_topic`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '\'' COMMENT '专题标题',
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'' COMMENT '专题子标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '专题内容，富文本格式',
  `price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '专题相关商品最低价',
  `read_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1k' COMMENT '专题阅读量',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '专题图片',
  `sort_order` int NULL DEFAULT 100 COMMENT '排序',
  `goods` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '专题相关商品序列码，用逗号分隔',
  `add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `share_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动分享二维码图片',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `topic_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 318 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '专题表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dts_topic
-- ----------------------------
INSERT INTO `dts_topic` VALUES (264, '品牌女装特钜惠', '聚惠星品牌女装特钜惠', '<p><img src=\"https://juhuixing-dts.oss-cn-shenzhen.aliyuncs.com/3kh017xfld3luh8y6h7r.jpg\" alt=\"\" width=\"1440\" height=\"800\" /></p>', 99.00, '77.7k', 'https://juhuixing-dts.oss-cn-shenzhen.aliyuncs.com/rzqjvv318gesdjqptvuq.jpg', 0, '[18595,18596,18598,18602,18607,18622,18624,18627,18628,18630,18651,18662,18665,18674,18676,18683,18734,18736]', '2019-10-10 11:00:00', '2019-10-12 00:09:55', NULL, 0);
INSERT INTO `dts_topic` VALUES (266, '宝贝童装服饰全平台火热抢购', '聚惠星宝贝童装服饰全平台火热抢购', '<p><img src=\"https://juhuixing-dts.oss-cn-shenzhen.aliyuncs.com/690k9icvldw6xq3ojabu.jpg\" alt=\"\" width=\"1440\" height=\"800\" /></p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>', 28.00, '35.0k', 'https://juhuixing-dts.oss-cn-shenzhen.aliyuncs.com/wxao0j1pn6tc27hcuztf.jpg', 0, '[17897,17900,17902,17918,17919,17921,17931,17942,17950,17966,17981,17982]', '2019-10-11 00:00:00', '2019-10-10 23:40:00', NULL, 0);
INSERT INTO `dts_topic` VALUES (268, '品牌女装特钜惠', '聚惠星品牌女装钜惠', '<p><img src=\"https://juhuixing-dts.oss-cn-shenzhen.aliyuncs.com/nacyefz96rmrptmbq61e.jpg\" width=\"1440\" height=\"1536\" /></p>\n<p><img src=\"https://cbu01.alicdn.com/img/ibank/2019/966/522/10514225669_415112448.400x400.jpg\" alt=\"\" width=\"750\" height=\"750\" /></p>\n<p><img src=\"https://cbu01.alicdn.com/img/ibank/2018/138/317/8680713831_530189552.400x400.jpg\" alt=\"\" width=\"750\" height=\"750\" /></p>\n<p><img src=\"https://cbu01.alicdn.com/img/ibank/2017/284/219/3819912482_729253905.400x400.jpg\" alt=\"\" width=\"750\" height=\"750\" /></p>\n<p><a href=\"/pages/goods/goods?id=157\" target=\"_blank\" rel=\"noopener\"><img src=\"https://cbu01.alicdn.com/img/ibank/2016/117/214/3639412711_2134625820.400x400.jpg\" alt=\"\" width=\"750\" height=\"750\" /></a></p>', 69.00, '33.3k', 'https://juhuixing-dts.oss-cn-shenzhen.aliyuncs.com/n7eoh6hnkmc5h3qsjlea.jpg', 0, '[]', '2018-02-01 00:00:00', '2019-10-10 22:54:04', NULL, 1);
INSERT INTO `dts_topic` VALUES (277, '聚惠星特别优惠', '聚惠星特别优惠你想要聚惠星都有', '<p><img src=\"https://juhuixing-dts.oss-cn-shenzhen.aliyuncs.com/sf26w469pdsy4viour4t.jpg\" alt=\"\" width=\"1440\" height=\"800\" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>', 18.00, '19.6k', 'https://juhuixing-dts.oss-cn-shenzhen.aliyuncs.com/5h2l71ztjufwwlsrwkex.jpg', 0, '[6510,10942,11050,11146,12673,14100,14101,14187,17478,17481,17486,17487,17506,17515,17533,17688,17691,17695,17713,17721,17723,17746,17751,17779,17792,17793,17797,17798,17799,17800]', '2019-10-13 00:00:00', '2019-10-12 00:11:53', NULL, 0);
INSERT INTO `dts_topic` VALUES (315, '新品童鞋专场-包邮5折起', '聚惠星童鞋专场活动免邮5折起售', '<p><img src=\"https://juhuixing-dts.oss-cn-shenzhen.aliyuncs.com/5qsxz9ejw3tlyk7y6ff9.jpg\" alt=\"\" width=\"1440\" height=\"800\" /></p>', 40.00, '2k', 'https://juhuixing-dts.oss-cn-shenzhen.aliyuncs.com/3wu4kqq1sufwigkg14mo.jpg', 100, '[18032,18033,18035,18036,18071,18077,18091,18105,18112,18121,18136,18163]', '2019-10-09 22:11:25', '2019-10-09 22:12:23', NULL, 0);
INSERT INTO `dts_topic` VALUES (316, '阿道夫洗护系列—全场6.5折', '阿道夫洗护系列—全场6.5折', '<p><img src=\"https://juhuixing-dts.oss-cn-shenzhen.aliyuncs.com/v9w5nnro13ldmo0ocijx.jpg\" alt=\"\" width=\"1440\" height=\"800\" /></p>', 15.00, '3k', 'https://juhuixing-dts.oss-cn-shenzhen.aliyuncs.com/y4r9fbsr5vgt0dqzbaxk.jpg', 100, '[17838,17839,17840,17841,17842,17843,17844,17845,17846,17847,17848,17849,17850,17851,17852,17853,17854,17855,17856,17857,17858,17859,17860,17861,17862,17863,17864,17865,17866,17867,17868,17869,17870,17871,17872,17873,17874,17875,17876,17877,17878,17879,17880,17881,17882,17883,17884,17885,17886,17887,17888,17889]', '2019-10-10 00:05:25', '2019-10-10 00:07:16', NULL, 0);
INSERT INTO `dts_topic` VALUES (317, '千姿万丽内衣专场', '聚惠星千姿万丽内衣专场5折起', '<p><img src=\"https://juhuixing-dts.oss-cn-shenzhen.aliyuncs.com/uk0xqx5q976yxj1cn2eq.jpg\" alt=\"\" width=\"1440\" height=\"800\" /></p>', 20.00, '45k', 'https://juhuixing-dts.oss-cn-shenzhen.aliyuncs.com/zp28pzt2c02omh0yifie.jpg', 100, '[17580,17582,17586,17589,17590,17591,17595,17596,17597,17598,17600,17601,17603,17607,17609,17612,17626,17628,17662]', '2019-10-10 22:14:49', '2019-10-10 22:14:49', NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
