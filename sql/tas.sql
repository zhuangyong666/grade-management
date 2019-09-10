/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : tas

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2019-09-10 17:00:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for clazz
-- ----------------------------
DROP TABLE IF EXISTS `clazz`;
CREATE TABLE `clazz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clazz
-- ----------------------------
INSERT INTO `clazz` VALUES ('1', '电子工程1601');
INSERT INTO `clazz` VALUES ('2', '机械工程1602');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '电路理论实验');
INSERT INTO `course` VALUES ('2', '电工实践');
INSERT INTO `course` VALUES ('3', '数电实验');
INSERT INTO `course` VALUES ('4', '电子实践');

-- ----------------------------
-- Table structure for experiment
-- ----------------------------
DROP TABLE IF EXISTS `experiment`;
CREATE TABLE `experiment` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of experiment
-- ----------------------------
INSERT INTO `experiment` VALUES ('001566916ABE3A2724D5F9B55714F7F5', '实验六');
INSERT INTO `experiment` VALUES ('0703ADEA1D132C9DAC17ECA0B5329D12', '加法器实验');
INSERT INTO `experiment` VALUES ('0822B5171716AE6F5A40B0199868131B', '计数器实验');
INSERT INTO `experiment` VALUES ('1C753EEF1894CB0014DB0A76294038F3', '基本逻辑实验');
INSERT INTO `experiment` VALUES ('1DAAECDC67553BDC71F594C1213BEE0F', '实验二');
INSERT INTO `experiment` VALUES ('2009F40308C186B0B876F428B284EAB7', '实验五');
INSERT INTO `experiment` VALUES ('200F717654D59DA4E9270CEBB003EDDA', '小夜灯焊接');
INSERT INTO `experiment` VALUES ('464C0F3A5D492950DEC44F11ADE3CF2D', '焊接实验');
INSERT INTO `experiment` VALUES ('522A820E72F0730488C34AFF4E42F822', '实验一');
INSERT INTO `experiment` VALUES ('53AEAD5B53D9857A7781A45CB104DAE6', '计数器实验纪律');
INSERT INTO `experiment` VALUES ('5FF618EEEA2B798AC092437CBF59F738', '元件识别实验');
INSERT INTO `experiment` VALUES ('679CC54C8DE83435C26D036D34560F47', '小夜灯装配');
INSERT INTO `experiment` VALUES ('6A0D299308A93F6F010AE14BF9B23157', '基本逻辑实验平时');
INSERT INTO `experiment` VALUES ('7A497D5D1F5CAC4B1A5B8FB93C053B1A', '实验四');
INSERT INTO `experiment` VALUES ('961CAD30FD38791E649B3DEED9FFD2D2', '电机实验');
INSERT INTO `experiment` VALUES ('A12092C8A7010D0B9225D4523EA5296A', '变压器实验');
INSERT INTO `experiment` VALUES ('A3783E2D40D70E21E8EF21A6A24A08A9', '实验测试');
INSERT INTO `experiment` VALUES ('AC7DE84DAE0AF31A2899A01E4257E1D9', '计数器实验平时');
INSERT INTO `experiment` VALUES ('C8D6F16A8DE618E0949D15BB76288502', '双控灯实验');
INSERT INTO `experiment` VALUES ('D5F0334CF18C4D175055F0EF95BEE9DB', '基本逻辑实验纪律');
INSERT INTO `experiment` VALUES ('E47A9202E6ECA1D1155EFE2DF632556D', '实验三');
INSERT INTO `experiment` VALUES ('F7A734DB1514165876C2417600457A5E', '加法器实验平时');
INSERT INTO `experiment` VALUES ('FF3A05CF0513295AD888EFC26059B46B', '实验七');

-- ----------------------------
-- Table structure for experimental_score
-- ----------------------------
DROP TABLE IF EXISTS `experimental_score`;
CREATE TABLE `experimental_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` varchar(2048) DEFAULT NULL,
  `studentId` varchar(32) DEFAULT NULL,
  `courseId` int(11) DEFAULT NULL,
  `semesterId` int(11) DEFAULT NULL,
  `usuallyScoreLevelId` varchar(32) DEFAULT NULL,
  `exScoreLevelId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of experimental_score
-- ----------------------------
INSERT INTO `experimental_score` VALUES ('1', '[{\"experimentalFlag\":1,\"name\":\"实验一成绩\",\"remarks\":\"该学生上课不认真\",\"score\":\"B-\"},{\"experimentalFlag\":0,\"name\":\"实验一平时成绩\",\"remarks\":\"该学生上课不认真\",\"score\":\"差\"},{\"experimentalFlag\":1,\"name\":\"实验二成绩\",\"remarks\":\"123\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"实验二平时成绩\",\"remarks\":\"123\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"实验三成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"实验三平时成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"实验四成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"实验四平时成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"实验五成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"实验五平时成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"实验六成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"实验六平时成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"实验七成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"实验七平时成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"实验测试成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"实验测试平时成绩\",\"remarks\":\"\",\"score\":\"优\"}]', '4D4A0C0A21C3840251F9ECF575516BD5', '1', '1', '24A13CA5879D42EA9E4915CAA25DE666', 'DE1151092C60FF0229DAC3688A124CAB');
INSERT INTO `experimental_score` VALUES ('2', '[{\"experimentalFlag\":1,\"name\":\"实验一成绩\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"实验一平时成绩\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"实验二成绩\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"实验二平时成绩\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"实验三成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"实验三平时成绩\",\"score\":\"差\"},{\"experimentalFlag\":1,\"name\":\"实验四成绩\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"实验四平时成绩\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"实验五成绩\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"实验五平时成绩\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"实验六成绩\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"实验六平时成绩\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"实验七成绩\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"实验七平时成绩\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"实验测试成绩\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"实验测试平时成绩\",\"score\":\"优\"}]', '90A78D1232871DBA773E9E224E2E569C', '1', '1', '24A13CA5879D42EA9E4915CAA25DE666', 'DE1151092C60FF0229DAC3688A124CAB');
INSERT INTO `experimental_score` VALUES ('3', '[{\"experimentalFlag\":1,\"name\":\"实验一成绩\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"实验一平时成绩\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"实验二成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"实验二平时成绩\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"实验三成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"实验三平时成绩\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"实验四成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"实验四平时成绩\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"实验五成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"实验五平时成绩\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"实验六成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"实验六平时成绩\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"实验七成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"实验七平时成绩\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"实验测试成绩\",\"score\":\"B+\"},{\"experimentalFlag\":0,\"name\":\"实验测试平时成绩\",\"score\":\"良\"}]', 'E322BD3F74BCE76D23C8FE3F2D283C47', '1', '1', '24A13CA5879D42EA9E4915CAA25DE666', 'DE1151092C60FF0229DAC3688A124CAB');
INSERT INTO `experimental_score` VALUES ('32', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"非常好\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"非常好\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"电机实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"电机平时成绩\",\"score\":\"优-\"},{\"experimentalFlag\":1,\"name\":\"双控灯实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"双控灯平时成绩\",\"score\":\"优-\"},{\"experimentalFlag\":1,\"name\":\"变压器实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"变压器平时成绩\",\"score\":\"优-\"}]', '4D4A0C0A21C3840251F9ECF575516BD5', '2', '1', 'FD64C4A8EFF0356CA5EE7DFC0CAEE4F7', '18FB64C8655427F200317C2949242AC5');
INSERT INTO `experimental_score` VALUES ('33', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"这人可以的\",\"score\":\"B\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"这人可以的\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"电机实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"电机平时成绩\",\"remarks\":\"\",\"score\":\"优-\"},{\"experimentalFlag\":1,\"name\":\"双控灯实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"双控灯平时成绩\",\"remarks\":\"\",\"score\":\"优-\"},{\"experimentalFlag\":1,\"name\":\"变压器实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"变压器平时成绩\",\"remarks\":\"\",\"score\":\"优-\"}]', '90A78D1232871DBA773E9E224E2E569C', '2', '1', 'FD64C4A8EFF0356CA5EE7DFC0CAEE4F7', '18FB64C8655427F200317C2949242AC5');
INSERT INTO `experimental_score` VALUES ('34', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"score\":\"优-\"},{\"experimentalFlag\":1,\"name\":\"电机实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"电机平时成绩\",\"score\":\"优-\"},{\"experimentalFlag\":1,\"name\":\"双控灯实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"双控灯平时成绩\",\"score\":\"优-\"},{\"experimentalFlag\":1,\"name\":\"变压器实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"变压器平时成绩\",\"score\":\"优-\"}]', 'E322BD3F74BCE76D23C8FE3F2D283C47', '2', '1', 'FD64C4A8EFF0356CA5EE7DFC0CAEE4F7', '18FB64C8655427F200317C2949242AC5');
INSERT INTO `experimental_score` VALUES ('35', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"score\":\"优-\"},{\"experimentalFlag\":1,\"name\":\"电机实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"电机平时成绩\",\"score\":\"优-\"},{\"experimentalFlag\":1,\"name\":\"双控灯实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"双控灯平时成绩\",\"score\":\"优-\"},{\"experimentalFlag\":1,\"name\":\"变压器实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"变压器平时成绩\",\"score\":\"优-\"}]', '8C9D1358B8AEB3FB57934CAAA4A19354', '2', '1', 'FD64C4A8EFF0356CA5EE7DFC0CAEE4F7', '18FB64C8655427F200317C2949242AC5');
INSERT INTO `experimental_score` VALUES ('36', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"score\":\"优-\"},{\"experimentalFlag\":1,\"name\":\"电机实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"电机平时成绩\",\"score\":\"优-\"},{\"experimentalFlag\":1,\"name\":\"双控灯实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"双控灯平时成绩\",\"score\":\"优-\"},{\"experimentalFlag\":1,\"name\":\"变压器实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"变压器平时成绩\",\"score\":\"优-\"}]', '0FE29C14FF02C4AA1CFFF365F29F2050', '2', '1', 'FD64C4A8EFF0356CA5EE7DFC0CAEE4F7', '18FB64C8655427F200317C2949242AC5');
INSERT INTO `experimental_score` VALUES ('37', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"score\":\"优-\"},{\"experimentalFlag\":1,\"name\":\"电机实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"电机平时成绩\",\"score\":\"优-\"},{\"experimentalFlag\":1,\"name\":\"双控灯实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"双控灯平时成绩\",\"score\":\"优-\"},{\"experimentalFlag\":1,\"name\":\"变压器实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"变压器平时成绩\",\"score\":\"优-\"}]', '4C086C42BE0AB7787DC8DAE2E41CE1B9', '2', '1', 'FD64C4A8EFF0356CA5EE7DFC0CAEE4F7', '18FB64C8655427F200317C2949242AC5');
INSERT INTO `experimental_score` VALUES ('38', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"电机实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"电机平时成绩\",\"score\":\"优-\"},{\"experimentalFlag\":1,\"name\":\"双控灯实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"双控灯平时成绩\",\"score\":\"优-\"},{\"experimentalFlag\":1,\"name\":\"变压器实验成绩\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"变压器平时成绩\",\"score\":\"优-\"}]', '99D7A1ACF5486DE7112D09E6EBACFA30', '2', '1', 'FD64C4A8EFF0356CA5EE7DFC0CAEE4F7', '18FB64C8655427F200317C2949242AC5');
INSERT INTO `experimental_score` VALUES ('63', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"计数器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"}]', '1A27E8B5E907E6D1CE1EB48634210084', '3', '1', '09199EF75CC205FD217D53B75B3B0E0C', 'E2F1F83950491D941F7F14C08598F780');
INSERT INTO `experimental_score` VALUES ('64', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"计数器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"}]', '5C00B3ADF6DDDA69289B112D629A0189', '3', '1', '09199EF75CC205FD217D53B75B3B0E0C', 'E2F1F83950491D941F7F14C08598F780');
INSERT INTO `experimental_score` VALUES ('65', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"计数器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"}]', 'E9825CA8EB8C696920706F603626EDA9', '3', '1', '09199EF75CC205FD217D53B75B3B0E0C', 'E2F1F83950491D941F7F14C08598F780');
INSERT INTO `experimental_score` VALUES ('66', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"计数器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"}]', 'A40AA18B9BCE66EA78302F939E6C88E1', '3', '1', '09199EF75CC205FD217D53B75B3B0E0C', 'E2F1F83950491D941F7F14C08598F780');
INSERT INTO `experimental_score` VALUES ('67', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"计数器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"}]', '3278EC36F6B9DE55477FAC5E73A626FB', '3', '1', '09199EF75CC205FD217D53B75B3B0E0C', 'E2F1F83950491D941F7F14C08598F780');
INSERT INTO `experimental_score` VALUES ('68', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"计数器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"}]', '5B5754C5643E2B078056A597D1062422', '3', '1', '09199EF75CC205FD217D53B75B3B0E0C', 'E2F1F83950491D941F7F14C08598F780');
INSERT INTO `experimental_score` VALUES ('69', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"计数器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"}]', '7E8CEAF32807198FC0DF131BF9389991', '3', '1', '09199EF75CC205FD217D53B75B3B0E0C', 'E2F1F83950491D941F7F14C08598F780');
INSERT INTO `experimental_score` VALUES ('70', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"计数器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"}]', '0AC637C7EF58A1D0970BE84FEF7B60A2', '3', '1', '09199EF75CC205FD217D53B75B3B0E0C', 'E2F1F83950491D941F7F14C08598F780');
INSERT INTO `experimental_score` VALUES ('71', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"计数器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"}]', 'A26FEE941781917D5274F6475941F072', '3', '1', '09199EF75CC205FD217D53B75B3B0E0C', 'E2F1F83950491D941F7F14C08598F780');
INSERT INTO `experimental_score` VALUES ('72', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"计数器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"}]', 'A0477B0B6E0209B44B225CA792DD0078', '3', '1', '09199EF75CC205FD217D53B75B3B0E0C', 'E2F1F83950491D941F7F14C08598F780');
INSERT INTO `experimental_score` VALUES ('73', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"计数器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"}]', 'C84ED6401866730A85BE794EDBB2DA79', '3', '1', '09199EF75CC205FD217D53B75B3B0E0C', 'E2F1F83950491D941F7F14C08598F780');
INSERT INTO `experimental_score` VALUES ('74', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"计数器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"差\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"B+\"}]', '84F5FB2F5A67BC322E3DB4E729C13A86', '3', '1', '09199EF75CC205FD217D53B75B3B0E0C', 'E2F1F83950491D941F7F14C08598F780');
INSERT INTO `experimental_score` VALUES ('75', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', 'D7203E40B30C8C0792515A222BD27D0B', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('76', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', '260F86029711F450A2F679F7077F8EBB', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('77', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', '16F581D5550EA87640830F23699A81B3', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('78', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', '231BB3A006ED5F2685C923A9528CF0E3', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('79', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', 'FDA261A57FFAB0223BC737DBBC3E7E7D', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('80', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', '605C64DA20D10FA585C5DD5A675E82F6', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('81', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', 'DB1EAD7128F4017EA7997E243102632D', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('82', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', '0FB2BA1FD56336336F983B7A8E22B027', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('83', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', '3FF1BC763029889F1B1AC0D9F25F6F2F', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('84', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', 'A91F1C52C10496177AEA5017BD0820D5', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('85', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', 'D9E16249EB2FBEA4301DF21609A8DBD1', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('86', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', 'F517AA6E397B87B60062E94A68B369D3', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('87', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', '21896BB84C569518B4639EFB3F74968F', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('88', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', '107925C676C29DCD5269EE1285DB9664', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('89', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', '3A1A8E016F7AB40C388CB66700052E7F', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('90', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', 'A71A75FA2EA26F95FA09844270F26C8E', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('91', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', 'AE227DE2D90D6BBB8324808C60474896', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('92', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', '077E55961C1FC059B616AE03E8DF3E50', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('93', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', '3A2015EC4F9207A4DBB7563A98AEE557', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('94', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', '64A0DEE9B352546BE0E3AD14259DB932', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('95', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', '13848EF5A52A713A63E7C66FF0E6DAB5', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('96', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', '21386F48A922A3DC6C6B15EA9E6B98B6', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('97', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', 'A65EB50D0FDEC68317D19CD618E7D12F', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('98', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"A\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"优\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', 'B8FBB10DEDE3F07E5BEEC213ECD0A05B', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('99', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', 'B545B7C885CE59E623D1B150245E9764', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('100', '[{\"experimentalFlag\":1,\"name\":\"基本逻辑实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"基本逻辑实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"计数器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"计数器实验纪律成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":1,\"name\":\"加法器实验成绩\",\"remarks\":\"\",\"score\":\"\"},{\"experimentalFlag\":0,\"name\":\"加法器实验平时成绩\",\"remarks\":\"\",\"score\":\"\"}]', '2F16C1B0FDEEB3330C058033F98EE1EF', '4', '1', '1FC8150E683D98550DB2AD7A5D0A9FCE', '839FA39B14A88600BE9E6FCC7F8365D8');
INSERT INTO `experimental_score` VALUES ('101', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', '4D4A0C0A21C3840251F9ECF575516BD5', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('102', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', '90A78D1232871DBA773E9E224E2E569C', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('103', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', 'E322BD3F74BCE76D23C8FE3F2D283C47', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('104', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', '8C9D1358B8AEB3FB57934CAAA4A19354', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('105', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', '0FE29C14FF02C4AA1CFFF365F29F2050', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('106', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', '4C086C42BE0AB7787DC8DAE2E41CE1B9', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('107', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', '99D7A1ACF5486DE7112D09E6EBACFA30', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('108', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', '11C9AEF0E5E772511B49FB96719929A1', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('109', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', 'EA4CBDD7EE93257388565F16F24343D4', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('110', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', '4387D5050F68611E401C393C3F930B2E', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('111', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', 'C3740BF7A233E8FCEA72123C3258B5B4', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('112', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', '1A27E8B5E907E6D1CE1EB48634210084', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('113', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', '5C00B3ADF6DDDA69289B112D629A0189', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('114', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', 'E9825CA8EB8C696920706F603626EDA9', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('115', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', 'A40AA18B9BCE66EA78302F939E6C88E1', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('116', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', '3278EC36F6B9DE55477FAC5E73A626FB', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('117', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', '5B5754C5643E2B078056A597D1062422', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('118', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', '7E8CEAF32807198FC0DF131BF9389991', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('119', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', '0AC637C7EF58A1D0970BE84FEF7B60A2', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('120', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', 'A26FEE941781917D5274F6475941F072', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('121', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', 'A0477B0B6E0209B44B225CA792DD0078', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('122', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', 'C84ED6401866730A85BE794EDBB2DA79', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('123', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', '84F5FB2F5A67BC322E3DB4E729C13A86', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('124', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', '15A366E8780EEEFE719B4855025ECD20', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('125', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', 'E6A62EE8437B3052DEFBDCD37D8867FF', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');
INSERT INTO `experimental_score` VALUES ('126', '[{\"experimentalFlag\":1,\"name\":\"焊接实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"焊接实验平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"元件识别实验成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"元件识别平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯装配成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯装配平时成绩\",\"remarks\":\"\",\"score\":\"良\"},{\"experimentalFlag\":1,\"name\":\"小夜灯焊接成绩\",\"remarks\":\"\",\"score\":\"F\"},{\"experimentalFlag\":0,\"name\":\"小夜灯焊接平时成绩\",\"remarks\":\"\",\"score\":\"良\"}]', '70D1D970ADECE92CF6D92ABE872C3D13', '4', '2', '9AA103237930F4C687B88E6B87B7E5C6', '711FE32278134DEEC4EC04001F884BFB');

-- ----------------------------
-- Table structure for score_level
-- ----------------------------
DROP TABLE IF EXISTS `score_level`;
CREATE TABLE `score_level` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '1平时成绩，2实验成绩',
  `level` varchar(1024) DEFAULT NULL COMMENT '1平时成绩，2实验成绩',
  `formula` varchar(255) DEFAULT NULL,
  `clazzId` int(11) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score_level
-- ----------------------------
INSERT INTO `score_level` VALUES ('09199EF75CC205FD217D53B75B3B0E0C', '实验平时成绩选项', '[{\"level\":\"A\",\"score\":\"100\"},{\"level\":\"B+\",\"score\":\"95\"},{\"level\":\"B\",\"score\":\"85\"},{\"level\":\"B-\",\"score\":\"75\"},{\"level\":\"C+\",\"score\":\"65\"},{\"level\":\"C\",\"score\":\"55\"},{\"level\":\"F\",\"score\":\"0\"}]', 'F*0.33+H*0.33+J*0.34', '1', '2019-09-02 14:47:51');
INSERT INTO `score_level` VALUES ('18FB64C8655427F200317C2949242AC5', '实验成绩选项', '[{\"level\":\"A\",\"score\":\"100\"},{\"level\":\"B\",\"score\":\"95\"},{\"level\":\"C\",\"score\":\"85\"},{\"level\":\"D\",\"score\":\"75\"},{\"level\":\"E\",\"score\":\"65\"},{\"level\":\"F\",\"score\":\"0\"}]', 'E*0.2+G*0.2+I*0.3+K*0.3', '1', '2019-07-11 16:07:58');
INSERT INTO `score_level` VALUES ('1FC8150E683D98550DB2AD7A5D0A9FCE', '实验平时成绩选项', '[{\"level\":\"优\",\"score\":\"90\"},{\"level\":\"良\",\"score\":\"80\"},{\"level\":\"中\",\"score\":\"70\"},{\"level\":\"差\",\"score\":\"60\"},{\"level\":\"\",\"score\":\"\"},{\"level\":\"\",\"score\":\"\"},{\"level\":\"\",\"score\":\"\"},{\"level\":\"\",\"score\":\"\"},{\"level\":\"\",\"score\":\"\"},{\"level\":\"\",\"score\":\"\"},{\"level\":\"\",\"score\":\"\"}]', 'F*0.33+H*0.33+J*0.34', '2', '2019-08-30 13:04:30');
INSERT INTO `score_level` VALUES ('24A13CA5879D42EA9E4915CAA25DE666', '实验平时成绩选项', '[{\"level\":\"优\",\"score\":\"95\"},{\"level\":\"良\",\"score\":\"85\"},{\"level\":\"中\",\"score\":\"75\"},{\"level\":\"差\",\"score\":\"40\"}]', 'F*01+H*0.1+J*01+L*0.2+N*0.1+0.3*P+0.4*R+0.5*T', '1', '2019-07-09 16:32:21');
INSERT INTO `score_level` VALUES ('2E0857B4C6CB2A1FF428A21BFC22F137', '实验平时成绩选项', '[{\"level\":\"A\",\"score\":\"100\"},{\"level\":\"B+\",\"score\":\"95\"},{\"level\":\"B\",\"score\":\"85\"},{\"level\":\"B-\",\"score\":\"75\"},{\"level\":\"C+\",\"score\":\"65\"},{\"level\":\"C\",\"score\":\"55\"},{\"level\":\"F\",\"score\":\"0\"}]', 'F*0.33+H*0.33+J*0.34', '1', '2019-07-11 16:27:19');
INSERT INTO `score_level` VALUES ('5C6E911C32C5759D596DDD35F71D8BDD', '实验成绩选项', '[{\"level\":\"优\",\"score\":\"90\"},{\"level\":\"良\",\"score\":\"80\"},{\"level\":\"中\",\"score\":\"70\"},{\"level\":\"差\",\"score\":\"60\"}]', '(E*0.8+F*0.2+G*0.8+H*0.2+I*0.8+J*0.2)/3', '1', '2019-07-11 16:42:43');
INSERT INTO `score_level` VALUES ('64E228E4ADFC7B855E3D9C0D4751CA1C', '实验平时成绩选项', '[{\"level\":\"A\",\"score\":\"100\"},{\"level\":\"B+\",\"score\":\"95\"},{\"level\":\"B\",\"score\":\"85\"},{\"level\":\"B-\",\"score\":\"75\"},{\"level\":\"C+\",\"score\":\"65\"},{\"level\":\"C\",\"score\":\"55\"},{\"level\":\"F\",\"score\":\"0\"}]', 'F*0.33+H*0.33+J*0.34', '1', '2019-07-11 16:42:43');
INSERT INTO `score_level` VALUES ('6923B842ED38CCC3A69757F469D6A49E', '实验成绩选项', '[{\"level\":\"优\",\"score\":\"90\"},{\"level\":\"良\",\"score\":\"80\"},{\"level\":\"中\",\"score\":\"70\"},{\"level\":\"差\",\"score\":\"60\"}]', '(E*0.8+F*0.2+G*0.8+H*0.2+I*0.8+J*0.2)/3', '1', '2019-09-02 13:51:23');
INSERT INTO `score_level` VALUES ('6F28142AFEE418C894A886B9F1307E7E', '实验平时成绩选项', '[{\"level\":\"A\",\"score\":\"100\"},{\"level\":\"B+\",\"score\":\"95\"},{\"level\":\"B\",\"score\":\"85\"},{\"level\":\"B-\",\"score\":\"75\"},{\"level\":\"C+\",\"score\":\"65\"},{\"level\":\"C\",\"score\":\"55\"},{\"level\":\"F\",\"score\":\"0\"}]', 'F*0.33+H*0.33+J*0.34', '1', '2019-09-02 14:41:07');
INSERT INTO `score_level` VALUES ('711FE32278134DEEC4EC04001F884BFB', '实验成绩选项', '[{\"level\":\"A\",\"score\":\"100\"},{\"level\":\"B+\",\"score\":\"95\"},{\"level\":\"B\",\"score\":\"85\"},{\"level\":\"B-\",\"score\":\"75\"},{\"level\":\"C+\",\"score\":\"65\"},{\"level\":\"C\",\"score\":\"55\"},{\"level\":\"F\",\"score\":\"0\"}]', 'E*0.2+G*0.2+I*0.3+K*0.3', '1', '2019-08-30 13:10:26');
INSERT INTO `score_level` VALUES ('839FA39B14A88600BE9E6FCC7F8365D8', '实验成绩选项', '[{\"level\":\"A\",\"score\":\"100\"},{\"level\":\"B+\",\"score\":\"95\"},{\"level\":\"B\",\"score\":\"85\"},{\"level\":\"B-\",\"score\":\"75\"},{\"level\":\"C+\",\"score\":\"65\"},{\"level\":\"C\",\"score\":\"55\"},{\"level\":\"F\",\"score\":\"0\"},{\"level\":\"\",\"score\":\"\"},{\"level\":\"\",\"score\":\"\"},{\"level\":\"\",\"score\":\"\"},{\"level\":\"\",\"score\":\"\"}]', '（E*0.8+F*0.2+G*0.8+H*0.2+I*0.8+J*0.2)/3', '2', '2019-08-30 13:04:30');
INSERT INTO `score_level` VALUES ('93E590B79A3297BCE5C93E96D425F4F0', '实验平时成绩选项', '[{\"level\":\"A\",\"score\":\"100\"},{\"level\":\"B+\",\"score\":\"95\"},{\"level\":\"B\",\"score\":\"85\"},{\"level\":\"B-\",\"score\":\"75\"},{\"level\":\"C+\",\"score\":\"65\"},{\"level\":\"C\",\"score\":\"55\"},{\"level\":\"F\",\"score\":\"0\"}]', 'F*0.33+H*0.33+J*0.34', '1', '2019-09-02 13:51:23');
INSERT INTO `score_level` VALUES ('9AA103237930F4C687B88E6B87B7E5C6', '实验平时成绩选项', '[{\"level\":\"优\",\"score\":\"95\"},{\"level\":\"良\",\"score\":\"85\"},{\"level\":\"中\",\"score\":\"75\"},{\"level\":\"差\",\"score\":\"40\"}]', 'F*0.25+H*0.25+J*0.25+L*0.25', '1', '2019-08-30 13:10:26');
INSERT INTO `score_level` VALUES ('ABBC518A1EBF074154165DCE4936D607', '实验成绩选项', '[{\"level\":\"优\",\"score\":\"90\"},{\"level\":\"良\",\"score\":\"80\"},{\"level\":\"中\",\"score\":\"70\"},{\"level\":\"差\",\"score\":\"60\"}]', '（E*0.8+F*0.2+G*0.8+H*0.2+I*0.8+J*0.2)/3', '1', '2019-07-11 16:39:13');
INSERT INTO `score_level` VALUES ('B995D4944805A67A3DEA9689E9D480E9', '实验平时成绩选项', '[{\"level\":\"A\",\"score\":\"100\"},{\"level\":\"B+\",\"score\":\"95\"},{\"level\":\"B\",\"score\":\"85\"},{\"level\":\"B-\",\"score\":\"75\"},{\"level\":\"C+\",\"score\":\"65\"},{\"level\":\"C\",\"score\":\"55\"},{\"level\":\"F\",\"score\":\"0\"}]', 'F*0.33+H*0.33+J*0.34', '1', '2019-07-11 16:39:13');
INSERT INTO `score_level` VALUES ('D3448AE17333A05BE02C7D4C7F1EC0B2', '实验成绩选项', '[{\"level\":\"优\",\"score\":\"90\"},{\"level\":\"良\",\"score\":\"80\"},{\"level\":\"中\",\"score\":\"70\"},{\"level\":\"差\",\"score\":\"60\"}]', '(E*0.8+F*0.2+G*0.8+H*0.2+I*0.8+J*0.2)/3', '1', '2019-09-02 14:41:07');
INSERT INTO `score_level` VALUES ('D89DE6739DD69CCB2C32B61704F04FBA', '实验成绩选项', '[{\"level\":\"优\",\"score\":\"90\"},{\"level\":\"良\",\"score\":\"80\"},{\"level\":\"中\",\"score\":\"70\"},{\"level\":\"差\",\"score\":\"60\"}]', '（E*0.8+F*0.2+G*0.8+H*0.2+I*0.8+J*0.2)/3', '1', '2019-07-11 16:27:19');
INSERT INTO `score_level` VALUES ('DE1151092C60FF0229DAC3688A124CAB', '实验成绩选项', '[{\"level\":\"A\",\"score\":\"100\"},{\"level\":\"B+\",\"score\":\"95\"},{\"level\":\"B\",\"score\":\"85\"},{\"level\":\"B-\",\"score\":\"75\"},{\"level\":\"C+\",\"score\":\"65\"},{\"level\":\"C\",\"score\":\"55\"},{\"level\":\"F\",\"score\":\"0\"}]', 'E*0.1+G*0.1+I*0.1+K*0.1+M*0.1+O*0.1+Q*0.1+S*0.3', '1', '2019-07-09 16:32:21');
INSERT INTO `score_level` VALUES ('E2F1F83950491D941F7F14C08598F780', '实验成绩选项', '[{\"level\":\"优\",\"score\":\"90\"},{\"level\":\"良\",\"score\":\"80\"},{\"level\":\"中\",\"score\":\"70\"},{\"level\":\"差\",\"score\":\"60\"}]', '(E*0.8+F*0.2+G*0.8+H*0.2+I*0.8+J*0.2)/3', '1', '2019-09-02 14:47:51');
INSERT INTO `score_level` VALUES ('FD64C4A8EFF0356CA5EE7DFC0CAEE4F7', '实验平时成绩选项', '[{\"level\":\"优\",\"score\":\"95\"},{\"level\":\"优-\",\"score\":\"85\"},{\"level\":\"良\",\"score\":\"75\"},{\"level\":\"中\",\"score\":\"40\"},{\"level\":\"差\",\"score\":\"30\"}]', 'F*0.25+H*0.25+J*0.25+L*0.25', '1', '2019-07-11 16:07:58');

-- ----------------------------
-- Table structure for semester
-- ----------------------------
DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of semester
-- ----------------------------
INSERT INTO `semester` VALUES ('1', '2018-2019-2');
INSERT INTO `semester` VALUES ('2', '2017-2018-2');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` varchar(32) NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `clazzId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('077E55961C1FC059B616AE03E8DF3E50', '16109101123', '卢毅1', '男', '2');
INSERT INTO `student` VALUES ('0AC637C7EF58A1D0970BE84FEF7B60A2', '1610910124', '李磊', '男', '1');
INSERT INTO `student` VALUES ('0FB2BA1FD56336336F983B7A8E22B027', '16109101071', '刘明坤1', '男', '2');
INSERT INTO `student` VALUES ('0FE29C14FF02C4AA1CFFF365F29F2050', '1610910104', '王庚阳', '男', '1');
INSERT INTO `student` VALUES ('107925C676C29DCD5269EE1285DB9664', '16109101191', '王宝军1', '男', '2');
INSERT INTO `student` VALUES ('11C9AEF0E5E772511B49FB96719929A1', '1610910107', '刘明坤', '男', '1');
INSERT INTO `student` VALUES ('13848EF5A52A713A63E7C66FF0E6DAB5', '1610660106111', '张建坤1', '男', '2');
INSERT INTO `student` VALUES ('15A366E8780EEEFE719B4855025ECD20', '1610910129', '徐殊颖', '女', '1');
INSERT INTO `student` VALUES ('16F581D5550EA87640830F23699A81B3', '16109101021', '周义涛1', '男', '2');
INSERT INTO `student` VALUES ('1A27E8B5E907E6D1CE1EB48634210084', '1610910117', '魏志鹏', '男', '1');
INSERT INTO `student` VALUES ('21386F48A922A3DC6C6B15EA9E6B98B6', '16109101127', '杨佳龙1', '男', '2');
INSERT INTO `student` VALUES ('21896BB84C569518B4639EFB3F74968F', '16109101181', '鱼琳1', '女', '2');
INSERT INTO `student` VALUES ('231BB3A006ED5F2685C923A9528CF0E3', '16109101031', '席雍斌1', '男', '2');
INSERT INTO `student` VALUES ('260F86029711F450A2F679F7077F8EBB', '16106601061', '黄文杰1', '男', '2');
INSERT INTO `student` VALUES ('2F16C1B0FDEEB3330C058033F98EE1EF', '1111111', '黄杰1', '男', '2');
INSERT INTO `student` VALUES ('3278EC36F6B9DE55477FAC5E73A626FB', '1610910121', '金鹏帅', '男', '1');
INSERT INTO `student` VALUES ('3A1A8E016F7AB40C388CB66700052E7F', '16109101201', '闫振宇1', '男', '2');
INSERT INTO `student` VALUES ('3A2015EC4F9207A4DBB7563A98AEE557', '16109101124', '李磊1', '男', '2');
INSERT INTO `student` VALUES ('3F3C1B27CA0330098D5650C03F05DE80', '1610910136', '张春雷', '男', '1');
INSERT INTO `student` VALUES ('3FF1BC763029889F1B1AC0D9F25F6F2F', '16109101101', '王峥1', '男', '2');
INSERT INTO `student` VALUES ('4387D5050F68611E401C393C3F930B2E', '1610910113', '江育武', '男', '1');
INSERT INTO `student` VALUES ('4C086C42BE0AB7787DC8DAE2E41CE1B9', '1610910105', '唐凌峰', '男', '1');
INSERT INTO `student` VALUES ('4D4A0C0A21C3840251F9ECF575516BD5', '1610340101', '张伟', '女', null);
INSERT INTO `student` VALUES ('5B5754C5643E2B078056A597D1062422', '1610910122', '叶明', '男', '1');
INSERT INTO `student` VALUES ('5C00B3ADF6DDDA69289B112D629A0189', '1610910118', '鱼琳', '女', '1');
INSERT INTO `student` VALUES ('5FA0A22A3F5045A035BEBBAB680AC1D4', '1610910135', '尤宪超', '男', '1');
INSERT INTO `student` VALUES ('605C64DA20D10FA585C5DD5A675E82F6', '16109101051', '唐凌峰1', '男', '2');
INSERT INTO `student` VALUES ('64A0DEE9B352546BE0E3AD14259DB932', '16109101125', '郭泽康1', '男', '2');
INSERT INTO `student` VALUES ('64AE84F805FA6DCB26A7C474967D2EA4', '1610910134', '李少杰', '男', '1');
INSERT INTO `student` VALUES ('70D1D970ADECE92CF6D92ABE872C3D13', '1610910132', '黄杰', '男', '1');
INSERT INTO `student` VALUES ('7E8CEAF32807198FC0DF131BF9389991', '1610910123', '卢毅', '男', '1');
INSERT INTO `student` VALUES ('84F5FB2F5A67BC322E3DB4E729C13A86', '1610910128', '王孟迪', '男', '1');
INSERT INTO `student` VALUES ('8C9D1358B8AEB3FB57934CAAA4A19354', '1610910103', '席雍斌', '男', '1');
INSERT INTO `student` VALUES ('90A78D1232871DBA773E9E224E2E569C', '1610660106', '黄文杰', '女', null);
INSERT INTO `student` VALUES ('99D7A1ACF5486DE7112D09E6EBACFA30', '1610910106', '赵明江', '男', '1');
INSERT INTO `student` VALUES ('A0477B0B6E0209B44B225CA792DD0078', '1610910126', '张建坤', '男', '1');
INSERT INTO `student` VALUES ('A26FEE941781917D5274F6475941F072', '1610910125', '郭泽康', '男', '1');
INSERT INTO `student` VALUES ('A40AA18B9BCE66EA78302F939E6C88E1', '1610910120', '闫振宇', '男', '1');
INSERT INTO `student` VALUES ('A65EB50D0FDEC68317D19CD618E7D12F', '16109101128', '王孟迪1', '男', '2');
INSERT INTO `student` VALUES ('A71A75FA2EA26F95FA09844270F26C8E', '16109101211', '金鹏帅1', '男', '2');
INSERT INTO `student` VALUES ('A91F1C52C10496177AEA5017BD0820D5', '16109101131', '江育武1', '男', '2');
INSERT INTO `student` VALUES ('AE227DE2D90D6BBB8324808C60474896', '16109101122', '叶明1', '男', '2');
INSERT INTO `student` VALUES ('B545B7C885CE59E623D1B150245E9764', '16109101130', '孙涛1', '男', '2');
INSERT INTO `student` VALUES ('B8FBB10DEDE3F07E5BEEC213ECD0A05B', '16109101129', '徐殊颖1', '女', '2');
INSERT INTO `student` VALUES ('C3740BF7A233E8FCEA72123C3258B5B4', '1610910115', '谢冰', '男', '1');
INSERT INTO `student` VALUES ('C84ED6401866730A85BE794EDBB2DA79', '1610910127', '杨佳龙', '男', '1');
INSERT INTO `student` VALUES ('D08D8B8BCBF42E4A14A8A0D717CED558', '1610910133', '李畅', '女', '1');
INSERT INTO `student` VALUES ('D7203E40B30C8C0792515A222BD27D0B', '16103401011', '张伟1', '男', '2');
INSERT INTO `student` VALUES ('D9E16249EB2FBEA4301DF21609A8DBD1', '16109101151', '谢冰1', '男', '2');
INSERT INTO `student` VALUES ('DB1EAD7128F4017EA7997E243102632D', '16109101061', '赵明江1', '男', '2');
INSERT INTO `student` VALUES ('E322BD3F74BCE76D23C8FE3F2D283C47', '1610910102', '周义涛', '女', null);
INSERT INTO `student` VALUES ('E6A62EE8437B3052DEFBDCD37D8867FF', '1610910130', '孙涛', '男', '1');
INSERT INTO `student` VALUES ('E9825CA8EB8C696920706F603626EDA9', '1610910119', '王宝军', '男', '1');
INSERT INTO `student` VALUES ('EA4CBDD7EE93257388565F16F24343D4', '1610910110', '王峥', '男', '1');
INSERT INTO `student` VALUES ('F517AA6E397B87B60062E94A68B369D3', '16109101171', '魏志鹏1', '男', '2');
INSERT INTO `student` VALUES ('FD9F307A46B34F52605C856ADE047424', '1610710417', '王香', '男', '1');
INSERT INTO `student` VALUES ('FDA261A57FFAB0223BC737DBBC3E7E7D', '16109101041', '王庚阳1', '男', '2');

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

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` varchar(32) NOT NULL,
  `number` varchar(255) DEFAULT NULL COMMENT '工号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('12886525EBAB62D957099FCA6976BCCC', '20000028', null, '沈老师');
INSERT INTO `teacher` VALUES ('3246C5464DC83B00FD2774C7B796F7F6', '201400381', null, '涂老师');
INSERT INTO `teacher` VALUES ('5949674468E4D7D8EC32EAB7339D3EB7', '201400291', null, '孙老师');
INSERT INTO `teacher` VALUES ('7674CD2AAAE2873438B8119D41CA2C7A', '20139021', null, '刘芬');
INSERT INTO `teacher` VALUES ('8A170D3C899D2892C41E8A9C54B059D0', '19950019', null, '吴旻1');
INSERT INTO `teacher` VALUES ('A279DC8661087BF6E676836BDCEC5AD9', '20110015', null, '李老师');
INSERT INTO `teacher` VALUES ('A67EA31FB1261544DCFB31E96A4DB67D', '20140029', null, '孙老师');
INSERT INTO `teacher` VALUES ('admin', 'admin', null, 'admin');
INSERT INTO `teacher` VALUES ('CE572822FBF4077F4E3BD320B6B04547', '19950091', null, '赵老师');
INSERT INTO `teacher` VALUES ('F6F430CA880A105C5C53F18ACA7D5630', '20140038', null, '涂老师');

-- ----------------------------
-- Table structure for teacher_extend
-- ----------------------------
DROP TABLE IF EXISTS `teacher_extend`;
CREATE TABLE `teacher_extend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semesterId` int(11) DEFAULT NULL,
  `courseId` int(11) DEFAULT NULL,
  `clazzId` int(11) DEFAULT NULL,
  `teacherId` varchar(32) DEFAULT NULL,
  `experimentId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_extend
-- ----------------------------
INSERT INTO `teacher_extend` VALUES ('1', '1', '1', '1', '7674CD2AAAE2873438B8119D41CA2C7A', '522A820E72F0730488C34AFF4E42F822');
INSERT INTO `teacher_extend` VALUES ('2', '1', '1', '1', '7674CD2AAAE2873438B8119D41CA2C7A', '1DAAECDC67553BDC71F594C1213BEE0F');
INSERT INTO `teacher_extend` VALUES ('3', '1', '1', '1', '7674CD2AAAE2873438B8119D41CA2C7A', 'E47A9202E6ECA1D1155EFE2DF632556D');
INSERT INTO `teacher_extend` VALUES ('4', '1', '1', '1', '7674CD2AAAE2873438B8119D41CA2C7A', '7A497D5D1F5CAC4B1A5B8FB93C053B1A');
INSERT INTO `teacher_extend` VALUES ('5', '1', '1', '1', '7674CD2AAAE2873438B8119D41CA2C7A', '2009F40308C186B0B876F428B284EAB7');
INSERT INTO `teacher_extend` VALUES ('6', '1', '1', '1', '7674CD2AAAE2873438B8119D41CA2C7A', '001566916ABE3A2724D5F9B55714F7F5');
INSERT INTO `teacher_extend` VALUES ('7', '1', '1', '1', '7674CD2AAAE2873438B8119D41CA2C7A', 'FF3A05CF0513295AD888EFC26059B46B');
INSERT INTO `teacher_extend` VALUES ('8', '1', '1', '1', '7674CD2AAAE2873438B8119D41CA2C7A', 'A3783E2D40D70E21E8EF21A6A24A08A9');
INSERT INTO `teacher_extend` VALUES ('9', '1', '1', '1', '8A170D3C899D2892C41E8A9C54B059D0', '522A820E72F0730488C34AFF4E42F822');
INSERT INTO `teacher_extend` VALUES ('10', '1', '1', '1', '8A170D3C899D2892C41E8A9C54B059D0', '1DAAECDC67553BDC71F594C1213BEE0F');
INSERT INTO `teacher_extend` VALUES ('11', '1', '1', '1', '8A170D3C899D2892C41E8A9C54B059D0', 'E47A9202E6ECA1D1155EFE2DF632556D');
INSERT INTO `teacher_extend` VALUES ('12', '1', '1', '1', '8A170D3C899D2892C41E8A9C54B059D0', '7A497D5D1F5CAC4B1A5B8FB93C053B1A');
INSERT INTO `teacher_extend` VALUES ('13', '1', '1', '1', '8A170D3C899D2892C41E8A9C54B059D0', '2009F40308C186B0B876F428B284EAB7');
INSERT INTO `teacher_extend` VALUES ('14', '1', '1', '1', '8A170D3C899D2892C41E8A9C54B059D0', '001566916ABE3A2724D5F9B55714F7F5');
INSERT INTO `teacher_extend` VALUES ('15', '1', '1', '1', '8A170D3C899D2892C41E8A9C54B059D0', 'FF3A05CF0513295AD888EFC26059B46B');
INSERT INTO `teacher_extend` VALUES ('16', '1', '1', '1', '8A170D3C899D2892C41E8A9C54B059D0', 'A3783E2D40D70E21E8EF21A6A24A08A9');
INSERT INTO `teacher_extend` VALUES ('17', '1', '2', '1', '12886525EBAB62D957099FCA6976BCCC', '464C0F3A5D492950DEC44F11ADE3CF2D');
INSERT INTO `teacher_extend` VALUES ('18', '1', '2', '1', '12886525EBAB62D957099FCA6976BCCC', '961CAD30FD38791E649B3DEED9FFD2D2');
INSERT INTO `teacher_extend` VALUES ('19', '1', '2', '1', '12886525EBAB62D957099FCA6976BCCC', 'C8D6F16A8DE618E0949D15BB76288502');
INSERT INTO `teacher_extend` VALUES ('20', '1', '2', '1', '12886525EBAB62D957099FCA6976BCCC', 'A12092C8A7010D0B9225D4523EA5296A');
INSERT INTO `teacher_extend` VALUES ('21', '1', '2', '1', 'A279DC8661087BF6E676836BDCEC5AD9', '464C0F3A5D492950DEC44F11ADE3CF2D');
INSERT INTO `teacher_extend` VALUES ('22', '1', '2', '1', 'A279DC8661087BF6E676836BDCEC5AD9', '961CAD30FD38791E649B3DEED9FFD2D2');
INSERT INTO `teacher_extend` VALUES ('23', '1', '2', '1', 'A279DC8661087BF6E676836BDCEC5AD9', 'C8D6F16A8DE618E0949D15BB76288502');
INSERT INTO `teacher_extend` VALUES ('24', '1', '2', '1', 'A279DC8661087BF6E676836BDCEC5AD9', 'A12092C8A7010D0B9225D4523EA5296A');
INSERT INTO `teacher_extend` VALUES ('25', '1', '3', '1', 'F6F430CA880A105C5C53F18ACA7D5630', '1C753EEF1894CB0014DB0A76294038F3');
INSERT INTO `teacher_extend` VALUES ('26', '1', '3', '1', 'F6F430CA880A105C5C53F18ACA7D5630', 'D5F0334CF18C4D175055F0EF95BEE9DB');
INSERT INTO `teacher_extend` VALUES ('27', '1', '3', '1', 'F6F430CA880A105C5C53F18ACA7D5630', '0822B5171716AE6F5A40B0199868131B');
INSERT INTO `teacher_extend` VALUES ('28', '1', '3', '1', 'F6F430CA880A105C5C53F18ACA7D5630', '53AEAD5B53D9857A7781A45CB104DAE6');
INSERT INTO `teacher_extend` VALUES ('29', '1', '3', '1', 'F6F430CA880A105C5C53F18ACA7D5630', '0703ADEA1D132C9DAC17ECA0B5329D12');
INSERT INTO `teacher_extend` VALUES ('30', '1', '3', '1', 'F6F430CA880A105C5C53F18ACA7D5630', 'F7A734DB1514165876C2417600457A5E');
INSERT INTO `teacher_extend` VALUES ('31', '1', '3', '1', 'A279DC8661087BF6E676836BDCEC5AD9', '1C753EEF1894CB0014DB0A76294038F3');
INSERT INTO `teacher_extend` VALUES ('32', '1', '3', '1', 'A279DC8661087BF6E676836BDCEC5AD9', 'D5F0334CF18C4D175055F0EF95BEE9DB');
INSERT INTO `teacher_extend` VALUES ('33', '1', '3', '1', 'A279DC8661087BF6E676836BDCEC5AD9', '0822B5171716AE6F5A40B0199868131B');
INSERT INTO `teacher_extend` VALUES ('34', '1', '3', '1', 'A279DC8661087BF6E676836BDCEC5AD9', '53AEAD5B53D9857A7781A45CB104DAE6');
INSERT INTO `teacher_extend` VALUES ('35', '1', '3', '1', 'A279DC8661087BF6E676836BDCEC5AD9', '0703ADEA1D132C9DAC17ECA0B5329D12');
INSERT INTO `teacher_extend` VALUES ('36', '1', '3', '1', 'A279DC8661087BF6E676836BDCEC5AD9', 'F7A734DB1514165876C2417600457A5E');
INSERT INTO `teacher_extend` VALUES ('37', '1', '3', '1', 'A67EA31FB1261544DCFB31E96A4DB67D', '1C753EEF1894CB0014DB0A76294038F3');
INSERT INTO `teacher_extend` VALUES ('38', '1', '3', '1', 'A67EA31FB1261544DCFB31E96A4DB67D', 'D5F0334CF18C4D175055F0EF95BEE9DB');
INSERT INTO `teacher_extend` VALUES ('39', '1', '3', '1', 'A67EA31FB1261544DCFB31E96A4DB67D', '0822B5171716AE6F5A40B0199868131B');
INSERT INTO `teacher_extend` VALUES ('40', '1', '3', '1', 'A67EA31FB1261544DCFB31E96A4DB67D', '53AEAD5B53D9857A7781A45CB104DAE6');
INSERT INTO `teacher_extend` VALUES ('41', '1', '3', '1', 'A67EA31FB1261544DCFB31E96A4DB67D', '0703ADEA1D132C9DAC17ECA0B5329D12');
INSERT INTO `teacher_extend` VALUES ('42', '1', '3', '1', 'A67EA31FB1261544DCFB31E96A4DB67D', 'F7A734DB1514165876C2417600457A5E');
INSERT INTO `teacher_extend` VALUES ('43', '1', '4', '2', '3246C5464DC83B00FD2774C7B796F7F6', '1C753EEF1894CB0014DB0A76294038F3');
INSERT INTO `teacher_extend` VALUES ('44', '1', '4', '2', '3246C5464DC83B00FD2774C7B796F7F6', 'D5F0334CF18C4D175055F0EF95BEE9DB');
INSERT INTO `teacher_extend` VALUES ('45', '1', '4', '2', '3246C5464DC83B00FD2774C7B796F7F6', '0822B5171716AE6F5A40B0199868131B');
INSERT INTO `teacher_extend` VALUES ('46', '1', '4', '2', '3246C5464DC83B00FD2774C7B796F7F6', '53AEAD5B53D9857A7781A45CB104DAE6');
INSERT INTO `teacher_extend` VALUES ('47', '1', '4', '2', '3246C5464DC83B00FD2774C7B796F7F6', '0703ADEA1D132C9DAC17ECA0B5329D12');
INSERT INTO `teacher_extend` VALUES ('48', '1', '4', '2', '3246C5464DC83B00FD2774C7B796F7F6', 'F7A734DB1514165876C2417600457A5E');
INSERT INTO `teacher_extend` VALUES ('49', '1', '4', '2', 'A279DC8661087BF6E676836BDCEC5AD9', '1C753EEF1894CB0014DB0A76294038F3');
INSERT INTO `teacher_extend` VALUES ('50', '1', '4', '2', 'A279DC8661087BF6E676836BDCEC5AD9', 'D5F0334CF18C4D175055F0EF95BEE9DB');
INSERT INTO `teacher_extend` VALUES ('51', '1', '4', '2', 'A279DC8661087BF6E676836BDCEC5AD9', '0822B5171716AE6F5A40B0199868131B');
INSERT INTO `teacher_extend` VALUES ('52', '1', '4', '2', 'A279DC8661087BF6E676836BDCEC5AD9', '53AEAD5B53D9857A7781A45CB104DAE6');
INSERT INTO `teacher_extend` VALUES ('53', '1', '4', '2', 'A279DC8661087BF6E676836BDCEC5AD9', '0703ADEA1D132C9DAC17ECA0B5329D12');
INSERT INTO `teacher_extend` VALUES ('54', '1', '4', '2', 'A279DC8661087BF6E676836BDCEC5AD9', 'F7A734DB1514165876C2417600457A5E');
INSERT INTO `teacher_extend` VALUES ('55', '1', '4', '2', '5949674468E4D7D8EC32EAB7339D3EB7', '1C753EEF1894CB0014DB0A76294038F3');
INSERT INTO `teacher_extend` VALUES ('56', '1', '4', '2', '5949674468E4D7D8EC32EAB7339D3EB7', 'D5F0334CF18C4D175055F0EF95BEE9DB');
INSERT INTO `teacher_extend` VALUES ('57', '1', '4', '2', '5949674468E4D7D8EC32EAB7339D3EB7', '0822B5171716AE6F5A40B0199868131B');
INSERT INTO `teacher_extend` VALUES ('58', '1', '4', '2', '5949674468E4D7D8EC32EAB7339D3EB7', '53AEAD5B53D9857A7781A45CB104DAE6');
INSERT INTO `teacher_extend` VALUES ('59', '1', '4', '2', '5949674468E4D7D8EC32EAB7339D3EB7', '0703ADEA1D132C9DAC17ECA0B5329D12');
INSERT INTO `teacher_extend` VALUES ('60', '1', '4', '2', '5949674468E4D7D8EC32EAB7339D3EB7', 'F7A734DB1514165876C2417600457A5E');
INSERT INTO `teacher_extend` VALUES ('67', '2', '4', '1', '12886525EBAB62D957099FCA6976BCCC', '464C0F3A5D492950DEC44F11ADE3CF2D');
INSERT INTO `teacher_extend` VALUES ('68', '2', '4', '1', '12886525EBAB62D957099FCA6976BCCC', '5FF618EEEA2B798AC092437CBF59F738');
INSERT INTO `teacher_extend` VALUES ('69', '2', '4', '1', '12886525EBAB62D957099FCA6976BCCC', '679CC54C8DE83435C26D036D34560F47');
INSERT INTO `teacher_extend` VALUES ('70', '2', '4', '1', '12886525EBAB62D957099FCA6976BCCC', '200F717654D59DA4E9270CEBB003EDDA');
INSERT INTO `teacher_extend` VALUES ('71', '2', '4', '1', 'A279DC8661087BF6E676836BDCEC5AD9', '464C0F3A5D492950DEC44F11ADE3CF2D');
INSERT INTO `teacher_extend` VALUES ('72', '2', '4', '1', 'A279DC8661087BF6E676836BDCEC5AD9', '5FF618EEEA2B798AC092437CBF59F738');
INSERT INTO `teacher_extend` VALUES ('73', '2', '4', '1', 'A279DC8661087BF6E676836BDCEC5AD9', '679CC54C8DE83435C26D036D34560F47');
INSERT INTO `teacher_extend` VALUES ('74', '2', '4', '1', 'A279DC8661087BF6E676836BDCEC5AD9', '200F717654D59DA4E9270CEBB003EDDA');
INSERT INTO `teacher_extend` VALUES ('75', '2', '4', '1', 'A67EA31FB1261544DCFB31E96A4DB67D', '464C0F3A5D492950DEC44F11ADE3CF2D');
INSERT INTO `teacher_extend` VALUES ('76', '2', '4', '1', 'A67EA31FB1261544DCFB31E96A4DB67D', '5FF618EEEA2B798AC092437CBF59F738');
INSERT INTO `teacher_extend` VALUES ('77', '2', '4', '1', 'A67EA31FB1261544DCFB31E96A4DB67D', '679CC54C8DE83435C26D036D34560F47');
INSERT INTO `teacher_extend` VALUES ('78', '2', '4', '1', 'A67EA31FB1261544DCFB31E96A4DB67D', '200F717654D59DA4E9270CEBB003EDDA');
INSERT INTO `teacher_extend` VALUES ('79', '2', '4', '1', 'CE572822FBF4077F4E3BD320B6B04547', '464C0F3A5D492950DEC44F11ADE3CF2D');
INSERT INTO `teacher_extend` VALUES ('80', '2', '4', '1', 'CE572822FBF4077F4E3BD320B6B04547', '5FF618EEEA2B798AC092437CBF59F738');
INSERT INTO `teacher_extend` VALUES ('81', '2', '4', '1', 'CE572822FBF4077F4E3BD320B6B04547', '679CC54C8DE83435C26D036D34560F47');
INSERT INTO `teacher_extend` VALUES ('82', '2', '4', '1', 'CE572822FBF4077F4E3BD320B6B04547', '200F717654D59DA4E9270CEBB003EDDA');
