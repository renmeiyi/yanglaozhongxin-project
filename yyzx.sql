/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : yyzx

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 13/09/2024 23:55:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bed_management
-- ----------------------------
DROP TABLE IF EXISTS `bed_management`;
CREATE TABLE `bed_management`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `record_number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `gender` enum('男','女') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `bed_start_date` date NULL DEFAULT NULL,
  `bed_end_date` date NULL DEFAULT NULL,
  `bed_details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT 'now()',
  `updated_at` timestamp(0) NULL DEFAULT 'now()' ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bed_management
-- ----------------------------
INSERT INTO `bed_management` VALUES (1, '占用', '张7', '男', '2023-12-24', '2024-03-23', '1102-01', '2024-09-11 08:10:28', '2024-09-12 02:21:32');
INSERT INTO `bed_management` VALUES (2, '占用', '李四', '女', '2024-02-13', '2024-04-28', '1103-02', '2024-09-11 08:10:28', '2024-09-11 08:10:28');
INSERT INTO `bed_management` VALUES (3, '占用', '王五', '男', '2024-02-28', NULL, '1104-03', '2024-09-11 08:10:28', '2024-09-11 08:10:28');
INSERT INTO `bed_management` VALUES (4, '无人', '空床位', NULL, NULL, NULL, '1103-03', '2024-09-11 08:49:37', '2024-09-12 12:46:43');
INSERT INTO `bed_management` VALUES (5, '占用', '孙七', '男', '2024-05-18', NULL, '1106-05', '2024-09-11 08:10:28', '2024-09-11 08:10:28');
INSERT INTO `bed_management` VALUES (9, '无人', '空床位', NULL, NULL, NULL, '1104-04', '2024-09-11 08:49:37', '2024-09-11 08:49:37');
INSERT INTO `bed_management` VALUES (10, '无人', '空床位', NULL, NULL, NULL, '1105-05', '2024-09-11 08:49:37', '2024-09-11 08:49:37');
INSERT INTO `bed_management` VALUES (12, '占用', '波波', '男', NULL, NULL, '1301-2', '2024-09-12 03:26:27', '2024-09-12 03:26:27');
INSERT INTO `bed_management` VALUES (13, '占用', '九九', '女', '2024-09-14', '2024-09-20', '1301-2', '2024-09-12 07:11:24', '2024-09-12 07:11:24');

-- ----------------------------
-- Table structure for check_out
-- ----------------------------
DROP TABLE IF EXISTS `check_out`;
CREATE TABLE `check_out`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `customer_id` int(0) NOT NULL COMMENT '客户ID',
  `check_out_date` datetime(6) NULL DEFAULT NULL COMMENT '退住时间',
  `check_out_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '退住类型',
  `check_out_reason` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '退住原因',
  `is_deleted` int(0) NULL DEFAULT 0 COMMENT '逻辑删除',
  `application_date` datetime(6) NULL DEFAULT NULL COMMENT '申请时间',
  `review_comments` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核意见',
  `reviewer` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核人',
  `review_date` datetime(6) NULL DEFAULT NULL COMMENT '审核时间',
  `remarks` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `review_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '待审核' COMMENT '审核状态：通过、不通过、撤销',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '退住登记表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of check_out
-- ----------------------------
INSERT INTO `check_out` VALUES (12, 4, '2024-09-13 00:00:00.000000', '正常退住', '身体康复', 1, '2024-09-11 00:00:00.000000', NULL, NULL, NULL, NULL, '通过');
INSERT INTO `check_out` VALUES (13, 4, '2024-09-13 00:00:00.000000', '正常退住', '身体康复', 0, '2024-09-11 00:00:00.000000', '无', NULL, '2024-09-13 00:00:00.000000', NULL, '通过');
INSERT INTO `check_out` VALUES (14, 14, NULL, '正常退住', '2024-09-13', 1, NULL, NULL, NULL, NULL, NULL, '待审核');
INSERT INTO `check_out` VALUES (15, 16, NULL, '保留床位', 'ZXC', 1, NULL, NULL, NULL, NULL, NULL, '通过');
INSERT INTO `check_out` VALUES (16, 18, NULL, '正常退住', '', 1, '2024-09-07 00:00:00.000000', NULL, NULL, NULL, NULL, '待审核');
INSERT INTO `check_out` VALUES (17, 5, NULL, '正常退住', 'Kangfy', 1, NULL, NULL, NULL, NULL, NULL, '待审核');
INSERT INTO `check_out` VALUES (18, 15, NULL, '正常退住', 'QQQ', 1, '2024-09-01 00:00:00.000000', NULL, NULL, NULL, NULL, '待审核');
INSERT INTO `check_out` VALUES (19, 14, NULL, '保留床位', 'QQQQQQQQQQ', 1, '2024-09-12 00:00:00.000000', NULL, NULL, NULL, NULL, '待审核');
INSERT INTO `check_out` VALUES (20, 15, NULL, '死亡退住', 'ASDF', 1, '2024-09-06 00:00:00.000000', NULL, NULL, NULL, NULL, '待审核');
INSERT INTO `check_out` VALUES (21, 3, '2024-09-01 00:00:00.000000', '正常退住', '身体康复', 0, '2024-08-29 00:00:00.000000', '无', NULL, '2024-09-12 00:00:00.000000', NULL, '通过');
INSERT INTO `check_out` VALUES (22, 4, '2024-09-13 00:00:00.000000', '正常退住', '身体康复', 1, '2024-09-11 00:00:00.000000', NULL, NULL, NULL, NULL, '通过');
INSERT INTO `check_out` VALUES (23, 4, '2024-09-13 00:00:00.000000', '正常退住', '身体康复', 0, '2024-09-11 00:00:00.000000', '无', NULL, '2024-09-13 00:00:00.000000', NULL, '通过');
INSERT INTO `check_out` VALUES (24, 14, NULL, '正常退住', '2024-09-13', 1, NULL, NULL, NULL, NULL, NULL, '待审核');
INSERT INTO `check_out` VALUES (25, 16, NULL, '保留床位', 'ZXC', 1, NULL, NULL, NULL, NULL, NULL, '通过');
INSERT INTO `check_out` VALUES (26, 18, NULL, '正常退住', '', 1, '2024-09-07 00:00:00.000000', NULL, NULL, NULL, NULL, '待审核');
INSERT INTO `check_out` VALUES (27, 5, NULL, '正常退住', 'Kangfy', 1, NULL, NULL, NULL, NULL, NULL, '待审核');
INSERT INTO `check_out` VALUES (28, 15, NULL, '正常退住', 'QQQ', 1, '2024-09-01 00:00:00.000000', NULL, NULL, NULL, NULL, '待审核');
INSERT INTO `check_out` VALUES (29, 14, NULL, '保留床位', 'QQQQQQQQQQ', 1, '2024-09-12 00:00:00.000000', NULL, NULL, NULL, NULL, '待审核');
INSERT INTO `check_out` VALUES (30, 15, NULL, '死亡退住', 'ASDF', 1, '2024-09-06 00:00:00.000000', NULL, NULL, NULL, NULL, '待审核');
INSERT INTO `check_out` VALUES (31, 3, '2024-09-01 00:00:00.000000', '正常退住', '身体康复', 0, '2024-08-29 00:00:00.000000', '无', NULL, '2024-09-12 00:00:00.000000', NULL, '通过');
INSERT INTO `check_out` VALUES (32, 5, '2024-07-12 00:00:00.000000', '正常退住', '想退', 0, '2024-06-30 00:00:00.000000', '无', NULL, '2024-07-01 00:00:00.000000', NULL, '通过');
INSERT INTO `check_out` VALUES (33, 16, NULL, '正常退住', '213321', 1, NULL, NULL, NULL, '2024-09-21 00:00:00.000000', NULL, '通过');
INSERT INTO `check_out` VALUES (34, 14, '2024-09-22 00:00:00.000000', '正常退住', NULL, 1, NULL, '已通过', NULL, NULL, NULL, '通过');
INSERT INTO `check_out` VALUES (35, 14, NULL, '正常退住', NULL, 1, NULL, NULL, NULL, NULL, NULL, '待审核');
INSERT INTO `check_out` VALUES (36, 14, '2024-09-13 00:00:00.000000', '正常退住', '康复出院', 0, '2024-09-22 00:00:00.000000', NULL, NULL, NULL, NULL, '待审核');
INSERT INTO `check_out` VALUES (37, 4, '2024-09-14 00:00:00.000000', '正常退住', '康复', 0, '2024-09-15 00:00:00.000000', '通过审核', NULL, '2024-09-14 00:00:00.000000', NULL, '通过');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(0) NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` int(0) NULL DEFAULT NULL,
  `is_deleted` int(0) NULL DEFAULT 0 COMMENT '逻辑删除',
  `customer_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `customer_age` int(0) NULL DEFAULT NULL COMMENT '年龄',
  `customer_sex` int(0) NULL DEFAULT NULL COMMENT '性别',
  `idcard` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `room_number` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '房间号',
  `building_id` int(0) NULL DEFAULT NULL COMMENT '楼号',
  `record_id` int(0) NULL DEFAULT NULL COMMENT '档案号',
  `elder_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '老人类型',
  `checkin_date` datetime(6) NULL DEFAULT NULL,
  `expiration_date` datetime(6) NULL DEFAULT NULL,
  `contact_tel` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电话',
  `bed_id` int(0) NULL DEFAULT NULL COMMENT '床号',
  `psychosomatic_state` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `attention` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `birthday` date NULL DEFAULT NULL,
  `height` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '身高',
  `marital_status` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `weight` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '体重',
  `blood_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '血型',
  `filepath` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, '1900-01-20 00:00:00.000000', NULL, '1900-01-20 00:00:00.000000', NULL, 1, '老王', 11, 1, '652424', '', NULL, NULL, '', NULL, NULL, '', NULL, '', '', NULL, '', '', '', '', '');
INSERT INTO `customer` VALUES (2, '1900-01-20 16:56:45.691000', 1, '1900-01-20 16:56:45.809000', 1, 0, '小张', 20, 1, '445242', '', NULL, NULL, '', NULL, NULL, '', NULL, '', '', NULL, '', '', '', 'AB', '');
INSERT INTO `customer` VALUES (3, '1900-01-20 10:30:30.113759', 0, '1900-01-20 10:30:30.115760', 0, 0, '李艳', 63, 0, '210102195505051253', '101', 1, 1102, '', '1900-01-20 00:00:00.000000', '1900-01-20 00:00:00.000000', '13901020304', 1, '', '', '1900-01-19', '162', '1', '76', '0', '');
INSERT INTO `customer` VALUES (4, '1900-01-20 00:00:00.000000', NULL, NULL, NULL, 0, '老孙', 90, 0, '521234556', '144', 11, 49, '', NULL, NULL, '1245642', NULL, '', '', NULL, '', '', '', '', '');
INSERT INTO `customer` VALUES (5, '1900-01-20 00:00:00.000000', NULL, NULL, NULL, 0, '老李', 55, 1, '425424', '', NULL, NULL, '', NULL, NULL, '', NULL, '', '', NULL, '', '', '', '', '');
INSERT INTO `customer` VALUES (6, '1900-01-20 00:00:00.000000', NULL, NULL, NULL, 0, '小王', 90, 0, '4563232352', '144', 11, 88, '', NULL, NULL, '124564245', NULL, '', '', NULL, '', '', '', '', '');
INSERT INTO `customer` VALUES (7, '2024-09-13 00:00:00.000000', NULL, NULL, NULL, 0, '老杜', 44, 1, '6542', '', NULL, NULL, '', '2024-09-15 00:00:00.000000', NULL, '', NULL, '', '', NULL, '', '', '', '', '');
INSERT INTO `customer` VALUES (8, '1900-01-20 00:00:00.000000', NULL, NULL, NULL, 1, '小李', 66, 0, '54222222222', '', NULL, NULL, '', NULL, NULL, '', NULL, '', '', NULL, '', '', '', '', '');
INSERT INTO `customer` VALUES (9, '1900-01-20 00:00:00.000000', NULL, NULL, NULL, 0, '李四', 88, 1, '55555236534', '', NULL, NULL, '', NULL, NULL, '', NULL, '', '', NULL, '', '', '', '', '');
INSERT INTO `customer` VALUES (10, '1900-01-20 00:00:00.000000', NULL, NULL, NULL, 1, '张三', 90, 1, '52123', '121', 11, 45, '活力老人', '1900-01-20 00:00:00.000000', '1900-01-20 00:00:00.000000', '12456', NULL, '', '', NULL, '', '', '', '', '');
INSERT INTO `customer` VALUES (11, '1900-01-20 00:00:00.000000', NULL, NULL, NULL, 1, '王五', 77, 0, '4524242424', '', NULL, NULL, '', NULL, NULL, '', NULL, '', '', NULL, '', '', '', '', '');
INSERT INTO `customer` VALUES (12, '1900-01-20 00:00:00.000000', NULL, NULL, NULL, 1, '吴六', 12, 1, '6545421', '54', 87, 984, '活力老人', NULL, NULL, '', NULL, '', '', NULL, '', '', '', '', '');
INSERT INTO `customer` VALUES (13, '1900-01-20 00:00:00.000000', NULL, NULL, NULL, 1, '王七', 68, 0, '883254363', '', NULL, NULL, '', NULL, NULL, '', NULL, '', '', NULL, '', '', '', '', '');
INSERT INTO `customer` VALUES (14, '2024-09-13 00:00:00.000000', NULL, NULL, NULL, 0, '东东', 73, 0, '88888887', '', NULL, NULL, '', '2024-09-07 00:00:00.000000', NULL, '', NULL, '', '', NULL, '', '', '', '', '');
INSERT INTO `customer` VALUES (15, '2024-09-13 00:00:00.000000', NULL, NULL, NULL, 0, '洋洋', 74, 1, '42453453', '321', 1, NULL, '活力老人', '2024-09-21 00:00:00.000000', '2024-09-22 00:00:00.000000', '2414134334', NULL, '', '测试', NULL, '', '', '', '', '');
INSERT INTO `customer` VALUES (16, '2024-09-13 00:00:00.000000', NULL, NULL, NULL, 0, '七七', 12, 0, '123456', '111', 1, 201, '活力老人', '2024-09-14 00:00:00.000000', '2024-09-28 00:00:00.000000', '', NULL, '', '', NULL, '', '', '', '', '');
INSERT INTO `customer` VALUES (17, '1900-01-20 00:00:00.000000', NULL, NULL, NULL, 0, '嗯呐嗯呐', 86, 1, '842524510', '', NULL, NULL, '', NULL, NULL, '', NULL, '', '', NULL, '', '', '', '', '');
INSERT INTO `customer` VALUES (18, '1900-01-20 00:00:00.000000', NULL, NULL, NULL, 0, '阿巴阿巴', 96, 1, '587552', '', NULL, NULL, '', NULL, NULL, '', NULL, '', '', NULL, '', '', '', '', '');
INSERT INTO `customer` VALUES (19, '1900-01-20 00:00:00.000000', NULL, NULL, NULL, 0, 'kkk', 101, 0, '2542854', '', NULL, NULL, '', NULL, NULL, '', NULL, '', '', NULL, '', '', '', '', '');
INSERT INTO `customer` VALUES (20, NULL, NULL, NULL, NULL, 0, 'AAA', 88, 1, '54240242', '203', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `customer` VALUES (21, '2024-09-13 00:00:00.000000', NULL, NULL, NULL, 1, '八八', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for health_assessment
-- ----------------------------
DROP TABLE IF EXISTS `health_assessment`;
CREATE TABLE `health_assessment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gender` enum('男','女') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` int(0) NOT NULL,
  `id_card` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `contact_info` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `living_status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `last_assessment_date` date NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` int(0) NOT NULL,
  `assessment_result` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of health_assessment
-- ----------------------------
INSERT INTO `health_assessment` VALUES (1, '张三', '男', 73, '15687', '17928554786', '健康', '2024-01-05', '2024-01-05 00:00:00', '2024-09-12 17:28:46', 0, '身体状况良好，血压稳定，需定期检查血糖，多走动。');
INSERT INTO `health_assessment` VALUES (2, '李四', '男', 91, '51548', '16816558954', '正常', '2024-01-05', '2024-01-05 00:00:00', '2024-08-18 00:00:00', 0, '行动自如，记忆力稍减退，建议进行认知训练，建议多晒太阳。');
INSERT INTO `health_assessment` VALUES (3, '王五', '男', 67, '48985', '41554889562', '正常 ', '2024-01-05', '2024-01-05 00:00:00', '2024-10-05 16:50:02', 0, '轻微关节炎，需注意关节保暖，适量运动。');
INSERT INTO `health_assessment` VALUES (4, '阿萨', '男', 58, '15659625', '35489625963', '健康', '2024-01-09', '2024-09-12 15:42:35', '2024-09-12 16:50:02', 0, '心血管健康，需定期进行胆固醇检查。');
INSERT INTO `health_assessment` VALUES (5, '回答vu有', '男', 51, '2148626', '65896514785247', '健康', '2024-09-12', '2024-09-12 15:55:39', '2024-09-12 16:50:02', 0, '视力下降，建议定期眼科检查，配戴老花镜。');
INSERT INTO `health_assessment` VALUES (6, '赵六', '女', 95, '1478548652586524', '245455584', '生病', '2024-09-12', '2024-09-12 22:29:33', '2024-09-12 22:30:41', 0, '饮食清淡，少活动，情绪需要稳定。');
INSERT INTO `health_assessment` VALUES (7, '滴滴', '女', 66, '111805444', '111155542', '生病', '2024-09-14', '2024-09-13 08:50:57', '2024-09-13 21:42:46', 1, '非常好');
INSERT INTO `health_assessment` VALUES (8, '洋洋', '男', 66, '4343432', '2312', '健康', '2024-09-14', '2024-09-13 11:08:08', '2024-09-13 11:08:12', 1, NULL);
INSERT INTO `health_assessment` VALUES (9, '王六', '男', 44, '23213', '2131', '健康', '2024-09-13', '2024-09-13 21:34:35', '2024-09-13 21:34:41', 1, NULL);
INSERT INTO `health_assessment` VALUES (10, '九九', '男', 78, '23255342', '2223', '健康', '2024-09-15', '2024-09-13 21:42:37', '2024-09-13 21:43:31', 0, '测试');

-- ----------------------------
-- Table structure for life
-- ----------------------------
DROP TABLE IF EXISTS `life`;
CREATE TABLE `life`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `number` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `matter` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `a_time` datetime(6) NULL DEFAULT NULL,
  `state` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `t_time` datetime(6) NULL DEFAULT NULL,
  `remark` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `is_deleted` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of life
-- ----------------------------
INSERT INTO `life` VALUES (1, '张六', '2114123', '打扫', '2024-09-13 00:00:00.000000', '未提醒', '2024-09-13 00:00:00.000000', '测试', 0);
INSERT INTO `life` VALUES (2, '张三', '34534534534', '出门旅游', '2024-09-13 00:00:00.000000', '已提醒', '2024-09-13 00:00:00.000000', '北京', 0);
INSERT INTO `life` VALUES (3, '李四', '23423423423', '卖书', '2024-09-13 00:00:00.000000', '已提醒', '2024-09-13 00:00:00.000000', '六本书', 0);
INSERT INTO `life` VALUES (4, '王五', '67867867867', '洗衣服', '2024-09-13 00:00:00.000000', '已提醒', '2024-09-13 00:00:00.000000', '洗衣机', 1);
INSERT INTO `life` VALUES (34, '七七', '21312313', '打扫', '2024-09-13 00:00:00.000000', '已提醒', '2024-09-13 00:00:00.000000', '测试', 1);
INSERT INTO `life` VALUES (35, '琳琳', '213131', '打扫卫生', '2024-09-13 00:00:00.000000', '已提醒', '2024-09-13 00:00:00.000000', '测试数据', 0);
INSERT INTO `life` VALUES (36, '小林', NULL, NULL, '2024-09-13 00:00:00.000000', NULL, '2024-09-13 00:00:00.000000', NULL, 1);

-- ----------------------------
-- Table structure for outing
-- ----------------------------
DROP TABLE IF EXISTS `outing`;
CREATE TABLE `outing`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_id` int(0) NULL DEFAULT NULL COMMENT '外键关联客户登记表',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '老人姓名',
  `outing_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '外出原因',
  `outing_time` datetime(0) NULL DEFAULT NULL COMMENT '外出时间',
  `expected_return` datetime(0) NULL DEFAULT NULL COMMENT '预计返回时间',
  `actual_return` datetime(0) NULL DEFAULT NULL COMMENT '实际返回时间',
  `companion_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '陪同人姓名',
  `elderly_relation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '和老人的关系',
  `companion_contact` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '陪同人联系方式',
  `approval_status` enum('已审批','撤销','待审批') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '待审批' COMMENT '审批状态：已审批、待审批、撤销',
  `approver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '审批人',
  `approval_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '备注',
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` int(0) NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of outing
-- ----------------------------
INSERT INTO `outing` VALUES (1, 1, '李艳', '旅游', '2024-09-11 00:00:00', '2024-09-20 00:00:00', '2024-09-13 00:00:00', '老杜', '母子', '11234', '已审批', NULL, NULL, 'Updated remarks for testing.', '2024-09-13 00:00:00', '2024-09-13 10:18:56', 1);
INSERT INTO `outing` VALUES (2, 3, '李四', '探亲', '2024-09-12 00:00:00', '2024-09-14 00:00:00', '2024-09-13 00:00:00', '李四', '儿子', '13800000000', '已审批', '王五', '2024-09-12 00:00:00', '提前回院，测试', '2024-09-12 00:00:00', '2024-09-12 00:00:00', 0);
INSERT INTO `outing` VALUES (3, NULL, '王七', '突发事件', '2024-09-06 00:00:00', '2024-10-12 00:00:00', '2024-09-28 00:00:00', '小丽', '护工', '19976893', '已审批', NULL, NULL, '测试数据，纯属编撰', '2024-09-12 00:00:00', '2024-09-12 20:14:11', 0);
INSERT INTO `outing` VALUES (4, NULL, '七七', '探亲', '2024-09-13 00:00:00', '2024-09-20 00:00:00', '2024-09-25 00:00:00', '小杜', '护工', '199865472421', '已审批', NULL, NULL, '测试数据，9.13', '2024-09-12 00:00:00', '2024-09-12 00:00:00', 0);
INSERT INTO `outing` VALUES (5, NULL, '老孙', '探亲事件', '2024-09-13 00:00:00', '2024-09-15 00:00:00', '2024-09-15 00:00:00', '111', '护工', '432432', '已审批', NULL, NULL, '测试', '2024-09-13 00:00:00', '2024-09-13 20:59:28', 0);
INSERT INTO `outing` VALUES (6, NULL, '李四', '探亲', NULL, NULL, NULL, '111', '', '', '待审批', NULL, NULL, '测试', '2024-09-13 00:00:00', '2024-09-13 20:57:47', 1);
INSERT INTO `outing` VALUES (7, NULL, '老李', '111', NULL, NULL, NULL, '', '', '', '已审批', NULL, NULL, '', '2024-09-13 00:00:00', '2024-09-13 21:48:38', 1);
INSERT INTO `outing` VALUES (8, NULL, '洋洋', '111', NULL, NULL, NULL, '', '', '', '已审批', NULL, NULL, '', '2024-09-13 00:00:00', '2024-09-13 20:59:28', 0);
INSERT INTO `outing` VALUES (9, NULL, '七七', '111', NULL, NULL, NULL, '', '', '', '已审批', NULL, NULL, '', '2024-09-13 00:00:00', '2024-09-13 20:59:28', 0);
INSERT INTO `outing` VALUES (10, NULL, '七七', '', NULL, NULL, NULL, '', '', '', '已审批', NULL, NULL, '', '2024-09-13 00:00:00', '2024-09-13 21:50:24', 0);
INSERT INTO `outing` VALUES (11, NULL, '老杜', '', NULL, NULL, NULL, '', '', '', '待审批', NULL, NULL, '', '2024-09-13 00:00:00', '2024-09-13 21:48:40', 1);
INSERT INTO `outing` VALUES (12, NULL, '李艳', '', NULL, NULL, NULL, '', '', '', '已审批', NULL, NULL, '', '2024-09-13 00:00:00', '2024-09-13 21:50:24', 0);
INSERT INTO `outing` VALUES (13, NULL, '东东', '突发事件', '2024-09-15 00:00:00', '2024-09-19 00:00:00', '2024-09-15 00:00:00', '小东', '家属', '321321', '已审批', NULL, NULL, '测试数据', '2024-09-13 00:00:00', '2024-09-13 21:50:24', 0);
INSERT INTO `outing` VALUES (14, NULL, '嗯呐嗯呐', '探亲', '2024-09-15 00:00:00', '2024-09-11 00:00:00', NULL, 'zzz', '护工', '2313', '已审批', NULL, NULL, '测试', '2024-09-13 00:00:00', '2024-09-13 21:50:24', 0);

-- ----------------------------
-- Table structure for recovery
-- ----------------------------
DROP TABLE IF EXISTS `recovery`;
CREATE TABLE `recovery`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `record_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `customer_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `customer_gender` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `idcard` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `contact_tel` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `current_address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `living_environment` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `occupation` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `hobbies` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `is_deleted` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recovery
-- ----------------------------
INSERT INTO `recovery` VALUES (1, '412321523544124', '张晓红', '女', '1900-01-20', '2213423123234435', '13167157892', '上海市崇明区', '环境优美', '大堂经理', '跳舞', 0);
INSERT INTO `recovery` VALUES (2, '412321523544124', '田林路', '女', '1900-01-20', '2253463128239435', '13467157392', '上海浦东机场西行200米', '环境嘈杂', '咨询顾问', '茶道', 0);
INSERT INTO `recovery` VALUES (3, '1223', 'lkk', '男', '1900-01-20', '58698741', '123456', '郑州市金水区', '环境优美', '老师', '唱歌', 0);
INSERT INTO `recovery` VALUES (4, '1224', 'lmm', '男', '1900-01-20', '123456', '12548', '郑州市金水区', '环境优美', '老师', '唱歌', 0);
INSERT INTO `recovery` VALUES (5, '1234', 'ljj', '女', '1900-01-20', '88544136', '456985', '郑州市金水区', '环境优美', '老师', '唱歌，跳舞，钢琴', 0);
INSERT INTO `recovery` VALUES (6, '12356', 'lhh', '男', '1900-01-20', '1254652877', '12599', '郑州市金水区', '环境优美', '老师', '唱歌', 0);
INSERT INTO `recovery` VALUES (7, '58469', 'luu', '男', '1900-01-20', '856932145', '1233654', '郑州市金水区', '环境优美', '老师', '跳舞', 0);
INSERT INTO `recovery` VALUES (8, '852369125', 'ltt', '女', '1900-01-20', '125896', '11225', '郑州市金水区', '环境嘈杂', '老师', '跳舞', 0);
INSERT INTO `recovery` VALUES (9, '123551', 'lgg', '女', '1900-01-20', '1122366', '3369884', '郑州市金水区', '环境嘈杂', '老师', '钓鱼', 0);
INSERT INTO `recovery` VALUES (10, 'l1526', 'lss', '女', '1900-01-20', '123654', '123654789', '郑州市金水区', '环境嘈杂', '老师', '插花', 0);
INSERT INTO `recovery` VALUES (11, '45692', 'lww', '女', '1900-01-20', '13658841', '69774563', '郑州市中原区', '环境优美', '教师', '打游戏', 0);
INSERT INTO `recovery` VALUES (12, '3231338', 'kkk', '男', '2024-09-13', '23132313', '22325543', '郑州市金水区', '环境优美', '白领', '跳舞', 0);
INSERT INTO `recovery` VALUES (13, '43243424', 'zz', '男', NULL, '32132137', '231321312', '郑州市金水区', '环境优美', NULL, NULL, 1);
INSERT INTO `recovery` VALUES (14, '31231213', 'zz', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `recovery` VALUES (15, '43244', '王六', '女', '2024-09-13', '2312321', '321321', '郑州市金水区测试', '环境优美', '嘈杂', '游戏', 1);
INSERT INTO `recovery` VALUES (16, '4324324', '九九', '女', '2024-09-06', '3213132143553', '32422323', '郑州市金水区', '环境优美', NULL, '跳舞', 0);

SET FOREIGN_KEY_CHECKS = 1;
