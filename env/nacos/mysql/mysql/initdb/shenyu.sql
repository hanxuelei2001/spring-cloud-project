/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 192.168.88.128:3306
 Source Schema         : shenyu

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 15/04/2023 19:27:04
*/
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shenyu` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `shenyu`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alert_template
-- ----------------------------
DROP TABLE IF EXISTS `alert_template`;
CREATE TABLE `alert_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'primary key id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'alert template name',
  `strategy_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'alert template strategy name',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'alert template content',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of alert_template
-- ----------------------------

-- ----------------------------
-- Table structure for api
-- ----------------------------
DROP TABLE IF EXISTS `api`;
CREATE TABLE `api`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `context_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the context_path',
  `api_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the api_path',
  `http_method` int NOT NULL COMMENT '0-get,1-head,2-post,3-put,4-patch,5-delete,6-options,7-trace',
  `consume` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'consume content-type',
  `produce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'produce content-type',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'api version,for example V0.01',
  `rpc_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'http,dubbo,sofa,tars,websocket,springCloud,motan,grpc',
  `state` tinyint NOT NULL COMMENT '0-unpublished,1-published,2-offline',
  `ext` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'extended fields',
  `api_owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'api_owner',
  `api_desc` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the api description',
  `api_source` int NOT NULL COMMENT '0-swagger,1-annotation generation,2-create manually,3-import swagger,4-import yapi',
  `document` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'complete documentation of the api, including request parameters and response parameters',
  `document_md5` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'document_md5',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of api
-- ----------------------------

-- ----------------------------
-- Table structure for api_rule_relation
-- ----------------------------
DROP TABLE IF EXISTS `api_rule_relation`;
CREATE TABLE `api_rule_relation`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `api_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the table api primary key id',
  `rule_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the table rule primary key id',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of api_rule_relation
-- ----------------------------

-- ----------------------------
-- Table structure for app_auth
-- ----------------------------
DROP TABLE IF EXISTS `app_auth`;
CREATE TABLE `app_auth`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `app_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'application identification key',
  `app_secret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'encryption algorithm secret',
  `user_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'user id',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'phone number when the user applies',
  `ext_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'extended parameter json',
  `open` tinyint NOT NULL COMMENT 'open auth path or not  (0 close, 1 open) ',
  `enabled` tinyint NOT NULL COMMENT 'delete or not  (0 close, 1 open) ',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_auth
-- ----------------------------

-- ----------------------------
-- Table structure for auth_param
-- ----------------------------
DROP TABLE IF EXISTS `auth_param`;
CREATE TABLE `auth_param`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `auth_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Authentication table id',
  `app_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'business Module',
  `app_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'service module parameters (parameters that need to be passed by the gateway) json type',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_param
-- ----------------------------

-- ----------------------------
-- Table structure for auth_path
-- ----------------------------
DROP TABLE IF EXISTS `auth_path`;
CREATE TABLE `auth_path`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `auth_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'auth table id',
  `app_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'module',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'path',
  `enabled` tinyint NOT NULL COMMENT 'whether pass 1 is  (0 close, 1 open) ',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_path
-- ----------------------------

-- ----------------------------
-- Table structure for dashboard_user
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_user`;
CREATE TABLE `dashboard_user`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'user name',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'user password',
  `role` int NOT NULL COMMENT 'role',
  `enabled` tinyint NOT NULL COMMENT 'delete or not (0 close, 1 open) ',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_user_name`(`user_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dashboard_user
-- ----------------------------
INSERT INTO `dashboard_user` VALUES ('1', 'admin', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 1, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');

-- ----------------------------
-- Table structure for data_permission
-- ----------------------------
DROP TABLE IF EXISTS `data_permission`;
CREATE TABLE `data_permission`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `user_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'user primary key id',
  `data_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'data(selector,rule) primary key id',
  `data_type` int NOT NULL COMMENT '0 selector type , 1 rule type',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'data permission table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of data_permission
-- ----------------------------

-- ----------------------------
-- Table structure for detail
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `field_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the field id',
  `is_example` tinyint NOT NULL COMMENT 'is example or not (0 not, 1 is)',
  `field_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the field value',
  `value_desc` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'field value description',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'field value detail table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of detail
-- ----------------------------

-- ----------------------------
-- Table structure for field
-- ----------------------------
DROP TABLE IF EXISTS `field`;
CREATE TABLE `field`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `model_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'this field belongs to which model',
  `self_model_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'which model of this field is',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'field name',
  `field_desc` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'field description',
  `required` tinyint NOT NULL COMMENT 'whether to require (0 not required, 1 required)',
  `ext` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'extended fields,can store genericTypes,eg..{\"genericTypes\":[model_id1,model_id2]}',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'field document table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of field
-- ----------------------------

-- ----------------------------
-- Table structure for meta_data
-- ----------------------------
DROP TABLE IF EXISTS `meta_data`;
CREATE TABLE `meta_data`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'id',
  `app_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'application name',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'path, cannot be repeated',
  `path_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'path description',
  `rpc_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'rpc type',
  `service_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'service name',
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'method name',
  `parameter_types` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'parameter types are provided with multiple parameter types separated by commas',
  `rpc_ext` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'rpc extended information, json format',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  `enabled` tinyint NOT NULL DEFAULT 0 COMMENT 'enabled state  (0 close, 1 open) ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of meta_data
-- ----------------------------
INSERT INTO `meta_data` VALUES ('1654502265578737664', 'search', '/search/wx/search/**', NULL, 'http', 'com.haust.shop.search.controller.WxSearchController', NULL, NULL, NULL, '2023-05-05 23:04:13.936', '2023-05-05 23:04:13.936', 1);
INSERT INTO `meta_data` VALUES ('1654502285988220928', 'third-party', '/third/wx/storage/**', NULL, 'http', 'com.haust.shop.third.controller.WxStorageController', NULL, NULL, NULL, '2023-05-05 23:04:18.802', '2023-05-05 23:04:18.802', 1);
INSERT INTO `meta_data` VALUES ('1654502287028408320', 'third-party', '/third/wx/region/**', NULL, 'http', 'com.haust.shop.third.controller.WxRegionController', NULL, NULL, NULL, '2023-05-05 23:04:19.050', '2023-05-05 23:04:19.050', 1);
INSERT INTO `meta_data` VALUES ('1654513588622680064', 'product', '/product/wx/goods/**', NULL, 'http', 'com.haust.shop.product.controller.WxGoodsController', NULL, NULL, NULL, '2023-05-05 23:49:13.560', '2023-05-05 23:49:13.560', 1);
INSERT INTO `meta_data` VALUES ('1654513588861755392', 'product', '/product/wx/topic/**', NULL, 'http', 'com.haust.shop.product.controller.WxTopicController', NULL, NULL, NULL, '2023-05-05 23:49:13.617', '2023-05-05 23:49:13.617', 1);
INSERT INTO `meta_data` VALUES ('1654513589008556032', 'product', '/product/wx/brand/**', NULL, 'http', 'com.haust.shop.product.controller.WxBrandController', NULL, NULL, NULL, '2023-05-05 23:49:13.652', '2023-05-05 23:49:13.652', 1);
INSERT INTO `meta_data` VALUES ('1654513589180522496', 'product', '/product/wx/catalog/**', NULL, 'http', 'com.haust.shop.product.controller.WxCatalogController', NULL, NULL, NULL, '2023-05-05 23:49:13.693', '2023-05-05 23:49:13.693', 1);
INSERT INTO `meta_data` VALUES ('1654513640221007872', 'order', '/order/wx/order/**', NULL, 'http', 'com.haust.shop.order.controller.WxOrderController', NULL, NULL, NULL, '2023-05-05 23:49:25.862', '2023-05-05 23:49:25.862', 1);
INSERT INTO `meta_data` VALUES ('1654513646004953088', 'groupon', '/groupon/wx/groupon/**', NULL, 'http', 'com.haust.shop.groupon.controller.WxGrouponController', NULL, NULL, NULL, '2023-05-05 23:49:27.241', '2023-05-05 23:49:27.241', 1);
INSERT INTO `meta_data` VALUES ('1654513670772318208', 'coupon', '/coupon/wx/coupon/**', NULL, 'http', 'com.haust.shop.coupon.controller.WxCouponController', NULL, NULL, NULL, '2023-05-05 23:49:33.146', '2023-05-05 23:49:33.146', 1);
INSERT INTO `meta_data` VALUES ('1654513703198482432', 'cart', '/cart/wx/cart/**', NULL, 'http', 'com.haust.shop.cart.controller.WxCartController', NULL, NULL, NULL, '2023-05-05 23:49:40.877', '2023-05-05 23:49:40.877', 1);
INSERT INTO `meta_data` VALUES ('1654513763223166976', 'admin', '/admin/admin/groupon/**', NULL, 'http', 'com.haust.shop.admin.web.AdminGrouponController', NULL, NULL, NULL, '2023-05-05 23:49:55.188', '2023-05-05 23:49:55.188', 1);
INSERT INTO `meta_data` VALUES ('1654513763411910656', 'admin', '/admin/admin/storage/**', NULL, 'http', 'com.haust.shop.admin.web.AdminStorageController', NULL, NULL, NULL, '2023-05-05 23:49:55.233', '2023-05-05 23:49:55.233', 1);
INSERT INTO `meta_data` VALUES ('1654513763508379648', 'admin', '/admin/admin/topic/**', NULL, 'http', 'com.haust.shop.admin.web.AdminTopicController', NULL, NULL, NULL, '2023-05-05 23:49:55.256', '2023-05-05 23:49:55.256', 1);
INSERT INTO `meta_data` VALUES ('1654513763613237248', 'admin', '/admin/wx/feedback/**', NULL, 'http', 'com.haust.shop.admin.web.WxFeedbackController', NULL, NULL, NULL, '2023-05-05 23:49:55.281', '2023-05-05 23:49:55.281', 1);
INSERT INTO `meta_data` VALUES ('1654513763692929024', 'admin', '/admin/admin/stat/**', NULL, 'http', 'com.haust.shop.admin.web.AdminStatController', NULL, NULL, NULL, '2023-05-05 23:49:55.300', '2023-05-05 23:49:55.300', 1);
INSERT INTO `meta_data` VALUES ('1654513763776815104', 'admin', '/admin/admin/user/**', NULL, 'http', 'com.haust.shop.admin.web.AdminUserController', NULL, NULL, NULL, '2023-05-05 23:49:55.320', '2023-05-05 23:49:55.320', 1);
INSERT INTO `meta_data` VALUES ('1654513763864895488', 'admin', '/admin/admin/profile/**', NULL, 'http', 'com.haust.shop.admin.web.AdminProfileController', NULL, NULL, NULL, '2023-05-05 23:49:55.341', '2023-05-05 23:49:55.341', 1);
INSERT INTO `meta_data` VALUES ('1654513763986530304', 'admin', '/admin/admin/brand/**', NULL, 'http', 'com.haust.shop.admin.web.AdminBrandController', NULL, NULL, NULL, '2023-05-05 23:49:55.370', '2023-05-05 23:49:55.370', 1);
INSERT INTO `meta_data` VALUES ('1654513764074610688', 'admin', '/admin/admin/auth/**', NULL, 'http', 'com.haust.shop.admin.web.AdminAuthController', NULL, NULL, NULL, '2023-05-05 23:49:55.391', '2023-05-05 23:49:55.391', 1);
INSERT INTO `meta_data` VALUES ('1654513764162691072', 'admin', '/admin/admin/goods/**', NULL, 'http', 'com.haust.shop.admin.web.AdminGoodsController', NULL, NULL, NULL, '2023-05-05 23:49:55.412', '2023-05-05 23:49:55.412', 1);
INSERT INTO `meta_data` VALUES ('1654513764263354368', 'admin', '/admin/admin/comment/**', NULL, 'http', 'com.haust.shop.admin.web.AdminCommentController', NULL, NULL, NULL, '2023-05-05 23:49:55.436', '2023-05-05 23:49:55.436', 1);
INSERT INTO `meta_data` VALUES ('1654513764364017664', 'admin', '/admin/admin/brokerage/**', NULL, 'http', 'com.haust.shop.admin.web.AdminBrokerageController', NULL, NULL, NULL, '2023-05-05 23:49:55.460', '2023-05-05 23:49:55.460', 1);
INSERT INTO `meta_data` VALUES ('1654513764456292352', 'admin', '/admin/admin/role/**', NULL, 'http', 'com.haust.shop.admin.web.AdminRoleController', NULL, NULL, NULL, '2023-05-05 23:49:55.482', '2023-05-05 23:49:55.482', 1);
INSERT INTO `meta_data` VALUES ('1654513764540178432', 'admin', '/admin/admin/region/**', NULL, 'http', 'com.haust.shop.admin.web.AdminRegionController', NULL, NULL, NULL, '2023-05-05 23:49:55.502', '2023-05-05 23:49:55.502', 1);
INSERT INTO `meta_data` VALUES ('1654513764632453120', 'admin', '/admin/admin/ad/**', NULL, 'http', 'com.haust.shop.admin.web.AdminAdController', NULL, NULL, NULL, '2023-05-05 23:49:55.524', '2023-05-05 23:49:55.524', 1);
INSERT INTO `meta_data` VALUES ('1654513764720533504', 'admin', '/admin/admin/category/**', NULL, 'http', 'com.haust.shop.admin.web.AdminCategoryController', NULL, NULL, NULL, '2023-05-05 23:49:55.545', '2023-05-05 23:49:55.545', 1);
INSERT INTO `meta_data` VALUES ('1654513764800225280', 'admin', '/admin/admin/collect/**', NULL, 'http', 'com.haust.shop.admin.web.AdminCollectController', NULL, NULL, NULL, '2023-05-05 23:49:55.564', '2023-05-05 23:49:55.564', 1);
INSERT INTO `meta_data` VALUES ('1654513764888305664', 'admin', '/admin/admin/admin/**', NULL, 'http', 'com.haust.shop.admin.web.AdminAdminController', NULL, NULL, NULL, '2023-05-05 23:49:55.585', '2023-05-05 23:49:55.585', 1);
INSERT INTO `meta_data` VALUES ('1654513764976386048', 'admin', '/admin/admin/footprint/**', NULL, 'http', 'com.haust.shop.admin.web.AdminFootprintController', NULL, NULL, NULL, '2023-05-05 23:49:55.606', '2023-05-05 23:49:55.606', 1);
INSERT INTO `meta_data` VALUES ('1654513765068660736', 'admin', '/admin/admin/history/**', NULL, 'http', 'com.haust.shop.admin.web.AdminHistoryController', NULL, NULL, NULL, '2023-05-05 23:49:55.628', '2023-05-05 23:49:55.628', 1);
INSERT INTO `meta_data` VALUES ('1654513765152546816', 'admin', '/admin/admin/article/**', NULL, 'http', 'com.haust.shop.admin.web.AdminArticleController', NULL, NULL, NULL, '2023-05-05 23:49:55.648', '2023-05-05 23:49:55.648', 1);
INSERT INTO `meta_data` VALUES ('1654513765269987328', 'admin', '/admin/admin/keyword/**', NULL, 'http', 'com.haust.shop.admin.web.AdminKeywordController', NULL, NULL, NULL, '2023-05-05 23:49:55.676', '2023-05-05 23:49:55.676', 1);
INSERT INTO `meta_data` VALUES ('1654513765358067712', 'admin', '/admin/admin/issue/**', NULL, 'http', 'com.haust.shop.admin.web.AdminIssueController', NULL, NULL, NULL, '2023-05-05 23:49:55.697', '2023-05-05 23:49:55.697', 1);
INSERT INTO `meta_data` VALUES ('1654513765450342400', 'admin', '/admin/admin/order/**', NULL, 'http', 'com.haust.shop.admin.web.AdminOrderController', NULL, NULL, NULL, '2023-05-05 23:49:55.719', '2023-05-05 23:49:55.719', 1);
INSERT INTO `meta_data` VALUES ('1654513765517451264', 'admin', '/admin/admin/index/**', NULL, 'http', 'com.haust.shop.admin.web.AdminIndexController', NULL, NULL, NULL, '2023-05-05 23:49:55.735', '2023-05-05 23:49:55.735', 1);
INSERT INTO `meta_data` VALUES ('1654513765634891776', 'admin', '/admin/admin/address/**', NULL, 'http', 'com.haust.shop.admin.web.AdminAddressController', NULL, NULL, NULL, '2023-05-05 23:49:55.763', '2023-05-05 23:49:55.763', 1);
INSERT INTO `meta_data` VALUES ('1654513765706194944', 'admin', '/admin/admin/feedback/**', NULL, 'http', 'com.haust.shop.admin.web.AdminFeedbackController', NULL, NULL, NULL, '2023-05-05 23:49:55.780', '2023-05-05 23:49:55.780', 1);
INSERT INTO `meta_data` VALUES ('1654513765773303808', 'admin', '/admin/admin/dashboard/**', NULL, 'http', 'com.haust.shop.admin.web.AdminDashbordController', NULL, NULL, NULL, '2023-05-05 23:49:55.796', '2023-05-05 23:49:55.796', 1);
INSERT INTO `meta_data` VALUES ('1654513765852995584', 'admin', '/admin/wx/article/**', NULL, 'http', 'com.haust.shop.admin.web.WxArticleController', NULL, NULL, NULL, '2023-05-05 23:49:55.815', '2023-05-05 23:49:55.815', 1);
INSERT INTO `meta_data` VALUES ('1654513765941075968', 'admin', '/admin/admin/coupon/**', NULL, 'http', 'com.haust.shop.admin.web.AdminCouponController', NULL, NULL, NULL, '2023-05-05 23:49:55.836', '2023-05-05 23:49:55.836', 1);
INSERT INTO `meta_data` VALUES ('1654513791060762624', 'user', '/user/wx/comment/**', NULL, 'http', 'com.haust.shop.user.controller.WxCommentController', NULL, NULL, NULL, '2023-05-05 23:50:01.825', '2023-05-05 23:50:01.825', 1);
INSERT INTO `meta_data` VALUES ('1654513791211757568', 'user', '/user/wx/collect/**', NULL, 'http', 'com.haust.shop.user.controller.WxCollectController', NULL, NULL, NULL, '2023-05-05 23:50:01.861', '2023-05-05 23:50:01.861', 1);
INSERT INTO `meta_data` VALUES ('1654513791278866432', 'user', '/user/wx/address/**', NULL, 'http', 'com.haust.shop.user.controller.WxAddressController', NULL, NULL, NULL, '2023-05-05 23:50:01.877', '2023-05-05 23:50:01.877', 1);
INSERT INTO `meta_data` VALUES ('1654513791345975296', 'user', '/user/wx/formid/**', NULL, 'http', 'com.haust.shop.user.controller.WxUserFormId', NULL, NULL, NULL, '2023-05-05 23:50:01.893', '2023-05-05 23:50:01.893', 1);
INSERT INTO `meta_data` VALUES ('1654513791475998720', 'user', '/user/wx/brokerage/**', NULL, 'http', 'com.haust.shop.user.controller.WxBrokerageController', NULL, NULL, NULL, '2023-05-05 23:50:01.924', '2023-05-05 23:50:01.924', 1);
INSERT INTO `meta_data` VALUES ('1654513791547301888', 'user', '/user/wx/user/**', NULL, 'http', 'com.haust.shop.user.controller.WxUserController', NULL, NULL, NULL, '2023-05-05 23:50:01.941', '2023-05-05 23:50:01.941', 1);
INSERT INTO `meta_data` VALUES ('1654513791614410752', 'user', '/user/wx/index/**', NULL, 'http', 'com.haust.shop.user.controller.WxIndexController', NULL, NULL, NULL, '2023-05-05 23:50:01.957', '2023-05-05 23:50:01.957', 1);
INSERT INTO `meta_data` VALUES ('1654513791685713920', 'user', '/user/wx/home/**', NULL, 'http', 'com.haust.shop.user.controller.WxHomeController', NULL, NULL, NULL, '2023-05-05 23:50:01.974', '2023-05-05 23:50:01.974', 1);
INSERT INTO `meta_data` VALUES ('1654513791777988608', 'user', '/user/wx/footprint/**', NULL, 'http', 'com.haust.shop.user.controller.WxFootprintController', NULL, NULL, NULL, '2023-05-05 23:50:01.996', '2023-05-05 23:50:01.996', 1);
INSERT INTO `meta_data` VALUES ('1654513791857680384', 'user', '/user/wx/auth/**', NULL, 'http', 'com.haust.shop.user.controller.WxAuthController', NULL, NULL, NULL, '2023-05-05 23:50:02.015', '2023-05-05 23:50:02.015', 1);
INSERT INTO `meta_data` VALUES ('1654513791933177856', 'user', '/user/wx/agency/**', NULL, 'http', 'com.haust.shop.user.controller.WxAgencyController', NULL, NULL, NULL, '2023-05-05 23:50:02.033', '2023-05-05 23:50:02.033', 1);

-- ----------------------------
-- Table structure for mock_request_record
-- ----------------------------
DROP TABLE IF EXISTS `mock_request_record`;
CREATE TABLE `mock_request_record`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `api_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the api id',
  `host` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the request host',
  `port` int NOT NULL COMMENT 'the request port',
  `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the request url',
  `path_variable` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'the request param in url',
  `query` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'the request param after url',
  `header` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'the request param in header',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'the request body',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mock_request_record
-- ----------------------------

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the model name',
  `model_desc` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the model description',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model
-- ----------------------------

-- ----------------------------
-- Table structure for operation_record_log
-- ----------------------------
DROP TABLE IF EXISTS `operation_record_log`;
CREATE TABLE `operation_record_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'log color',
  `context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'log context',
  `operator` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'operator [user or app]]',
  `operation_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'operation time',
  `operation_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'update' COMMENT 'operation type：create/update/delete/register...',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'operation record log' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of operation_record_log
-- ----------------------------
INSERT INTO `operation_record_log` VALUES (2, '#CC6600', 'the plugin [divide] is update : ', 'admin', '2023-05-06 21:46:34.539', 'UPDATE:Plugin');

-- ----------------------------
-- Table structure for param
-- ----------------------------
DROP TABLE IF EXISTS `param`;
CREATE TABLE `param`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `api_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the api id',
  `model_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the model id, empty if not a model',
  `type` int NOT NULL COMMENT '0-requestPathVariable,1-requestUrlParam,2-requestHeader,3-requestBody,4-responseHeader,5-responseBody',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the param name',
  `param_desc` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the param description',
  `required` tinyint NOT NULL COMMENT 'whether to require (0 not required, 1 required)',
  `ext` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'extended fields',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of param
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `object_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'user primary key id or role primary key id',
  `resource_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'resource primary key id',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'permission table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1351007708572688384', '1346358560427216896', '1346775491550474240', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708585271296', '1346358560427216896', '1346776175553376256', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708593659904', '1346358560427216896', '1346777157943259136', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708597854208', '1346358560427216896', '1346777449787125760', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708606242816', '1346358560427216896', '1346777623011880960', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708610437120', '1346358560427216896', '1346777766301888512', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708614631424', '1346358560427216896', '1346777907096285184', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708623020032', '1346358560427216896', '1346778036402483200', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708685934593', '1346358560427216896', '1347032308726902784', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708690128896', '1346358560427216896', '1347032395901317120', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708694323200', '1346358560427216896', '1347032453707214848', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708698517504', '1346358560427216896', '1347032509051056128', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708702711808', '1346358560427216896', '1347034027070337024', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708706906112', '1346358560427216896', '1347039054925148160', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708711100416', '1346358560427216896', '1347041326749691904', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708715294720', '1346358560427216896', '1347046566244003840', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708719489024', '1346358560427216896', '1347047143350874112', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708723683328', '1346358560427216896', '1347047203220369408', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708727877632', '1346358560427216896', '1347047555588042752', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708732071936', '1346358560427216896', '1347047640145211392', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708732071937', '1346358560427216896', '1347047695002513408', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708736266240', '1346358560427216896', '1347047747305484288', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708740460544', '1346358560427216896', '1347048004105940992', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708744654848', '1346358560427216896', '1347048101875167232', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708744654849', '1346358560427216896', '1347048145877610496', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708748849152', '1346358560427216896', '1347048240677269504', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708753043456', '1346358560427216896', '1347048316216684544', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708757237760', '1346358560427216896', '1347048776029843456', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708757237761', '1346358560427216896', '1347048968414179328', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708761432064', '1346358560427216896', '1347049029323862016', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708765626368', '1346358560427216896', '1347049092552994816', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708769820672', '1346358560427216896', '1347049251395481600', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708774014976', '1346358560427216896', '1347049317178945536', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708774014977', '1346358560427216896', '1347049370014593024', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708778209280', '1346358560427216896', '1347049542417264640', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708782403584', '1346358560427216896', '1347049598155370496', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708786597888', '1346358560427216896', '1347049659023110144', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708790792192', '1346358560427216896', '1347049731047698432', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007708794986496', '1346358560427216896', '1347049794008395776', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007709080199168', '1346358560427216896', '1350106119681622016', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007709080199169', '1346358560427216896', '1350107709494804480', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007709084393472', '1346358560427216896', '1350107842236137472', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007709084393473', '1346358560427216896', '1350112406754766848', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007709088587776', '1346358560427216896', '1350112481253994496', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1351007709088587777', '1346358560427216896', '1350804501819195392', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1355167519859040256', '1346358560427216896', '1355163372527050752', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1355167519859040257', '1346358560427216896', '1355165158419750912', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1355167519859040258', '1346358560427216896', '1355165353534578688', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1355167519859040259', '1346358560427216896', '1355165475785957376', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1355167519859040260', '1346358560427216896', '1355165608565039104', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1357956838021890049', '1346358560427216896', '1357956838021890048', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1357977745893326848', '1346358560427216896', '1357977745889132544', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1357977912126177281', '1346358560427216896', '1357977912126177280', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1357977971827900417', '1346358560427216896', '1357977971827900416', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1386680049203195905', '1346358560427216896', '1386680049203195904', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `permission` VALUES ('1529402639305326592', '1346358560427216896', '1529402639271772160', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326593', '1346358560427216896', '1529402639284355072', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326594', '1346358560427216896', '1529402639284355073', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326595', '1346358560427216896', '1529402639284355074', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326596', '1346358560427216896', '1529402639284355075', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326597', '1346358560427216896', '1529402639284355076', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326598', '1346358560427216896', '1529402639284355077', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326599', '1346358560427216896', '1529402639284355078', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326600', '1346358560427216896', '1529402639284355079', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326601', '1346358560427216896', '1529402639284355080', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326602', '1346358560427216896', '1529402639284355081', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326603', '1346358560427216896', '1529402639284355082', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326604', '1346358560427216896', '1529402639284355083', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326605', '1346358560427216896', '1529402639284355084', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326606', '1346358560427216896', '1529402639284355085', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326607', '1346358560427216896', '1529402639284355086', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326608', '1346358560427216896', '1529402639284355087', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326609', '1346358560427216896', '1529402639284355088', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326610', '1346358560427216896', '1529402639284355089', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326611', '1346358560427216896', '1529402639284355090', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326612', '1346358560427216896', '1529402639284355091', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326613', '1346358560427216896', '1529402639284355092', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326614', '1346358560427216896', '1529402639284355093', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326615', '1346358560427216896', '1529402639284355094', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326616', '1346358560427216896', '1529402639284355095', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326617', '1346358560427216896', '1529402639284355096', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326618', '1346358560427216896', '1529402639284355097', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326619', '1346358560427216896', '1529402639284355098', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639305326620', '1346358560427216896', '1529402639284355099', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435663', '1346358560427216896', '1529402639368241152', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435664', '1346358560427216896', '1529402639368241153', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435665', '1346358560427216896', '1529402639368241154', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435666', '1346358560427216896', '1529402639368241155', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435667', '1346358560427216896', '1529402639368241156', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435668', '1346358560427216896', '1529402639368241157', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435669', '1346358560427216896', '1529402639368241158', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435670', '1346358560427216896', '1529402639368241159', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435671', '1346358560427216896', '1529402639368241160', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435672', '1346358560427216896', '1529402639368241161', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435673', '1346358560427216896', '1529402639368241162', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435674', '1346358560427216896', '1529402639368241163', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435675', '1346358560427216896', '1529402639368241164', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435676', '1346358560427216896', '1529402639368241165', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435677', '1346358560427216896', '1529402639368241166', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435678', '1346358560427216896', '1529402639368241167', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435679', '1346358560427216896', '1529402639368241168', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435680', '1346358560427216896', '1529402639368241169', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435681', '1346358560427216896', '1529402639368241170', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435682', '1346358560427216896', '1529402639368241171', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435683', '1346358560427216896', '1529402639368241172', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435684', '1346358560427216896', '1529402639368241173', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435685', '1346358560427216896', '1529402639368241174', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435686', '1346358560427216896', '1529402639368241175', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435687', '1346358560427216896', '1529402639368241176', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435688', '1346358560427216896', '1529402639368241177', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435689', '1346358560427216896', '1529402639368241178', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435690', '1346358560427216896', '1529402639368241179', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435691', '1346358560427216896', '1529402639368241180', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435692', '1346358560427216896', '1529402639368241181', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435693', '1346358560427216896', '1529402639368241182', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435694', '1346358560427216896', '1529402639368241183', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435695', '1346358560427216896', '1529402639368241184', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435696', '1346358560427216896', '1529402639368241185', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435697', '1346358560427216896', '1529402639368241186', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435698', '1346358560427216896', '1529402639368241187', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435699', '1346358560427216896', '1529402639368241188', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435700', '1346358560427216896', '1529402639368241189', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435701', '1346358560427216896', '1529402639368241190', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435702', '1346358560427216896', '1529402639368241191', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435703', '1346358560427216896', '1529402639368241192', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435704', '1346358560427216896', '1529402639368241193', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435705', '1346358560427216896', '1529402639368241194', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435706', '1346358560427216896', '1529402639368241195', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435707', '1346358560427216896', '1529402639368241196', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435708', '1346358560427216896', '1529402639368241197', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435709', '1346358560427216896', '1529402639368241198', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435710', '1346358560427216896', '1529402639368241199', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435711', '1346358560427216896', '1529402639368241200', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435712', '1346358560427216896', '1529402639368241201', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435713', '1346358560427216896', '1529402639368241202', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435714', '1346358560427216896', '1529402639368241203', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435715', '1346358560427216896', '1529402639368241204', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435716', '1346358560427216896', '1529402639368241205', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435717', '1346358560427216896', '1529402639372435456', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435718', '1346358560427216896', '1529402639372435457', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435719', '1346358560427216896', '1529402639372435458', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435720', '1346358560427216896', '1529402639372435459', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435721', '1346358560427216896', '1529402639372435460', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435722', '1346358560427216896', '1529402639372435461', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435723', '1346358560427216896', '1529402639372435462', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435724', '1346358560427216896', '1529402639372435463', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435725', '1346358560427216896', '1529402639372435464', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435726', '1346358560427216896', '1529402639372435465', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435727', '1346358560427216896', '1529402639372435466', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435728', '1346358560427216896', '1529402639372435467', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435729', '1346358560427216896', '1529402639372435468', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435730', '1346358560427216896', '1529402639372435469', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435731', '1346358560427216896', '1529402639372435470', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435732', '1346358560427216896', '1529402639372435471', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435733', '1346358560427216896', '1529402639372435472', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435734', '1346358560427216896', '1529402639372435473', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435735', '1346358560427216896', '1529402639372435474', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435736', '1346358560427216896', '1529402639372435475', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435737', '1346358560427216896', '1529402639372435476', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435738', '1346358560427216896', '1529402639372435477', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435739', '1346358560427216896', '1529402639372435478', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435740', '1346358560427216896', '1529402639372435479', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435741', '1346358560427216896', '1529402639372435480', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435742', '1346358560427216896', '1529402639372435481', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435743', '1346358560427216896', '1529402639372435482', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435744', '1346358560427216896', '1529402639372435483', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435745', '1346358560427216896', '1529402639372435484', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435746', '1346358560427216896', '1529402639372435485', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435747', '1346358560427216896', '1529402639372435486', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435748', '1346358560427216896', '1529402639372435487', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435749', '1346358560427216896', '1529402639372435488', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435750', '1346358560427216896', '1529402639372435489', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435751', '1346358560427216896', '1529402639372435490', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435752', '1346358560427216896', '1529402639372435491', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435753', '1346358560427216896', '1529402639372435492', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435754', '1346358560427216896', '1529402639372435493', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435755', '1346358560427216896', '1529402639372435494', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435756', '1346358560427216896', '1529402639372435495', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435757', '1346358560427216896', '1529402639372435496', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435758', '1346358560427216896', '1529402639372435497', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435759', '1346358560427216896', '1529402639372435498', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435760', '1346358560427216896', '1529402639372435499', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435761', '1346358560427216896', '1529402639372435500', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435762', '1346358560427216896', '1529402639372435501', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435763', '1346358560427216896', '1529402639372435502', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435764', '1346358560427216896', '1529402639372435503', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435765', '1346358560427216896', '1529402639372435504', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435766', '1346358560427216896', '1529402639372435505', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435767', '1346358560427216896', '1529402639372435506', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435768', '1346358560427216896', '1529402639372435507', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435769', '1346358560427216896', '1529402639372435508', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435770', '1346358560427216896', '1529402639372435509', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435771', '1346358560427216896', '1529402639372435510', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435772', '1346358560427216896', '1529402639372435511', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435773', '1346358560427216896', '1529402639372435512', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435774', '1346358560427216896', '1529402639372435513', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435775', '1346358560427216896', '1529402639372435514', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435776', '1346358560427216896', '1529402639372435515', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435777', '1346358560427216896', '1529402639372435516', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435778', '1346358560427216896', '1529402639372435517', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435779', '1346358560427216896', '1529402639372435518', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435780', '1346358560427216896', '1529402639372435519', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435781', '1346358560427216896', '1529402639372435520', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435782', '1346358560427216896', '1529402639372435521', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435783', '1346358560427216896', '1529402639372435522', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435784', '1346358560427216896', '1529402639372435523', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435785', '1346358560427216896', '1529402639372435524', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639372435786', '1346358560427216896', '1529402639372435525', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629760', '1346358560427216896', '1529402639372435526', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629761', '1346358560427216896', '1529402639372435527', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629762', '1346358560427216896', '1529402639372435528', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629763', '1346358560427216896', '1529402639372435529', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629764', '1346358560427216896', '1529402639372435530', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629765', '1346358560427216896', '1529402639372435531', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629766', '1346358560427216896', '1529402639372435532', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629767', '1346358560427216896', '1529402639372435533', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629768', '1346358560427216896', '1529402639372435534', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629769', '1346358560427216896', '1529402639372435535', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629770', '1346358560427216896', '1529402639372435536', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629771', '1346358560427216896', '1529402639372435537', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629772', '1346358560427216896', '1529402639372435538', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629773', '1346358560427216896', '1529402639372435539', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629774', '1346358560427216896', '1529402639372435540', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629775', '1346358560427216896', '1529402639372435541', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629776', '1346358560427216896', '1529402639372435542', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629777', '1346358560427216896', '1529402639372435543', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629778', '1346358560427216896', '1529402639372435544', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629779', '1346358560427216896', '1529402639372435545', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629780', '1346358560427216896', '1529402639372435546', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629781', '1346358560427216896', '1529402639372435547', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629782', '1346358560427216896', '1529402639372435548', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629783', '1346358560427216896', '1529402639372435549', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629784', '1346358560427216896', '1529402639372435550', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629785', '1346358560427216896', '1529402639372435551', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629786', '1346358560427216896', '1529402639372435552', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629787', '1346358560427216896', '1529402639372435553', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629788', '1346358560427216896', '1529402639372435554', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629789', '1346358560427216896', '1529402639372435555', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629790', '1346358560427216896', '1529402639372435556', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629791', '1346358560427216896', '1529402639372435557', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629792', '1346358560427216896', '1529402639372435558', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629793', '1346358560427216896', '1529402639372435559', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629794', '1346358560427216896', '1529402639372435560', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629795', '1346358560427216896', '1529402639372435561', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629796', '1346358560427216896', '1529402639372435562', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629797', '1346358560427216896', '1529402639372435563', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629798', '1346358560427216896', '1529402639372435564', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629799', '1346358560427216896', '1529402639372435565', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629800', '1346358560427216896', '1529402639372435566', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629801', '1346358560427216896', '1529402639372435567', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629802', '1346358560427216896', '1529402639372435568', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629803', '1346358560427216896', '1529402639372435569', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629804', '1346358560427216896', '1529402639372435570', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629805', '1346358560427216896', '1529402639372435571', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629806', '1346358560427216896', '1529402639372435572', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629807', '1346358560427216896', '1529402639372435573', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629808', '1346358560427216896', '1529402639372435574', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629809', '1346358560427216896', '1529402639372435575', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629810', '1346358560427216896', '1529402639372435576', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629811', '1346358560427216896', '1529402639372435577', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629812', '1346358560427216896', '1529402639372435578', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629813', '1346358560427216896', '1529402639372435579', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629814', '1346358560427216896', '1529402639372435580', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629815', '1346358560427216896', '1529402639372435581', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629816', '1346358560427216896', '1529402639372435582', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629817', '1346358560427216896', '1529402639372435583', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629818', '1346358560427216896', '1529402639372435584', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629819', '1346358560427216896', '1529402639372435585', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629820', '1346358560427216896', '1529402639372435586', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629821', '1346358560427216896', '1529402639372435587', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629822', '1346358560427216896', '1529402639372435588', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629823', '1346358560427216896', '1529402639372435589', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629824', '1346358560427216896', '1529402639372435590', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629825', '1346358560427216896', '1529402639372435591', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629826', '1346358560427216896', '1529402639372435592', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629827', '1346358560427216896', '1529402639372435593', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629828', '1346358560427216896', '1529402639372435594', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629829', '1346358560427216896', '1529402639372435595', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629830', '1346358560427216896', '1529402639372435596', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629831', '1346358560427216896', '1529402639372435597', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629832', '1346358560427216896', '1529402639372435598', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629833', '1346358560427216896', '1529402639372435599', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629834', '1346358560427216896', '1529402639372435600', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629835', '1346358560427216896', '1529402639372435601', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629836', '1346358560427216896', '1529402639372435602', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629837', '1346358560427216896', '1529402639372435603', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629838', '1346358560427216896', '1529402639372435604', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629839', '1346358560427216896', '1529402639372435605', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629840', '1346358560427216896', '1529402639372435606', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629841', '1346358560427216896', '1529402639372435607', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629842', '1346358560427216896', '1529402639372435608', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629843', '1346358560427216896', '1529402639372435609', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629844', '1346358560427216896', '1529402639372435610', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629845', '1346358560427216896', '1529402639372435611', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629846', '1346358560427216896', '1529402639372435612', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629847', '1346358560427216896', '1529402639372435613', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629848', '1346358560427216896', '1529402639372435614', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629849', '1346358560427216896', '1529402639372435615', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629850', '1346358560427216896', '1529402639372435616', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629851', '1346358560427216896', '1529402639372435617', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629852', '1346358560427216896', '1529402639372435618', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629853', '1346358560427216896', '1529402639372435619', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629854', '1346358560427216896', '1529402639372435620', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629855', '1346358560427216896', '1529402639372435621', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629856', '1346358560427216896', '1529402639372435622', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629857', '1346358560427216896', '1529402639372435623', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629858', '1346358560427216896', '1529402639372435624', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629859', '1346358560427216896', '1529402639372435625', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629860', '1346358560427216896', '1529402639372435626', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629861', '1346358560427216896', '1529402639372435627', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629862', '1346358560427216896', '1529402639372435628', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629863', '1346358560427216896', '1529402639372435629', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629864', '1346358560427216896', '1529402639372435630', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629865', '1346358560427216896', '1529402639372435631', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629866', '1346358560427216896', '1529402639372435632', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629867', '1346358560427216896', '1529402639372435633', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629868', '1346358560427216896', '1529402639372435634', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629869', '1346358560427216896', '1529402639372435635', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629870', '1346358560427216896', '1529402639372435636', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629871', '1346358560427216896', '1529402639372435637', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629872', '1346358560427216896', '1529402639372435638', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629873', '1346358560427216896', '1529402639372435639', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629874', '1346358560427216896', '1529402639372435640', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629875', '1346358560427216896', '1529402639372435641', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629876', '1346358560427216896', '1529402639372435642', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629877', '1346358560427216896', '1529402639372435643', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629878', '1346358560427216896', '1529402639372435644', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629879', '1346358560427216896', '1529402639372435645', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629880', '1346358560427216896', '1529402639372435646', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629881', '1346358560427216896', '1529402639372435647', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629882', '1346358560427216896', '1529402639372435648', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629883', '1346358560427216896', '1529402639372435649', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629884', '1346358560427216896', '1529402639372435650', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629885', '1346358560427216896', '1529402639372435651', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629886', '1346358560427216896', '1529402639372435652', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629887', '1346358560427216896', '1529402639372435653', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629888', '1346358560427216896', '1529402639372435654', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629889', '1346358560427216896', '1529402639372435655', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629890', '1346358560427216896', '1529402639372435656', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629891', '1346358560427216896', '1529402639372435657', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629892', '1346358560427216896', '1529402639372435658', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629893', '1346358560427216896', '1529402639372435659', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629894', '1346358560427216896', '1529402639372435660', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629895', '1346358560427216896', '1529402639372435661', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1529402639376629896', '1346358560427216896', '1529402639372435662', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534577122279825408', '1346358560427216896', '1534577121923309568', '2022-06-09 00:44:32.000', '2022-06-09 00:44:31.000');
INSERT INTO `permission` VALUES ('1534585430587875328', '1346358560427216896', '1534585430311051264', '2022-06-09 01:17:33.000', '2022-06-09 01:17:32.000');
INSERT INTO `permission` VALUES ('1534585531389583360', '1346358560427216896', '1534585531108564992', '2022-06-09 01:17:57.000', '2022-06-09 01:17:56.000');
INSERT INTO `permission` VALUES ('1534585531389583361', '1346358560427216896', '1534585531108564993', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583362', '1346358560427216896', '1534585531108564994', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583363', '1346358560427216896', '1534585531108564995', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583364', '1346358560427216896', '1534585531108564996', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583365', '1346358560427216896', '1534585531108564997', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583366', '1346358560427216896', '1534585531108564998', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583367', '1346358560427216896', '1534585531108564999', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583368', '1346358560427216896', '1534585531108565000', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583369', '1346358560427216896', '1534585531108565001', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583370', '1346358560427216896', '1534585531108565002', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583371', '1346358560427216896', '1534585531108565003', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583372', '1346358560427216896', '1534585531108565004', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583373', '1346358560427216896', '1534585531108565005', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583374', '1346358560427216896', '1534585531108565006', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583375', '1346358560427216896', '1534585531108565007', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583376', '1346358560427216896', '1534585531108565008', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583377', '1346358560427216896', '1534585531108565009', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583378', '1346358560427216896', '1534585531108565010', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583379', '1346358560427216896', '1534585531108565011', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583380', '1346358560427216896', '1534585531108565012', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583381', '1346358560427216896', '1534585531108565013', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583382', '1346358560427216896', '1534585531108565014', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583383', '1346358560427216896', '1534585531108565015', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583384', '1346358560427216896', '1534585531108565016', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583385', '1346358560427216896', '1534585531108565017', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583386', '1346358560427216896', '1534585531108565018', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583387', '1346358560427216896', '1534585531108565019', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583388', '1346358560427216896', '1534585531108565020', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583389', '1346358560427216896', '1534585531108565021', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583390', '1346358560427216896', '1534585531108565022', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583391', '1346358560427216896', '1534585531108565023', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583392', '1346358560427216896', '1534585531108565024', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583393', '1346358560427216896', '1534585531108565025', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583394', '1346358560427216896', '1534585531108565026', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583395', '1346358560427216896', '1534585531108565027', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583396', '1346358560427216896', '1534585531108565028', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583397', '1346358560427216896', '1534585531108565029', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583398', '1346358560427216896', '1534585531108565030', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583399', '1346358560427216896', '1534585531108565031', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583400', '1346358560427216896', '1534585531108565032', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583401', '1346358560427216896', '1534585531108565033', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583402', '1346358560427216896', '1534585531108565034', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583403', '1346358560427216896', '1534585531108565035', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583404', '1346358560427216896', '1534585531108565036', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583405', '1346358560427216896', '1534585531108565037', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583406', '1346358560427216896', '1534585531108565038', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583407', '1346358560427216896', '1534585531108565039', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583408', '1346358560427216896', '1534585531108565040', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583409', '1346358560427216896', '1534585531108565041', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583410', '1346358560427216896', '1534585531108565042', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583411', '1346358560427216896', '1534585531108565043', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583412', '1346358560427216896', '1534585531108565044', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583413', '1346358560427216896', '1534585531108565045', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583414', '1346358560427216896', '1534585531108565046', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583415', '1346358560427216896', '1534585531108565047', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583416', '1346358560427216896', '1534585531108565048', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583417', '1346358560427216896', '1534585531108565049', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583418', '1346358560427216896', '1534585531108565050', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583419', '1346358560427216896', '1534585531108565051', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1534585531389583420', '1346358560427216896', '1534585531108565052', '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `permission` VALUES ('1572525965658820608', '1346358560427216896', '1572525965625266176', '2022-09-28 11:50:58.000', '2022-09-28 11:50:58.000');

-- ----------------------------
-- Table structure for plugin
-- ----------------------------
DROP TABLE IF EXISTS `plugin`;
CREATE TABLE `plugin`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `name` varchar(62) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'plugin name',
  `config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'plugin configuration',
  `role` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'plug-in role',
  `sort` int NULL DEFAULT NULL COMMENT 'sort',
  `enabled` tinyint NOT NULL DEFAULT 0 COMMENT 'whether to open (0, not open, 1 open)',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  `plugin_jar` mediumblob NULL COMMENT 'plugin jar',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of plugin
-- ----------------------------
INSERT INTO `plugin` VALUES ('1', 'sign', NULL, 'Authentication', 20, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('10', 'sentinel', NULL, 'FaultTolerance', 140, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('11', 'sofa', '{\"protocol\":\"zookeeper\",\"register\":\"127.0.0.1:2181\",\"threadpool\":\"shared\"}', 'Proxy', 310, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('12', 'resilience4j', NULL, 'FaultTolerance', 310, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('13', 'tars', '{\"multiSelectorHandle\":\"1\",\"multiRuleHandle\":\"0\",\"threadpool\":\"shared\"}', 'Proxy', 310, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('14', 'contextPath', NULL, 'HttpProcess', 80, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('15', 'grpc', '{\"multiSelectorHandle\":\"1\",\"multiRuleHandle\":\"0\",\"threadpool\":\"shared\"}', 'Proxy', 310, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('16', 'redirect', NULL, 'HttpProcess', 110, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('17', 'motan', '{\"register\":\"127.0.0.1:2181\",\"corethreads\":0,\"threads\":2147483647,\"queues\":0,\"threadpool\":\"shared\"}', 'Proxy', 310, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('18', 'loggingConsole', NULL, 'Logging', 160, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('19', 'jwt', '{\"secretKey\":\"key\"}', 'Authentication', 30, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('2', 'waf', '{\"model\":\"black\"}', 'Authentication', 50, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('20', 'request', NULL, 'HttpProcess', 120, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('21', 'oauth2', NULL, 'Authentication', 40, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('22', 'paramMapping', '{\"ruleHandlePageType\":\"custom\"}', 'HttpProcess', 70, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('23', 'modifyResponse', '{\"ruleHandlePageType\":\"custom\"}', 'HttpProcess', 220, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('24', 'cryptorRequest', NULL, 'Cryptor', 100, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('25', 'cryptorResponse', NULL, 'Cryptor', 410, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('26', 'websocket', '{\"multiSelectorHandle\":\"1\"}', 'Proxy', 200, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('27', 'generalContext', NULL, 'Common', 125, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('28', 'mqtt', '{\"port\": 9500,\"bossGroupThreadCount\": 1,\"maxPayloadSize\": 65536,\"workerGroupThreadCount\": 12,\"userName\": \"shenyu\",\"password\": \"shenyu\",\"isEncryptPassword\": false,\"encryptMode\": \"\",\"leakDetectorLevel\": \"DISABLED\"}', 'Proxy', 125, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('29', 'loggingRocketMQ', '{\"topic\":\"shenyu-access-logging\", \"namesrvAddr\": \"localhost:9876\",\"producerGroup\":\"shenyu-plugin-logging-rocketmq\"}', 'Logging', 170, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('3', 'rewrite', NULL, 'HttpProcess', 90, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('30', 'cache', '{\"cacheType\":\"memory\"}', 'Cache', 10, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('31', 'mock', NULL, 'Mock', 1, 0, '2022-06-16 14:40:35.000', '2022-06-16 14:40:55.000', NULL);
INSERT INTO `plugin` VALUES ('32', 'loggingElasticSearch', '{\"host\":\"localhost\", \"port\": \"9200\"}', 'Logging', 190, 0, '2022-06-19 22:00:00.000', '2022-06-19 22:00:00.000', NULL);
INSERT INTO `plugin` VALUES ('33', 'loggingKafka', '{\"host\":\"localhost\", \"port\": \"9092\"}', 'Logging', 180, 0, '2022-07-04 22:00:00.000', '2022-07-02 22:00:00.000', NULL);
INSERT INTO `plugin` VALUES ('34', 'loggingAliyunSls', '{\"projectName\": \"shenyu\", \"logStoreName\": \"shenyu-logstore\", \"topic\": \"shenyu-topic\"}', 'Logging', 175, 0, '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000', NULL);
INSERT INTO `plugin` VALUES ('35', 'loggingPulsar', '{\"topic\":\"shenyu-access-logging\", \"serviceUrl\": \"pulsar://localhost:6650\"}', 'Logging', 185, 0, '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000', NULL);
INSERT INTO `plugin` VALUES ('36', 'loggingTencentCls', '{\"endpoint\": \"ap-guangzhou.cls.tencentcs.com\", \"topic\": \"shenyu-topic\"}', 'Logging', 176, 0, '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000', NULL);
INSERT INTO `plugin` VALUES ('38', 'loggingClickHouse', '{\"host\":\"127.0.0.1\",\"port\":\"8123\",\"databse\":\"shenyu-gateway\",\"username\":\"foo\",\"password\":\"bar\"}', 'Logging', 195, 0, '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000', NULL);
INSERT INTO `plugin` VALUES ('39', 'casdoor', '{\"endpoint\":\"http://localhost:8000\"}', 'Authentication', 40, 0, '2022-09-11 12:00:00.000', '2022-09-11 12:00:00.000', NULL);
INSERT INTO `plugin` VALUES ('4', 'rateLimiter', '{\"master\":\"mymaster\",\"mode\":\"standalone\",\"url\":\"192.168.1.1:6379\",\"password\":\"abc\"}', 'FaultTolerance', 60, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('40', 'keyAuth', NULL, 'Authentication', 150, 0, '2022-07-24 19:00:00.000', '2022-07-24 19:00:00.000', NULL);
INSERT INTO `plugin` VALUES ('41', 'brpc', '{\"address\":\"127.0.0.1\", \"port\":\"8005\", \"corethreads\":0, \"threads\":2147483647, \"queues\":0, \"threadpool\":\"shared\"}', 'Proxy', 310, 0, '2023-01-10 10:08:01.000', '2023-01-10 10:08:01.000', NULL);
INSERT INTO `plugin` VALUES ('5', 'divide', '{\"multiSelectorHandle\":\"1\",\"multiRuleHandle\":\"0\"}', 'Proxy', 200, 1, '2022-05-25 18:02:53.000', '2023-05-06 21:46:34.522', NULL);
INSERT INTO `plugin` VALUES ('6', 'dubbo', '{\"register\":\"zookeeper://localhost:2181\",\"multiSelectorHandle\":\"1\",\"threadpool\":\"shared\",\"corethreads\":0,\"threads\":2147483647,\"queues\":0}', 'Proxy', 310, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('8', 'springCloud', NULL, 'Proxy', 200, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);
INSERT INTO `plugin` VALUES ('9', 'hystrix', NULL, 'FaultTolerance', 130, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000', NULL);

-- ----------------------------
-- Table structure for plugin_handle
-- ----------------------------
DROP TABLE IF EXISTS `plugin_handle`;
CREATE TABLE `plugin_handle`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `plugin_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'plugin id',
  `field` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'field',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'label',
  `data_type` smallint NOT NULL DEFAULT 1 COMMENT 'data type 1 number 2 string',
  `type` smallint NULL DEFAULT NULL COMMENT 'type, 1 means selector, 2 means rule, 3 means plugin',
  `sort` int NULL DEFAULT NULL COMMENT 'sort',
  `ext_obj` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'extra configuration (json format data)',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `plugin_id_field_type`(`plugin_id`, `field`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of plugin_handle
-- ----------------------------
INSERT INTO `plugin_handle` VALUES ('1529402613195784246', '10', 'flowRuleGrade', 'flowRuleGrade', 3, 2, 8, '{\"required\":\"1\",\"defaultValue\":\"1\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978496', '10', 'flowRuleControlBehavior', 'flowRuleControlBehavior', 3, 2, 5, '{\"required\":\"1\",\"defaultValue\":\"0\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978497', '10', 'flowRuleEnable', 'flowRuleEnable 1 or 0)', 1, 2, 7, '{\"required\":\"1\",\"defaultValue\":\"1\",\"rule\":\"/^[01]$/\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978498', '10', 'flowRuleCount', 'flowRuleCount', 1, 2, 6, '{\"required\":\"1\",\"defaultValue\":\"0\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978499', '10', 'degradeRuleEnable', 'degradeRuleEnable 1 or 0)', 1, 2, 2, '{\"required\":\"1\",\"defaultValue\":\"1\",\"rule\":\"/^[01]$/\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978500', '10', 'degradeRuleGrade', 'degradeRuleGrade', 3, 2, 3, '{\"required\":\"1\",\"defaultValue\":\"0\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978501', '10', 'degradeRuleCount', 'degradeRuleCount', 1, 2, 1, '{\"required\":\"1\",\"defaultValue\":\"0\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978502', '10', 'degradeRuleTimeWindow', 'degradeRuleTimeWindow', 1, 2, 4, '{\"required\":\"1\",\"defaultValue\":\"0\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978503', '10', 'degradeRuleMinRequestAmount', 'degradeRuleMinRequestAmount', 1, 2, 3, '{\"required\":\"1\",\"defaultValue\":\"5\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978504', '10', 'degradeRuleStatIntervals', 'degradeRuleStatIntervals', 1, 2, 3, '{\"required\":\"1\",\"defaultValue\":\"1\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978505', '10', 'degradeRuleSlowRatioThreshold', 'degradeRuleSlowRatioThreshold', 1, 2, 3, '{\"required\":\"1\",\"defaultValue\":\"0.5\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978506', '10', 'fallbackUri', 'fallbackUri', 2, 2, 9, '{\"required\":\"0\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978507', '2', 'permission', 'permission', 3, 2, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978508', '2', 'statusCode', 'statusCode', 2, 2, 2, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978509', '4', 'replenishRate', 'replenishRate', 2, 2, 2, '{\"required\":\"1\",\"defaultValue\":\"10\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978510', '4', 'burstCapacity', 'burstCapacity', 2, 2, 3, '{\"required\":\"1\",\"defaultValue\":\"100\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978511', '3', 'regex', 'regex', 2, 2, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978512', '3', 'replace', 'replace', 2, 2, 2, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978513', '16', 'redirectURI', 'redirectURI', 2, 2, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978514', '8', 'path', 'path', 2, 2, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978515', '8', 'timeout', 'timeout ms)', 1, 2, 2, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978516', '8', 'serviceId', 'serviceId', 2, 1, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978517', '12', 'timeoutDurationRate', 'timeoutDurationRate ms)', 1, 2, 1, '{\"required\":\"1\",\"defaultValue\":\"5000\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978518', '12', 'limitRefreshPeriod', 'limitRefreshPeriod ms)', 1, 2, 0, '{\"required\":\"1\",\"defaultValue\":\"500\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978519', '12', 'limitForPeriod', 'limitForPeriod', 1, 2, 0, '{\"required\":\"1\",\"defaultValue\":\"50\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978520', '12', 'circuitEnable', 'circuitEnable', 1, 2, 2, '{\"required\":\"1\",\"defaultValue\":\"0\",\"rule\":\"/^[01]$/\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978521', '12', 'timeoutDuration', 'timeoutDuration ms)', 1, 2, 2, '{\"required\":\"1\",\"defaultValue\":\"30000\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978522', '12', 'fallbackUri', 'fallbackUri', 2, 2, 2, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978523', '12', 'slidingWindowSize', 'slidingWindowSize', 1, 2, 2, '{\"required\":\"1\",\"defaultValue\":\"100\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978524', '12', 'slidingWindowType', 'slidingWindowType', 1, 2, 2, '{\"required\":\"1\",\"defaultValue\":\"0\",\"rule\":\"/^[01]$/\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978525', '12', 'minimumNumberOfCalls', 'minimumNumberOfCalls', 1, 2, 2, '{\"required\":\"1\",\"defaultValue\":\"100\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978526', '12', 'waitIntervalFunctionInOpenState', 'waitIntervalInOpen', 1, 2, 2, '{\"required\":\"1\",\"defaultValue\":\"60000\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978527', '12', 'permittedNumberOfCallsInHalfOpenState', 'bufferSizeInHalfOpen', 1, 2, 2, '{\"required\":\"1\",\"defaultValue\":\"10\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978528', '12', 'failureRateThreshold', 'failureRateThreshold', 1, 2, 2, '{\"required\":\"1\",\"defaultValue\":\"50\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978529', '12', 'automaticTransitionFromOpenToHalfOpenEnabled', 'automaticHalfOpen', 3, 2, 1, '{\"required\":\"1\",\"defaultValue\":\"true\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978530', '4', 'mode', 'mode', 3, 3, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978531', '4', 'master', 'master', 2, 3, 2, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978532', '4', 'url', 'url', 2, 3, 3, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978533', '4', 'password', 'password', 2, 3, 4, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978534', '11', 'protocol', 'protocol', 2, 3, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978535', '11', 'register', 'register', 2, 3, 2, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978536', '2', 'model', 'model', 2, 3, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978537', '6', 'register', 'register', 2, 3, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978538', '4', 'algorithmName', 'algorithmName', 3, 2, 1, '{\"required\":\"1\",\"defaultValue\":\"slidingWindow\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978539', '4', 'keyResolverName', 'keyResolverName', 3, 2, 4, '{\"required\":\"1\",\"defaultValue\":\"WHOLE_KEY_RESOLVER\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978540', '5', 'upstreamHost', 'host', 2, 1, 0, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978541', '5', 'protocol', 'protocol', 2, 1, 2, '{\"required\":\"0\",\"defaultValue\":\"\",\"placeholder\":\"http://\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978542', '5', 'upstreamUrl', 'ip:port', 2, 1, 1, '{\"required\":\"1\",\"placeholder\":\"\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978543', '5', 'weight', 'weight', 1, 1, 3, '{\"defaultValue\":\"50\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978544', '5', 'timestamp', 'startupTime', 1, 1, 3, '{\"defaultValue\":\"0\",\"placeholder\":\"startup timestamp\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978545', '5', 'warmup', 'warmupTime', 1, 1, 5, '{\"defaultValue\":\"0\",\"placeholder\":\"warmup time ms)\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978546', '5', 'status', 'status', 3, 1, 6, '{\"defaultValue\":\"true\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978547', '5', 'loadBalance', 'loadStrategy', 3, 2, 0, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978548', '5', 'retry', 'retryCount', 1, 2, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978549', '5', 'timeout', 'timeout', 1, 2, 2, '{\"defaultValue\":\"3000\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978550', '5', 'multiSelectorHandle', 'multiSelectorHandle', 3, 3, 0, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978551', '5', 'multiRuleHandle', 'multiRuleHandle', 3, 3, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978552', '5', 'headerMaxSize', 'headerMaxSize', 1, 2, 3, '{\"defaultValue\":\"10240\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978553', '5', 'requestMaxSize', 'requestMaxSize', 1, 2, 4, '{\"defaultValue\":\"102400\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978554', '5', 'retryStrategy', 'retryStrategy', 3, 2, 0, '{\"required\":\"0\",\"defaultValue\":\"current\",\"placeholder\":\"retryStrategy\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978555', '13', 'upstreamHost', 'host', 2, 1, 0, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978556', '13', 'protocol', 'protocol', 2, 1, 2, '{\"defaultValue\":\"\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978557', '13', 'upstreamUrl', 'ip:port', 2, 1, 1, '{\"required\":\"1\",\"placeholder\":\"\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978558', '13', 'weight', 'weight', 1, 1, 3, '{\"defaultValue\":\"50\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978559', '13', 'timestamp', 'startupTime', 1, 1, 3, '{\"defaultValue\":\"0\",\"placeholder\":\"startup timestamp\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978560', '13', 'warmup', 'warmupTime', 1, 1, 5, '{\"defaultValue\":\"0\",\"placeholder\":\"warmup time ms)\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978561', '13', 'status', 'status', 3, 1, 6, '{\"defaultValue\":\"true\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978562', '13', 'loadBalance', 'loadStrategy', 3, 2, 0, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978563', '13', 'retry', 'retryCount', 1, 2, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978564', '13', 'timeout', 'timeout', 1, 2, 2, '{\"defaultValue\":\"3000\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978565', '13', 'multiSelectorHandle', 'multiSelectorHandle', 3, 3, 0, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978566', '13', 'multiRuleHandle', 'multiRuleHandle', 3, 3, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978567', '15', 'upstreamUrl', 'ip:port', 2, 1, 1, '{\"required\":\"1\",\"placeholder\":\"\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978568', '15', 'weight', 'weight', 1, 1, 3, '{\"defaultValue\":\"50\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978569', '15', 'status', 'status', 3, 1, 6, '{\"defaultValue\":\"true\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978570', '15', 'multiSelectorHandle', 'multiSelectorHandle', 3, 3, 0, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978571', '15', 'multiRuleHandle', 'multiRuleHandle', 3, 3, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978572', '15', 'threadpool', 'threadpool', 3, 3, 0, '{\"required\":\"0\",\"defaultValue\":\"cached\",\"placeholder\":\"threadpool\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978573', '14', 'contextPath', 'contextPath', 2, 2, 0, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978574', '14', 'addPrefix', 'addPrefix', 2, 2, 0, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978575', '20', 'ruleHandlePageType', 'ruleHandlePageType', 3, 3, 0, '{\"required\":\"0\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978576', '19', 'secretKey', 'secretKey', 2, 3, 0, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978577', '24', 'strategyName', 'strategyName', 3, 2, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978578', '24', 'fieldNames', 'fieldNames', 2, 2, 3, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613199978579', '24', 'decryptKey', 'decryptKey', 2, 2, 3, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172742', '8', 'loadBalance', 'loadStrategy', 3, 2, 3, '{\"defaultValue\":\"roundRobin\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172743', '10', 'flowRuleMaxQueueingTimeMs', 'flowRuleMaxQueueingTimeMs', 1, 2, 6, '{\"required\":\"0\",\"defaultValue\":\"500\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172744', '10', 'flowRuleWarmUpPeriodSec', 'flowRuleWarmUpPeriodSec', 1, 2, 6, '{\"required\":\"0\",\"defaultValue\":\"10\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172745', '14', 'addPrefixed', 'addPrefixed', 3, 2, 3, '{\"required\":\"1\",\"defaultValue\":\"false\"}', '2022-09-27 12:00:00.000', '2022-09-27 12:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172746', '18', 'keyword', 'keyword', 2, 2, 0, '{\"required\":\"0\",\"placeholder\":\"please use ‘;’ to split keyword\",\"rule\":\"\"}', '2022-09-22 00:15:56.158', '2022-09-22 00:23:36.169');
INSERT INTO `plugin_handle` VALUES ('1529402613204172747', '18', 'maskType', 'maskType', 3, 2, 1, '{\"required\":\"0\",\"defaultValue\":\"dataMaskByMD5\",\"rule\":\"\"}', '2022-09-22 00:16:27.342', '2022-09-22 00:16:27.342');
INSERT INTO `plugin_handle` VALUES ('1529402613204172748', '18', 'maskStatus', 'maskStatus', 3, 2, 2, '{\"required\":\"0\",\"defaultValue\":\"false\",\"rule\":\"\"}', '2022-09-22 00:17:21.150', '2022-09-22 00:17:21.150');
INSERT INTO `plugin_handle` VALUES ('1529402613204172749', '29', 'keyword', 'keyword', 2, 2, 0, '{\"required\":\"0\",\"placeholder\":\"please use ‘;’ to split keyword\",\"rule\":\"\"}', '2022-09-22 00:15:56.158', '2022-09-22 00:23:36.169');
INSERT INTO `plugin_handle` VALUES ('1529402613204172750', '29', 'maskType', 'maskType', 3, 2, 1, '{\"required\":\"0\",\"defaultValue\":\"dataMaskByMD5\",\"rule\":\"\"}', '2022-09-22 00:16:27.342', '2022-09-22 00:16:27.342');
INSERT INTO `plugin_handle` VALUES ('1529402613204172751', '29', 'maskStatus', 'maskStatus', 3, 2, 2, '{\"required\":\"0\",\"defaultValue\":\"false\",\"rule\":\"\"}', '2022-09-22 00:17:21.150', '2022-09-22 00:17:21.150');
INSERT INTO `plugin_handle` VALUES ('1529402613204172752', '32', 'keyword', 'keyword', 2, 2, 0, '{\"required\":\"0\",\"placeholder\":\"please use ‘;’ to split keyword\",\"rule\":\"\"}', '2022-09-22 00:15:56.158', '2022-09-22 00:23:36.169');
INSERT INTO `plugin_handle` VALUES ('1529402613204172753', '32', 'maskType', 'maskType', 3, 2, 1, '{\"required\":\"0\",\"defaultValue\":\"dataMaskByMD5\",\"rule\":\"\"}', '2022-09-22 00:16:27.342', '2022-09-22 00:16:27.342');
INSERT INTO `plugin_handle` VALUES ('1529402613204172754', '32', 'maskStatus', 'maskStatus', 3, 2, 2, '{\"required\":\"0\",\"defaultValue\":\"false\",\"rule\":\"\"}', '2022-09-22 00:17:21.150', '2022-09-22 00:17:21.150');
INSERT INTO `plugin_handle` VALUES ('1529402613204172755', '33', 'keyword', 'keyword', 2, 2, 0, '{\"required\":\"0\",\"placeholder\":\"please use ‘;’ to split keyword\",\"rule\":\"\"}', '2022-09-22 00:15:56.158', '2022-09-22 00:23:36.169');
INSERT INTO `plugin_handle` VALUES ('1529402613204172756', '33', 'maskType', 'maskType', 3, 2, 1, '{\"required\":\"0\",\"defaultValue\":\"dataMaskByMD5\",\"rule\":\"\"}', '2022-09-22 00:16:27.342', '2022-09-22 00:16:27.342');
INSERT INTO `plugin_handle` VALUES ('1529402613204172757', '33', 'maskStatus', 'maskStatus', 3, 2, 2, '{\"required\":\"0\",\"defaultValue\":\"false\",\"rule\":\"\"}', '2022-09-22 00:17:21.150', '2022-09-22 00:17:21.150');
INSERT INTO `plugin_handle` VALUES ('1529402613204172758', '34', 'keyword', 'keyword', 2, 2, 0, '{\"required\":\"0\",\"placeholder\":\"please use ‘;’ to split keyword\",\"rule\":\"\"}', '2022-09-22 00:15:56.158', '2022-09-22 00:23:36.169');
INSERT INTO `plugin_handle` VALUES ('1529402613204172759', '34', 'maskType', 'maskType', 3, 2, 1, '{\"required\":\"0\",\"defaultValue\":\"dataMaskByMD5\",\"rule\":\"\"}', '2022-09-22 00:16:27.342', '2022-09-22 00:16:27.342');
INSERT INTO `plugin_handle` VALUES ('1529402613204172760', '34', 'maskStatus', 'maskStatus', 3, 2, 2, '{\"required\":\"0\",\"defaultValue\":\"false\",\"rule\":\"\"}', '2022-09-22 00:17:21.150', '2022-09-22 00:17:21.150');
INSERT INTO `plugin_handle` VALUES ('1529402613204172761', '35', 'keyword', 'keyword', 2, 2, 0, '{\"required\":\"0\",\"placeholder\":\"please use ‘;’ to split keyword\",\"rule\":\"\"}', '2022-09-22 00:15:56.158', '2022-09-22 00:23:36.169');
INSERT INTO `plugin_handle` VALUES ('1529402613204172762', '35', 'maskType', 'maskType', 3, 2, 1, '{\"required\":\"0\",\"defaultValue\":\"dataMaskByMD5\",\"rule\":\"\"}', '2022-09-22 00:16:27.342', '2022-09-22 00:16:27.342');
INSERT INTO `plugin_handle` VALUES ('1529402613204172763', '35', 'maskStatus', 'maskStatus', 3, 2, 2, '{\"required\":\"0\",\"defaultValue\":\"false\",\"rule\":\"\"}', '2022-09-22 00:17:21.150', '2022-09-22 00:17:21.150');
INSERT INTO `plugin_handle` VALUES ('1529402613204172764', '36', 'keyword', 'keyword', 2, 2, 0, '{\"required\":\"0\",\"placeholder\":\"please use ‘;’ to split keyword\",\"rule\":\"\"}', '2022-09-22 00:15:56.158', '2022-09-22 00:23:36.169');
INSERT INTO `plugin_handle` VALUES ('1529402613204172765', '36', 'maskType', 'maskType', 3, 2, 1, '{\"required\":\"0\",\"defaultValue\":\"dataMaskByMD5\",\"rule\":\"\"}', '2022-09-22 00:16:27.342', '2022-09-22 00:16:27.342');
INSERT INTO `plugin_handle` VALUES ('1529402613204172766', '36', 'maskStatus', 'maskStatus', 3, 2, 2, '{\"required\":\"0\",\"defaultValue\":\"false\",\"rule\":\"\"}', '2022-09-22 00:17:21.150', '2022-09-22 00:17:21.150');
INSERT INTO `plugin_handle` VALUES ('1529402613204172767', '38', 'keyword', 'keyword', 2, 2, 0, '{\"required\":\"0\",\"placeholder\":\"please use ‘;’ to split keyword\",\"rule\":\"\"}', '2022-09-22 00:15:56.158', '2022-09-22 00:23:36.169');
INSERT INTO `plugin_handle` VALUES ('1529402613204172768', '38', 'maskType', 'maskType', 3, 2, 1, '{\"required\":\"0\",\"defaultValue\":\"dataMaskByMD5\",\"rule\":\"\"}', '2022-09-22 00:16:27.342', '2022-09-22 00:16:27.342');
INSERT INTO `plugin_handle` VALUES ('1529402613204172769', '38', 'maskStatus', 'maskStatus', 3, 2, 2, '{\"required\":\"0\",\"defaultValue\":\"false\",\"rule\":\"\"}', '2022-09-22 00:17:21.150', '2022-09-22 00:17:21.150');
INSERT INTO `plugin_handle` VALUES ('1529402613204172770', '38', 'host', 'host', 2, 3, 3, '{\"required\":\"1\",\"defaultValue\":\"127.0.0.1\",\"rule\":\"\"}', '2022-12-30 00:17:21.150', '2022-12-30 00:17:21.150');
INSERT INTO `plugin_handle` VALUES ('1529402613204172771', '38', 'port', 'port', 2, 3, 4, '{\"required\":\"1\",\"defaultValue\":\"8123\",\"rule\":\"\"}', '2022-12-30 00:17:21.150', '2022-12-30 00:17:21.150');
INSERT INTO `plugin_handle` VALUES ('1529402613204172772', '38', 'database', 'database', 2, 3, 5, '{\"required\":\"0\",\"defaultValue\":\"shenyu-gateway\",\"rule\":\"\"}', '2022-12-30 00:17:21.150', '2022-12-30 00:17:21.150');
INSERT INTO `plugin_handle` VALUES ('1529402613204172773', '38', 'username', 'username', 2, 3, 6, '{\"required\":\"0\",\"defaultValue\":\"\",\"rule\":\"\"}', '2022-12-30 00:17:21.150', '2022-12-30 00:17:21.150');
INSERT INTO `plugin_handle` VALUES ('1529402613204172774', '38', 'password', 'password', 2, 3, 7, '{\"required\":\"0\",\"defaultValue\":\"\",\"rule\":\"\"}', '2022-12-30 00:17:21.150', '2022-12-30 00:17:21.150');
INSERT INTO `plugin_handle` VALUES ('1529402613204172775', '38', 'engine', 'engine', 3, 3, 8, '{\"required\":\"0\",\"defaultValue\":\"MergeTree\",\"rule\":\"\"}', '2022-12-30 00:17:21.150', '2022-12-30 00:17:21.150');
INSERT INTO `plugin_handle` VALUES ('1529402613204172776', '38', 'clusterName', 'clusterName', 3, 3, 9, '{\"required\":\"1\",\"defaultValue\":\"cluster\",\"rule\":\"\"}', '2022-12-30 00:17:21.150', '2022-12-30 00:17:21.150');
INSERT INTO `plugin_handle` VALUES ('1529402613204172800', '24', 'encryptKey', 'encryptKey', 2, 2, 3, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172801', '24', 'way', 'way', 3, 2, 3, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172802', '25', 'strategyName', 'strategyName', 3, 2, 2, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172803', '25', 'decryptKey', 'decryptKey', 2, 2, 3, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172804', '25', 'encryptKey', 'encryptKey', 2, 2, 3, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172805', '25', 'fieldNames', 'fieldNames', 2, 2, 4, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172806', '25', 'way', 'way', 3, 2, 3, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172807', '6', 'gray', 'gray', 3, 1, 9, '{\"required\":\"0\",\"defaultValue\":\"false\",\"placeholder\":\"gray\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172808', '6', 'group', 'group', 2, 1, 3, '{\"required\":\"0\",\"placeholder\":\"group\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172809', '6', 'loadbalance', 'loadbalance', 3, 2, 0, '{\"required\":\"0\",\"placeholder\":\"loadbalance\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172810', '6', 'multiSelectorHandle', 'multiSelectorHandle', 3, 3, 0, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172811', '6', 'protocol', 'protocol', 2, 1, 2, '{\"required\":\"0\",\"defaultValue\":\"\",\"placeholder\":\"http://\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172812', '6', 'status', 'status', 3, 1, 8, '{\"defaultValue\":\"true\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172813', '6', 'timestamp', 'startupTime', 1, 1, 7, '{\"defaultValue\":\"0\",\"placeholder\":\"startup timestamp\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172814', '6', 'upstreamHost', 'host', 2, 1, 0, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172815', '6', 'upstreamUrl', 'ip:port', 2, 1, 1, '{\"required\":\"1\",\"placeholder\":\"\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172816', '6', 'version', 'version', 2, 1, 4, '{\"required\":\"0\",\"placeholder\":\"version\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172817', '6', 'warmup', 'warmupTime', 1, 1, 6, '{\"defaultValue\":\"0\",\"placeholder\":\"warmup time ms)\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172818', '6', 'weight', 'weight', 1, 1, 5, '{\"defaultValue\":\"50\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172819', '6', 'threadpool', 'threadpool', 3, 3, 0, '{\"required\":\"0\",\"defaultValue\":\"cached\",\"placeholder\":\"threadpool\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172820', '6', 'corethreads', 'corethreads', 1, 3, 0, '{\"required\":\"0\",\"defaultValue\":\"0\",\"placeholder\":\"corethreads\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172821', '6', 'threads', 'threads', 1, 3, 0, '{\"required\":\"0\",\"defaultValue\":\"2147483647\",\"placeholder\":\"threads\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172822', '6', 'queues', 'queues', 1, 3, 0, '{\"required\":\"0\",\"defaultValue\":\"0\",\"placeholder\":\"queues\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172823', '26', 'host', 'host', 2, 1, 0, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172824', '26', 'protocol', 'protocol', 2, 1, 2, '{\"required\":\"0\",\"defaultValue\":\"\",\"placeholder\":\"ws://\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172825', '26', 'url', 'ip:port', 2, 1, 1, '{\"required\":\"1\",\"placeholder\":\"\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172826', '26', 'weight', 'weight', 1, 1, 3, '{\"defaultValue\":\"50\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172827', '26', 'timestamp', 'startupTime', 1, 1, 3, '{\"defaultValue\":\"0\",\"placeholder\":\"startup timestamp\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172828', '26', 'warmup', 'warmupTime', 1, 1, 5, '{\"defaultValue\":\"0\",\"placeholder\":\"warmup time ms)\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172829', '26', 'status', 'status', 3, 1, 6, '{\"defaultValue\":\"true\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172830', '26', 'loadBalance', 'loadStrategy', 3, 2, 0, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172831', '26', 'retry', 'retryCount', 1, 2, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172832', '26', 'timeout', 'timeout', 1, 2, 2, '{\"defaultValue\":\"3000\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172833', '26', 'multiSelectorHandle', 'multiSelectorHandle', 3, 3, 0, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172834', '17', 'register', 'register', 2, 3, 0, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172835', '17', 'corethreads', 'corethreads', 1, 3, 0, '{\"required\":\"0\",\"defaultValue\":\"0\",\"placeholder\":\"corethreads\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172836', '17', 'threads', 'threads', 1, 3, 0, '{\"required\":\"0\",\"defaultValue\":\"2147483647\",\"placeholder\":\"threads\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172837', '17', 'queues', 'queues', 1, 3, 0, '{\"required\":\"0\",\"defaultValue\":\"0\",\"placeholder\":\"queues\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172838', '17', 'threadpool', 'threadpool', 3, 3, 0, '{\"required\":\"0\",\"defaultValue\":\"cached\",\"placeholder\":\"threadpool\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172839', '28', 'port', 'port', 1, 3, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172840', '28', 'bossGroupThreadCount', 'bossGroupThreadCount', 1, 3, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172841', '28', 'maxPayloadSize', 'maxPayloadSize', 1, 3, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172842', '28', 'workerGroupThreadCount', 'workerGroupThreadCount', 1, 3, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172843', '28', 'userName', 'userName', 2, 3, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172844', '28', 'password', 'password', 2, 3, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172845', '28', 'isEncryptPassword', 'isEncryptPassword', 2, 3, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172846', '28', 'encryptMode', 'encryptMode', 2, 3, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172847', '28', 'leakDetectorLevel', 'leakDetectorLevel', 2, 3, 1, NULL, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172848', '29', 'topic', 'topic', 2, 3, 1, '{\"required\":\"1\",\"defaultValue\":\"shenyu-access-logging\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172849', '29', 'namesrvAddr', 'namesrvAddr', 2, 3, 2, '{\"required\":\"1\",\"defaultValue\":\"localhost:9876\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172850', '29', 'producerGroup', 'producerGroup', 2, 3, 3, '{\"required\":\"1\",\"defaultValue\":\"shenyu-plugin-logging-rocketmq\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172851', '29', 'accessKey', 'accessKey', 2, 3, 4, '{\"required\":\"0\",\"defaultValue\":\"\"}', '2022-08-20 22:00:00.000', '2022-08-20 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172852', '29', 'secretKey', 'secretKey', 2, 3, 5, '{\"required\":\"0\",\"defaultValue\":\"\"}', '2022-08-20 22:00:00.000', '2022-08-20 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172853', '29', 'sampleRate', 'sampleRate', 2, 3, 6, '{\"required\":\"0\",\"defaultValue\":\"1\",\"placeholder\":\"optional,0,0.01~1\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172854', '29', 'maxResponseBody', 'maxResponseBody', 1, 3, 7, '{\"required\":\"0\",\"defaultValue\":524288}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172855', '29', 'maxRequestBody', 'maxRequestBody', 1, 3, 8, '{\"required\":\"0\",\"defaultValue\":524288}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172856', '29', 'compressAlg', 'compressAlg', 3, 3, 9, '{\"required\":\"0\",\"defaultValue\":\"none\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172857', '29', 'topic', 'topic', 2, 1, 1, '{\"required\":\"0\",\"defaultValue\":\"\",\"placeholder\":\"optional\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172858', '29', 'sampleRate', 'sampleRate', 2, 1, 2, '{\"required\":\"0\",\"defaultValue\":\"\",\"placeholder\":\"optional,0,0.01~1\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172859', '30', 'cacheType', 'cacheType', 3, 3, 1, '{\"required\":\"1\",\"defaultValue\":\"memory\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172860', '30', 'database', 'database', 1, 3, 2, '{\"required\":\"0\",\"defaultValue\":\"0\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172861', '30', 'master', 'master', 2, 3, 3, '{\"required\":\"0\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172862', '30', 'mode', 'mode', 2, 3, 4, '{\"required\":\"0\",\"defaultValue\":\"standalone\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172863', '30', 'url', 'url', 2, 3, 5, '{\"required\":\"0\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172864', '30', 'password', 'password', 2, 3, 6, '{\"required\":\"0\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172865', '30', 'maxIdle', 'maxIdle', 1, 3, 7, '{\"required\":\"0\",\"defaultValue\":\"8\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172866', '30', 'minIdle', 'minIdle', 1, 3, 8, '{\"required\":\"0\",\"defaultValue\":\"0\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172867', '30', 'maxActive', 'maxActive', 1, 3, 9, '{\"required\":\"0\",\"defaultValue\":\"8\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172868', '30', 'maxWait', 'maxWait', 3, 3, 10, '{\"required\":\"0\",\"defaultValue\":\"-1\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172869', '30', 'timeoutSeconds', 'timeoutSeconds', 1, 2, 0, '{\"required\":\"0\",\"defaultValue\":\"60\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172870', '13', 'corethreads', 'corethreads', 1, 3, 3, '{\"required\":\"0\",\"defaultValue\":\"0\",\"placeholder\":\"corethreads\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172871', '13', 'threads', 'threads', 1, 3, 4, '{\"required\":\"0\",\"defaultValue\":\"2147483647\",\"placeholder\":\"threads\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172872', '13', 'queues', 'queues', 1, 3, 5, '{\"required\":\"0\",\"defaultValue\":\"0\",\"placeholder\":\"queues\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172873', '13', 'threadpool', 'threadpool', 3, 3, 2, '{\"required\":\"0\",\"defaultValue\":\"default\",\"placeholder\":\"threadpool\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172874', '11', 'corethreads', 'corethreads', 1, 3, 4, '{\"required\":\"0\",\"defaultValue\":\"0\",\"placeholder\":\"corethreads\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172875', '11', 'threads', 'threads', 1, 3, 5, '{\"required\":\"0\",\"defaultValue\":\"2147483647\",\"placeholder\":\"threads\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172876', '11', 'queues', 'queues', 1, 3, 6, '{\"required\":\"0\",\"defaultValue\":\"0\",\"placeholder\":\"queues\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172877', '11', 'threadpool', 'threadpool', 3, 3, 3, '{\"required\":\"0\",\"defaultValue\":\"default\",\"placeholder\":\"threadpool\",\"rule\":\"\"}', '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172878', '31', 'responseContent', 'responseContent', 2, 2, 0, '{\"required\":\"0\",\"rule\":\"\"}', '2022-06-16 14:47:37.000', '2022-06-16 14:50:39.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172879', '31', 'httpStatusCode', 'httpStatusCode', 1, 2, 0, '{\"required\":\"0\",\"defaultValue\":\"200\",\"rule\":\"\"}', '2022-06-16 14:47:09.000', '2022-06-16 14:50:39.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172880', '32', 'host', 'host', 2, 3, 1, '{\"required\":\"1\",\"defaultValue\":\"localhost\"}', '2022-06-19 22:00:00.000', '2022-06-19 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172881', '32', 'port', 'port', 2, 3, 2, '{\"required\":\"1\",\"defaultValue\":\"9200\"}', '2022-06-19 22:00:00.000', '2022-06-19 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172882', '32', 'username', 'username', 2, 3, 3, '{\"required\":\"0\",\"defaultValue\":\"\"}', '2022-08-20 22:00:00.000', '2022-08-20 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172883', '32', 'password', 'password', 2, 3, 4, '{\"required\":\"0\",\"defaultValue\":\"\"}', '2022-08-20 22:00:00.000', '2022-08-20 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172884', '32', 'authCache', 'authCache', 2, 3, 5, '{\"required\":\"0\",\"defaultValue\":\"\",\"placeholder\":\"true|false\"}', '2022-08-20 22:00:00.000', '2022-08-20 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172885', '32', 'sampleRate', 'sampleRate', 2, 3, 6, '{\"required\":\"0\",\"defaultValue\":\"1\",\"placeholder\":\"optional,0,0.01~1\"}', '2022-06-19 22:00:00.000', '2022-06-19 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172886', '32', 'maxResponseBody', 'maxResponseBody', 1, 3, 7, '{\"required\":\"0\",\"defaultValue\":524288}', '2022-06-19 22:00:00.000', '2022-06-19 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172887', '32', 'maxRequestBody', 'maxRequestBody', 1, 3, 8, '{\"required\":\"0\",\"defaultValue\":524288}', '2022-06-19 22:00:00.000', '2022-06-19 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172888', '32', 'compressAlg', 'compressAlg', 3, 3, 9, '{\"required\":\"0\",\"defaultValue\":\"none\"}', '2022-06-19 22:00:00.000', '2022-06-19 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172889', '32', 'index', 'index', 2, 1, 1, '{\"required\":\"0\",\"defaultValue\":\"\",\"placeholder\":\"optional\"}', '2022-06-19 22:00:00.000', '2022-06-19 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172890', '32', 'sampleRate', 'sampleRate', 2, 1, 2, '{\"required\":\"0\",\"defaultValue\":\"\",\"placeholder\":\"optional,0,0.01~1\"}', '2022-06-19 22:00:00.000', '2022-06-19 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172891', '1', 'signRequestBody', 'signRequestBody', 3, 2, 9, '{\"required\":\"0\",\"defaultValue\":\"false\",\"placeholder\":\"signRequestBody\",\"rule\":\"\"}', '2022-06-29 10:08:02.000', '2022-06-29 10:08:02.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172892', '33', 'topic', 'topic', 2, 3, 1, '{\"required\":\"1\",\"defaultValue\":\"shenyu-access-logging\"}', '2022-07-04 22:00:00.000', '2022-07-04 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172893', '33', 'namesrvAddr', 'namesrvAddr', 2, 3, 2, '{\"required\":\"1\",\"defaultValue\":\"localhost:9092\"}', '2022-07-04 22:00:00.000', '2022-07-04 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172894', '33', 'sampleRate', 'sampleRate', 2, 3, 4, '{\"required\":\"0\",\"defaultValue\":\"1\",\"placeholder\":\"optional,0,0.01~1\"}', '2022-07-04 22:00:00.000', '2022-07-04 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172895', '33', 'maxResponseBody', 'maxResponseBody', 1, 3, 5, '{\"required\":\"0\",\"defaultValue\":524288}', '2022-07-04 22:00:00.000', '2022-07-04 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172896', '33', 'maxRequestBody', 'maxRequestBody', 1, 3, 6, '{\"required\":\"0\",\"defaultValue\":524288}', '2022-07-04 22:00:00.000', '2022-07-04 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172897', '33', 'compressAlg', 'compressAlg', 3, 3, 7, '{\"required\":\"0\",\"defaultValue\":\"none\"}', '2022-07-04 22:00:00.000', '2022-07-04 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172898', '33', 'securityProtocol', 'securityProtocol', 3, 3, 8, '{\"required\":\"0\",\"defaultValue\":\"\"}', '2022-09-01 22:00:00.000', '2022-09-01 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172899', '33', 'saslMechanism', 'saslMechanism', 3, 3, 9, '{\"required\":\"0\",\"defaultValue\":\"\"}', '2022-07-04 22:00:00.000', '2022-09-01 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172900', '33', 'userName', 'userName', 2, 3, 10, '{\"required\":\"0\",\"defaultValue\":\"\"}', '2022-09-01 22:00:00.000', '2022-09-01 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172901', '33', 'passWord', 'passWord', 2, 3, 11, '{\"required\":\"0\",\"defaultValue\":\"\"}', '2022-09-01 22:00:00.000', '2022-09-01 22:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172902', '34', 'accessId', 'accessId', 2, 3, 0, '{\"required\":\"1\",\"defaultValue\":\"\",\"placeholder\":\"\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172903', '34', 'accessKey', 'accessKey', 2, 3, 1, '{\"required\":\"1\",\"defaultValue\":\"\",\"placeholder\":\"\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172904', '34', 'host', 'host', 2, 3, 2, '{\"required\":\"1\",\"defaultValue\":\"\",\"placeholder\":\"\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172905', '34', 'projectName', 'projectName', 2, 3, 3, '{\"required\":\"0\",\"defaultValue\":\"shenyu\",\"placeholder\":\"\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172906', '34', 'logStoreName', 'logStoreName', 2, 3, 4, '{\"required\":\"0\",\"defaultValue\":\"shenyu-logstore\",\"placeholder\":\"\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172907', '34', 'topic', 'topic', 2, 3, 5, '{\"required\":\"0\",\"defaultValue\":\"shenyu-topic\",\"placeholder\":\"\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172908', '34', 'ttlInDay', 'ttlInDay', 1, 3, 6, '{\"required\":\"0\",\"defaultValue\":3,\"placeholder\":\"\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172909', '34', 'shardCount', 'shardCount', 1, 3, 7, '{\"required\":\"0\",\"defaultValue\":10,\"placeholder\":\"\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172910', '34', 'sendThreadCount', 'sendThreadCount', 1, 3, 8, '{\"required\":\"0\",\"defaultValue\":1,\"placeholder\":\"1-500\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172911', '34', 'ioThreadCount', 'ioThreadCount', 1, 3, 9, '{\"required\":\"0\",\"defaultValue\":1,\"placeholder\":\"1-500\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172912', '34', 'sampleRate', 'sampleRate', 2, 3, 10, '{\"required\":\"0\",\"defaultValue\":\"1\",\"placeholder\":\"optional,0,0.01~1\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172913', '34', 'maxRequestBody', 'maxRequestBody', 1, 3, 11, '{\"required\":\"0\",\"defaultValue\":524288}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172914', '34', 'maxResponseBody', 'maxResponseBody', 1, 3, 12, '{\"required\":\"0\",\"defaultValue\":524288}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172915', '34', 'bufferQueueSize', 'bufferQueueSize', 1, 3, 13, '{\"required\":\"0\",\"defaultValue\":50000}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172916', '35', 'topic', 'topic', 2, 3, 1, '{\"required\":\"1\",\"defaultValue\":\"shenyu-access-logging\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172917', '35', 'serviceUrl', 'serviceUrl', 2, 3, 2, '{\"required\":\"1\",\"defaultValue\":\"pulsar://localhost:6650\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172918', '35', 'sampleRate', 'sampleRate', 2, 3, 4, '{\"required\":\"0\",\"defaultValue\":\"1\",\"placeholder\":\"optional,0,0.01~1\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172919', '35', 'maxResponseBody', 'maxResponseBody', 1, 3, 5, '{\"required\":\"0\",\"defaultValue\":524288}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172920', '35', 'maxRequestBody', 'maxRequestBody', 1, 3, 6, '{\"required\":\"0\",\"defaultValue\":524288}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172921', '35', 'compressAlg', 'compressAlg', 3, 3, 7, '{\"required\":\"0\",\"defaultValue\":\"none\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172922', '36', 'secretId', 'secretId', 2, 3, 1, '{\"required\":\"1\",\"defaultValue\":\"\",\"placeholder\":\"\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172923', '36', 'secretKey', 'secretKey', 2, 3, 2, '{\"required\":\"1\",\"defaultValue\":\"\",\"placeholder\":\"\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172924', '36', 'endpoint', 'endpoint', 2, 3, 3, '{\"required\":\"1\",\"defaultValue\":\"\",\"placeholder\":\"\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172925', '36', 'topic', 'topic', 2, 3, 4, '{\"required\":\"1\",\"defaultValue\":\"\",\"placeholder\":\"\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172926', '36', 'sendThreadCount', 'sendThreadCount', 1, 3, 5, '{\"required\":\"0\",\"defaultValue\":1,\"placeholder\":\"1-500\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172927', '36', 'totalSizeInBytes', 'totalSizeInBytes', 1, 3, 6, '{\"required\":\"0\",\"defaultValue\":104857600}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172928', '36', 'maxSendThreadCount', 'maxSendThreadCount', 1, 3, 7, '{\"required\":\"0\",\"defaultValue\":1,\"placeholder\":\"availableProcessors + 1\"}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172929', '36', 'maxBlockSec', 'maxBlockSec', 1, 3, 8, '{\"required\":\"0\",\"defaultValue\":60000}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172930', '36', 'maxBatchSize', 'maxBatchSize', 1, 3, 9, '{\"required\":\"0\",\"defaultValue\":524288}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172931', '36', 'maxBatchCount', 'maxBatchCount', 1, 3, 10, '{\"required\":\"0\",\"defaultValue\":4096}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172932', '36', 'lingerMs', 'lingerMs', 1, 3, 11, '{\"required\":\"0\",\"defaultValue\":2000}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172933', '36', 'retries', 'retries', 1, 3, 12, '{\"required\":\"0\",\"defaultValue\":10}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172934', '36', 'maxReservedAttempts', 'maxReservedAttempts', 1, 3, 13, '{\"required\":\"0\",\"defaultValue\":11}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172935', '36', 'baseRetryBackoffMs', 'baseRetryBackoffMs', 1, 3, 14, '{\"required\":\"0\",\"defaultValue\":100}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172936', '36', 'maxRetryBackoffMs', 'maxRetryBackoffMs', 1, 3, 15, '{\"required\":\"0\",\"defaultValue\":50000}', '2022-06-30 21:00:00.000', '2022-06-30 21:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1529402613204172957', '41', 'address', 'address', 2, 3, 0, '{\"required\":\"1\",\"defaultValue\":\"127.0.0.1\",\"placeholder\":\"address\",\"rule\":\"\"}', '2023-01-10 10:08:01.158', '2023-01-10 10:08:01.158');
INSERT INTO `plugin_handle` VALUES ('1529402613204172958', '41', 'port', 'port', 2, 3, 0, '{\"required\":\"1\",\"defaultValue\":\"8005\",\"placeholder\":\"port\",\"rule\":\"\"}', '2023-01-10 10:08:01.158', '2023-01-10 10:08:01.158');
INSERT INTO `plugin_handle` VALUES ('1529402613204172959', '41', 'corethreads', 'corethreads', 1, 3, 0, '{\"required\":\"0\",\"defaultValue\":\"0\",\"placeholder\":\"corethreads\",\"rule\":\"\"}', '2023-01-10 10:08:01.158', '2023-01-10 10:08:01.158');
INSERT INTO `plugin_handle` VALUES ('1529402613204172960', '41', 'threads', 'threads', 1, 3, 0, '{\"required\":\"0\",\"defaultValue\":\"2147483647\",\"placeholder\":\"threads\",\"rule\":\"\"}', '2023-01-10 10:08:01.158', '2023-01-10 10:08:01.158');
INSERT INTO `plugin_handle` VALUES ('1529402613204172961', '41', 'queues', 'queues', 1, 3, 0, '{\"required\":\"0\",\"defaultValue\":\"0\",\"placeholder\":\"queues\",\"rule\":\"\"}', '2023-01-10 10:08:01.158', '2023-01-10 10:08:01.158');
INSERT INTO `plugin_handle` VALUES ('1529402613204172962', '41', 'threadpool', 'threadpool', 3, 3, 0, '{\"required\":\"0\",\"defaultValue\":\"shared\",\"placeholder\":\"threadpool\",\"rule\":\"\"}', '2023-01-10 10:08:01.158', '2023-01-10 10:08:01.158');
INSERT INTO `plugin_handle` VALUES ('1570590990341775360', '39', 'endpoint', 'casdoor endpoint', 2, 3, 0, '{\"required\":\"1\",\"rule\":\"\"}', '2022-09-27 12:00:00.000', '2022-09-27 12:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1570591047635968000', '39', 'client_id', 'client_id', 2, 3, 0, '{\"required\":\"1\",\"rule\":\"\"}', '2022-09-27 12:00:00.000', '2022-09-27 12:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1570591109623586816', '39', 'client_secrect', 'client_secrect', 2, 3, 0, '{\"required\":\"1\",\"rule\":\"\"}', '2022-09-27 12:00:00.000', '2022-09-27 12:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1570591165374275584', '39', 'certificate', 'certificate', 2, 3, 0, '{\"required\":\"1\",\"rule\":\"\"}', '2022-09-27 12:00:00.000', '2022-09-27 12:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1570591215131303936', '39', 'organization-name', 'organization-name', 2, 3, 0, '{\"required\":\"1\",\"rule\":\"\"}', '2022-09-27 12:00:00.000', '2022-09-27 12:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1570591265492312064', '39', 'application-name', 'application-name', 2, 3, 0, '{\"required\":\"1\",\"rule\":\"\"}', '2022-09-27 12:00:00.000', '2022-09-27 12:00:00.000');
INSERT INTO `plugin_handle` VALUES ('1630760188111376384', '24', 'mapType', 'mapType', 3, 2, 3, '{\"required\":\"0\",\"defaultValue\":\"all\",\"rule\":\"\"}', '2023-03-01 10:41:41.000', '2023-03-01 10:42:21.000');
INSERT INTO `plugin_handle` VALUES ('1630768384280514560', '25', 'mapType', 'mapType', 3, 2, 4, '{\"required\":\"0\",\"defaultValue\":\"all\",\"rule\":\"\"}', '2023-03-01 11:14:15.000', '2023-03-01 11:15:14.000');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `parent_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'resource parent primary key id',
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'title',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'route name',
  `url` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'route url',
  `component` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'component',
  `resource_type` int NOT NULL COMMENT 'resource type eg 0:main menu 1:child menu 2:function button',
  `sort` int NOT NULL COMMENT 'sort',
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'icon',
  `is_leaf` tinyint(1) NOT NULL COMMENT 'leaf node 0:no 1:yes',
  `is_route` int NOT NULL COMMENT 'route 1:yes 0:no',
  `perms` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'button permission description sys:user:add(add)/sys:user:edit(edit)',
  `status` int NOT NULL COMMENT 'status 1:enable 0:disable',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'resource table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1346775491550474240', '', 'SHENYU.MENU.PLUGIN.LIST', 'plug', '/plug', 'PluginList', 0, 0, 'dashboard', 0, 0, '', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1346776175553376256', '', 'SHENYU.MENU.SYSTEM.MANAGMENT', 'system', '/system', 'system', 0, 2, 'setting', 0, 0, '', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1346777157943259136', '1346776175553376256', 'SHENYU.MENU.SYSTEM.MANAGMENT.USER', 'manage', '/system/manage', 'manage', 1, 1, 'user', 0, 0, '', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1346777449787125760', '1357956838021890048', 'SHENYU.MENU.SYSTEM.MANAGMENT.PLUGIN', 'plugin', '/config/plugin', 'plugin', 1, 2, 'book', 0, 0, '', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1346777623011880960', '1357956838021890048', 'SHENYU.PLUGIN.PLUGINHANDLE', 'pluginhandle', '/config/pluginhandle', 'pluginhandle', 1, 3, 'down-square', 0, 0, '', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1346777766301888512', '1357956838021890048', 'SHENYU.MENU.SYSTEM.MANAGMENT.AUTHEN', 'auth', '/config/auth', 'auth', 1, 4, 'audit', 0, 0, '', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1346777907096285184', '1357956838021890048', 'SHENYU.MENU.SYSTEM.MANAGMENT.METADATA', 'metadata', '/config/metadata', 'metadata', 1, 5, 'snippets', 0, 0, '', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1346778036402483200', '1357956838021890048', 'SHENYU.MENU.SYSTEM.MANAGMENT.DICTIONARY', 'dict', '/config/dict', 'dict', 1, 6, 'ordered-list', 0, 0, '', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347032308726902784', '1346777157943259136', 'SHENYU.BUTTON.SYSTEM.ADD', '', '', '', 2, 0, '', 1, 0, 'system:manager:add', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347032395901317120', '1346777157943259136', 'SHENYU.BUTTON.SYSTEM.LIST', '', '', '', 2, 1, '', 1, 0, 'system:manager:list', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347032453707214848', '1346777157943259136', 'SHENYU.BUTTON.SYSTEM.DELETE', '', '', '', 2, 2, '', 1, 0, 'system:manager:delete', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347032509051056128', '1346777157943259136', 'SHENYU.BUTTON.SYSTEM.EDIT', '', '', '', 2, 3, '', 1, 0, 'system:manager:edit', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347034027070337024', '1346777449787125760', 'SHENYU.BUTTON.SYSTEM.LIST', '', '', '', 2, 0, '', 1, 0, 'system:plugin:list', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347039054925148160', '1346777449787125760', 'SHENYU.BUTTON.SYSTEM.DELETE', '', '', '', 2, 1, '', 1, 0, 'system:plugin:delete', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347041326749691904', '1346777449787125760', 'SHENYU.BUTTON.SYSTEM.ADD', '', '', '', 2, 2, '', 1, 0, 'system:plugin:add', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347046566244003840', '1346777449787125760', 'SHENYU.BUTTON.SYSTEM.SYNCHRONIZE', '', '', '', 2, 3, '', 1, 0, 'system:plugin:modify', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347047143350874112', '1346777449787125760', 'SHENYU.BUTTON.SYSTEM.ENABLE', '', '', '', 2, 4, '', 1, 0, 'system:plugin:disable', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347047203220369408', '1346777449787125760', 'SHENYU.BUTTON.SYSTEM.EDIT', '', '', '', 2, 5, '', 1, 0, 'system:plugin:edit', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347047555588042752', '1346777623011880960', 'SHENYU.BUTTON.SYSTEM.LIST', '', '', '', 2, 0, '', 1, 0, 'system:pluginHandler:list', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347047640145211392', '1346777623011880960', 'SHENYU.BUTTON.SYSTEM.DELETE', '', '', '', 2, 1, '', 1, 0, 'system:pluginHandler:delete', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347047695002513408', '1346777623011880960', 'SHENYU.BUTTON.SYSTEM.ADD', '', '', '', 2, 2, '', 1, 0, 'system:pluginHandler:add', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347047747305484288', '1346777623011880960', 'SHENYU.BUTTON.SYSTEM.EDIT', '', '', '', 2, 3, '', 1, 0, 'system:pluginHandler:edit', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347048004105940992', '1346777766301888512', 'SHENYU.BUTTON.SYSTEM.LIST', '', '', '', 2, 0, '', 1, 0, 'system:authen:list', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347048101875167232', '1346777766301888512', 'SHENYU.BUTTON.SYSTEM.DELETE', '', '', '', 2, 1, '', 1, 0, 'system:authen:delete', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347048145877610496', '1346777766301888512', 'SHENYU.BUTTON.SYSTEM.ADD', '', '', '', 2, 2, '', 1, 0, 'system:authen:add', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347048240677269504', '1346777766301888512', 'SHENYU.BUTTON.SYSTEM.ENABLE', '', '', '', 2, 3, '', 1, 0, 'system:authen:disable', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347048316216684544', '1346777766301888512', 'SHENYU.BUTTON.SYSTEM.SYNCHRONIZE', '', '', '', 2, 4, '', 1, 0, 'system:authen:modify', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347048776029843456', '1346777766301888512', 'SHENYU.BUTTON.SYSTEM.EDIT', '', '', '', 2, 5, '', 1, 0, 'system:authen:edit', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347048968414179328', '1346777907096285184', 'SHENYU.BUTTON.SYSTEM.LIST', '', '', '', 2, 0, '', 1, 0, 'system:meta:list', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347049029323862016', '1346777907096285184', 'SHENYU.BUTTON.SYSTEM.DELETE', '', '', '', 2, 1, '', 1, 0, 'system:meta:delete', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347049092552994816', '1346777907096285184', 'SHENYU.BUTTON.SYSTEM.ADD', '', '', '', 2, 2, '', 1, 0, 'system:meta:add', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347049251395481600', '1346777907096285184', 'SHENYU.BUTTON.SYSTEM.ENABLE', '', '', '', 2, 3, '', 1, 0, 'system:meta:disable', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347049317178945536', '1346777907096285184', 'SHENYU.BUTTON.SYSTEM.SYNCHRONIZE', '', '', '', 2, 4, '', 1, 0, 'system:meta:modify', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347049370014593024', '1346777907096285184', 'SHENYU.BUTTON.SYSTEM.EDIT', '', '', '', 2, 5, '', 1, 0, 'system:meta:edit', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347049542417264640', '1346778036402483200', 'SHENYU.BUTTON.SYSTEM.LIST', '', '', '', 2, 0, '', 1, 0, 'system:dict:list', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347049598155370496', '1346778036402483200', 'SHENYU.BUTTON.SYSTEM.DELETE', '', '', '', 2, 1, '', 1, 0, 'system:dict:delete', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347049659023110144', '1346778036402483200', 'SHENYU.BUTTON.SYSTEM.ADD', '', '', '', 2, 2, '', 1, 0, 'system:dict:add', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347049731047698432', '1346778036402483200', 'SHENYU.BUTTON.SYSTEM.ENABLE', '', '', '', 2, 3, '', 1, 0, 'system:dict:disable', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1347049794008395776', '1346778036402483200', 'SHENYU.BUTTON.SYSTEM.EDIT', '', '', '', 2, 4, '', 1, 0, 'system:dict:edit', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1350106119681622016', '1346776175553376256', 'SHENYU.MENU.SYSTEM.MANAGMENT.ROLE', 'role', '/system/role', 'role', 1, 0, 'usergroup-add', 0, 0, '', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1350107709494804480', '1350106119681622016', 'SHENYU.BUTTON.SYSTEM.ADD', '', '', '', 2, 0, '', 1, 0, 'system:role:add', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1350107842236137472', '1350106119681622016', 'SHENYU.BUTTON.SYSTEM.LIST', '', '', '', 2, 1, '', 1, 0, 'system:role:list', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1350112406754766848', '1350106119681622016', 'SHENYU.BUTTON.SYSTEM.DELETE', '', '', '', 2, 2, '', 1, 0, 'system:role:delete', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1350112481253994496', '1350106119681622016', 'SHENYU.BUTTON.SYSTEM.EDIT', '', '', '', 2, 3, '', 1, 0, 'system:role:edit', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1350804501819195392', '1346777766301888512', 'SHENYU.BUTTON.SYSTEM.EDITRESOURCEDETAILS', '', '', '', 2, 6, '', 1, 0, 'system:authen:editResourceDetails', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1355163372527050752', '1346776175553376256', 'SHENYU.MENU.SYSTEM.MANAGMENT.RESOURCE', 'resource', '/system/resource', 'resource', 1, 2, 'menu', 0, 0, '', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1355165158419750912', '1355163372527050752', 'SHENYU.BUTTON.RESOURCE.MENU.ADD', '', '', '', 2, 1, '', 1, 0, 'system:resource:addMenu', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1355165353534578688', '1355163372527050752', 'SHENYU.BUTTON.SYSTEM.LIST', '', '', '', 2, 0, '', 1, 0, 'system:resource:list', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1355165475785957376', '1355163372527050752', 'SHENYU.BUTTON.RESOURCE.MENU.DELETE', '', '', '', 2, 2, '', 1, 0, 'system:resource:deleteMenu', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1355165608565039104', '1355163372527050752', 'SHENYU.BUTTON.RESOURCE.MENU.EDIT', '', '', '', 2, 3, '', 1, 0, 'system:resource:editMenu', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1357956838021890048', '', 'SHENYU.MENU.CONFIG.MANAGMENT', 'config', '/config', 'config', 0, 1, 'api', 0, 0, '', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1357977745889132544', '1355163372527050752', 'SHENYU.BUTTON.RESOURCE.BUTTON.ADD', '', '', '', 2, 4, '', 1, 0, 'system:resource:addButton', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1357977912126177280', '1355163372527050752', 'SHENYU.SYSTEM.EDITOR', '', '', '', 2, 5, '', 1, 0, 'system:resource:editButton', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1357977971827900416', '1355163372527050752', 'SHENYU.SYSTEM.DELETEDATA', '', '', '', 2, 6, '', 1, 0, 'system:resource:deleteButton', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1386680049203195904', '1346777157943259136', 'SHENYU.BUTTON.DATA.PERMISSION.CONFIG', '', '', '', 2, 0, '', 1, 0, 'system:manager:configureDataPermission', 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `resource` VALUES ('1529402639271772160', '1346775491550474240', 'sign', 'sign', '/plug/sign', 'sign', 1, 0, 'thunderbolt', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355072', '1346775491550474240', 'sentinel', 'sentinel', '/plug/sentinel', 'sentinel', 1, 0, 'stop', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355073', '1346775491550474240', 'sofa', 'sofa', '/plug/sofa', 'sofa', 1, 0, 'key', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355074', '1346775491550474240', 'resilience4j', 'resilience4j', '/plug/resilience4j', 'resilience4j', 1, 0, 'redo', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355075', '1346775491550474240', 'tars', 'tars', '/plug/tars', 'tars', 1, 0, 'thunderbolt', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355076', '1346775491550474240', 'contextPath', 'contextPath', '/plug/contextPath', 'contextPath', 1, 0, 'retweet', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355077', '1346775491550474240', 'grpc', 'grpc', '/plug/grpc', 'grpc', 1, 0, 'border-bottom', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355078', '1346775491550474240', 'redirect', 'redirect', '/plug/redirect', 'redirect', 1, 0, 'align-left', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355079', '1346775491550474240', 'motan', 'motan', '/plug/motan', 'motan', 1, 0, 'stop', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355080', '1346775491550474240', 'loggingConsole', 'loggingConsole', '/plug/loggingConsole', 'loggingConsole', 1, 0, 'fire', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355081', '1346775491550474240', 'jwt', 'jwt', '/plug/jwt', 'jwt', 1, 0, 'align-left', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355082', '1346775491550474240', 'waf', 'waf', '/plug/waf', 'waf', 1, 0, 'block', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355083', '1346775491550474240', 'request', 'request', '/plug/request', 'request', 1, 0, 'thunderbolt', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355084', '1346775491550474240', 'oauth2', 'oauth2', '/plug/oauth2', 'oauth2', 1, 0, 'block', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355085', '1346775491550474240', 'paramMapping', 'paramMapping', '/plug/paramMapping', 'paramMapping', 1, 0, 'highlight', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355086', '1346775491550474240', 'modifyResponse', 'modifyResponse', '/plug/modifyResponse', 'modifyResponse', 1, 0, 'block', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355087', '1346775491550474240', 'cryptorRequest', 'cryptorRequest', '/plug/cryptorRequest', 'cryptorRequest', 1, 0, 'highlight', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355088', '1346775491550474240', 'cryptorResponse', 'cryptorResponse', '/plug/cryptorResponse', 'cryptorResponse', 1, 0, 'pic-center', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355089', '1346775491550474240', 'websocket', 'websocket', '/plug/websocket', 'websocket', 1, 0, 'stop', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355090', '1346775491550474240', 'generalContext', 'generalContext', '/plug/generalContext', 'generalContext', 1, 0, 'border-bottom', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355091', '1346775491550474240', 'mqtt', 'mqtt', '/plug/mqtt', 'mqtt', 1, 0, 'block', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355092', '1346775491550474240', 'loggingRocketMQ', 'loggingRocketMQ', '/plug/loggingRocketMQ', 'loggingRocketMQ', 1, 0, 'pic-center', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355093', '1346775491550474240', 'rewrite', 'rewrite', '/plug/rewrite', 'rewrite', 1, 0, 'database', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355094', '1346775491550474240', 'cache', 'cache', '/plug/cache', 'cache', 1, 0, 'align-left', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355095', '1346775491550474240', 'rateLimiter', 'rateLimiter', '/plug/rateLimiter', 'rateLimiter', 1, 0, 'key', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355096', '1346775491550474240', 'divide', 'divide', '/plug/divide', 'divide', 1, 0, 'stop', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355097', '1346775491550474240', 'dubbo', 'dubbo', '/plug/dubbo', 'dubbo', 1, 0, 'fire', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355098', '1346775491550474240', 'springCloud', 'springCloud', '/plug/springCloud', 'springCloud', 1, 0, 'border-bottom', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639284355099', '1346775491550474240', 'hystrix', 'hystrix', '/plug/hystrix', 'hystrix', 1, 0, 'border-bottom', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241152', '1529402639271772160', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:signSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241153', '1529402639271772160', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:signSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241154', '1529402639271772160', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:signSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241155', '1529402639271772160', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:signSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241156', '1529402639271772160', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:signRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241157', '1529402639271772160', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:signRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241158', '1529402639271772160', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:signRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241159', '1529402639271772160', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:signRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241160', '1529402639271772160', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:sign:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241161', '1529402639284355072', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:sentinelSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241162', '1529402639284355072', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:sentinelSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241163', '1529402639284355072', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:sentinelSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241164', '1529402639284355072', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:sentinelSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241165', '1529402639284355072', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:sentinelRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241166', '1529402639284355072', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:sentinelRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241167', '1529402639284355072', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:sentinelRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241168', '1529402639284355072', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:sentinelRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241169', '1529402639284355072', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:sentinel:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241170', '1529402639284355073', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:sofaSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241171', '1529402639284355073', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:sofaSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241172', '1529402639284355073', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:sofaSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241173', '1529402639284355073', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:sofaSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241174', '1529402639284355073', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:sofaRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241175', '1529402639284355073', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:sofaRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241176', '1529402639284355073', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:sofaRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241177', '1529402639284355073', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:sofaRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241178', '1529402639284355073', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:sofa:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241179', '1529402639284355074', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:resilience4jSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241180', '1529402639284355074', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:resilience4jSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241181', '1529402639284355074', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:resilience4jSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241182', '1529402639284355074', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:resilience4jSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241183', '1529402639284355074', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:resilience4jRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241184', '1529402639284355074', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:resilience4jRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241185', '1529402639284355074', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:resilience4jRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241186', '1529402639284355074', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:resilience4jRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241187', '1529402639284355074', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:resilience4j:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241188', '1529402639284355075', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:tarsSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241189', '1529402639284355075', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:tarsSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241190', '1529402639284355075', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:tarsSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241191', '1529402639284355075', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:tarsSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241192', '1529402639284355075', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:tarsRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241193', '1529402639284355075', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:tarsRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241194', '1529402639284355075', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:tarsRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241195', '1529402639284355075', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:tarsRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241196', '1529402639284355075', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:tars:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241197', '1529402639284355076', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:contextPathSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241198', '1529402639284355076', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:contextPathSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241199', '1529402639284355076', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:contextPathSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241200', '1529402639284355076', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:contextPathSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241201', '1529402639284355076', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:contextPathRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241202', '1529402639284355076', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:contextPathRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241203', '1529402639284355076', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:contextPathRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241204', '1529402639284355076', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:contextPathRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639368241205', '1529402639284355076', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:contextPath:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435456', '1529402639284355077', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:grpcSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435457', '1529402639284355077', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:grpcSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435458', '1529402639284355077', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:grpcSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435459', '1529402639284355077', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:grpcSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435460', '1529402639284355077', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:grpcRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435461', '1529402639284355077', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:grpcRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435462', '1529402639284355077', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:grpcRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435463', '1529402639284355077', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:grpcRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435464', '1529402639284355077', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:grpc:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435465', '1529402639284355078', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:redirectSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435466', '1529402639284355078', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:redirectSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435467', '1529402639284355078', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:redirectSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435468', '1529402639284355078', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:redirectSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435469', '1529402639284355078', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:redirectRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435470', '1529402639284355078', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:redirectRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435471', '1529402639284355078', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:redirectRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435472', '1529402639284355078', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:redirectRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435473', '1529402639284355078', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:redirect:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435474', '1529402639284355079', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:motanSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435475', '1529402639284355079', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:motanSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435476', '1529402639284355079', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:motanSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435477', '1529402639284355079', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:motanSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435478', '1529402639284355079', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:motanRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435479', '1529402639284355079', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:motanRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435480', '1529402639284355079', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:motanRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435481', '1529402639284355079', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:motanRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435482', '1529402639284355079', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:motan:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435483', '1529402639284355080', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingConsoleSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435484', '1529402639284355080', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingConsoleSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435485', '1529402639284355080', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingConsoleSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435486', '1529402639284355080', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingConsoleSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435487', '1529402639284355080', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingConsoleRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435488', '1529402639284355080', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingConsoleRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435489', '1529402639284355080', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingConsoleRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435490', '1529402639284355080', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingConsoleRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435491', '1529402639284355080', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingConsole:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435492', '1529402639284355081', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:jwtSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435493', '1529402639284355081', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:jwtSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435494', '1529402639284355081', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:jwtSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435495', '1529402639284355081', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:jwtSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435496', '1529402639284355081', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:jwtRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435497', '1529402639284355081', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:jwtRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435498', '1529402639284355081', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:jwtRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435499', '1529402639284355081', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:jwtRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435500', '1529402639284355081', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:jwt:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435501', '1529402639284355082', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:wafSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435502', '1529402639284355082', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:wafSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435503', '1529402639284355082', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:wafSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435504', '1529402639284355082', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:wafSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435505', '1529402639284355082', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:wafRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435506', '1529402639284355082', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:wafRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435507', '1529402639284355082', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:wafRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435508', '1529402639284355082', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:wafRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435509', '1529402639284355082', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:waf:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435510', '1529402639284355083', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:requestSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435511', '1529402639284355083', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:requestSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435512', '1529402639284355083', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:requestSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435513', '1529402639284355083', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:requestSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435514', '1529402639284355083', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:requestRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435515', '1529402639284355083', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:requestRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435516', '1529402639284355083', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:requestRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435517', '1529402639284355083', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:requestRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435518', '1529402639284355083', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:request:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435519', '1529402639284355084', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:oauth2Selector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435520', '1529402639284355084', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:oauth2Selector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435521', '1529402639284355084', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:oauth2Selector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435522', '1529402639284355084', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:oauth2Selector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435523', '1529402639284355084', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:oauth2Rule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435524', '1529402639284355084', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:oauth2Rule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435525', '1529402639284355084', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:oauth2Rule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435526', '1529402639284355084', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:oauth2Rule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435527', '1529402639284355084', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:oauth2:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435528', '1529402639284355085', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:paramMappingSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435529', '1529402639284355085', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:paramMappingSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435530', '1529402639284355085', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:paramMappingSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435531', '1529402639284355085', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:paramMappingSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435532', '1529402639284355085', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:paramMappingRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435533', '1529402639284355085', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:paramMappingRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435534', '1529402639284355085', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:paramMappingRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435535', '1529402639284355085', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:paramMappingRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435536', '1529402639284355085', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:paramMapping:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435537', '1529402639284355086', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:modifyResponseSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435538', '1529402639284355086', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:modifyResponseSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435539', '1529402639284355086', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:modifyResponseSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435540', '1529402639284355086', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:modifyResponseSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435541', '1529402639284355086', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:modifyResponseRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435542', '1529402639284355086', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:modifyResponseRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435543', '1529402639284355086', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:modifyResponseRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435544', '1529402639284355086', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:modifyResponseRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435545', '1529402639284355086', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:modifyResponse:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435546', '1529402639284355087', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:cryptorRequestSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435547', '1529402639284355087', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:cryptorRequestSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435548', '1529402639284355087', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:cryptorRequestSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435549', '1529402639284355087', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:cryptorRequestSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435550', '1529402639284355087', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:cryptorRequestRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435551', '1529402639284355087', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:cryptorRequestRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435552', '1529402639284355087', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:cryptorRequestRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435553', '1529402639284355087', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:cryptorRequestRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435554', '1529402639284355087', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:cryptorRequest:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435555', '1529402639284355088', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:cryptorResponseSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435556', '1529402639284355088', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:cryptorResponseSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435557', '1529402639284355088', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:cryptorResponseSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435558', '1529402639284355088', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:cryptorResponseSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435559', '1529402639284355088', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:cryptorResponseRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435560', '1529402639284355088', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:cryptorResponseRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435561', '1529402639284355088', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:cryptorResponseRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435562', '1529402639284355088', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:cryptorResponseRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435563', '1529402639284355088', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:cryptorResponse:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435564', '1529402639284355089', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:websocketSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435565', '1529402639284355089', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:websocketSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435566', '1529402639284355089', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:websocketSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435567', '1529402639284355089', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:websocketSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435568', '1529402639284355089', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:websocketRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435569', '1529402639284355089', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:websocketRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435570', '1529402639284355089', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:websocketRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435571', '1529402639284355089', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:websocketRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435572', '1529402639284355089', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:websocket:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435573', '1529402639284355090', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:generalContextSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435574', '1529402639284355090', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:generalContextSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435575', '1529402639284355090', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:generalContextSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435576', '1529402639284355090', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:generalContextSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435577', '1529402639284355090', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:generalContextRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435578', '1529402639284355090', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:generalContextRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435579', '1529402639284355090', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:generalContextRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435580', '1529402639284355090', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:generalContextRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435581', '1529402639284355090', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:generalContext:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435582', '1529402639284355091', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:mqttSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435583', '1529402639284355091', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:mqttSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435584', '1529402639284355091', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:mqttSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435585', '1529402639284355091', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:mqttSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435586', '1529402639284355091', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:mqttRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435587', '1529402639284355091', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:mqttRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435588', '1529402639284355091', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:mqttRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435589', '1529402639284355091', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:mqttRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435590', '1529402639284355091', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:mqtt:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435591', '1529402639284355092', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingRocketMQSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435592', '1529402639284355092', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingRocketMQSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435593', '1529402639284355092', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingRocketMQSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435594', '1529402639284355092', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingRocketMQSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435595', '1529402639284355092', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingRocketMQRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435596', '1529402639284355092', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingRocketMQRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435597', '1529402639284355092', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingRocketMQRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435598', '1529402639284355092', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingRocketMQRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435599', '1529402639284355092', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingRocketMQ:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435600', '1529402639284355093', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:rewriteSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435601', '1529402639284355093', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:rewriteSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435602', '1529402639284355093', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:rewriteSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435603', '1529402639284355093', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:rewriteSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435604', '1529402639284355093', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:rewriteRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435605', '1529402639284355093', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:rewriteRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435606', '1529402639284355093', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:rewriteRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435607', '1529402639284355093', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:rewriteRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435608', '1529402639284355093', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:rewrite:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435609', '1529402639284355094', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:cacheSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435610', '1529402639284355094', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:cacheSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435611', '1529402639284355094', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:cacheSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435612', '1529402639284355094', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:cacheSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435613', '1529402639284355094', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:cacheRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435614', '1529402639284355094', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:cacheRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435615', '1529402639284355094', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:cacheRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435616', '1529402639284355094', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:cacheRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435617', '1529402639284355094', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:cache:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435618', '1529402639284355095', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:rateLimiterSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435619', '1529402639284355095', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:rateLimiterSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435620', '1529402639284355095', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:rateLimiterSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435621', '1529402639284355095', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:rateLimiterSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435622', '1529402639284355095', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:rateLimiterRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435623', '1529402639284355095', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:rateLimiterRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435624', '1529402639284355095', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:rateLimiterRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435625', '1529402639284355095', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:rateLimiterRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435626', '1529402639284355095', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:rateLimiter:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435627', '1529402639284355096', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:divideSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435628', '1529402639284355096', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:divideSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435629', '1529402639284355096', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:divideSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435630', '1529402639284355096', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:divideSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435631', '1529402639284355096', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:divideRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435632', '1529402639284355096', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:divideRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435633', '1529402639284355096', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:divideRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435634', '1529402639284355096', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:divideRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435635', '1529402639284355096', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:divide:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435636', '1529402639284355097', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:dubboSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435637', '1529402639284355097', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:dubboSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435638', '1529402639284355097', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:dubboSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435639', '1529402639284355097', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:dubboSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435640', '1529402639284355097', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:dubboRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435641', '1529402639284355097', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:dubboRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435642', '1529402639284355097', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:dubboRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435643', '1529402639284355097', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:dubboRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435644', '1529402639284355097', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:dubbo:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435645', '1529402639284355098', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:springCloudSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435646', '1529402639284355098', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:springCloudSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435647', '1529402639284355098', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:springCloudSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435648', '1529402639284355098', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:springCloudSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435649', '1529402639284355098', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:springCloudRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435650', '1529402639284355098', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:springCloudRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435651', '1529402639284355098', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:springCloudRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435652', '1529402639284355098', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:springCloudRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435653', '1529402639284355098', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:springCloud:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435654', '1529402639284355099', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:hystrixSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435655', '1529402639284355099', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:hystrixSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435656', '1529402639284355099', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:hystrixSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435657', '1529402639284355099', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:hystrixSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435658', '1529402639284355099', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:hystrixRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435659', '1529402639284355099', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:hystrixRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435660', '1529402639284355099', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:hystrixRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435661', '1529402639284355099', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:hystrixRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1529402639372435662', '1529402639284355099', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:hystrix:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534577121923309568', '', 'Document', '', '/document', '', 0, 3, 'file-text', 0, 0, '', 1, '2022-06-09 00:44:32.000', '2022-06-09 01:06:45.000');
INSERT INTO `resource` VALUES ('1534585430311051264', '1534577121923309568', 'API document', '', '/document/apidoc', '', 1, 0, 'api', 0, 0, '', 1, '2022-06-09 01:17:32.000', '2022-06-09 01:17:32.000');
INSERT INTO `resource` VALUES ('1534585531108564992', '1534585430311051264', 'send', '', '', '', 2, 0, '', 1, 0, 'document:apirun:send', 1, '2022-06-09 01:17:56.000', '2022-06-09 01:17:56.000');
INSERT INTO `resource` VALUES ('1534585531108564993', '1346775491550474240', 'loggingAliyunSls', 'loggingAliyunSls', '/plug/loggingAliyunSls', 'loggingAliyunSls', 1, 0, 'pic-center', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108564994', '1534585531108564993', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingAliyunSlsSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108564995', '1534585531108564993', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingAliyunSlsSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108564996', '1534585531108564993', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingAliyunSlsSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108564997', '1534585531108564993', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingAliyunSlsSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108564998', '1534585531108564993', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingAliyunSlsRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108564999', '1534585531108564993', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingAliyunSlsRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565000', '1534585531108564993', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingAliyunSlsRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565001', '1534585531108564993', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingAliyunSlsRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565002', '1534585531108564993', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingAliyunSls:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565003', '1346775491550474240', 'loggingTencentCls', 'loggingTencentCls', '/plug/loggingTencentCls', 'loggingTencentCls', 1, 0, 'pic-center', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565004', '1534585531108565003', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingTencentClsSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565005', '1534585531108565003', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingTencentClsSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565006', '1534585531108565003', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingTencentClsSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565007', '1534585531108565003', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingTencentClsSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565008', '1534585531108565003', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingTencentClsRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565009', '1534585531108565003', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingTencentClsRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565010', '1534585531108565003', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingTencentClsRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565011', '1534585531108565003', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingTencentClsRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565012', '1534585531108565003', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingTencentCls:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565013', '1346775491550474240', 'loggingKafka', 'loggingKafka', '/plug/loggingKafka', 'loggingKafka', 1, 0, 'pic-center', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565014', '1534585531108565013', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingKafkaSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565015', '1534585531108565013', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingKafkaSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565016', '1534585531108565013', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingKafkaSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565017', '1534585531108565013', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingKafkaSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565018', '1534585531108565013', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingKafkaRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565019', '1534585531108565013', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingKafkaRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565020', '1534585531108565013', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingKafkaRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565021', '1534585531108565013', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingKafkaRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565022', '1534585531108565013', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingKafka:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565023', '1346775491550474240', 'loggingPulsar', 'loggingPulsar', '/plug/loggingPulsar', 'loggingPulsar', 1, 0, 'pic-center', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565024', '1534585531108565023', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingPulsarSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565025', '1534585531108565023', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingPulsarSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565026', '1534585531108565023', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingPulsarSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565027', '1534585531108565023', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingPulsarSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565028', '1534585531108565023', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingPulsarRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565029', '1534585531108565023', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingPulsarRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565030', '1534585531108565023', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingPulsarRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565031', '1534585531108565023', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingPulsarRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565032', '1534585531108565023', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingPulsar:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565033', '1346775491550474240', 'loggingElasticSearch', 'loggingElasticSearch', '/plug/loggingElasticSearch', 'loggingElasticSearch', 1, 0, 'pic-center', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565034', '1534585531108565033', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingElasticSearchSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565035', '1534585531108565033', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingElasticSearchSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565036', '1534585531108565033', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingElasticSearchSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565037', '1534585531108565033', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingElasticSearchSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565038', '1534585531108565033', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingElasticSearchRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565039', '1534585531108565033', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingElasticSearchRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565040', '1534585531108565033', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingElasticSearchRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565041', '1534585531108565033', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingElasticSearchRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565042', '1534585531108565033', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingElasticSearch:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565043', '1346775491550474240', 'loggingClickHouse', 'loggingClickHouse', '/plug/loggingClickHouse', 'loggingClickHouse', 1, 0, 'pic-center', 0, 0, '', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565044', '1534585531108565043', 'SHENYU.BUTTON.PLUGIN.SELECTOR.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingClickHouseSelector:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565045', '1534585531108565043', 'SHENYU.BUTTON.PLUGIN.SELECTOR.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingClickHouseSelector:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565046', '1534585531108565043', 'SHENYU.BUTTON.PLUGIN.SELECTOR.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingClickHouseSelector:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565047', '1534585531108565043', 'SHENYU.BUTTON.PLUGIN.SELECTOR.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingClickHouseSelector:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565048', '1534585531108565043', 'SHENYU.BUTTON.PLUGIN.RULE.ADD', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingClickHouseRule:add', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565049', '1534585531108565043', 'SHENYU.BUTTON.PLUGIN.RULE.QUERY', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingClickHouseRule:query', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565050', '1534585531108565043', 'SHENYU.BUTTON.PLUGIN.RULE.EDIT', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingClickHouseRule:edit', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565051', '1534585531108565043', 'SHENYU.BUTTON.PLUGIN.RULE.DELETE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingClickHouseRule:delete', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1534585531108565052', '1534585531108565043', 'SHENYU.BUTTON.PLUGIN.SYNCHRONIZE', '', '', '', 2, 0, '', 1, 0, 'plugin:loggingClickHouse:modify', 1, '2022-05-25 18:02:58.000', '2022-05-25 18:02:58.000');
INSERT INTO `resource` VALUES ('1572525965625266176', '1346777449787125760', 'SHENYU.BUTTON.SYSTEM.RESOURCE', '', '', '', 2, 6, '', 1, 0, 'system:plugin:resource', 1, '2022-09-28 11:50:58.000', '2022-09-28 11:50:58.000');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `role_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'role name',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'role describe',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`, `role_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'role table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1346358560427216896', 'super', 'Administrator', '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `role` VALUES ('1385482862971723776', 'default', 'Standard', '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');

-- ----------------------------
-- Table structure for rule
-- ----------------------------
DROP TABLE IF EXISTS `rule`;
CREATE TABLE `rule`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `selector_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'selector id',
  `match_mode` int NOT NULL COMMENT 'matching mode (0 and 1 or)',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'rule name',
  `enabled` tinyint NOT NULL COMMENT 'whether to open (0 close, 1 open) ',
  `loged` tinyint NOT NULL COMMENT 'whether to log or not (0 no print, 1 print) ',
  `match_restful` tinyint NOT NULL DEFAULT 0 COMMENT 'whether to match restful(0 cache, 1 not cache)',
  `sort` int NOT NULL COMMENT 'sort',
  `handle` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'processing logic (here for different plug-ins, there will be different fields to identify different processes, all data in JSON format is stored)',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rule
-- ----------------------------
INSERT INTO `rule` VALUES ('1654502265012506624', '1653048828116779008', 0, '/search/wx/search/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:04:13.800', '2023-05-05 23:04:13.800');
INSERT INTO `rule` VALUES ('1654502266669256704', '1654502266077859840', 0, '/search', 1, 1, 0, 1, '{\"addPrefixed\":false,\"contextPath\":\"/search\"}', '2023-05-05 23:04:14.196', '2023-05-05 23:04:14.196');
INSERT INTO `rule` VALUES ('1654502285694619648', '1652998411555094528', 0, '/third/wx/storage/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:04:18.731', '2023-05-05 23:04:18.731');
INSERT INTO `rule` VALUES ('1654502286424428544', '1654502286193741824', 0, '/third', 1, 1, 0, 1, '{\"addPrefixed\":false,\"contextPath\":\"/third\"}', '2023-05-05 23:04:18.906', '2023-05-05 23:04:18.906');
INSERT INTO `rule` VALUES ('1654502286667698176', '1652998411555094528', 0, '/third/wx/region/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:04:18.963', '2023-05-05 23:04:18.963');
INSERT INTO `rule` VALUES ('1654513588496850944', '1654513588417159168', 0, '/product/wx/goods/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:13.530', '2023-05-05 23:49:13.530');
INSERT INTO `rule` VALUES ('1654513588727537664', '1654513588664623104', 0, '/product', 1, 1, 0, 1, '{\"addPrefixed\":false,\"contextPath\":\"/product\"}', '2023-05-05 23:49:13.585', '2023-05-05 23:49:13.585');
INSERT INTO `rule` VALUES ('1654513588798840832', '1654513588417159168', 0, '/product/wx/topic/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:13.601', '2023-05-05 23:49:13.601');
INSERT INTO `rule` VALUES ('1654513588941447168', '1654513588417159168', 0, '/product/wx/brand/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:13.636', '2023-05-05 23:49:13.636');
INSERT INTO `rule` VALUES ('1654513589079859200', '1654513588417159168', 0, '/product/wx/catalog/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:13.669', '2023-05-05 23:49:13.669');
INSERT INTO `rule` VALUES ('1654513640116150272', '1654513640049041408', 0, '/order/wx/order/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:25.837', '2023-05-05 23:49:25.837');
INSERT INTO `rule` VALUES ('1654513640325865472', '1654513640258756608', 0, '/order', 1, 1, 0, 1, '{\"addPrefixed\":false,\"contextPath\":\"/order\"}', '2023-05-05 23:49:25.887', '2023-05-05 23:49:25.887');
INSERT INTO `rule` VALUES ('1654513645954621440', '1653048885171896320', 0, '/groupon/wx/groupon/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:27.229', '2023-05-05 23:49:27.229');
INSERT INTO `rule` VALUES ('1654513646088839168', '1654513646042701824', 0, '/groupon', 1, 1, 0, 1, '{\"addPrefixed\":false,\"contextPath\":\"/groupon\"}', '2023-05-05 23:49:27.261', '2023-05-05 23:49:27.261');
INSERT INTO `rule` VALUES ('1654513670726180864', '1653048852812840960', 0, '/coupon/wx/coupon/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:33.135', '2023-05-05 23:49:33.135');
INSERT INTO `rule` VALUES ('1654513670877175808', '1654513670814261248', 0, '/coupon', 1, 1, 0, 1, '{\"addPrefixed\":false,\"contextPath\":\"/coupon\"}', '2023-05-05 23:49:33.171', '2023-05-05 23:49:33.171');
INSERT INTO `rule` VALUES ('1654513703148150784', '1654513703102013440', 0, '/cart/wx/cart/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:40.865', '2023-05-05 23:49:40.865');
INSERT INTO `rule` VALUES ('1654513703290757120', '1654513703232036864', 0, '/cart', 1, 1, 0, 1, '{\"addPrefixed\":false,\"contextPath\":\"/cart\"}', '2023-05-05 23:49:40.899', '2023-05-05 23:49:40.899');
INSERT INTO `rule` VALUES ('1654513763156058112', '1654513763042811904', 0, '/admin/admin/groupon/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.172', '2023-05-05 23:49:55.172');
INSERT INTO `rule` VALUES ('1654513763319635968', '1654513763260915712', 0, '/admin', 1, 1, 0, 1, '{\"addPrefixed\":false,\"contextPath\":\"/admin\"}', '2023-05-05 23:49:55.211', '2023-05-05 23:49:55.211');
INSERT INTO `rule` VALUES ('1654513763369967616', '1654513763042811904', 0, '/admin/admin/storage/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.223', '2023-05-05 23:49:55.223');
INSERT INTO `rule` VALUES ('1654513763462242304', '1654513763042811904', 0, '/admin/admin/topic/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.245', '2023-05-05 23:49:55.245');
INSERT INTO `rule` VALUES ('1654513763571294208', '1654513763042811904', 0, '/admin/wx/feedback/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.271', '2023-05-05 23:49:55.271');
INSERT INTO `rule` VALUES ('1654513763655180288', '1654513763042811904', 0, '/admin/admin/stat/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.291', '2023-05-05 23:49:55.291');
INSERT INTO `rule` VALUES ('1654513763743260672', '1654513763042811904', 0, '/admin/admin/user/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.312', '2023-05-05 23:49:55.312');
INSERT INTO `rule` VALUES ('1654513763822952448', '1654513763042811904', 0, '/admin/admin/profile/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.331', '2023-05-05 23:49:55.331');
INSERT INTO `rule` VALUES ('1654513763923615744', '1654513763042811904', 0, '/admin/admin/brand/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.355', '2023-05-05 23:49:55.355');
INSERT INTO `rule` VALUES ('1654513764028473344', '1654513763042811904', 0, '/admin/admin/auth/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.380', '2023-05-05 23:49:55.380');
INSERT INTO `rule` VALUES ('1654513764124942336', '1654513763042811904', 0, '/admin/admin/goods/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.403', '2023-05-05 23:49:55.403');
INSERT INTO `rule` VALUES ('1654513764213022720', '1654513763042811904', 0, '/admin/admin/comment/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.424', '2023-05-05 23:49:55.424');
INSERT INTO `rule` VALUES ('1654513764317880320', '1654513763042811904', 0, '/admin/admin/brokerage/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.449', '2023-05-05 23:49:55.449');
INSERT INTO `rule` VALUES ('1654513764414349312', '1654513763042811904', 0, '/admin/admin/role/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.472', '2023-05-05 23:49:55.472');
INSERT INTO `rule` VALUES ('1654513764502429696', '1654513763042811904', 0, '/admin/admin/region/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.493', '2023-05-05 23:49:55.493');
INSERT INTO `rule` VALUES ('1654513764586315776', '1654513763042811904', 0, '/admin/admin/ad/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.513', '2023-05-05 23:49:55.513');
INSERT INTO `rule` VALUES ('1654513764682784768', '1654513763042811904', 0, '/admin/admin/category/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.536', '2023-05-05 23:49:55.536');
INSERT INTO `rule` VALUES ('1654513764758282240', '1654513763042811904', 0, '/admin/admin/collect/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.554', '2023-05-05 23:49:55.554');
INSERT INTO `rule` VALUES ('1654513764842168320', '1654513763042811904', 0, '/admin/admin/admin/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.574', '2023-05-05 23:49:55.574');
INSERT INTO `rule` VALUES ('1654513764934443008', '1654513763042811904', 0, '/admin/admin/footprint/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.596', '2023-05-05 23:49:55.596');
INSERT INTO `rule` VALUES ('1654513765022523392', '1654513763042811904', 0, '/admin/admin/history/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.617', '2023-05-05 23:49:55.617');
INSERT INTO `rule` VALUES ('1654513765114798080', '1654513763042811904', 0, '/admin/admin/article/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.639', '2023-05-05 23:49:55.639');
INSERT INTO `rule` VALUES ('1654513765190295552', '1654513763042811904', 0, '/admin/admin/keyword/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.657', '2023-05-05 23:49:55.657');
INSERT INTO `rule` VALUES ('1654513765316124672', '1654513763042811904', 0, '/admin/admin/issue/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.687', '2023-05-05 23:49:55.687');
INSERT INTO `rule` VALUES ('1654513765412593664', '1654513763042811904', 0, '/admin/admin/order/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.710', '2023-05-05 23:49:55.710');
INSERT INTO `rule` VALUES ('1654513765479702528', '1654513763042811904', 0, '/admin/admin/index/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.726', '2023-05-05 23:49:55.726');
INSERT INTO `rule` VALUES ('1654513765576171520', '1654513763042811904', 0, '/admin/admin/address/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.749', '2023-05-05 23:49:55.749');
INSERT INTO `rule` VALUES ('1654513765672640512', '1654513763042811904', 0, '/admin/admin/feedback/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.772', '2023-05-05 23:49:55.772');
INSERT INTO `rule` VALUES ('1654513765735555072', '1654513763042811904', 0, '/admin/admin/dashboard/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.787', '2023-05-05 23:49:55.787');
INSERT INTO `rule` VALUES ('1654513765811052544', '1654513763042811904', 0, '/admin/wx/article/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.805', '2023-05-05 23:49:55.805');
INSERT INTO `rule` VALUES ('1654513765903327232', '1654513763042811904', 0, '/admin/admin/coupon/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:49:55.827', '2023-05-05 23:49:55.827');
INSERT INTO `rule` VALUES ('1654513791018819584', '1654513790964293632', 0, '/user/wx/comment/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:50:01.815', '2023-05-05 23:50:01.815');
INSERT INTO `rule` VALUES ('1654513791132065792', '1654513791085928448', 0, '/user', 1, 1, 0, 1, '{\"addPrefixed\":false,\"contextPath\":\"/user\"}', '2023-05-05 23:50:01.842', '2023-05-05 23:50:01.842');
INSERT INTO `rule` VALUES ('1654513791169814528', '1654513790964293632', 0, '/user/wx/collect/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:50:01.851', '2023-05-05 23:50:01.851');
INSERT INTO `rule` VALUES ('1654513791245312000', '1654513790964293632', 0, '/user/wx/address/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:50:01.869', '2023-05-05 23:50:01.869');
INSERT INTO `rule` VALUES ('1654513791312420864', '1654513790964293632', 0, '/user/wx/formid/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:50:01.885', '2023-05-05 23:50:01.885');
INSERT INTO `rule` VALUES ('1654513791421472768', '1654513790964293632', 0, '/user/wx/brokerage/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:50:01.911', '2023-05-05 23:50:01.911');
INSERT INTO `rule` VALUES ('1654513791513747456', '1654513790964293632', 0, '/user/wx/user/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:50:01.933', '2023-05-05 23:50:01.933');
INSERT INTO `rule` VALUES ('1654513791585050624', '1654513790964293632', 0, '/user/wx/index/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:50:01.950', '2023-05-05 23:50:01.950');
INSERT INTO `rule` VALUES ('1654513791652159488', '1654513790964293632', 0, '/user/wx/home/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:50:01.966', '2023-05-05 23:50:01.966');
INSERT INTO `rule` VALUES ('1654513791731851264', '1654513790964293632', 0, '/user/wx/footprint/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:50:01.985', '2023-05-05 23:50:01.985');
INSERT INTO `rule` VALUES ('1654513791815737344', '1654513790964293632', 0, '/user/wx/auth/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:50:02.005', '2023-05-05 23:50:02.005');
INSERT INTO `rule` VALUES ('1654513791895429120', '1654513790964293632', 0, '/user/wx/agency/**', 1, 1, 0, 1, '{\"loadBalance\":\"random\",\"retryStrategy\":\"current\",\"retry\":3,\"timeout\":3000,\"headerMaxSize\":0,\"requestMaxSize\":0}', '2023-05-05 23:50:02.024', '2023-05-05 23:50:02.024');

-- ----------------------------
-- Table structure for rule_condition
-- ----------------------------
DROP TABLE IF EXISTS `rule_condition`;
CREATE TABLE `rule_condition`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `rule_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'rule id',
  `param_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'parameter type (post query uri, etc.)',
  `operator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'matching character (=> <like match)',
  `param_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'parameter name',
  `param_value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'parameter value',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rule_condition
-- ----------------------------
INSERT INTO `rule_condition` VALUES ('1654502265146724352', '1654502265012506624', 'uri', 'pathPattern', '/', '/search/wx/search/**', '2023-05-05 23:04:13.833', '2023-05-05 23:04:13.833');
INSERT INTO `rule_condition` VALUES ('1654502266895749120', '1654502266669256704', 'uri', 'pathPattern', '/', '/search/**', '2023-05-05 23:04:14.250', '2023-05-05 23:04:14.250');
INSERT INTO `rule_condition` VALUES ('1654502285849808896', '1654502285694619648', 'uri', 'pathPattern', '/', '/third/wx/storage/**', '2023-05-05 23:04:18.769', '2023-05-05 23:04:18.769');
INSERT INTO `rule_condition` VALUES ('1654502286504120320', '1654502286424428544', 'uri', 'pathPattern', '/', '/third/**', '2023-05-05 23:04:18.925', '2023-05-05 23:04:18.925');
INSERT INTO `rule_condition` VALUES ('1654502286852247552', '1654502286667698176', 'uri', 'pathPattern', '/', '/third/wx/region/**', '2023-05-05 23:04:19.008', '2023-05-05 23:04:19.008');
INSERT INTO `rule_condition` VALUES ('1654513588576542720', '1654513588496850944', 'uri', 'pathPattern', '/', '/product/wx/goods/**', '2023-05-05 23:49:13.549', '2023-05-05 23:49:13.549');
INSERT INTO `rule_condition` VALUES ('1654513588744314880', '1654513588727537664', 'uri', 'pathPattern', '/', '/product/**', '2023-05-05 23:49:13.589', '2023-05-05 23:49:13.589');
INSERT INTO `rule_condition` VALUES ('1654513588824006656', '1654513588798840832', 'uri', 'pathPattern', '/', '/product/wx/topic/**', '2023-05-05 23:49:13.608', '2023-05-05 23:49:13.608');
INSERT INTO `rule_condition` VALUES ('1654513588962418688', '1654513588941447168', 'uri', 'pathPattern', '/', '/product/wx/brand/**', '2023-05-05 23:49:13.641', '2023-05-05 23:49:13.641');
INSERT INTO `rule_condition` VALUES ('1654513589134385152', '1654513589079859200', 'uri', 'pathPattern', '/', '/product/wx/catalog/**', '2023-05-05 23:49:13.682', '2023-05-05 23:49:13.682');
INSERT INTO `rule_condition` VALUES ('1654513640170676224', '1654513640116150272', 'uri', 'pathPattern', '/', '/order/wx/order/**', '2023-05-05 23:49:25.850', '2023-05-05 23:49:25.850');
INSERT INTO `rule_condition` VALUES ('1654513640346836992', '1654513640325865472', 'uri', 'pathPattern', '/', '/order/**', '2023-05-05 23:49:25.892', '2023-05-05 23:49:25.892');
INSERT INTO `rule_condition` VALUES ('1654513645971398656', '1654513645954621440', 'uri', 'pathPattern', '/', '/groupon/wx/groupon/**', '2023-05-05 23:49:27.233', '2023-05-05 23:49:27.233');
INSERT INTO `rule_condition` VALUES ('1654513646114004992', '1654513646088839168', 'uri', 'pathPattern', '/', '/groupon/**', '2023-05-05 23:49:27.267', '2023-05-05 23:49:27.267');
INSERT INTO `rule_condition` VALUES ('1654513670742958080', '1654513670726180864', 'uri', 'pathPattern', '/', '/coupon/wx/coupon/**', '2023-05-05 23:49:33.139', '2023-05-05 23:49:33.139');
INSERT INTO `rule_condition` VALUES ('1654513670893953024', '1654513670877175808', 'uri', 'pathPattern', '/', '/coupon/**', '2023-05-05 23:49:33.175', '2023-05-05 23:49:33.175');
INSERT INTO `rule_condition` VALUES ('1654513703164928000', '1654513703148150784', 'uri', 'pathPattern', '/', '/cart/wx/cart/**', '2023-05-05 23:49:40.869', '2023-05-05 23:49:40.869');
INSERT INTO `rule_condition` VALUES ('1654513703303340032', '1654513703290757120', 'uri', 'pathPattern', '/', '/cart/**', '2023-05-05 23:49:40.902', '2023-05-05 23:49:40.902');
INSERT INTO `rule_condition` VALUES ('1654513763189612544', '1654513763156058112', 'uri', 'pathPattern', '/', '/admin/admin/groupon/**', '2023-05-05 23:49:55.180', '2023-05-05 23:49:55.180');
INSERT INTO `rule_condition` VALUES ('1654513763332218880', '1654513763319635968', 'uri', 'pathPattern', '/', '/admin/**', '2023-05-05 23:49:55.214', '2023-05-05 23:49:55.214');
INSERT INTO `rule_condition` VALUES ('1654513763382550528', '1654513763369967616', 'uri', 'pathPattern', '/', '/admin/admin/storage/**', '2023-05-05 23:49:55.226', '2023-05-05 23:49:55.226');
INSERT INTO `rule_condition` VALUES ('1654513763479019520', '1654513763462242304', 'uri', 'pathPattern', '/', '/admin/admin/topic/**', '2023-05-05 23:49:55.249', '2023-05-05 23:49:55.249');
INSERT INTO `rule_condition` VALUES ('1654513763588071424', '1654513763571294208', 'uri', 'pathPattern', '/', '/admin/wx/feedback/**', '2023-05-05 23:49:55.275', '2023-05-05 23:49:55.275');
INSERT INTO `rule_condition` VALUES ('1654513763671957504', '1654513763655180288', 'uri', 'pathPattern', '/', '/admin/admin/stat/**', '2023-05-05 23:49:55.295', '2023-05-05 23:49:55.295');
INSERT INTO `rule_condition` VALUES ('1654513763755843584', '1654513763743260672', 'uri', 'pathPattern', '/', '/admin/admin/user/**', '2023-05-05 23:49:55.315', '2023-05-05 23:49:55.315');
INSERT INTO `rule_condition` VALUES ('1654513763835535360', '1654513763822952448', 'uri', 'pathPattern', '/', '/admin/admin/profile/**', '2023-05-05 23:49:55.334', '2023-05-05 23:49:55.334');
INSERT INTO `rule_condition` VALUES ('1654513763940392960', '1654513763923615744', 'uri', 'pathPattern', '/', '/admin/admin/brand/**', '2023-05-05 23:49:55.359', '2023-05-05 23:49:55.359');
INSERT INTO `rule_condition` VALUES ('1654513764041056256', '1654513764028473344', 'uri', 'pathPattern', '/', '/admin/admin/auth/**', '2023-05-05 23:49:55.383', '2023-05-05 23:49:55.383');
INSERT INTO `rule_condition` VALUES ('1654513764137525248', '1654513764124942336', 'uri', 'pathPattern', '/', '/admin/admin/goods/**', '2023-05-05 23:49:55.406', '2023-05-05 23:49:55.406');
INSERT INTO `rule_condition` VALUES ('1654513764233994240', '1654513764213022720', 'uri', 'pathPattern', '/', '/admin/admin/comment/**', '2023-05-05 23:49:55.429', '2023-05-05 23:49:55.429');
INSERT INTO `rule_condition` VALUES ('1654513764338851840', '1654513764317880320', 'uri', 'pathPattern', '/', '/admin/admin/brokerage/**', '2023-05-05 23:49:55.454', '2023-05-05 23:49:55.454');
INSERT INTO `rule_condition` VALUES ('1654513764426932224', '1654513764414349312', 'uri', 'pathPattern', '/', '/admin/admin/role/**', '2023-05-05 23:49:55.475', '2023-05-05 23:49:55.475');
INSERT INTO `rule_condition` VALUES ('1654513764515012608', '1654513764502429696', 'uri', 'pathPattern', '/', '/admin/admin/region/**', '2023-05-05 23:49:55.496', '2023-05-05 23:49:55.496');
INSERT INTO `rule_condition` VALUES ('1654513764598898688', '1654513764586315776', 'uri', 'pathPattern', '/', '/admin/admin/ad/**', '2023-05-05 23:49:55.516', '2023-05-05 23:49:55.516');
INSERT INTO `rule_condition` VALUES ('1654513764695367680', '1654513764682784768', 'uri', 'pathPattern', '/', '/admin/admin/category/**', '2023-05-05 23:49:55.539', '2023-05-05 23:49:55.539');
INSERT INTO `rule_condition` VALUES ('1654513764775059456', '1654513764758282240', 'uri', 'pathPattern', '/', '/admin/admin/collect/**', '2023-05-05 23:49:55.558', '2023-05-05 23:49:55.558');
INSERT INTO `rule_condition` VALUES ('1654513764863139840', '1654513764842168320', 'uri', 'pathPattern', '/', '/admin/admin/admin/**', '2023-05-05 23:49:55.579', '2023-05-05 23:49:55.579');
INSERT INTO `rule_condition` VALUES ('1654513764951220224', '1654513764934443008', 'uri', 'pathPattern', '/', '/admin/admin/footprint/**', '2023-05-05 23:49:55.600', '2023-05-05 23:49:55.600');
INSERT INTO `rule_condition` VALUES ('1654513765043494912', '1654513765022523392', 'uri', 'pathPattern', '/', '/admin/admin/history/**', '2023-05-05 23:49:55.622', '2023-05-05 23:49:55.622');
INSERT INTO `rule_condition` VALUES ('1654513765127380992', '1654513765114798080', 'uri', 'pathPattern', '/', '/admin/admin/article/**', '2023-05-05 23:49:55.642', '2023-05-05 23:49:55.642');
INSERT INTO `rule_condition` VALUES ('1654513765240627200', '1654513765190295552', 'uri', 'pathPattern', '/', '/admin/admin/keyword/**', '2023-05-05 23:49:55.669', '2023-05-05 23:49:55.669');
INSERT INTO `rule_condition` VALUES ('1654513765332901888', '1654513765316124672', 'uri', 'pathPattern', '/', '/admin/admin/issue/**', '2023-05-05 23:49:55.691', '2023-05-05 23:49:55.691');
INSERT INTO `rule_condition` VALUES ('1654513765425176576', '1654513765412593664', 'uri', 'pathPattern', '/', '/admin/admin/order/**', '2023-05-05 23:49:55.713', '2023-05-05 23:49:55.713');
INSERT INTO `rule_condition` VALUES ('1654513765496479744', '1654513765479702528', 'uri', 'pathPattern', '/', '/admin/admin/index/**', '2023-05-05 23:49:55.730', '2023-05-05 23:49:55.730');
INSERT INTO `rule_condition` VALUES ('1654513765601337344', '1654513765576171520', 'uri', 'pathPattern', '/', '/admin/admin/address/**', '2023-05-05 23:49:55.755', '2023-05-05 23:49:55.755');
INSERT INTO `rule_condition` VALUES ('1654513765685223424', '1654513765672640512', 'uri', 'pathPattern', '/', '/admin/admin/feedback/**', '2023-05-05 23:49:55.775', '2023-05-05 23:49:55.775');
INSERT INTO `rule_condition` VALUES ('1654513765748137984', '1654513765735555072', 'uri', 'pathPattern', '/', '/admin/admin/dashboard/**', '2023-05-05 23:49:55.790', '2023-05-05 23:49:55.790');
INSERT INTO `rule_condition` VALUES ('1654513765827829760', '1654513765811052544', 'uri', 'pathPattern', '/', '/admin/wx/article/**', '2023-05-05 23:49:55.809', '2023-05-05 23:49:55.809');
INSERT INTO `rule_condition` VALUES ('1654513765915910144', '1654513765903327232', 'uri', 'pathPattern', '/', '/admin/admin/coupon/**', '2023-05-05 23:49:55.830', '2023-05-05 23:49:55.830');
INSERT INTO `rule_condition` VALUES ('1654513791039791104', '1654513791018819584', 'uri', 'pathPattern', '/', '/user/wx/comment/**', '2023-05-05 23:50:01.820', '2023-05-05 23:50:01.820');
INSERT INTO `rule_condition` VALUES ('1654513791144648704', '1654513791132065792', 'uri', 'pathPattern', '/', '/user/**', '2023-05-05 23:50:01.845', '2023-05-05 23:50:01.845');
INSERT INTO `rule_condition` VALUES ('1654513791182397440', '1654513791169814528', 'uri', 'pathPattern', '/', '/user/wx/collect/**', '2023-05-05 23:50:01.854', '2023-05-05 23:50:01.854');
INSERT INTO `rule_condition` VALUES ('1654513791257894912', '1654513791245312000', 'uri', 'pathPattern', '/', '/user/wx/address/**', '2023-05-05 23:50:01.872', '2023-05-05 23:50:01.872');
INSERT INTO `rule_condition` VALUES ('1654513791329198080', '1654513791312420864', 'uri', 'pathPattern', '/', '/user/wx/formid/**', '2023-05-05 23:50:01.889', '2023-05-05 23:50:01.889');
INSERT INTO `rule_condition` VALUES ('1654513791450832896', '1654513791421472768', 'uri', 'pathPattern', '/', '/user/wx/brokerage/**', '2023-05-05 23:50:01.918', '2023-05-05 23:50:01.918');
INSERT INTO `rule_condition` VALUES ('1654513791526330368', '1654513791513747456', 'uri', 'pathPattern', '/', '/user/wx/user/**', '2023-05-05 23:50:01.936', '2023-05-05 23:50:01.936');
INSERT INTO `rule_condition` VALUES ('1654513791593439232', '1654513791585050624', 'uri', 'pathPattern', '/', '/user/wx/index/**', '2023-05-05 23:50:01.952', '2023-05-05 23:50:01.952');
INSERT INTO `rule_condition` VALUES ('1654513791664742400', '1654513791652159488', 'uri', 'pathPattern', '/', '/user/wx/home/**', '2023-05-05 23:50:01.969', '2023-05-05 23:50:01.969');
INSERT INTO `rule_condition` VALUES ('1654513791752822784', '1654513791731851264', 'uri', 'pathPattern', '/', '/user/wx/footprint/**', '2023-05-05 23:50:01.990', '2023-05-05 23:50:01.990');
INSERT INTO `rule_condition` VALUES ('1654513791832514560', '1654513791815737344', 'uri', 'pathPattern', '/', '/user/wx/auth/**', '2023-05-05 23:50:02.009', '2023-05-05 23:50:02.009');
INSERT INTO `rule_condition` VALUES ('1654513791912206336', '1654513791895429120', 'uri', 'pathPattern', '/', '/user/wx/agency/**', '2023-05-05 23:50:02.028', '2023-05-05 23:50:02.028');

-- ----------------------------
-- Table structure for selector
-- ----------------------------
DROP TABLE IF EXISTS `selector`;
CREATE TABLE `selector`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id varchar',
  `plugin_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'plugin id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'selector name',
  `match_mode` int NOT NULL COMMENT 'matching mode (0 and 1 or)',
  `type` int NOT NULL COMMENT 'type (0, full flow, 1 custom flow)',
  `sort` int NOT NULL COMMENT 'sort',
  `handle` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'processing logic (here for different plug-ins, there will be different fields to identify different processes, all data in JSON format is stored)',
  `enabled` tinyint NOT NULL COMMENT 'whether to open (0 close, 1 open) ',
  `loged` tinyint NOT NULL COMMENT 'whether to print the log (0 no print, 1 print) ',
  `continued` tinyint NOT NULL COMMENT 'whether to continue execution',
  `match_restful` tinyint NOT NULL DEFAULT 0 COMMENT 'whether to match restful(0 cache, 1 not cache)',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of selector
-- ----------------------------
INSERT INTO `selector` VALUES ('1652998411555094528', '5', '/third', 0, 1, 1, '[]', 1, 1, 1, 0, '2023-05-01 19:28:27.195', '2023-05-01 19:28:27.195');
INSERT INTO `selector` VALUES ('1653048828116779008', '5', '/search', 0, 1, 1, '[]', 1, 1, 1, 0, '2023-05-01 22:48:47.434', '2023-05-01 22:48:47.434');
INSERT INTO `selector` VALUES ('1653048852812840960', '5', '/coupon', 0, 1, 1, '[]', 1, 1, 1, 0, '2023-05-01 22:48:53.330', '2023-05-01 22:48:53.330');
INSERT INTO `selector` VALUES ('1653048885171896320', '5', '/groupon', 0, 1, 1, '[]', 1, 1, 1, 0, '2023-05-01 22:49:01.045', '2023-05-01 22:49:01.045');
INSERT INTO `selector` VALUES ('1654502266077859840', '14', '/search', 0, 1, 1, '', 1, 1, 1, 0, '2023-05-05 23:04:14.055', '2023-05-05 23:04:14.055');
INSERT INTO `selector` VALUES ('1654502286193741824', '14', '/third', 0, 1, 1, '', 1, 1, 1, 0, '2023-05-05 23:04:18.851', '2023-05-05 23:04:18.851');
INSERT INTO `selector` VALUES ('1654513588417159168', '5', '/product', 0, 1, 1, '[]', 1, 1, 1, 0, '2023-05-05 23:49:13.510', '2023-05-05 23:49:13.510');
INSERT INTO `selector` VALUES ('1654513588664623104', '14', '/product', 0, 1, 1, '', 1, 1, 1, 0, '2023-05-05 23:49:13.570', '2023-05-05 23:49:13.570');
INSERT INTO `selector` VALUES ('1654513640049041408', '5', '/order', 0, 1, 1, '[]', 1, 1, 1, 0, '2023-05-05 23:49:25.821', '2023-05-05 23:49:25.821');
INSERT INTO `selector` VALUES ('1654513640258756608', '14', '/order', 0, 1, 1, '', 1, 1, 1, 0, '2023-05-05 23:49:25.871', '2023-05-05 23:49:25.871');
INSERT INTO `selector` VALUES ('1654513646042701824', '14', '/groupon', 0, 1, 1, '', 1, 1, 1, 0, '2023-05-05 23:49:27.250', '2023-05-05 23:49:27.250');
INSERT INTO `selector` VALUES ('1654513670814261248', '14', '/coupon', 0, 1, 1, '', 1, 1, 1, 0, '2023-05-05 23:49:33.156', '2023-05-05 23:49:33.156');
INSERT INTO `selector` VALUES ('1654513703102013440', '5', '/cart', 0, 1, 1, '[]', 1, 1, 1, 0, '2023-05-05 23:49:40.854', '2023-05-05 23:49:40.854');
INSERT INTO `selector` VALUES ('1654513703232036864', '14', '/cart', 0, 1, 1, '', 1, 1, 1, 0, '2023-05-05 23:49:40.885', '2023-05-05 23:49:40.885');
INSERT INTO `selector` VALUES ('1654513763042811904', '5', '/admin', 0, 1, 1, '[]', 1, 1, 1, 0, '2023-05-05 23:49:55.145', '2023-05-05 23:49:55.145');
INSERT INTO `selector` VALUES ('1654513763260915712', '14', '/admin', 0, 1, 1, '', 1, 1, 1, 0, '2023-05-05 23:49:55.197', '2023-05-05 23:49:55.197');
INSERT INTO `selector` VALUES ('1654513790964293632', '5', '/user', 0, 1, 1, '[]', 1, 1, 1, 0, '2023-05-05 23:50:01.802', '2023-05-05 23:50:01.802');
INSERT INTO `selector` VALUES ('1654513791085928448', '14', '/user', 0, 1, 1, '', 1, 1, 1, 0, '2023-05-05 23:50:01.831', '2023-05-05 23:50:01.831');

-- ----------------------------
-- Table structure for selector_condition
-- ----------------------------
DROP TABLE IF EXISTS `selector_condition`;
CREATE TABLE `selector_condition`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `selector_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'selector id',
  `param_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'parameter type (to query uri, etc.)',
  `operator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'matching character (=> <like matching)',
  `param_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'parameter name',
  `param_value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'parameter value',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of selector_condition
-- ----------------------------
INSERT INTO `selector_condition` VALUES ('1652998411588648960', '1652998411555094528', 'uri', 'startsWith', '/', '/third/', '2023-05-01 19:28:27.205', '2023-05-01 19:28:27.205');
INSERT INTO `selector_condition` VALUES ('1653048830247485440', '1653048828116779008', 'uri', 'startsWith', '/', '/search/', '2023-05-01 22:48:47.949', '2023-05-01 22:48:47.949');
INSERT INTO `selector_condition` VALUES ('1653048876766511104', '1653048852812840960', 'uri', 'startsWith', '/', '/coupon/', '2023-05-01 22:48:59.041', '2023-05-01 22:48:59.041');
INSERT INTO `selector_condition` VALUES ('1653048893216571392', '1653048885171896320', 'uri', 'startsWith', '/', '/groupon/', '2023-05-01 22:49:02.963', '2023-05-01 22:49:02.963');
INSERT INTO `selector_condition` VALUES ('1654502266375655424', '1654502266077859840', 'uri', 'startsWith', '/', '/search/', '2023-05-05 23:04:14.126', '2023-05-05 23:04:14.126');
INSERT INTO `selector_condition` VALUES ('1654502286311182336', '1654502286193741824', 'uri', 'startsWith', '/', '/third/', '2023-05-05 23:04:18.879', '2023-05-05 23:04:18.879');
INSERT INTO `selector_condition` VALUES ('1654513588438130688', '1654513588417159168', 'uri', 'startsWith', '/', '/product/', '2023-05-05 23:49:13.516', '2023-05-05 23:49:13.516');
INSERT INTO `selector_condition` VALUES ('1654513588685594624', '1654513588664623104', 'uri', 'startsWith', '/', '/product/', '2023-05-05 23:49:13.575', '2023-05-05 23:49:13.575');
INSERT INTO `selector_condition` VALUES ('1654513640070012928', '1654513640049041408', 'uri', 'startsWith', '/', '/order/', '2023-05-05 23:49:25.826', '2023-05-05 23:49:25.826');
INSERT INTO `selector_condition` VALUES ('1654513640279728128', '1654513640258756608', 'uri', 'startsWith', '/', '/order/', '2023-05-05 23:49:25.876', '2023-05-05 23:49:25.876');
INSERT INTO `selector_condition` VALUES ('1654513646059479040', '1654513646042701824', 'uri', 'startsWith', '/', '/groupon/', '2023-05-05 23:49:27.254', '2023-05-05 23:49:27.254');
INSERT INTO `selector_condition` VALUES ('1654513670831038464', '1654513670814261248', 'uri', 'startsWith', '/', '/coupon/', '2023-05-05 23:49:33.160', '2023-05-05 23:49:33.160');
INSERT INTO `selector_condition` VALUES ('1654513703118790656', '1654513703102013440', 'uri', 'startsWith', '/', '/cart/', '2023-05-05 23:49:40.858', '2023-05-05 23:49:40.858');
INSERT INTO `selector_condition` VALUES ('1654513703248814080', '1654513703232036864', 'uri', 'startsWith', '/', '/cart/', '2023-05-05 23:49:40.889', '2023-05-05 23:49:40.889');
INSERT INTO `selector_condition` VALUES ('1654513763101532160', '1654513763042811904', 'uri', 'startsWith', '/', '/admin/', '2023-05-05 23:49:55.159', '2023-05-05 23:49:55.159');
INSERT INTO `selector_condition` VALUES ('1654513763281887232', '1654513763260915712', 'uri', 'startsWith', '/', '/admin/', '2023-05-05 23:49:55.202', '2023-05-05 23:49:55.202');
INSERT INTO `selector_condition` VALUES ('1654513790985265152', '1654513790964293632', 'uri', 'startsWith', '/', '/user/', '2023-05-05 23:50:01.807', '2023-05-05 23:50:01.807');
INSERT INTO `selector_condition` VALUES ('1654513791106899968', '1654513791085928448', 'uri', 'startsWith', '/', '/user/', '2023-05-05 23:50:01.836', '2023-05-05 23:50:01.836');

-- ----------------------------
-- Table structure for shenyu_dict
-- ----------------------------
DROP TABLE IF EXISTS `shenyu_dict`;
CREATE TABLE `shenyu_dict`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'type',
  `dict_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'dictionary encoding',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'dictionary name',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'dictionary value',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'dictionary description or remarks',
  `sort` int NOT NULL COMMENT 'sort',
  `enabled` tinyint NULL DEFAULT NULL COMMENT 'whether it is enabled (0 close, 1 open) ',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dict_type_dict_code_dict_name`(`type`, `dict_code`, `dict_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shenyu_dict
-- ----------------------------
INSERT INTO `shenyu_dict` VALUES ('1529402613191589888', 'degradeRuleGrade', 'DEGRADE_GRADE_RT', 'slow call ratio', '0', 'degrade type-slow call ratio', 1, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613191589889', 'degradeRuleGrade', 'DEGRADE_GRADE_EXCEPTION_RATIO', 'exception ratio', '1', 'degrade type-abnormal ratio', 0, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613191589890', 'degradeRuleGrade', 'DEGRADE_GRADE_EXCEPTION_COUNT', 'exception number strategy', '2', 'degrade type-abnormal number strategy', 2, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613191589891', 'flowRuleGrade', 'FLOW_GRADE_QPS', 'QPS', '1', 'grade type-QPS', 0, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613191589892', 'flowRuleGrade', 'FLOW_GRADE_THREAD', 'number of concurrent threads', '0', 'degrade type-number of concurrent threads', 1, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613191589893', 'flowRuleControlBehavior', 'CONTROL_BEHAVIOR_DEFAULT', 'direct rejection by default', '0', 'control behavior-direct rejection by default', 0, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613191589894', 'flowRuleControlBehavior', 'CONTROL_BEHAVIOR_WARM_UP', 'warm up', '1', 'control behavior-warm up', 1, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613191589895', 'flowRuleControlBehavior', 'CONTROL_BEHAVIOR_RATE_LIMITER', 'constant speed queuing', '2', 'control behavior-uniform speed queuing', 2, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613191589896', 'flowRuleControlBehavior', 'CONTROL_BEHAVIOR_WARM_UP_RATE_LIMITER', 'preheating uniformly queued', '3', 'control behavior-preheating uniformly queued', 3, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613191589897', 'permission', 'REJECT', 'reject', 'reject', 'reject', 0, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613191589898', 'permission', 'ALLOW', 'allow', 'allow', 'allow', 1, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613191589899', 'algorithmName', 'ALGORITHM_SLIDINGWINDOW', 'slidingWindow', 'slidingWindow', 'Sliding window algorithm', 0, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613191589900', 'algorithmName', 'ALGORITHM_LEAKYBUCKET', 'leakyBucket', 'leakyBucket', 'Leaky bucket algorithm', 1, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613191589901', 'algorithmName', 'ALGORITHM_CONCURRENT', 'concurrent', 'concurrent', 'Concurrent algorithm', 2, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784192', 'algorithmName', 'ALGORITHM_TOKENBUCKET', 'tokenBucket', 'tokenBucket', 'Token bucket algorithm', 3, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784193', 'loadBalance', 'LOAD_BALANCE', 'roundRobin', 'roundRobin', 'roundRobin', 2, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784194', 'loadBalance', 'LOAD_BALANCE', 'random', 'random', 'random', 1, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784195', 'loadBalance', 'LOAD_BALANCE', 'hash', 'hash', 'hash', 0, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784196', 'status', 'DIVIDE_STATUS', 'close', 'false', 'close', 1, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784197', 'status', 'DIVIDE_STATUS', 'open', 'true', 'open', 0, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784198', 'multiRuleHandle', 'MULTI_RULE_HANDLE', 'multiple rule', '1', 'multiple rule', 1, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784199', 'multiRuleHandle', 'MULTI_RULE_HANDLE', 'single rule', '0', 'single rule', 0, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784200', 'multiSelectorHandle', 'MULTI_SELECTOR_HANDLE', 'multiple handle', '1', 'multiple handle', 1, 1, '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784201', 'multiSelectorHandle', 'MULTI_SELECTOR_HANDLE', 'single handle', '0', 'single handle', 0, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784202', 'matchMode', 'MATCH_MODE', 'and', '0', 'and', 0, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784203', 'matchMode', 'MATCH_MODE', 'or', '1', 'or', 1, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784204', 'operator', 'OPERATOR', 'match', 'match', 'match', 0, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784205', 'operator', 'OPERATOR', '=', '=', '=', 1, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784206', 'operator', 'OPERATOR', 'regex', 'regex', 'regex', 2, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784207', 'operator', 'OPERATOR', 'contains', 'contains', 'contains', 3, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784208', 'operator', 'OPERATOR', 'TimeBefore', 'TimeBefore', 'TimeBefore', 4, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784209', 'operator', 'OPERATOR', 'TimeAfter', 'TimeAfter', 'TimeAfter', 5, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784210', 'operator', 'OPERATOR', 'exclude', 'exclude', 'exclude', 6, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784211', 'operator', 'OPERATOR', 'startsWith', 'startsWith', 'startsWith', 7, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784212', 'operator', 'OPERATOR', 'endsWith', 'endsWith', 'endsWith', 8, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784213', 'paramType', 'PARAM_TYPE', 'post', 'post', 'post', 0, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784214', 'paramType', 'PARAM_TYPE', 'uri', 'uri', 'uri', 1, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784215', 'paramType', 'PARAM_TYPE', 'query', 'query', 'query', 2, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784216', 'paramType', 'PARAM_TYPE', 'host', 'host', 'host', 3, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784217', 'paramType', 'PARAM_TYPE', 'ip', 'ip', 'ip', 4, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784218', 'paramType', 'PARAM_TYPE', 'header', 'header', 'header', 5, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784219', 'paramType', 'PARAM_TYPE', 'cookie', 'cookie', 'cookie', 6, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784220', 'paramType', 'PARAM_TYPE', 'req_method', 'req_method', 'req_method', 7, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784221', 'keyResolverName', 'WHOLE_KEY_RESOLVER', 'whole', 'WHOLE_KEY_RESOLVER', 'Rate limit by all request', 0, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784222', 'keyResolverName', 'REMOTE_ADDRESS_KEY_RESOLVER', 'remoteAddress', 'REMOTE_ADDRESS_KEY_RESOLVER', 'Rate limit by remote address', 1, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784223', 'automaticTransitionFromOpenToHalfOpenEnabled', 'AUTOMATIC_HALF_OPEN', 'open', 'true', '', 1, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784224', 'automaticTransitionFromOpenToHalfOpenEnabled', 'AUTOMATIC_HALF_OPEN', 'close', 'false', '', 2, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784225', 'paramType', 'PARAM_TYPE', 'domain', 'domain', 'domain', 8, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784226', 'strategyName', 'STRATEGY_NAME', 'rsa', 'rsa', 'rsa strategy', 1, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784227', 'way', 'WAY', 'encrypt', 'encrypt', 'encrypt', 1, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784228', 'way', 'WAY', 'decrypt', 'decrypt', 'decrypt', 1, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784229', 'mode', 'MODE', 'cluster', 'cluster', 'cluster', 0, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784230', 'mode', 'MODE', 'sentinel', 'sentinel', 'sentinel', 1, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784231', 'mode', 'MODE', 'standalone', 'standalone', 'standalone', 2, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784232', 'gray', 'GRAY_STATUS', 'close', 'false', 'close', 1, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784233', 'gray', 'GRAY_STATUS', 'open', 'true', 'open', 0, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784234', 'threadpool', 'THREADPOOL', 'shared', 'shared', '', 4, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784235', 'threadpool', 'THREADPOOL', 'fixed', 'fixed', '', 3, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784236', 'threadpool', 'THREADPOOL', 'eager', 'eager', '', 2, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784237', 'threadpool', 'THREADPOOL', 'cached', 'cached', '', 0, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784238', 'threadpool', 'THREADPOOL', 'limited', 'limited', '', 1, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784239', 'retryStrategy', 'RETRY_STRATEGY', 'current', 'current', 'current', 0, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784240', 'retryStrategy', 'RETRY_STRATEGY', 'failover', 'failover', 'failover', 1, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784241', 'table', 'INIT_FLAG', 'status', 'true', 'table(resource,permission) init status', 0, 0, '2022-05-25 18:02:53.000', '2022-05-25 18:02:58.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784242', 'compressAlg', 'COMPRESS_ALG', 'none', 'none', '', 0, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784243', 'compressAlg', 'COMPRESS_ALG', 'LZ4', 'LZ4', '', 1, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784244', 'cacheType', 'CACHE_TYPE_MEMORY', 'memory', 'memory', 'use memory to cache data', 0, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784245', 'cacheType', 'CACHE_TYPE_REDIS', 'redis', 'redis', 'use redis to cache data', 1, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784246', 'threadpool', 'THREADPOOL', 'default', 'default', '', 5, 1, '2022-05-25 18:02:53.000', '2022-05-25 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784247', 'signRequestBody', 'SIGN_REQUEST_BODY', 'close', 'false', 'close', 1, 1, '2022-06-29 10:08:02.000', '2022-06-29 10:08:02.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784248', 'signRequestBody', 'SIGN_REQUEST_BODY', 'open', 'true', 'open', 0, 1, '2022-06-29 10:08:02.000', '2022-06-29 10:08:02.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784271', 'securityProtocol', 'SECURITY_PROTOCOL', 'default', '', '', 0, 1, '2022-09-02 00:00:00.000', '2022-09-02 00:00:00.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784272', 'securityProtocol', 'SECURITY_PROTOCOL', 'SSL', 'SSL', '', 1, 1, '2022-09-02 00:00:00.000', '2022-09-02 00:00:00.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784273', 'securityProtocol', 'SECURITY_PROTOCOL', 'PLAINTEXT', 'PLAINTEXT', '', 2, 1, '2022-09-02 00:00:00.000', '2022-09-02 00:00:00.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784274', 'securityProtocol', 'SECURITY_PROTOCOL', 'SASL_PLAINTEXT', 'SASL_PLAINTEXT', '', 3, 1, '2022-09-02 00:00:00.000', '2022-09-02 00:00:00.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784275', 'securityProtocol', 'SECURITY_PROTOCOL', 'SASL_SSL', 'SASL_SSL', '', 4, 1, '2022-09-02 00:00:00.000', '2022-09-02 00:00:00.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784276', 'saslMechanism', 'SASL_MECHANISM', 'default', '', '', 0, 1, '2022-09-02 00:00:00.000', '2022-09-02 00:00:00.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784277', 'saslMechanism', 'SASL_MECHANISM', 'GSSAPI', 'GSSAPI', '', 1, 1, '2022-09-02 00:00:00.000', '2022-09-02 00:00:00.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784278', 'saslMechanism', 'SASL_MECHANISM', 'PLAIN', 'PLAIN', '', 2, 1, '2022-09-02 00:00:00.000', '2022-09-02 00:00:00.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784279', 'saslMechanism', 'SASL_MECHANISM', 'OAUTHBEARER', 'OAUTHBEARER', '', 3, 1, '2022-09-02 00:00:00.000', '2022-09-02 00:00:00.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784280', 'saslMechanism', 'SASL_MECHANISM', 'SCRAM-SHA-256', 'SCRAM-SHA-256', '', 4, 1, '2022-09-02 00:00:00.000', '2022-09-02 00:00:00.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784281', 'saslMechanism', 'SASL_MECHANISM', 'SCRAM-SHA-512', 'SCRAM-SHA-512', '', 5, 1, '2022-09-02 00:00:00.000', '2022-09-02 00:00:00.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784282', 'addPrefixed', 'ADD_PREFIXED', 'open', 'true', '', 0, 1, '2022-09-27 12:00:00.000', '2022-09-27 12:00:00.000');
INSERT INTO `shenyu_dict` VALUES ('1529402613195784283', 'addPrefixed', 'ADD_PREFIXED', 'close', 'false', '', 1, 1, '2022-09-27 12:00:00.000', '2022-09-27 12:00:00.000');
INSERT INTO `shenyu_dict` VALUES ('1545811989312315392', 'apidoc', 'API_DOC_GLOBAL_FLAG', 'status', 'true', 'Global switching (on or off) of API documents.', 0, 1, '2022-07-10 00:47:52.000', '2022-07-10 00:47:52.000');
INSERT INTO `shenyu_dict` VALUES ('1545812101056962560', 'apidocEnv', 'ENV_LABEL_OFFLINE', 'Offline', 'http://127.0.0.1:9195', 'Offline environment', 0, 1, '2022-07-10 00:48:19.000', '2022-07-10 00:48:19.000');
INSERT INTO `shenyu_dict` VALUES ('1545812228228259840', 'apidocEnv', 'ENV_LABEL_ONLINE', 'Online', 'http://127.0.0.1:9196', 'Online environment', 1, 1, '2022-07-10 00:48:49.000', '2022-07-10 00:48:49.000');
INSERT INTO `shenyu_dict` VALUES ('1572621145865248768', 'keyword', 'MASK_KEYWORD', 'keyword', 'keyword', '', 0, 1, '2022-09-22 00:17:55.137', '2022-09-22 00:17:55.137');
INSERT INTO `shenyu_dict` VALUES ('1572621497251454976', 'maskType', 'MASKTYPE_ENCRYPT', 'encrypt', 'dataMaskByMD5', '', 0, 1, '2022-09-22 00:19:17.595', '2022-09-22 00:19:17.595');
INSERT INTO `shenyu_dict` VALUES ('1572621587282190336', 'maskType', 'MASKTYPE_REPLACE', 'replace', 'dataMaskByCharReplace', '', 0, 1, '2022-09-22 00:19:39.060', '2022-09-22 00:19:39.060');
INSERT INTO `shenyu_dict` VALUES ('1572621912915369984', 'maskStatus', 'MASK_STATUS_FALSE', 'notmask', 'false', '', 0, 1, '2022-09-22 00:20:56.693', '2022-09-22 00:20:56.693');
INSERT INTO `shenyu_dict` VALUES ('1572621976689762304', 'maskStatus', 'MASK_STATUS_TRUE', 'mask', 'true', '', 0, 1, '2022-09-22 00:21:11.924', '2022-09-22 00:21:11.924');
INSERT INTO `shenyu_dict` VALUES ('1572621976689762305', 'engine', 'engine', 'ReplacingMergeTree', 'ReplacingMergeTree', '', 0, 1, '2022-09-22 00:21:11.924', '2022-09-22 00:21:11.924');
INSERT INTO `shenyu_dict` VALUES ('1572621976689762306', 'engine', 'engine', 'MergeTree', 'MergeTree', '', 1, 1, '2022-09-22 00:21:11.924', '2022-09-22 00:21:11.924');
INSERT INTO `shenyu_dict` VALUES ('1572621976689762307', 'loadBalance', 'LOAD_BALANCE', 'leastActive', 'leastActive', 'leastActive', 3, 1, '2023-01-17 18:02:52.000', '2023-01-17 18:02:52.000');
INSERT INTO `shenyu_dict` VALUES ('1572621976689762308', 'loadBalance', 'LOAD_BALANCE', 'p2c', 'p2c', 'p2c', 4, 1, '2023-03-07 22:12:12.000', '2023-03-07 22:12:12.000');
INSERT INTO `shenyu_dict` VALUES ('1572621976689762309', 'loadBalance', 'LOAD_BALANCE', 'shortestResponse', 'shortestResponse', 'shortestResponse', 5, 1, '2023-03-17 10:12:12.000', '2023-03-17 10:12:12.000');
INSERT INTO `shenyu_dict` VALUES ('1629402613195884212', 'operator', 'OPERATOR', 'pathPattern', 'pathPattern', 'pathPattern', 9, 1, '2022-07-19 18:02:53.000', '2022-07-19 18:02:53.000');
INSERT INTO `shenyu_dict` VALUES ('1630761573833920512', 'mapType', 'mapType', 'all', 'all', '', 1, 1, '2023-03-01 10:47:11.000', '2023-03-01 10:47:11.000');
INSERT INTO `shenyu_dict` VALUES ('1630761984393367552', 'mapType', 'mapType', 'field', 'field', '', 1, 1, '2023-03-01 10:48:49.000', '2023-03-01 10:48:49.000');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'tag name',
  `tag_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'tag description',
  `parent_tag_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'parent tag_id',
  `ext` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'extension info',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'api doc tag table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tag
-- ----------------------------

-- ----------------------------
-- Table structure for tag_relation
-- ----------------------------
DROP TABLE IF EXISTS `tag_relation`;
CREATE TABLE `tag_relation`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `api_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'api id',
  `tag_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'tag id',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'api doc and tag bind table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tag_relation
-- ----------------------------

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key id',
  `user_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'user primary key',
  `role_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'role primary key',
  `date_created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'create time',
  `date_updated` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'user and role bind table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1351007709096976384', '1', '1346358560427216896', '2022-05-25 18:02:52.000', '2022-05-25 18:02:52.000');

SET FOREIGN_KEY_CHECKS = 1;