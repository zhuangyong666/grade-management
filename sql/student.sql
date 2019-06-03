/*
Navicat MySQL Data Transfer

Source Server         : mysql localhost
Source Server Version : 50535
Source Host           : localhost:3306
Source Database       : tas

Target Server Type    : MYSQL
Target Server Version : 50535
File Encoding         : 65001

Date: 2019-06-03 17:34:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `professional_id` int(11) DEFAULT NULL,
  `clazz_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
