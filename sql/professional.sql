/*
Navicat MySQL Data Transfer

Source Server         : mysql localhost
Source Server Version : 50535
Source Host           : localhost:3306
Source Database       : tas

Target Server Type    : MYSQL
Target Server Version : 50535
File Encoding         : 65001

Date: 2019-06-03 17:34:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for professional
-- ----------------------------
DROP TABLE IF EXISTS `professional`;
CREATE TABLE `professional` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
