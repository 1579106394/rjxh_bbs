/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : bbs

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2018-11-02 20:34:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cart_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '帖子id',
  `type_id` bigint(20) NOT NULL COMMENT '分类id',
  `mold` varchar(30) DEFAULT '普通帖' COMMENT '普通帖，提问帖，投票帖，视频帖，新技术帖',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `top` int(11) NOT NULL DEFAULT '1' COMMENT '是否置顶。1未置顶2置顶，默认1',
  `great` int(11) NOT NULL DEFAULT '1' COMMENT '是否精品。1非精品2精品，默认1',
  `flag` int(11) NOT NULL DEFAULT '1' COMMENT '帖子状态，1正常，2删除，3通知，默认1',
  `article` mediumtext NOT NULL COMMENT '文章内容',
  `zan` int(11) NOT NULL DEFAULT '0' COMMENT '有多少人点赞默认0',
  `shoucang` int(11) NOT NULL DEFAULT '0' COMMENT '有多少人收藏，默认0',
  `jubao` int(11) DEFAULT '0',
  `readnum` int(11) DEFAULT '0' COMMENT '有多少人看，默认0',
  `title` varchar(80) NOT NULL COMMENT '帖子标题',
  `huifutime` varchar(30) NOT NULL COMMENT '最新恢复时间',
  `createtime` varchar(30) NOT NULL COMMENT '发帖时间',
  `huifunum` int(11) NOT NULL DEFAULT '0' COMMENT '帖子回复数，默认是0',
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('1', '1', '普通帖', '30', '1', '1', '1', '<p>我们是兄弟，我怎么会鸽你呢<br></p>', '0', '0', '0', '2', '测试发帖', '2018年10月31日 09:14:42', '2018年10月31日 09:14:42', '0');
INSERT INTO `cart` VALUES ('2', '1', '普通帖', '30', '1', '2', '1', '<p>测试<br></p>', '0', '0', '0', '5', '请问java能干啥', '2018年10月31日 09:22:24', '2018年10月31日 09:22:24', '0');
INSERT INTO `cart` VALUES ('3', '3', '技术帖', '30', '2', '1', '1', '<p>从v<br></p>', '1', '1', '1', '45', '去编辑', '2018年10月31日 10:18:37', '2018年10月31日 09:32:34', '12');
INSERT INTO `cart` VALUES ('4', '1', '投票帖', '31', '1', '1', '1', '<p>12<br></p>', '0', '0', '0', '4', '我是牛逼的管理员', '2018年11月01日 10:50:24', '2018年11月01日 10:50:24', '0');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `c_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `comment_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '该评论评论的哪条评论',
  `user_id1` bigint(20) NOT NULL COMMENT '该评论属于谁',
  `user_id2` bigint(20) NOT NULL COMMENT '该评论评论的谁',
  `article` mediumtext NOT NULL COMMENT '评论内容',
  `art_time` varchar(30) NOT NULL COMMENT '帖子评论时间',
  `com_zan` int(11) NOT NULL DEFAULT '0' COMMENT '评论点赞',
  `cart_id` bigint(20) NOT NULL COMMENT '帖子id',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '通知id',
  `article` mediumtext NOT NULL COMMENT '通知内容',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '通知哪个用户，如果为0则为全体用户，如果为-1则为全体非实验室用户，如果为-2则为全体实验室用户',
  `not_time` varchar(30) NOT NULL COMMENT '通知时间',
  `not_flag` int(11) NOT NULL DEFAULT '1' COMMENT '1未读，2已读，3删除',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', 'sdcsvcs', '0', '21123', '2');
INSERT INTO `notice` VALUES ('2', '123', '31', '1231321', '1');
INSERT INTO `notice` VALUES ('3', '12312', '31', '1231231', '1');
INSERT INTO `notice` VALUES ('4', '`12`12`1', '1', '12313', '1');
INSERT INTO `notice` VALUES ('5', '<p>12<br></p>', '31', '2018年11月02日 20:02:26', '1');
INSERT INTO `notice` VALUES ('6', '<p>123<br></p>', '34', '2018年11月02日 20:06:13', '1');
INSERT INTO `notice` VALUES ('7', '<p>122<br></p>', '34', '2018年11月02日 20:06:46', '1');
INSERT INTO `notice` VALUES ('8', '<p>2312131<br></p>', '33', '2018年11月02日 20:07:02', '1');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(32) NOT NULL COMMENT '分类名称',
  `url` varchar(50) NOT NULL DEFAULT '/cart/cartList.html' COMMENT '分类超链接',
  `path` varchar(20) DEFAULT NULL COMMENT '路径',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('0', '首页', '', 'index');
INSERT INTO `type` VALUES ('1', '高校', 'cart/cartList.html?typeId=1', 'Java');
INSERT INTO `type` VALUES ('2', '社会', 'cart/cartList.html?typeId=2', 'Web');
INSERT INTO `type` VALUES ('3', '时尚', 'cart/cartList.html?typeId=3', 'C');
INSERT INTO `type` VALUES ('4', '新时代', 'cart/cartList.html?typeId=4', 'Android');
INSERT INTO `type` VALUES ('5', '体育', 'cart/cartList.html?typeId=5', 'Python');
INSERT INTO `type` VALUES ('6', '明星', 'cart/cartList.html?typeId=6', 'Chat');
INSERT INTO `type` VALUES ('7', '情感', 'cart/cartList.html?typeId=7', 'Study');
INSERT INTO `type` VALUES ('8', '电影', 'cart/cartList.html?typeId=8', 'Log');
INSERT INTO `type` VALUES ('9', '游戏12', 'cart/cartList.html?typeId=9', null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(16) NOT NULL COMMENT '用户账号',
  `password` varchar(16) NOT NULL COMMENT '用户密码',
  `niko` varchar(32) NOT NULL DEFAULT '小萌新' COMMENT '用户昵称，先随机生成，之后可以修改',
  `telephone` bigint(15) NOT NULL COMMENT '手机号，注册时必填',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱，用于找回账号',
  `sex` int(11) DEFAULT NULL COMMENT '性别，1男2女',
  `clazz` varchar(50) DEFAULT NULL COMMENT '班级',
  `autograph` mediumtext COMMENT '个性签名',
  `image` varchar(200) DEFAULT NULL COMMENT '头像',
  `mycard` mediumtext COMMENT '我发的帖子，逻辑外键，-拼串',
  `Shoucang` mediumtext COMMENT '我收藏的帖子，逻辑外键，-拼串',
  `Cardnum` int(11) NOT NULL DEFAULT '0' COMMENT '帖子数，默认0',
  `zan` mediumtext COMMENT '点赞过的帖子，-拼串',
  `time` varchar(20) NOT NULL COMMENT '账号注册时间',
  `flag` int(11) NOT NULL DEFAULT '1' COMMENT '账号状态，1.普通用户，2.VIP用户，3.用户被封禁',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('30', '1609104008', 'yangdeshi', 'guda', '18296662232', '1579106394@qq.com', '1', '迦勒底', '少废话快给我注册', '/photo/0de5a4bc02b34ee5844e7b9a428eabf1.png', null, '2-', '0', null, '2018年10月30日 21:47:35', '1');
INSERT INTO `user` VALUES ('31', '1609104071', 'yangdeshi', '姑姑姑姑姑姑', '13004099513', '1579106394@qq.com', '2', null, null, '/photo/moren.jpg', null, '3-', '0', '3-', '2018年10月31日 09:36:36', '2');
INSERT INTO `user` VALUES ('32', '111111111', '11111111', '111111111', '11111111111', '111111@qq.com', '1', null, null, '/photo/moren.jpg', null, null, '0', null, '2018年11月01日 20:02:55', '2');
INSERT INTO `user` VALUES ('33', '11', '11', '小萌新', '11', '11', '1', '1', '1', '1', null, null, '0', null, '1', '1');
INSERT INTO `user` VALUES ('34', '22', '22', '小萌新', '22', '22', '2', '2', '2', '2', null, null, '0', null, '2', '2');
