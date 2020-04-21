/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : resource

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2018-02-09 22:09:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_dept`
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `did` int(10) NOT NULL AUTO_INCREMENT,
  `dname` varchar(50) NOT NULL,
  `dremark` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('1', '开发部', '开发部门');
INSERT INTO `t_dept` VALUES ('2', '设计部', '设计部');
INSERT INTO `t_dept` VALUES ('4', '人事部', '');
INSERT INTO `t_dept` VALUES ('6', '12312', '');
INSERT INTO `t_dept` VALUES ('7', '121', '1212');

-- ----------------------------
-- Table structure for `t_document`
-- ----------------------------
DROP TABLE IF EXISTS `t_document`;
CREATE TABLE `t_document` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `filename` varchar(300) NOT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`did`),
  KEY `uid` (`uid`),
  CONSTRAINT `t_document_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_document
-- ----------------------------
INSERT INTO `t_document` VALUES ('1', '天天', '9728b155aed34796b21996efb7c5d0f9.txt', '', '2', '2018-01-02 18:49:57', '1');
INSERT INTO `t_document` VALUES ('2', '11', 'fae5ee9e6dbb4cd6b280014388a4cbc9.rar', '', '1', '2018-01-03 20:25:12', '1');
INSERT INTO `t_document` VALUES ('3', '123456', '4718188a88124f908bdd35d1a8eadca0.docx', '', '123456', '2018-01-10 20:28:49', '2');
INSERT INTO `t_document` VALUES ('4', '测试文档', '4fa22a2e5ab84a5181b5f81a121993da.doc', '', '测试文档', '2018-01-24 20:11:10', '2');

-- ----------------------------
-- Table structure for `t_employee`
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) NOT NULL,
  `jid` int(11) NOT NULL,
  `ename` varchar(20) NOT NULL,
  `card_id` varchar(18) NOT NULL,
  `address` varchar(50) NOT NULL,
  `post_code` varchar(50) NOT NULL,
  `tel` varchar(16) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `qq_num` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `sex` int(11) NOT NULL DEFAULT '1',
  `party` varchar(10) DEFAULT NULL,
  `birthday` date NOT NULL,
  `race` varchar(100) DEFAULT NULL,
  `education` varchar(10) DEFAULT NULL,
  `speciality` varchar(20) DEFAULT NULL,
  `hobby` varchar(100) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `did` (`did`),
  KEY `jid` (`jid`),
  CONSTRAINT `t_employee_ibfk_1` FOREIGN KEY (`did`) REFERENCES `t_dept` (`did`),
  CONSTRAINT `t_employee_ibfk_2` FOREIGN KEY (`jid`) REFERENCES `t_job` (`jid`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES ('2', '2', '2', '王永定', '445381199104154517', '广东', '527200', '15016596263', '07663943257', '645813259', '645813259@qq.com', '0', '群众', '2017-12-14', '汉', '本科', '计算机科学与技术', '篮球', '2017-12-31 16:59:43', '1');
INSERT INTO `t_employee` VALUES ('6', '2', '2', '王永定', '445381199104154517', '广东省罗定市附城镇', '527200', '15016596263', '15016596263', '645813259', '645813259@qq.com', '1', '', '2017-12-30', '汉', '本科', '', '', '2017-12-31 22:21:53', '');
INSERT INTO `t_employee` VALUES ('7', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('9', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('10', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('11', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('12', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('13', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('14', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('15', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('16', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('17', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('18', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('19', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('20', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('21', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('22', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('23', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('24', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('25', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('26', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('27', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('28', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('29', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('30', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('31', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('32', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('33', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('34', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('35', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('56', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('57', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('58', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('59', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('60', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('61', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('62', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('63', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('64', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('65', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('66', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('67', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('68', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('69', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('70', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('71', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('72', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('73', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('74', '1', '1', '1', '11111', '2222222', '11', '1', '11', '1', '1', '1', '1', '2017-01-01', '1', '1', '1', '1', '2017-12-31 22:48:11', '1');
INSERT INTO `t_employee` VALUES ('107', '2', '1', '王永定', '445381199104154517', '广东', '527200', '15016596263', '07663943257', '645813259', '645813259@qq.com', '1', '群众', '2017-12-07', '汉', '本科', '计算机科学与技术', '篮球', '2017-12-31 23:55:07', '');
INSERT INTO `t_employee` VALUES ('108', '1', '1', '王永定', '445381199104154517', '广东', '527200', '15016596263', '07663943257', '645813259', '645813259@qq.com', '1', '群众', '2018-01-19', '汉', '本科', '计算机科学与技术', '篮球', '2018-01-01 00:02:58', '');

-- ----------------------------
-- Table structure for `t_job`
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `jid` int(10) NOT NULL AUTO_INCREMENT,
  `jname` varchar(50) NOT NULL,
  `jremark` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`jid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO `t_job` VALUES ('1', '开发工程师', '1');
INSERT INTO `t_job` VALUES ('2', '助理工程师', '2');
INSERT INTO `t_job` VALUES ('4', '1', '1');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) NOT NULL,
  `publishDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `uid` int(10) NOT NULL,
  `remark` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `fk_notice_user` (`uid`),
  CONSTRAINT `fk_notice_user` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '放假事宜', '今天放假', '2018-01-01 18:34:44', '0', '2018-01-23 22:49:50', '1', '');
INSERT INTO `t_notice` VALUES ('9', 'wqeqw', 'qwewqeq', '2018-01-10 20:21:28', '1', '2018-01-16 18:07:32', '1', 'qweqe');
INSERT INTO `t_notice` VALUES ('10', '12311', '1', '2018-01-10 20:45:57', '1', '2018-01-24 20:10:14', '2', '1');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(20) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `loginname` (`loginname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'admin', '1', '2017-12-30 21:08:46', 'yongding', null);
INSERT INTO `t_user` VALUES ('2', '123456', '123456', '1', '2017-12-30 21:56:36', 'iamdashen', '1');
