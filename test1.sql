/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80027
Source Host           : localhost:3306
Source Database       : test1

Target Server Type    : MYSQL
Target Server Version : 80027
File Encoding         : 65001

Date: 2022-06-10 11:49:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for logindata
-- ----------------------------
DROP TABLE IF EXISTS `logindata`;
CREATE TABLE `logindata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logintime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logouttime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of logindata
-- ----------------------------
INSERT INTO `logindata` VALUES ('1', '2', 'cyx', '2022-04-31 00:40:28', '2022-04-31 00:40:35', '127.0.0.1');
INSERT INTO `logindata` VALUES ('2', '1', 'admin', '2022-05-31 21:05:28', '2022-05-31 21:05:35', '127.0.0.1');
INSERT INTO `logindata` VALUES ('3', '1', 'admin', '2022-06-01 12:45:50', '2022-06-01 12:48:32', '127.0.0.1');
INSERT INTO `logindata` VALUES ('4', '1', 'admin', '2022-06-04 09:44:53', '2022-06-04 09:45:10', '127.0.0.1');
INSERT INTO `logindata` VALUES ('5', '2', 'cyx', '2022-06-04 13:23:20', '2022-06-04 13:23:28', '127.0.0.1');
INSERT INTO `logindata` VALUES ('6', '2', 'cyx', '2022-06-04 13:28:17', '2022-06-04 13:28:22', '127.0.0.1');
INSERT INTO `logindata` VALUES ('7', '1', 'admin', '2022-06-04 13:32:58', '2022-06-04 13:33:27', '127.0.0.1');
INSERT INTO `logindata` VALUES ('8', '1', 'digit', '2022-06-04 13:44:18', '2022-06-04 13:44:44', '127.0.0.1');
INSERT INTO `logindata` VALUES ('9', '1', 'admin', '2022-06-05 00:57:15', '2022-06-05 01:07:25', '127.0.0.1');
INSERT INTO `logindata` VALUES ('10', '2', 'cyx', '2022-06-05 01:10:56', '2022-06-05 01:39:36', '127.0.0.1');
INSERT INTO `logindata` VALUES ('11', '1', 'admin', '2022-06-05 02:40:07', '2022-06-05 02:40:30', '127.0.0.1');
INSERT INTO `logindata` VALUES ('12', '1', 'admin', '2022-06-05 02:43:33', '2022-06-05 02:44:30', '127.0.0.1');
INSERT INTO `logindata` VALUES ('13', '1', 'admin', '2022-06-09 19:39:23', '2022-06-09 20:28:58', '127.0.0.1');
INSERT INTO `logindata` VALUES ('14', '1', 'admin', '2022-06-09 20:29:05', '2022-06-09 20:29:09', '127.0.0.1');
INSERT INTO `logindata` VALUES ('15', '2', 'cyx', '2022-06-09 23:55:41', '2022-06-09 23:56:46', '127.0.0.1');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `order_id` varchar(100) NOT NULL DEFAULT '',
  `product_id` varchar(100) NOT NULL DEFAULT '',
  `buynum` int DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('0c0796f2-0124-4a13-a891-5efbb63b04f9', '79bbe618-d2f8-4081-b35a-62ebbe938b64', '1');
INSERT INTO `orderitem` VALUES ('15f1f3df-8de5-4d6a-9b3d-649c672b5e60', '3cdd01d2-95d4-4077-b512-ff4c3b340d6b', '1');
INSERT INTO `orderitem` VALUES ('15f1f3df-8de5-4d6a-9b3d-649c672b5e60', '4dbac6bb-ac2a-4ea0-a62f-ea5a2fc2b3c2', '1');
INSERT INTO `orderitem` VALUES ('6375da29-720a-41c9-994f-47abee476c22', '3a0196b2-71c1-4d4d-a4e8-d1f875096f00', '1');
INSERT INTO `orderitem` VALUES ('6375da29-720a-41c9-994f-47abee476c22', '8740bee0-bfb8-4ba1-8f6e-b69310617db9', '1');
INSERT INTO `orderitem` VALUES ('ae904e62-86e9-429c-8cf0-d9d68f9578f3', '8c19d2e2-1020-425d-aeeb-56d3c1bc0a81', '1');
INSERT INTO `orderitem` VALUES ('b411e0cd-e387-4477-8fd8-cfba9f202ee6', '26ddd0c6-d7f2-4a83-b01b-286bb8c38420', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(100) NOT NULL,
  `money` double DEFAULT NULL,
  `receiverAddress` varchar(255) DEFAULT NULL,
  `receiverName` varchar(20) DEFAULT NULL,
  `receiverPhone` varchar(20) DEFAULT NULL,
  `paystate` int DEFAULT '0',
  `ordertime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0c0796f2-0124-4a13-a891-5efbb63b04f9', '29', '华南理工大学', 'cyx', '19865023468', '1', '2021-12-26 17:22:48', '2');
INSERT INTO `orders` VALUES ('15f1f3df-8de5-4d6a-9b3d-649c672b5e60', '188', '华南理工大学', 'cyx', '19865023468', '1', '2022-06-09 23:56:35', '2');
INSERT INTO `orders` VALUES ('6375da29-720a-41c9-994f-47abee476c22', '38.9', '华南理工大学', 'cyx', '19860207844', '1', '2022-06-05 01:24:41', '2');
INSERT INTO `orders` VALUES ('ae904e62-86e9-429c-8cf0-d9d68f9578f3', '129', 'hnlgdx', 'cyx', '19865023468', '1', '2022-06-10 00:00:32', '2');
INSERT INTO `orders` VALUES ('b411e0cd-e387-4477-8fd8-cfba9f202ee6', '51', 'hnlgdx', 'cyx', '19865023468', '1', '2022-06-10 11:02:28', '2');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(40) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `pnum` int DEFAULT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('26ddd0c6-d7f2-4a83-b01b-286bb8c38420', '滴眼液', '51', '医药', '179', '/productImg/b8a866f2-aac7-4f7b-bfab-ae0a8c0c764f.jpg', '眼药水');
INSERT INTO `products` VALUES ('3a0196b2-71c1-4d4d-a4e8-d1f875096f00', '英语四六级听力收音机', '26', '数码', '148', '/productImg/0270eba2-2b48-48df-956b-0341204384d9.jpg', '英语四六级听力收音机考试FM调频大学生四级六级专用便携式收音机');
INSERT INTO `products` VALUES ('3cdd01d2-95d4-4077-b512-ff4c3b340d6b', '吐司面包', '29', '食品', '99', '/productImg/a2da626c-c72d-4972-83de-cf48405c5563.jpg', '豪士早餐吐司面包夹心健康小零食小吃休闲食品夜宵网红爆款整箱');
INSERT INTO `products` VALUES ('4dbac6bb-ac2a-4ea0-a62f-ea5a2fc2b3c2', 'T恤女装', '159', '服饰', '197', '/productImg/c4ab442f-95c7-4d6f-a57e-3eb7dc6b83c4.jpg', 'IAZ（服饰）宽松小logo短袖T恤女ins潮秋季气质内搭圆领女装');
INSERT INTO `products` VALUES ('57a44950-935a-4dac-953d-515fd92d8174', '吹风机', '69', '家电', '100', '/productImg/d79dc124-de69-4b77-847e-bc461bfdb857.jpg', '康夫吹风机家用负离子护发大功率150发廊大风力发型师专用电吹风、交流电机 快速干发 造型优选');
INSERT INTO `products` VALUES ('72c52302-cd1e-4a22-8ac8-dc300a915be5', '胶囊太阳伞', '30', '百货', '92', '/productImg/23c6610b-1dc4-4a21-a128-164945d01974.jpg', '胶囊太阳伞女防晒防紫外线遮阳晴雨伞两用迷你五折叠超轻小巧便携 2021年新款 超防晒防紫外线 UPF50+');
INSERT INTO `products` VALUES ('79bbe618-d2f8-4081-b35a-62ebbe938b64', '笔记本', '1380', '数码', '70', '/productImg/697a23d6-225a-41a3-8c20-7ab624265ecc.png', 'Lenovo/联想小新笔记本电脑游戏轻薄便携商务办公学生本i7/i5网课');
INSERT INTO `products` VALUES ('84c842da-16b6-4e87-953e-859a1ca62bab', '薄荷糖', '9.9', '食品', '147', '/productImg/acc9d557-f8c9-426b-9aec-50a5a7cf3960.jpg', '雀巢宝路薄荷糖750g有个圈的老式含片糖冰路强劲清凉散装招待糖果');
INSERT INTO `products` VALUES ('8740bee0-bfb8-4ba1-8f6e-b69310617db9', '充电线', '12.9', '数码', '98', '/productImg/3253aeee-5462-47d0-991c-afb568ab3b03.jpg', '苹果数据线适用iPhone12快充13pro充电器线11原装6x正品xs手机7Plus快速xr闪充ipad平板8P车载2米pd加长max 认证不弹窗 快充不伤手');
INSERT INTO `products` VALUES ('880fdb00-6798-4302-962b-f337f3393802', 'Java Web程序开发入门', '44.5', '百货', '99', '/productImg/eac105d4-4ab5-4af9-9061-e255016b79d9.png', '本书为Java Web开发入门教材，让初学者达到能够灵活使用Java语言开发Web应用程序的程度。为了让初学者易于学习，本书力求内容通俗易懂，讲解寓教于乐，同时针对书中的每个知识点，都精心设计了经典案例，让初学者真正理解这些知识点在实际工作中如何去运用。');
INSERT INTO `products` VALUES ('8c19d2e2-1020-425d-aeeb-56d3c1bc0a81', '纯羊毛围巾', '129', '服饰', '199', '/productImg/ebcee924-7d42-43f8-b974-fbdb900bdb58.jpg', '恒源祥纯羊毛围巾女冬季百搭保暖格子情侣春秋加厚男围脖2021新款 100%澳洲羊毛，保暖亲肤舒适');
INSERT INTO `products` VALUES ('968df3a0-be4d-473e-85a8-d3466b4ca7c2', '藿香正气水', '23.8', '医药', '230', '/productImg/792116e7-6d83-4be4-b3e5-4dd11b0b4565.jpg', '太极藿香正气液正气水口服液水液霍香荷香正汽合剂10支无酒精正品、不含酒精 开车也能喝 团购优惠');
INSERT INTO `products` VALUES ('9a7af97e-deea-417e-ad66-23ea755d2a51', '抽油烟机', '249', '家电', '80', '/productImg/7ede11f8-3ff9-4c12-ad58-b1d5e0e72032.jpg', '好太太大吸力抽油烟机家用厨房顶吸式欧式吸油姻机小型T型油畑机、大吸力+自动清洗+智能体感+豪华大屏');
INSERT INTO `products` VALUES ('adc06981-0dc9-4006-b763-e6413ee93ac1', '泡面', '20', '食品', '120', '/productImg/5394df32-ed6e-4203-b9c0-fc175cfc187e.jpg', '香港公仔面公仔碗仔面方便面泡面车仔面整箱速食即食小杯迷你碗面');
INSERT INTO `products` VALUES ('bdb32537-8f2c-4ba2-a752-94fdc0e9a250', '提拉米苏', '9.9', '食品', '97', '/productImg/8efe720f-fa72-435b-a3c3-69230f9677cc.jpg', '泓一提拉米苏夹心蛋糕零食小吃面包早餐充饥夜宵解馋休闲食品整箱');
INSERT INTO `products` VALUES ('ccce7590-0925-4e7a-9b89-a397fdcab0e3', '红米Redmi Note8 Pro', '1399', '数码', '100', '/productImg/3/4/2f68e2b4-1b62-4dc0-97ed-25079bfff9ce.jpg', 'Redmi Note8Pro 6400万全场景四摄 液冷游戏芯 4500mAh长续航 NFC 18W快充 红外遥控 8GB+128GB 贝母白 游戏智能手机 小米 红米');

-- ----------------------------
-- Table structure for salesman
-- ----------------------------
DROP TABLE IF EXISTS `salesman`;
CREATE TABLE `salesman` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `category` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of salesman
-- ----------------------------
INSERT INTO `salesman` VALUES ('1', 'cyx', '123456', '', null, '数码');
INSERT INTO `salesman` VALUES ('2', 'cyx', '123123', null, null, '医药');
INSERT INTO `salesman` VALUES ('3', 'food', '123456', '', '', '食品');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '普通用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', '804830410@qq.com', '', '超级用户');
INSERT INTO `user` VALUES ('2', 'cyx', '123456', '804830410@qq.com', null, '普通用户');
