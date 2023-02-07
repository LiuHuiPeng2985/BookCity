/*
 Navicat Premium Data Transfer

 Source Server         : 1
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : bookcity

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 10/06/2022 14:01:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书名',
  `book_author` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `book_price` double(32, 2) NULL DEFAULT NULL COMMENT '价格',
  `book_number` int(11) NULL DEFAULT NULL COMMENT '库存数量',
  `book_sales` int(11) NULL DEFAULT NULL COMMENT '书籍销量',
  `book_synopsis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书籍介绍（包括出版社等）',
  `book_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书籍类型',
  `book_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书籍图片路径',
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '零基础学Java', '明日科技', 29.90, 95, 62, '零基础自学编程的入门图书，由浅入深，详解Java语言的编程思想和核心技术，配同步视频教程和源代码，海量资源免费赠送(吉林大学出版社出版)', '计算机', 'img/bookImg/book_001.png');
INSERT INTO `book` VALUES (2, '流浪的地球', '刘慈欣', 125.40, 32, 26, '8位科幻界大咖重磅之作，星球危机、生化实验、虚拟空间、非人类生命四大经典主题，帮助孩子建立系统科幻框架(9岁以上)(浙江教育出版社出版)', '文学', 'img/bookImg/book_002.png');
INSERT INTO `book` VALUES (3, '典籍里的中国', '有书', 145.00, 28, 22, '全套书超过700位历史人物出场，2000+文史知识点。原典呈现，有据可考，季薇、黄向军、申一帆、席越、徐彬等重磅推荐！(天地出版社)', '历史', 'img/bookImg/book_003.png');
INSERT INTO `book` VALUES (4, '匈奴帝国史', '陈序经', 83.60, 90, 22, '一本书读懂匈奴兴衰500年的神秘历史，1992年荣获国家古籍研究与出版奖(应急管理出版社)', '历史', 'img/bookImg/book_004.png');
INSERT INTO `book` VALUES (5, '格局', '吴军', 44.20, 31, 19, '硅谷投资人、国家文津图书奖得主吴军博士自《见识》《态度》之后人生进阶的第三部作品；5步方法论、7大方面快速提升格局，让你获重复的成功和可叠加式的进步(中信出版社)', '管理', 'img/bookImg/book_005.png');
INSERT INTO `book` VALUES (6, '伟大的博物馆', '莫扎蒂(意)', 882.30, 42, 6, '意大利原版引进 精评馆藏名作 点亮艺术之眼(译林出版社)', '艺术', 'img/bookImg/book_006.png');
INSERT INTO `book` VALUES (7, '三国演义', '罗贯中', 54.30, 49, 16, '中国长篇历史小说，依据正史《三国志》《晋书》《资治通鉴》等订正多处错误，增加详细注释，附三国重要事件时间轴长卷彩页和人物关系图(民主与建设出版社)', '小说', 'img/bookImg/book_007.png');
INSERT INTO `book` VALUES (8, '西游记原著版', '吴承恩', 47.20, 38, 12, '权威版本！收藏经典！(人民文学出版社)', '小说', 'img/bookImg/book_008.png');
INSERT INTO `book` VALUES (9, '星光的速度', '科林·斯图尔特', 109.00, 23, 5, '一眼即懂的天文物理书，入选 英国 2019年 图书设计和制作大奖短名单、奥利地2019年年度科学书籍长名单、2017年博洛尼亚儿童插画大展(辽宁少年儿童出版社)', '童书', 'img/bookImg/book_009.png');
INSERT INTO `book` VALUES (10, '必有人重写爱情', '北岛', 58.00, 54, 6, '著名诗人北岛亲定“自传性”读本，读北岛，这一本就够了 收录长诗《歧路行》选章，简体中文世界首次出版 20余幅摄影作品、画作、珍贵诗歌手稿曝光 不只是诗人北岛，更是艺术家和思想者的北岛(海南出版社)', '文学', 'img/bookImg/book_010.png');
INSERT INTO `book` VALUES (11, '成为学霸', '九三学长', 37.90, 38, 2, '摆脱假努力，学霸有方法。学习的本质+三种思维模型+学习技巧，全网500万粉丝的知识博主九三学长手把手助你少熬夜、少刷题，快速提高成绩。张雪峰、杨晓燕、牛萌、辰薇诚意推荐(北京联合出版有限公司)', '励志', 'img/bookImg/book_011.png');
INSERT INTO `book` VALUES (12, '金融模式', '任泽平', 79.00, 65, 1, '著名经济学家任泽平重磅新作！ 全景展现世界百年金融商业模式的变迁， 深入解析金融巨头兴衰成败的底层逻辑。 江南春、樊登、吴晓波、梁建章、秦朔、刘润、管清友、郝景芳联袂推荐(中译出版社)', '管理', 'img/bookImg/book_012.png');
INSERT INTO `book` VALUES (13, '大师的自然课', '安野光雅(日)', 164.60, 21, 14, '遇见四时繁花，聆听自然之音。汲取创造力，放飞想象力，提升五感力(台海出版社)', '童书', 'img/bookImg/book_013.png');
INSERT INTO `book` VALUES (14, '特战荣耀', '纷舞妖姬', 99.96, 97, 5, '全套小说讲述了燕破岳从一名技能突出，却与集体格格不入的“兵王”，在严酷环境与艰巨任务的捶打之下，逐渐融入群体，与军中工程师艾千雪、女兵王郭笑笑、战友萧云杰等并肩作战共同成长，最终成长为优秀武警特战队员的热血军旅故事(中国友谊出版公司)', '文艺', 'img/bookImg/book_014.png');
INSERT INTO `book` VALUES (15, '轻松主义', '格雷戈·麦吉沃恩', 49.99, 21, 14, '你是否觉得自己： 想做出更大的贡献，但缺乏精力？ 跑得更快了，但没有更近自己的目标？ 面对职场内卷，在崩溃的边缘摇摇欲坠？ 生活中只剩关键的事，时间还是不够用？ 那么，《轻松主义》就是你的救星！(中国财政经济出版社)', '经管', 'img/bookImg/book_015.png');
INSERT INTO `book` VALUES (16, '中国建筑史', '梁思成', 59.80, 29, 4, '三联书店出版，梁思成先生主编，这是我国DY部由中国人自己编写的比较完善、系统的中国建筑史。民族的自大与自卑，皆源自对本民族历史文化的无知(三联书店)', '建筑', 'img/bookImg/book_016.png');
INSERT INTO `book` VALUES (17, '万物解释者', '兰道尔·门罗(美)', 117.80, 14, 5, '未读 探索家 | 变大50%，用小学生都能懂的文字和大幅蓝图科普45种复杂事物，新增含800+事物通用名词手册！比尔·盖茨盛赞，满足5~105岁人类的好奇心(天津科学技术出版社)', '科普读物', 'img/bookImg/book_017.png');
INSERT INTO `book` VALUES (18, '看不够的中国史', '国家人文历史', 54.80, 52, 8, '一本书读懂古代中国的承袭与变革，众多历史专家倾力打造，制度、经济、朝堂、战略、军事5个大主题，史料严谨，视角独特，鞭辟入里，语言幽默，一读就上瘾(四川人民出版社)', '历史', 'img/bookImg/book_018.png');
INSERT INTO `book` VALUES (19, '中国历史超好看', '冯涛', 149.00, 47, 8, '中国历史超好看全8册 汉史春秋战国秦史三国两晋唐史宋史明史清史 中国历史书书籍中国通史古代史历史书籍历史知识读物上下五千年', '励志', 'img/bookImg/book_019.png');
INSERT INTO `book` VALUES (20, '量子宇宙', '布莱恩·考克斯', 24.90, 39, 7, '量子宇宙（世界公认的量子力学科普经典，一本书让你弄清楚宇宙的本质，看到科技的未来。升级译本！）（上海科学技术文献出版社）', '科普读物', 'img/bookImg/book_020.png');
INSERT INTO `book` VALUES (21, '十万个小问号', '延边大学出版社', 69.00, 49, 8, '漫画版十万个小问号 全10册 手提礼盒 十万个为什么 少儿百科全书 注音彩绘 幼儿版小学版科普儿童读物 6-9-12岁小学生少儿漫画书课外读物', '中小学用书', 'img/bookImg/book_021.png');
INSERT INTO `book` VALUES (22, '心理学入门', '舒娅', 11.56, 54, 5, '心理学入门：简单有趣的99个心理学常识（中国纺织出版社）', '心理学', 'img/bookImg/book_022.png');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户表',
  `book_id` int(11) NULL DEFAULT NULL COMMENT '图书表',
  `cart_num` int(11) NULL DEFAULT NULL COMMENT '单种书籍数量',
  `status` int(1) NULL DEFAULT NULL COMMENT '书的勾选状态',
  PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 5, 1, 5, 0);
INSERT INTO `cart` VALUES (4, 5, 4, 1, 0);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '购书人',
  `state` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态( 0：申请退单，1：未发货；2：已发货，3：已签收，4：已退单)',
  `price` double(32, 2) NULL DEFAULT NULL COMMENT '总价',
  `order_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下单时间',
  `book_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书id',
  `book_nums` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书数量',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `is_deleted` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否被用户删除(0：未被删除，1：已被删除)',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (10, '2022050919292267', 2, '4', 683.34, '2022-05-09 19:29:22', '15,5,2', '6,3,2', '江西省南昌市南昌县金沙二路', '0');
INSERT INTO `orders` VALUES (21, '2022051017332582', 2, '2', 132.60, '2022-05-10 17:33:25', '5', '3', '江西省南昌市南昌县金沙二路', '0');
INSERT INTO `orders` VALUES (22, '2022051017362560', 2, '3', 29.90, '2022-05-10 17:36:25', '1', '1', '江西省南昌市南昌县金沙二路', '0');
INSERT INTO `orders` VALUES (23, '2022051017375155', 2, '3', 29.90, '2022-05-10 17:37:51', '1', '1', '江西省南昌市南昌县金沙二路', '0');
INSERT INTO `orders` VALUES (28, '2022051020173576', 2, '4', 29.90, '2022-05-10 20:17:35', '1', '1', '江西省南昌市南昌县金沙二路', '0');
INSERT INTO `orders` VALUES (37, '2022051118152638', 2, '3', 310.68, '2022-05-11 18:15:26', '21,22', '4,3', '江西省南昌市南昌县sixsixsix大道', '0');
INSERT INTO `orders` VALUES (38, '2022051118203632', 2, '4', 235.86, '2022-05-11 18:20:36', '21,22,1,2', '1,1,1,1', '江西省南昌市南昌县sixsixsix大道', '0');
INSERT INTO `orders` VALUES (39, '2022051118341134', 2, '4', 155.30, '2022-05-11 18:34:11', '1,2', '1,1', '江西省南昌市南昌县sixsixsix大道', '0');
INSERT INTO `orders` VALUES (40, '2022051120164564', 2, '3', 83.60, '2022-05-11 20:16:45', '4', '1', '江西省南昌市南昌县光明大道', '0');
INSERT INTO `orders` VALUES (44, '2022051217551227', 2, '2', 290.00, '2022-05-12 17:55:12', '3', '2', '江西省南昌市南昌县金沙一路', '0');
INSERT INTO `orders` VALUES (45, '2022051220131848', 2, '2', 101.50, '2022-05-12 20:13:18', '8,7', '1,1', '江西省南昌市南昌县金沙一路', '0');
INSERT INTO `orders` VALUES (46, '2022051220221969', 2, '3', 384.40, '2022-05-12 20:22:19', '4,7', '2,4', '江西省南昌市南昌县金沙一路', '0');
INSERT INTO `orders` VALUES (47, '2022051220233376', 2, '2', 44.20, '2022-05-12 20:23:33', '5', '1', '江西省南昌市南昌县金沙一路', '0');
INSERT INTO `orders` VALUES (48, '2022051220260690', 2, '4', 511.20, '2022-05-12 20:26:06', '4,5', '4,4', '江西省南昌市南昌县金沙一路', '0');
INSERT INTO `orders` VALUES (49, '2022051308483066', 2, '1', 2622.61, '2022-05-13 08:48:30', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22', '1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1', '江西省南昌市南昌县金沙一路', '0');
INSERT INTO `orders` VALUES (50, '2022051308520743', 2, '0', 602.20, '2022-05-13 08:52:07', '3,4', '3,2', '江西省南昌市南昌县金沙一路', '0');
INSERT INTO `orders` VALUES (51, '2022051310143093', 2, '0', 29.90, '2022-05-13 10:14:30', '1', '1', '江西省南昌市南昌县金沙一路', '0');
INSERT INTO `orders` VALUES (52, '2022051310145970', 2, '0', 59.80, '2022-05-13 10:14:59', '1', '2', '江西省南昌市南昌县金沙一路', '0');
INSERT INTO `orders` VALUES (61, '2022060808575068', 2, '1', 428.10, '2022-06-08 08:57:50', '1,2,3,4,5', '1,1,1,1,1', '江西省南昌市南昌县软件动漫学院', '0');
INSERT INTO `orders` VALUES (65, '2022060915062182', 7, '1', 1275.60, '2022-06-09 15:06:21', '5,3,4', '3,5,5', '江西省南昌市南昌县软件动漫学院', '0');
INSERT INTO `orders` VALUES (66, '2022060915062698', 7, '2', 149.50, '2022-06-09 15:06:26', '1', '5', '江西省南昌市南昌县软件动漫学院', '0');
INSERT INTO `orders` VALUES (67, '2022060915063182', 7, '4', 877.80, '2022-06-09 15:06:31', '2', '7', '江西省南昌市南昌县软件动漫学院', '0');
INSERT INTO `orders` VALUES (68, '2022060915064325', 7, '2', 329.20, '2022-06-09 15:06:43', '13', '2', '江西省南昌市南昌县软件动漫学院', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `user_password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `user_identity` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份(0：普通用户，1：管理员)',
  `user_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `user_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `user_county` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '县',
  `user_place` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '张三', '3@3', 'zhangsan', '1', '江西省', '南昌市', '南昌县', '金沙二路');
INSERT INTO `user` VALUES (2, '李四', '4@4', 'lisi44', '0', '江西省', '南昌市', '南昌县', '软件动漫学院');
INSERT INTO `user` VALUES (5, '王五', '5@qq.com', '123456', '0', '', '', '', '');
INSERT INTO `user` VALUES (7, '赵六', '6@qq.com', '123123', '0', '江西省', '南昌市', '南昌县', '软件动漫学院');

SET FOREIGN_KEY_CHECKS = 1;
