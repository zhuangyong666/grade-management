/*
Navicat MySQL Data Transfer

Source Server         : mysql localhost
Source Server Version : 50535
Source Host           : localhost:3306
Source Database       : tas

Target Server Type    : MYSQL
Target Server Version : 50535
File Encoding         : 65001

Date: 2019-06-03 17:35:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dic
-- ----------------------------
DROP TABLE IF EXISTS `sys_dic`;
CREATE TABLE `sys_dic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `key` int(11) DEFAULT NULL,
  `val` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dic
-- ----------------------------
INSERT INTO `sys_dic` VALUES ('1', 'sex', '1', '男');
INSERT INTO `sys_dic` VALUES ('2', 'sex', '2', '女');
