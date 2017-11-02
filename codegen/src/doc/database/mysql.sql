/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50168
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50168
File Encoding         : 65001

Date: 2015-06-15 17:06:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_auth`
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth`;
CREATE TABLE `sys_auth` (
  `AUTHORITY_ID` varchar(32) NOT NULL COMMENT '主键',
  `RESOURCE_ID` varchar(32) DEFAULT NULL COMMENT '资源ID',
  `RESOURCE_TYPE` varchar(50) DEFAULT NULL COMMENT '资源类类',
  `VISITOR_ID` varchar(32) DEFAULT NULL COMMENT '访问者ID',
  `REMARK` varchar(300) DEFAULT NULL COMMENT '备注',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`AUTHORITY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限信息';

-- ----------------------------
-- Records of sys_auth
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `ID` varchar(32) NOT NULL COMMENT '主键',
  `NAME` varchar(60) DEFAULT NULL COMMENT '名称',
  `PARENT_ID` varchar(32) DEFAULT NULL COMMENT '父结点',
  `IS_LEAF` tinyint(2) DEFAULT NULL COMMENT '是否叶子',
  `ORDER_CODE` varchar(10) DEFAULT NULL COMMENT '排序编号',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `TS` datetime DEFAULT NULL COMMENT '时间戳',
  `DR` tinyint(2) DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('27dc825c651342da8a8b8c2342fbac79', '审核组', '1', '1', '', '', '2015-01-22 19:27:41', '0');
INSERT INTO `sys_dept` VALUES ('1', '随变科技', '', '0', '0', '', '2015-01-21 20:53:34', '0');
INSERT INTO `sys_dept` VALUES ('29176d46665d43b88d124fe49385aeb2', '必要', '1', '0', '0', '', '2015-01-21 20:53:53', '0');
INSERT INTO `sys_dept` VALUES ('3a00f44eef73467fb87d3828bc79d9e2', '运营', '29176d46665d43b88d124fe49385aeb2', '1', '1', '', '2015-01-22 14:41:21', '0');
INSERT INTO `sys_dept` VALUES ('9972f1515bd54e9dac56cbdd859a1124', '运维', '29176d46665d43b88d124fe49385aeb2', '1', '1', '', '2015-01-22 20:44:52', '0');
INSERT INTO `sys_dept` VALUES ('65675bb2fd5e4c53aca971e0505a14c8', '开发', '29176d46665d43b88d124fe49385aeb2', '1', '1', '', '2015-01-22 14:41:29', '0');
INSERT INTO `sys_dept` VALUES ('72da0f0b28694b539ebbf8ac5807ad83', '米兰港', '1', '1', '0', '', '2015-01-21 20:54:25', '0');
INSERT INTO `sys_dept` VALUES ('c7d72b3b18b54ce78c3ba15708d9325d', '测试', '29176d46665d43b88d124fe49385aeb2', '1', '1', 'qqqq', '2015-01-22 14:41:37', '0');
INSERT INTO `sys_dept` VALUES ('d067969b8fca46e089a04916b3905fd8', '产品', '29176d46665d43b88d124fe49385aeb2', '1', '1', '', '2015-01-22 14:56:31', '0');
INSERT INTO `sys_dept` VALUES ('f4fe17830f414427bd7072c67b9a7681', '策划', '29176d46665d43b88d124fe49385aeb2', '1', '2', '', '2015-01-22 14:56:47', '0');

-- ----------------------------
-- Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `ID` varchar(32) NOT NULL COMMENT '主键',
  `TYPE_CODE` decimal(3,0) DEFAULT NULL COMMENT '类型编码',
  `DATA_KEY` decimal(3,0) DEFAULT NULL COMMENT '数据键',
  `DATA_VALUE` varchar(50) DEFAULT NULL COMMENT '数据值',
  `TYPE_ID` varchar(32) DEFAULT NULL COMMENT '类型名称',
  `IMG_URL` varchar(300) DEFAULT NULL,
  `REMARK` varchar(300) DEFAULT NULL COMMENT '备注',
  `TS` datetime DEFAULT NULL COMMENT '时间戳',
  `DR` decimal(1,0) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('4bdcc8646b7145b6af3829079d2c6a9f', '1', '1', '20-25岁', '9b262042fe97447c8122e68e7ff2fe94', '无', '', '2014-12-03 20:00:50', '0');
INSERT INTO `sys_dict` VALUES ('780f603b31f245698bd485283c9ee655', '30', '1', '站内链接', 'ecd1ded311ee420e81fc41a021fe82dd', '', '', '2015-03-02 13:51:15', '0');
INSERT INTO `sys_dict` VALUES ('2b863314ad204f17baa19aa06468b78d', '30', '2', '对外推广', 'ecd1ded311ee420e81fc41a021fe82dd', '', '', '2015-03-02 13:51:33', '0');
INSERT INTO `sys_dict` VALUES ('33779f636ede40339d0f8bee5c6515a9', '26', '1', '20', '35b090957a0e438388662720b57567d6', '', '', '2015-03-09 15:56:32', '0');
INSERT INTO `sys_dict` VALUES ('5db1fe4d6d1141f2bec8b93731d8a530', '26', '2', '30', '35b090957a0e438388662720b57567d6', '', '', '2015-03-09 15:56:38', '0');
INSERT INTO `sys_dict` VALUES ('f8ea2dae9ca048b0b4044d2d1274db1f', '26', '3', '20', '35b090957a0e438388662720b57567d6', '', '', '2015-03-09 15:56:46', '0');
INSERT INTO `sys_dict` VALUES ('b9a000061f974198b5bc75b706966fbb', '26', '4', '10', '35b090957a0e438388662720b57567d6', '', '', '2015-03-09 15:56:52', '0');
INSERT INTO `sys_dict` VALUES ('dc1b26f3bd6f4704ab30aaf04f83f42e', '27', '1', '38,38,100', '684a1bd8d4584334a6c92c5785f320d6', '', '', '2015-03-09 15:58:07', '0');
INSERT INTO `sys_dict` VALUES ('2862b058cb344c1bb0490ecefe244912', '27', '2', '40,40,100', '684a1bd8d4584334a6c92c5785f320d6', '', '', '2015-03-09 15:58:16', '0');
INSERT INTO `sys_dict` VALUES ('ed7e7e5a52394bd1983933e1866cf574', '27', '3', '40,40,100', '684a1bd8d4584334a6c92c5785f320d6', '', '', '2015-03-09 15:58:30', '0');
INSERT INTO `sys_dict` VALUES ('7e2e925d8a7a4c1ab8873a73605571ea', '28', '1', '1', '2aea14289fcb47c89e0870265d95728d', '', '', '2015-03-13 14:12:41', '0');
INSERT INTO `sys_dict` VALUES ('43685501bf3040d7b1cf54714df56dd7', '28', '2', '2', '2aea14289fcb47c89e0870265d95728d', '', '', '2015-03-13 14:12:47', '0');
INSERT INTO `sys_dict` VALUES ('f3aa05bf3d174875b2e1a238dde380e2', '28', '3', '3', '2aea14289fcb47c89e0870265d95728d', '', '', '2015-03-13 14:12:50', '0');
INSERT INTO `sys_dict` VALUES ('8ba7d45c9d84450e8e1980ae0b40cff4', '29', '1', '星期日', '967706c087154289a090d583f56bc6d2', '', '', '2015-03-20 17:43:17', '0');
INSERT INTO `sys_dict` VALUES ('976472d07c5d42b0b274360688c25f73', '29', '2', '星期一', '967706c087154289a090d583f56bc6d2', '', '', '2015-03-20 17:43:24', '0');
INSERT INTO `sys_dict` VALUES ('208cb81c96034ed2a4143509ec4f3768', '29', '3', '星期二', '967706c087154289a090d583f56bc6d2', '', '', '2015-03-20 17:43:30', '0');
INSERT INTO `sys_dict` VALUES ('d2241e4493ff4f90ac44214f68a0279f', '29', '4', '星期三', '967706c087154289a090d583f56bc6d2', '', '', '2015-03-20 17:43:36', '0');
INSERT INTO `sys_dict` VALUES ('1274adb017834aaeba355979415e89b5', '29', '5', '星期四', '967706c087154289a090d583f56bc6d2', '', '', '2015-03-20 17:43:45', '0');
INSERT INTO `sys_dict` VALUES ('7f22778a8e274f2cbc87895e89546784', '29', '6', '星期五', '967706c087154289a090d583f56bc6d2', '', '', '2015-03-20 17:43:50', '0');
INSERT INTO `sys_dict` VALUES ('5fb06ca60c634f4b81acfda23f0013c7', '29', '7', '星期六', '967706c087154289a090d583f56bc6d2', '', '', '2015-03-20 17:43:56', '0');
INSERT INTO `sys_dict` VALUES ('aab96ccde5eb4bff972c330126bf77da', '31', '1', '短信', '6ba4d770efad4fdbbceb3cd701d542ac', '', '', '2015-04-10 11:31:39', '0');
INSERT INTO `sys_dict` VALUES ('c57e686655ce48a48f18e1d32f63dfe9', '31', '2', '站内信', '6ba4d770efad4fdbbceb3cd701d542ac', '', '', '2015-04-10 11:31:46', '0');
INSERT INTO `sys_dict` VALUES ('9042389e8d1149d3aae8ff4d8676dad8', '1', '2', '26~30岁', '9b262042fe97447c8122e68e7ff2fe94', '', '', '2014-12-04 17:37:01', '0');
INSERT INTO `sys_dict` VALUES ('3a87283f377b44dd8a0314f53e2e88e9', '1', '4', '35岁以上', '9b262042fe97447c8122e68e7ff2fe94', '', '', '2015-02-02 12:10:59', '0');
INSERT INTO `sys_dict` VALUES ('802a9785efbe4ebc84dd56234a2746d5', '1', '3', '31~35岁', '9b262042fe97447c8122e68e7ff2fe94', '', '', '2014-12-04 17:37:13', '0');
INSERT INTO `sys_dict` VALUES ('50ee9c417a8746dc8b1402b60db3f2f6', '2', '1', '黑', '35a34fd4b52740f8a3f4d06522cd3297', '', '', '2014-12-15 09:58:23', '0');
INSERT INTO `sys_dict` VALUES ('4456e88668b84ac0b8e77a426083cb0c', '2', '2', '蓝', '35a34fd4b52740f8a3f4d06522cd3297', '', '', '2014-12-15 09:58:30', '0');
INSERT INTO `sys_dict` VALUES ('f58c415ea70748bf94e9081a44a13b63', '2', '3', '棕', '35a34fd4b52740f8a3f4d06522cd3297', '', '', '2014-12-15 09:58:38', '0');
INSERT INTO `sys_dict` VALUES ('7d344782c9994301aa6b7a36b6ef032c', '2', '4', '金', '35a34fd4b52740f8a3f4d06522cd3297', '', '', '2014-12-15 09:58:53', '0');
INSERT INTO `sys_dict` VALUES ('c9eb1f5d53d549398d85718ff5d85b9a', '2', '5', '红', '35a34fd4b52740f8a3f4d06522cd3297', '', '', '2014-12-15 09:59:00', '0');
INSERT INTO `sys_dict` VALUES ('00a5fcdc48bc4678974cac5462966a96', '3', '1', '15mm', '066d1c87edd44570b6d282f4bf6bc18a', '', '', '2014-12-04 17:43:21', '0');
INSERT INTO `sys_dict` VALUES ('02a6fcec321d48ba923e17498ec6dcb7', '3', '2', '45mm', '066d1c87edd44570b6d282f4bf6bc18a', '', '', '2014-12-04 17:43:33', '0');
INSERT INTO `sys_dict` VALUES ('d41e05fcc2cb426ba38baabc7c17e63d', '3', '3', '65mm', '066d1c87edd44570b6d282f4bf6bc18a', '', '', '2014-12-04 17:43:41', '0');
INSERT INTO `sys_dict` VALUES ('9a69d7a224cb4eaa805b1989c0bf62a9', '3', '4', '85mm', '066d1c87edd44570b6d282f4bf6bc18a', '', '', '2014-12-04 17:43:51', '0');
INSERT INTO `sys_dict` VALUES ('894147596df14e0bb7fa502b674333d5', '3', '5', '100mm', '066d1c87edd44570b6d282f4bf6bc18a', '', '', '2014-12-04 17:44:06', '0');
INSERT INTO `sys_dict` VALUES ('7de0fae61f9a4db8846d6bc6426b5b4b', '4', '1', '电镀鞋跟', '08c8a6450e104144bec142f1053b1147', '', '', '2014-12-04 17:44:54', '0');
INSERT INTO `sys_dict` VALUES ('56c67b4b1fce46e597f18c182300ff02', '4', '2', '包料鞋跟', '08c8a6450e104144bec142f1053b1147', '', '', '2014-12-04 17:45:05', '0');
INSERT INTO `sys_dict` VALUES ('66725def157942af8816a7d38cff8fcb', '5', '1', '33码', 'dedcfb0e1c274fb59df1becb4f08c617', '', '', '2014-12-04 17:45:53', '0');
INSERT INTO `sys_dict` VALUES ('c26b50b519fd47afba0644f66bcbf4b8', '5', '2', '34码', 'dedcfb0e1c274fb59df1becb4f08c617', '', '', '2014-12-04 17:46:03', '0');
INSERT INTO `sys_dict` VALUES ('566602921de1499399a60af6bddf045e', '5', '3', '35码', 'dedcfb0e1c274fb59df1becb4f08c617', '', '', '2014-12-04 17:46:13', '0');
INSERT INTO `sys_dict` VALUES ('56f7faee9ab54183932c8c49ae7921af', '5', '4', '36码', 'dedcfb0e1c274fb59df1becb4f08c617', '', '', '2014-12-04 17:46:27', '0');
INSERT INTO `sys_dict` VALUES ('c377f77fa99f47d4825aee178e62f95d', '5', '5', '37码', 'dedcfb0e1c274fb59df1becb4f08c617', '', '', '2014-12-04 17:46:44', '0');
INSERT INTO `sys_dict` VALUES ('b05b523531014b0e83abbf5bd7ec5cfe', '5', '6', '38码', 'dedcfb0e1c274fb59df1becb4f08c617', '', '', '2014-12-04 17:47:00', '0');
INSERT INTO `sys_dict` VALUES ('5ad9be5a0105466f8a086aa462091b66', '5', '7', '39码', 'dedcfb0e1c274fb59df1becb4f08c617', '', '', '2014-12-04 17:47:19', '0');
INSERT INTO `sys_dict` VALUES ('6d884d2c60e94ff5a711cc2346a69719', '5', '8', '40码', 'dedcfb0e1c274fb59df1becb4f08c617', '', '', '2014-12-04 17:47:32', '0');
INSERT INTO `sys_dict` VALUES ('1713255fd5db4eb7bd078b502e95e02f', '5', '9', '41码', 'dedcfb0e1c274fb59df1becb4f08c617', '', '', '2014-12-04 17:47:50', '0');
INSERT INTO `sys_dict` VALUES ('e3d87e39894641ea997be9c76eaf2ec7', '5', '10', '42码', 'dedcfb0e1c274fb59df1becb4f08c617', '', '', '2014-12-04 17:48:01', '0');
INSERT INTO `sys_dict` VALUES ('1ef1009bffd14987aaabf405e8cbba04', '6', '1', '3000以上', 'fbb88d5e9582453391cb1ab64b7f03f2', '', '', '2014-12-04 17:48:41', '0');
INSERT INTO `sys_dict` VALUES ('6e2471590f7a488b9e1df2a141a29434', '6', '2', '1000~3000', 'fbb88d5e9582453391cb1ab64b7f03f2', '', '', '2014-12-04 17:48:56', '0');
INSERT INTO `sys_dict` VALUES ('c15f2207b909416ea59ab0a2c57aa06d', '6', '3', '500~1000', 'fbb88d5e9582453391cb1ab64b7f03f2', '', '', '2014-12-04 17:49:07', '0');
INSERT INTO `sys_dict` VALUES ('b81b2958ca944df786ca4d9bb1e96ef3', '6', '4', '200~500', 'fbb88d5e9582453391cb1ab64b7f03f2', '', '', '2014-12-04 17:49:19', '0');
INSERT INTO `sys_dict` VALUES ('a825a44f23b14038bec42dd650477d3d', '7', '1', '已中奖', 'db32214220444ac4b9a4bb4894082e4b', '', '', '2014-12-05 16:44:43', '0');
INSERT INTO `sys_dict` VALUES ('16083b0a11814f4c9da40ea810a0a1fa', '7', '0', '未中奖', 'db32214220444ac4b9a4bb4894082e4b', '', '', '2014-12-05 16:45:32', '0');
INSERT INTO `sys_dict` VALUES ('c906b9c1bc684bc699659693676f831c', '8', '1', 'WEB端', '0e8c944c2b094a378531f8cf977ecd93', '', '', '2014-12-04 18:25:07', '0');
INSERT INTO `sys_dict` VALUES ('2b0b3a2a659e44e09e982ab212e0ed34', '8', '2', 'MOBILE端', '0e8c944c2b094a378531f8cf977ecd93', '', '', '2014-12-04 18:25:20', '0');
INSERT INTO `sys_dict` VALUES ('a17088b566c64375afe069e6c0aa677c', '9', '1', '启用', '9de1336ac93f42d9a7ec6d742bd55a5c', '', '', '2014-12-04 18:26:45', '0');
INSERT INTO `sys_dict` VALUES ('e1c7f9906c6e4f94b63f68bfc2a538d8', '9', '0', '禁用', '9de1336ac93f42d9a7ec6d742bd55a5c', '', '', '2014-12-04 18:26:57', '0');
INSERT INTO `sys_dict` VALUES ('4643e3c9f14c427f96e2f7b3e3588b9b', '2', '6', '银', '35a34fd4b52740f8a3f4d06522cd3297', '', '', '2014-12-15 09:59:16', '0');
INSERT INTO `sys_dict` VALUES ('c7e820aee1cb476eac57fb5b289af6bd', '10', '1', '跳转到list页', 'b5593c423bce4ca9864cfd6507276476', '', '', '2014-12-29 17:23:09', '0');
INSERT INTO `sys_dict` VALUES ('200b5be59bdd4475a48a69d852b37daa', '10', '2', '跳转单品页', 'b5593c423bce4ca9864cfd6507276476', '', '', '2014-12-29 17:23:22', '0');
INSERT INTO `sys_dict` VALUES ('e4467060fc1d44338a6ee0d20191d629', '10', '3', '预告', 'b5593c423bce4ca9864cfd6507276476', '', '', '2014-12-27 16:35:41', '0');
INSERT INTO `sys_dict` VALUES ('a586f83ddbc247f9833c5110cf27c900', '11', '1', 'web端', '0c20bad4e41042bc9fc8bc63e75f3b79', '', '', '2015-01-22 15:55:38', '0');
INSERT INTO `sys_dict` VALUES ('dae23001e77d4b608191ca6fac46571b', '11', '2', 'M站', '0c20bad4e41042bc9fc8bc63e75f3b79', '', '', '2015-01-22 15:55:53', '0');
INSERT INTO `sys_dict` VALUES ('52620c06151a4960a4f9db5cb6522f9a', '11', '3', 'APP', '0c20bad4e41042bc9fc8bc63e75f3b79', '', '', '2015-01-22 15:56:05', '0');
INSERT INTO `sys_dict` VALUES ('d5012311fef448faa94b35144b3a6fe2', '12', '1', '跳转到活动页面', 'd6d4c31b60ea491cae76d5bb6ac29356', '', '', '2015-01-26 14:16:22', '0');
INSERT INTO `sys_dict` VALUES ('35f1d7fde16c457897d587eb6f210bb0', '12', '2', '跳转到单品页', 'd6d4c31b60ea491cae76d5bb6ac29356', '', '', '2015-01-26 14:16:48', '0');
INSERT INTO `sys_dict` VALUES ('563e5684c1ff40abaf6f58fddaeacdee', '13', '0', '禁用', '66df182f9fd349d08605618c1750ad9b', '', '', '2015-01-22 15:58:08', '0');
INSERT INTO `sys_dict` VALUES ('fb602d68a0da46229eeb46c1079cc29b', '13', '1', '启用', '66df182f9fd349d08605618c1750ad9b', '', '', '2015-01-22 15:58:15', '0');
INSERT INTO `sys_dict` VALUES ('a447c060a9494357b4fe75382f65751b', '14', '1', '左小右大', '9810d0e861dd4710a1371753316e6ef2', '', '', '2015-01-22 15:58:59', '0');
INSERT INTO `sys_dict` VALUES ('bad196c6729d40688a99f8a4f04bfddb', '14', '2', '左大右小', '9810d0e861dd4710a1371753316e6ef2', '', '', '2015-01-22 15:59:07', '0');
INSERT INTO `sys_dict` VALUES ('c1469927efa84c53a4fb9ce125f4cde4', '15', '0', '禁用', 'fe09657fa586489fa71082c3ea35028d', '', '', '2015-01-22 15:59:37', '0');
INSERT INTO `sys_dict` VALUES ('ef1458eb3017424dbf5d0f98b4dc519f', '15', '1', '启用', 'fe09657fa586489fa71082c3ea35028d', '', '', '2015-01-22 15:59:44', '0');
INSERT INTO `sys_dict` VALUES ('f4556665d3234e42b98f1cc2db098bf3', '16', '0', '禁用', '3de078da3fe84a0d9b241c0624465cde', '', '', '2015-01-22 16:00:17', '0');
INSERT INTO `sys_dict` VALUES ('d63106105af1457b87975d095467906a', '16', '1', '启用', '3de078da3fe84a0d9b241c0624465cde', '', '', '2015-01-22 16:00:23', '0');
INSERT INTO `sys_dict` VALUES ('5ad29128534a4bfebe13ffff1c434b3d', '19', '0', '投票区主标题', 'b5497b9abd9c4639b96e275e2c077e3c', '', '', '2015-02-05 15:53:58', '0');
INSERT INTO `sys_dict` VALUES ('03b7ab4c973346d3a0d41804cd910453', '19', '1', '投票区副标题', 'b5497b9abd9c4639b96e275e2c077e3c', '', '', '2015-02-05 15:54:19', '0');
INSERT INTO `sys_dict` VALUES ('a1295edfb5f24f87a6379219a893d5c7', '21', '1', 'Web页面', '24895aa9aac84878a6cd3be7509c684b', '', '', '2015-02-07 17:18:08', '0');
INSERT INTO `sys_dict` VALUES ('cf840802e97b47a0ab87fcc82550e50d', '21', '2', '移动端页面', '24895aa9aac84878a6cd3be7509c684b', '', '', '2015-02-07 17:18:17', '0');
INSERT INTO `sys_dict` VALUES ('1b726a4051e14650915cea6a45ded2bc', '21', '3', 'APP页面', '24895aa9aac84878a6cd3be7509c684b', '', '', '2015-02-07 17:18:26', '0');
INSERT INTO `sys_dict` VALUES ('5aa31dd648cb4e99aa6fc4c6a14a0c7e', '18', '1', '轮播图下卖点区', 'd753baf586274e39924eed4b29db1850', '', '', '2015-02-05 15:51:53', '0');
INSERT INTO `sys_dict` VALUES ('20ebbe1314e9467e8a9b3ee7035d3618', '24', '0', '未审核', '536a564cead148958bf1c9f4444937df', '', '', '2015-02-11 14:57:19', '0');
INSERT INTO `sys_dict` VALUES ('871a8f02942c4e62a35cfdcd0211150f', '24', '1', '审核通过', '536a564cead148958bf1c9f4444937df', '', '', '2015-02-11 14:57:30', '0');
INSERT INTO `sys_dict` VALUES ('99484b215e3d4b788e88bdd294dc217f', '24', '2', '审核未通过', '536a564cead148958bf1c9f4444937df', '', '', '2015-02-11 14:57:39', '0');
INSERT INTO `sys_dict` VALUES ('70c28497b4a9461f92f2f4267b128f68', '24', '3', '已发货', '536a564cead148958bf1c9f4444937df', '', '', '2015-02-11 14:57:49', '0');
INSERT INTO `sys_dict` VALUES ('340e599495f94d05b42abd5e97d0c703', '24', '4', '已反馈', '536a564cead148958bf1c9f4444937df', '', '', '2015-02-11 14:58:03', '0');
INSERT INTO `sys_dict` VALUES ('34740955be064277ae3548ef29f1ea74', '18', '0', '头部卖点区', 'd753baf586274e39924eed4b29db1850', '', '', '2015-02-05 15:51:37', '0');
INSERT INTO `sys_dict` VALUES ('9ea008b8a70448ab9f634b2535ab162f', '22', '1', '690,280,100◆80,80,20', '3adca82a357d48c3a3de717fe21b4096', '', '大图片1920X1080,500K图标50X60,30k,web端', '2015-03-11 10:08:02', '0');
INSERT INTO `sys_dict` VALUES ('651049741a9042d492301cd74f1f8931', '22', '2', '198,262,100◆80,80,100', '3adca82a357d48c3a3de717fe21b4096', '', 'M站', '2015-02-12 19:11:52', '0');
INSERT INTO `sys_dict` VALUES ('bb09315952934eb2a543821056358224', '22', '3', '198,262,100◆80,80,1000', '3adca82a357d48c3a3de717fe21b4096', '', 'APP端', '2015-03-11 10:34:49', '0');
INSERT INTO `sys_dict` VALUES ('6d24a9548c9547b7bef28e7a8761aae1', '23', '1', '1200,300,100', 'c7c64b3fed024b5682b175a24a2391b0', '', '', '2015-03-09 16:03:05', '0');
INSERT INTO `sys_dict` VALUES ('c4b4d7dd6d974aca93601e3ad8f06fce', '23', '2', '592,196,300', 'c7c64b3fed024b5682b175a24a2391b0', '', '', '2015-03-14 19:49:47', '0');
INSERT INTO `sys_dict` VALUES ('bb4d97b8407244f2a6cbcecfb05113ee', '23', '3', '592,200,300', 'c7c64b3fed024b5682b175a24a2391b0', '', '', '2015-02-12 18:34:00', '0');
INSERT INTO `sys_dict` VALUES ('a53b116eb05046fa988f518424abe406', '20', '1', '1920,380,250', 'cbfab114a5d949029685be77653d8e66', '', '', '2015-04-13 20:07:49', '0');
INSERT INTO `sys_dict` VALUES ('b65e7dbcd6ee4e83b920b826b68d9be4', '20', '2', '640,440,400', 'cbfab114a5d949029685be77653d8e66', '', '', '2015-03-24 11:54:10', '0');
INSERT INTO `sys_dict` VALUES ('194937a7a9dc40ac81c08552633e9d6e', '20', '3', '640,440,400', 'cbfab114a5d949029685be77653d8e66', '', '', '2015-03-24 11:54:03', '0');

-- ----------------------------
-- Table structure for `sys_dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `ID` varchar(32) NOT NULL COMMENT '主键',
  `TYPE_CODE` decimal(3,0) DEFAULT NULL COMMENT '类型标识',
  `TYPE_NAME` varchar(50) DEFAULT NULL COMMENT '类型名称',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `TS` datetime DEFAULT NULL COMMENT '时间戳',
  `DR` decimal(1,0) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='字典类型';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('9b262042fe97447c8122e68e7ff2fe94', '1', '年龄范围', '年龄范围', '2015-02-02 11:29:07', '0');
INSERT INTO `sys_dict_type` VALUES ('ecd1ded311ee420e81fc41a021fe82dd', '30', 'Minisite类型', '', '2015-03-02 13:50:39', '0');
INSERT INTO `sys_dict_type` VALUES ('35b090957a0e438388662720b57567d6', '26', '卖点文案字数', '', '2015-03-09 15:56:04', '0');
INSERT INTO `sys_dict_type` VALUES ('684a1bd8d4584334a6c92c5785f320d6', '27', '平台卖点轮播图卖点区图片尺寸', '', '2015-03-09 15:57:41', '0');
INSERT INTO `sys_dict_type` VALUES ('2aea14289fcb47c89e0870265d95728d', '28', '卖点显示顺序', '', '2015-03-13 14:12:26', '0');
INSERT INTO `sys_dict_type` VALUES ('967706c087154289a090d583f56bc6d2', '29', '星期几', '用于预约管理', '2015-03-13 14:13:11', '0');
INSERT INTO `sys_dict_type` VALUES ('6ba4d770efad4fdbbceb3cd701d542ac', '31', 'F码发放通道', '', '2015-04-10 11:31:29', '0');
INSERT INTO `sys_dict_type` VALUES ('35a34fd4b52740f8a3f4d06522cd3297', '2', '鞋面颜色', '有图', '2014-12-04 17:40:16', '0');
INSERT INTO `sys_dict_type` VALUES ('066d1c87edd44570b6d282f4bf6bc18a', '3', '鞋跟高度', '有图', '2014-12-04 17:42:57', '0');
INSERT INTO `sys_dict_type` VALUES ('08c8a6450e104144bec142f1053b1147', '4', '鞋跟类型', '有图', '2014-12-04 17:44:36', '0');
INSERT INTO `sys_dict_type` VALUES ('dedcfb0e1c274fb59df1becb4f08c617', '5', '鞋码', '', '2014-12-04 17:45:32', '0');
INSERT INTO `sys_dict_type` VALUES ('fbb88d5e9582453391cb1ab64b7f03f2', '6', '价格范围 ', '', '2014-12-04 17:48:27', '0');
INSERT INTO `sys_dict_type` VALUES ('db32214220444ac4b9a4bb4894082e4b', '7', '是否中奖', '', '2014-12-04 18:23:09', '0');
INSERT INTO `sys_dict_type` VALUES ('0e8c944c2b094a378531f8cf977ecd93', '8', '来源', '', '2014-12-04 18:24:38', '0');
INSERT INTO `sys_dict_type` VALUES ('9de1336ac93f42d9a7ec6d742bd55a5c', '9', '状态', '', '2014-12-04 18:26:19', '0');
INSERT INTO `sys_dict_type` VALUES ('b5593c423bce4ca9864cfd6507276476', '10', '跳转类型', '跳转类型', '2015-01-04 15:50:52', '0');
INSERT INTO `sys_dict_type` VALUES ('0c20bad4e41042bc9fc8bc63e75f3b79', '11', '终端类型', '', '2015-01-22 15:54:35', '0');
INSERT INTO `sys_dict_type` VALUES ('d6d4c31b60ea491cae76d5bb6ac29356', '12', '轮播图跳转类型', '', '2015-01-22 15:56:53', '0');
INSERT INTO `sys_dict_type` VALUES ('66df182f9fd349d08605618c1750ad9b', '13', '轮播图状态', '', '2015-01-22 15:57:50', '0');
INSERT INTO `sys_dict_type` VALUES ('9810d0e861dd4710a1371753316e6ef2', '14', '广告位板式', '', '2015-01-22 15:58:45', '0');
INSERT INTO `sys_dict_type` VALUES ('fe09657fa586489fa71082c3ea35028d', '15', '广告位状态', '', '2015-01-22 15:59:25', '0');
INSERT INTO `sys_dict_type` VALUES ('3de078da3fe84a0d9b241c0624465cde', '16', '楼层状态', '', '2015-01-22 16:00:03', '0');
INSERT INTO `sys_dict_type` VALUES ('d753baf586274e39924eed4b29db1850', '18', '卖点位置', '', '2015-02-05 15:50:56', '0');
INSERT INTO `sys_dict_type` VALUES ('b5497b9abd9c4639b96e275e2c077e3c', '19', '投票位标题类型', '', '2015-02-05 15:52:25', '0');
INSERT INTO `sys_dict_type` VALUES ('24895aa9aac84878a6cd3be7509c684b', '21', 'CMS所属终端', '', '2015-02-07 17:17:49', '0');
INSERT INTO `sys_dict_type` VALUES ('536a564cead148958bf1c9f4444937df', '24', '招募状态字典', '', '2015-02-11 14:56:55', '0');
INSERT INTO `sys_dict_type` VALUES ('c7c64b3fed024b5682b175a24a2391b0', '23', '广告位图片尺寸', '', '2015-02-12 19:01:32', '0');
INSERT INTO `sys_dict_type` VALUES ('cbfab114a5d949029685be77653d8e66', '20', '轮播图尺寸', '三个站点的轮播图要求不同的尺寸', '2015-02-06 13:14:26', '0');
INSERT INTO `sys_dict_type` VALUES ('3adca82a357d48c3a3de717fe21b4096', '22', '投票位图片参数', '以逗号分隔长X宽,文件大小', '2015-02-10 11:26:02', '0');

-- ----------------------------
-- Table structure for `sys_func`
-- ----------------------------
DROP TABLE IF EXISTS `sys_func`;
CREATE TABLE `sys_func` (
  `FUNC_ID` varchar(32) NOT NULL COMMENT '主键',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `TYPE` varchar(6) DEFAULT NULL COMMENT '类型',
  `IS_LEAF` tinyint(2) DEFAULT NULL COMMENT '是否叶子',
  `URL` varchar(200) DEFAULT NULL COMMENT '地址或按钮键',
  `PARENT_ID` varchar(32) DEFAULT NULL COMMENT '父结点',
  `ORDER_CODE` varchar(10) DEFAULT NULL COMMENT '排序编号',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `DR` tinyint(2) DEFAULT NULL COMMENT '删除标志',
  `TS` datetime DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`FUNC_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='功能菜单';

-- ----------------------------
-- Records of sys_func
-- ----------------------------
INSERT INTO `sys_func` VALUES ('1', '功能菜单', 'MENU', '0', '', '', '0010', '', '0', null);
INSERT INTO `sys_func` VALUES ('4d3f1f5587ef4247a7f4dcb7ce099b62', '选择参照页', 'MENU', '1', '/common/ref', '4c99c665edf343d5a6ed83d8d35ffa61', '', '', '0', '2015-06-15 15:53:47');
INSERT INTO `sys_func` VALUES ('14d02052ca24408fb6edf26f16394983', '用户管理', 'MENU', '1', '/user/list', '402880ec2af47efb012af48398a30001', '', '', '0', '2015-01-22 20:26:18');
INSERT INTO `sys_func` VALUES ('33ac8a8ece714f3998215db84a045083', '修改密码', 'MENU', '1', '/user/toEditPws', '402880ec2af47efb012af48398a30001', '020', '', '0', '2015-01-22 20:33:11');
INSERT INTO `sys_func` VALUES ('402880ec2af47efb012af48398a30001', '系统管理', 'MENU', '0', '', '1', '01', '', '0', '2014-07-28 11:47:46');
INSERT INTO `sys_func` VALUES ('64e4716f5311449188aec9b9db4cd82a', '字典管理', 'MENU', '1', '/dicttype/list', '402880ec2af47efb012af48398a30001', '040', '', '0', null);
INSERT INTO `sys_func` VALUES ('9fe11e2f455a46b2a6874fa57cc80ff8', '菜单维护', 'MENU', '1', '/sysfunc/totree', '402880ec2af47efb012af48398a30001', '070', '', '0', '2014-09-06 16:47:10');
INSERT INTO `sys_func` VALUES ('a98721606eb1495d964f2a499a7ff793', '参数维护', 'MENU', '1', '/param/list', '402880ec2af47efb012af48398a30001', '050', '', '0', null);
INSERT INTO `sys_func` VALUES ('4c99c665edf343d5a6ed83d8d35ffa61', '开发辅助', 'MENU', '0', '', '1', '', '', '0', '2015-06-15 13:10:44');
INSERT INTO `sys_func` VALUES ('cf997dfd0a1e4a0d91651ebfee9774bd', '机构管理', 'MENU', '1', '/sysdept/totree', '402880ec2af47efb012af48398a30001', '080', '', '0', '2014-07-29 20:10:31');
INSERT INTO `sys_func` VALUES ('2e887b0e9e5f42b7a2c0e7ce5f70bd70', '代码生成', 'MENU', '1', '/code/list', '4c99c665edf343d5a6ed83d8d35ffa61', '', '', '0', '2015-06-15 13:11:04');
INSERT INTO `sys_func` VALUES ('ef33d21e9d8945b2ac813408866e028c', '角色管理', 'MENU', '1', '/role/list', '402880ec2af47efb012af48398a30001', '010', '', '0', null);
INSERT INTO `sys_func` VALUES ('66a43c79eeb246bc9a63c37e83a336ff', '测试树型', 'MENU', '1', '/systest/totree', '4c99c665edf343d5a6ed83d8d35ffa61', '', '', '0', '2015-06-15 15:44:24');
INSERT INTO `sys_func` VALUES ('0be46d4468bb4720ba12ad462b08567d', '下拉列表实例', 'MENU', '1', '/exp/select', '4c99c665edf343d5a6ed83d8d35ffa61', '', '', '0', '2015-06-15 15:51:02');

-- ----------------------------
-- Table structure for `sys_interval`
-- ----------------------------
DROP TABLE IF EXISTS `sys_interval`;
CREATE TABLE `sys_interval` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `IP` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `IP_desc` varchar(50) DEFAULT NULL COMMENT 'IP描述',
  `interval_second` int(11) DEFAULT NULL COMMENT '间隔秒数',
  `beford_time` datetime DEFAULT NULL COMMENT '上次时间',
  `interface_code` varchar(10) DEFAULT NULL COMMENT '接口编号',
  `interface_desc` varchar(50) DEFAULT NULL COMMENT '接口描述',
  `interface_address` varchar(50) DEFAULT NULL COMMENT '接口地址',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='访问间隔表';

-- ----------------------------
-- Records of sys_interval
-- ----------------------------
INSERT INTO `sys_interval` VALUES ('28', '127.0.0.1', '本地测试IP', '5', '2015-01-01 00:00:00', '100101', null, '订单查询');
INSERT INTO `sys_interval` VALUES ('29', '127.0.0.1', '本地测试IP', '5', '2015-01-01 00:00:00', '100102', null, '更新开始生产');
INSERT INTO `sys_interval` VALUES ('30', '127.0.0.1', '本地测试IP', '5', '2015-01-01 00:00:00', '100103', null, '更新运单号');

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `ID` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `LOG_TYPE` varchar(50) DEFAULT NULL COMMENT '类型',
  `POSITION` varchar(50) DEFAULT NULL COMMENT '发生位置',
  `IP` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `USER_NAME` varchar(50) DEFAULT NULL COMMENT '操作用户',
  `DETAIL` longtext COMMENT '详细',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `DR` varchar(1) DEFAULT NULL COMMENT '删除标志',
  `OCCUR_TIME` datetime DEFAULT NULL COMMENT '发生时间',
  `return_msg` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=660 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_para`
-- ----------------------------
DROP TABLE IF EXISTS `sys_para`;
CREATE TABLE `sys_para` (
  `ID` varchar(32) NOT NULL COMMENT '主键',
  `NAME` varchar(50) DEFAULT NULL COMMENT '参数名称',
  `PARAM_KEY` varchar(50) DEFAULT NULL COMMENT '参数键',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `TS` datetime DEFAULT NULL COMMENT '时间戳',
  `PARAM_VALUE` varchar(100) DEFAULT NULL COMMENT '参数值',
  `DR` decimal(1,0) DEFAULT NULL COMMENT '删除标记',
  `USABLE` decimal(1,0) DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统参数';

-- ----------------------------
-- Records of sys_para
-- ----------------------------
INSERT INTO `sys_para` VALUES ('111', '重置密码', 'defalt_password', '重置密码时的默认值', '2014-12-31 15:24:59', '111111', '0', '1');
INSERT INTO `sys_para` VALUES ('f59b5ed5ba4f4548b2f1356634529100', '每页记录个数', 'PAGE_SIZE', '每页记录个数', '2015-01-19 17:12:54', '30', '0', '0');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ID` varchar(32) NOT NULL COMMENT '主键',
  `NAME` varchar(32) DEFAULT NULL COMMENT '名称',
  `TS` datetime DEFAULT NULL COMMENT '时间戳',
  `REMARK` varchar(300) DEFAULT NULL COMMENT '备注',
  `DR` decimal(1,0) DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('898fdb77728241989d17db032dfa6053', '管理员', '2015-03-24 17:55:54', '', '0');
INSERT INTO `sys_role` VALUES ('8b8b0947777e46df9dbb32a2e6e7c0bf', '运营组', '2015-06-15 16:18:53', '运营组', '0');

-- ----------------------------
-- Table structure for `sys_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `ID` varchar(32) NOT NULL COMMENT '主键',
  `USER_ID` varchar(32) DEFAULT NULL COMMENT '用户',
  `TS` datetime DEFAULT NULL COMMENT '时间戳',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色用户关联';

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES ('9411c4c7f31749258ad0bd568c12e92d', '3', '2015-01-22 19:55:38', 'system', 'adf1eb3cd6684c7a92200bd8938fe45b');
INSERT INTO `sys_role_user` VALUES ('c538325bdb8f445d93b7fd6b268987c1', '76d9d12258224409a4802c6c73c320a3', '2015-01-22 19:55:38', 'system', 'adf1eb3cd6684c7a92200bd8938fe45b');
INSERT INTO `sys_role_user` VALUES ('9b1fb9d91c4e42d992c652cee5884d31', '1769275e640f4957bfe958168edc07b7', '2015-01-26 18:00:55', 'system', 'bd165d8cfe3549d887d0bbf64cdca1c9');
INSERT INTO `sys_role_user` VALUES ('a1f30a8b2946417190ca0a088b49a7ce', '2a00c2e1b74e453185b50fd628ea0815', '2015-01-26 18:00:55', 'system', 'bd165d8cfe3549d887d0bbf64cdca1c9');
INSERT INTO `sys_role_user` VALUES ('6c87655770c04010bccce9607cee0b68', '801ee0dffa254dfaa587f835d05c2e18', '2015-01-26 18:00:55', 'system', 'bd165d8cfe3549d887d0bbf64cdca1c9');
INSERT INTO `sys_role_user` VALUES ('734b86a9dd1f489f8cce8ebe30d23336', '8aa8690453874850af9ce48a411e0f86', '2015-01-26 18:00:55', 'system', 'bd165d8cfe3549d887d0bbf64cdca1c9');
INSERT INTO `sys_role_user` VALUES ('f80053aae9bb410ea0d0fa5bb6e7c88f', 'ff1359e4bfdc472cb2bf8f130375db04', '2015-01-26 18:00:55', 'system', 'bd165d8cfe3549d887d0bbf64cdca1c9');
INSERT INTO `sys_role_user` VALUES ('0588f76eccd34a6293f0299a7b230f58', '1d6b0fa113534546aef8c12a8bc4e788', '2015-06-15 16:18:31', 'system', '898fdb77728241989d17db032dfa6053');
INSERT INTO `sys_role_user` VALUES ('1610aa07c2c24bc9a28266cbda2515e4', '1769275e640f4957bfe958168edc07b7', '2015-06-15 16:18:31', 'system', '898fdb77728241989d17db032dfa6053');
INSERT INTO `sys_role_user` VALUES ('24c182260821490ea64ec529b8f58298', '0d9aa1fccfab4bdea8f47f9a8686ca55', '2015-06-15 16:18:31', 'system', '898fdb77728241989d17db032dfa6053');
INSERT INTO `sys_role_user` VALUES ('e8bab355acd04817af052b522e58045d', '2a00c2e1b74e453185b50fd628ea0815', '2015-06-15 16:18:31', 'system', '898fdb77728241989d17db032dfa6053');
INSERT INTO `sys_role_user` VALUES ('66b0f4dfd2994fc28b752ba3044ea4dd', '3', '2015-06-15 16:18:31', 'system', '898fdb77728241989d17db032dfa6053');
INSERT INTO `sys_role_user` VALUES ('cf30ec425b0f4614900448bd8f8c8b70', '76d9d12258224409a4802c6c73c320a3', '2015-06-15 16:18:31', 'system', '898fdb77728241989d17db032dfa6053');
INSERT INTO `sys_role_user` VALUES ('ff2fe61e32a04826b0b33518eee050c2', '801ee0dffa254dfaa587f835d05c2e18', '2015-06-15 16:18:31', 'system', '898fdb77728241989d17db032dfa6053');
INSERT INTO `sys_role_user` VALUES ('50df8be02e1b435f8697323011cdd0fc', '8aa8690453874850af9ce48a411e0f86', '2015-06-15 16:18:31', 'system', '898fdb77728241989d17db032dfa6053');
INSERT INTO `sys_role_user` VALUES ('de840a19f00d4d348db148a95b71d894', '0d9aa1fccfab4bdea8f47f9a8686ca55', '2015-06-15 16:18:59', 'system', '8b8b0947777e46df9dbb32a2e6e7c0bf');
INSERT INTO `sys_role_user` VALUES ('5b1a4344446f438cbd30979b4176f242', '1769275e640f4957bfe958168edc07b7', '2015-06-15 16:18:59', 'system', '8b8b0947777e46df9dbb32a2e6e7c0bf');
INSERT INTO `sys_role_user` VALUES ('ed67c2cff3e743bda2304366be04b317', '1d6b0fa113534546aef8c12a8bc4e788', '2015-06-15 16:18:59', 'system', '8b8b0947777e46df9dbb32a2e6e7c0bf');
INSERT INTO `sys_role_user` VALUES ('4ddfef5520b44df8a97a8247cdc5212a', '2a00c2e1b74e453185b50fd628ea0815', '2015-06-15 16:18:59', 'system', '8b8b0947777e46df9dbb32a2e6e7c0bf');
INSERT INTO `sys_role_user` VALUES ('7f180aa1dafd471d82784bf9b353a6ae', '3', '2015-06-15 16:18:59', 'system', '8b8b0947777e46df9dbb32a2e6e7c0bf');
INSERT INTO `sys_role_user` VALUES ('3fca6ec120fd4a44869465ca40c0c7c5', '76d9d12258224409a4802c6c73c320a3', '2015-06-15 16:18:59', 'system', '8b8b0947777e46df9dbb32a2e6e7c0bf');
INSERT INTO `sys_role_user` VALUES ('a5f4ad02b04d4801ab6fdb177ea3560b', '801ee0dffa254dfaa587f835d05c2e18', '2015-06-15 16:18:59', 'system', '8b8b0947777e46df9dbb32a2e6e7c0bf');
INSERT INTO `sys_role_user` VALUES ('ea32643410344755a12d38570a289bbf', '8aa8690453874850af9ce48a411e0f86', '2015-06-15 16:18:59', 'system', '8b8b0947777e46df9dbb32a2e6e7c0bf');

-- ----------------------------
-- Table structure for `sys_test`
-- ----------------------------
DROP TABLE IF EXISTS `sys_test`;
CREATE TABLE `sys_test` (
  `ID` varchar(32) NOT NULL COMMENT '主键',
  `NAME` varchar(60) DEFAULT NULL COMMENT '名称',
  `PARENT_ID` varchar(32) DEFAULT NULL COMMENT '父结点',
  `IS_LEAF` tinyint(2) DEFAULT NULL COMMENT '是否叶子',
  `ORDER_CODE` varchar(10) DEFAULT NULL COMMENT '排序编号',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `TS` datetime DEFAULT NULL COMMENT '时间戳',
  `DR` tinyint(2) DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of sys_test
-- ----------------------------
INSERT INTO `sys_test` VALUES ('052e2e9890ac4b759a8351468c92a209', '陕西', '1', '0', '0', null, '2013-05-29 09:52:29', '0');
INSERT INTO `sys_test` VALUES ('0a6b4cea34f24a3ab819ede8e2b818a5', '朝阳区', '2fed2fb50aab4ccab73e8c195e524340', '1', '1', null, '2013-05-29 10:17:51', '0');
INSERT INTO `sys_test` VALUES ('1', '组织机构', '', '0', '0', '', null, '0');
INSERT INTO `sys_test` VALUES ('1473dafc397144e48a3014f78ac93c2d', '石家庄', '29176d46665d43b88d124fe49385aeb2', '1', '1', null, '2013-05-29 09:57:08', '0');
INSERT INTO `sys_test` VALUES ('29176d46665d43b88d124fe49385aeb2', '河北', '1', '0', '0', '', '2013-05-29 09:56:57', '0');
INSERT INTO `sys_test` VALUES ('2fed2fb50aab4ccab73e8c195e524340', '北京', '1', '0', '0', null, '2013-05-29 09:59:38', '0');
INSERT INTO `sys_test` VALUES ('369b5b02cdb0498b924858f58e65dcc8', '昌平', '2fed2fb50aab4ccab73e8c195e524340', '1', '1', null, '2013-05-29 14:21:39', '0');
INSERT INTO `sys_test` VALUES ('3a00f44eef73467fb87d3828bc79d9e2', '秦皇岛', '29176d46665d43b88d124fe49385aeb2', '1', '1', '11', '2013-05-29 09:58:30', '0');
INSERT INTO `sys_test` VALUES ('66065af841ef4f089d9287e9ab477beb', '西安', '052e2e9890ac4b759a8351468c92a209', '1', '0', null, '2013-05-29 09:53:28', '0');
INSERT INTO `sys_test` VALUES ('c40ff9552bf4489288575d3f9459bd03', '邯郸', '29176d46665d43b88d124fe49385aeb2', '1', '1', null, '2013-05-29 09:58:13', '0');
INSERT INTO `sys_test` VALUES ('c7d72b3b18b54ce78c3ba15708d9325d', '张家口', '29176d46665d43b88d124fe49385aeb2', '1', '1', 'qqqq', '2014-07-29 19:15:10', '0');
INSERT INTO `sys_test` VALUES ('cb0c808b16ed4adc9969b01c6720d971', '延安', '052e2e9890ac4b759a8351468c92a209', '1', '0', '', '2013-05-29 09:56:14', '0');
INSERT INTO `sys_test` VALUES ('d79c2d39b9784eddae2f9d71b861e779', '陕西总队', '052e2e9890ac4b759a8351468c92a209', '1', '1', '', '2013-05-29 09:55:16', '0');

-- ----------------------------
-- Table structure for `sys_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_type`;
CREATE TABLE `sys_type` (
  `ID` varchar(32) NOT NULL COMMENT '主键',
  `NAME` varchar(20) NOT NULL COMMENT '名称',
  `PARENT_ID` varchar(32) DEFAULT NULL COMMENT '父结点ID',
  `IS_LEAF` tinyint(2) DEFAULT NULL COMMENT '是否叶子',
  `TS` datetime DEFAULT NULL COMMENT '时间戳',
  `REMARK` varchar(100) DEFAULT NULL COMMENT '备注',
  `ORDER_CODE` varchar(10) DEFAULT NULL COMMENT '排序编号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产类型表';

-- ----------------------------
-- Records of sys_type
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `ID` varchar(32) NOT NULL COMMENT '主键',
  `ORGANIZE_ID` varchar(32) DEFAULT NULL COMMENT '行政区划',
  `LOGIN_ID` varchar(50) DEFAULT NULL COMMENT '登录名',
  `PASSWORD` varchar(50) DEFAULT NULL COMMENT '登录密码',
  `USER_TYPE` varchar(10) DEFAULT '0' COMMENT '用户类型',
  `SEX_STAT` varchar(10) DEFAULT NULL COMMENT '性别',
  `NAME` varchar(50) DEFAULT NULL COMMENT '姓名',
  `E_MAIL` varchar(50) DEFAULT NULL COMMENT '电邮',
  `ID_CARD` varchar(50) DEFAULT NULL COMMENT '身份证号',
  `TEL` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `TS` datetime DEFAULT NULL COMMENT '时间戳',
  `DR` decimal(1,0) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', 'admin', 'lueSGJZetyySpUndWjMBEg==', null, '1', '管理员', '5', '5', '5', '5', '2015-01-22 18:29:02', '0');
INSERT INTO `sys_user` VALUES ('1769275e640f4957bfe958168edc07b7', 'c7d72b3b18b54ce78c3ba15708d9325d', 'liyi', 'lueSGJZetyySpUndWjMBEg==', null, '1', '李毅', '1', '2', '2', '2', '2015-01-22 19:33:51', '0');
INSERT INTO `sys_user` VALUES ('2a00c2e1b74e453185b50fd628ea0815', '29176d46665d43b88d124fe49385aeb2', 'wangchengqing', 'lueSGJZetyySpUndWjMBEg==', null, '1', '王成庆', '1', '2', '2', '2', '2015-01-22 20:45:52', '0');
INSERT INTO `sys_user` VALUES ('3', '27dc825c651342da8a8b8c2342fbac79', 'shenhe1', 'lueSGJZetyySpUndWjMBEg==', null, '1', '审核员1', '1', '1', '1', '1', '2015-01-22 19:55:15', '0');
INSERT INTO `sys_user` VALUES ('801ee0dffa254dfaa587f835d05c2e18', '65675bb2fd5e4c53aca971e0505a14c8', 'liuhui', 'lueSGJZetyySpUndWjMBEg==', null, '1', '刘辉', '2', '2', '2', '2', '2015-01-22 20:39:31', '0');
INSERT INTO `sys_user` VALUES ('8aa8690453874850af9ce48a411e0f86', '65675bb2fd5e4c53aca971e0505a14c8', 'liuzhiyong', 'lueSGJZetyySpUndWjMBEg==', null, '1', '李志勇', '3', '3', '3', '3', '2015-01-22 20:40:17', '0');
INSERT INTO `sys_user` VALUES ('76d9d12258224409a4802c6c73c320a3', '27dc825c651342da8a8b8c2342fbac79', 'shenhe2', 'lueSGJZetyySpUndWjMBEg==', null, '1', '审核员2', 'string', 'string', 'string', 'string', '2015-01-22 19:55:25', '0');
INSERT INTO `sys_user` VALUES ('0d9aa1fccfab4bdea8f47f9a8686ca55', '9972f1515bd54e9dac56cbdd859a1124', 'qiyong', 'lueSGJZetyySpUndWjMBEg==', null, '1', '祁勇', '1', '1', '1', '1', '2015-02-28 17:52:37', '0');
INSERT INTO `sys_user` VALUES ('1d6b0fa113534546aef8c12a8bc4e788', '27dc825c651342da8a8b8c2342fbac79', '15600581070', 'lueSGJZetyySpUndWjMBEg==', null, null, '15600581070', '', '1000154', '15600581070', '', '2015-03-22 16:58:47', '0');
