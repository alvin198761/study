/*
Navicat SQL Server Data Transfer

Source Server         : 192.168.99.201
Source Server Version : 105000
Source Host           : 192.168.99.201:1433
Source Database       : dztest
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 105000
File Encoding         : 65001

Date: 2016-02-24 19:52:34
*/


-- ----------------------------
-- Table structure for sys_auth
-- ----------------------------
DROP TABLE [dbo].[sys_auth]
GO
CREATE TABLE [dbo].[sys_auth] (
[AUTHORITY_ID] varchar(32) NOT NULL ,
[RESOURCE_ID] varchar(32) NULL ,
[RESOURCE_TYPE] varchar(50) NULL ,
[VISITOR_ID] varchar(32) NULL ,
[REMARK] varchar(300) NULL ,
[CREATE_DATE] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_auth', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'权限信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_auth'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'权限信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_auth'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_auth', 
'COLUMN', N'AUTHORITY_ID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_auth'
, @level2type = 'COLUMN', @level2name = N'AUTHORITY_ID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_auth'
, @level2type = 'COLUMN', @level2name = N'AUTHORITY_ID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_auth', 
'COLUMN', N'RESOURCE_ID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'资源ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_auth'
, @level2type = 'COLUMN', @level2name = N'RESOURCE_ID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'资源ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_auth'
, @level2type = 'COLUMN', @level2name = N'RESOURCE_ID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_auth', 
'COLUMN', N'RESOURCE_TYPE')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'资源类类'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_auth'
, @level2type = 'COLUMN', @level2name = N'RESOURCE_TYPE'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'资源类类'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_auth'
, @level2type = 'COLUMN', @level2name = N'RESOURCE_TYPE'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_auth', 
'COLUMN', N'VISITOR_ID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'访问者ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_auth'
, @level2type = 'COLUMN', @level2name = N'VISITOR_ID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'访问者ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_auth'
, @level2type = 'COLUMN', @level2name = N'VISITOR_ID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_auth', 
'COLUMN', N'REMARK')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_auth'
, @level2type = 'COLUMN', @level2name = N'REMARK'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_auth'
, @level2type = 'COLUMN', @level2name = N'REMARK'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_auth', 
'COLUMN', N'CREATE_DATE')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'时间戳'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_auth'
, @level2type = 'COLUMN', @level2name = N'CREATE_DATE'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'时间戳'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_auth'
, @level2type = 'COLUMN', @level2name = N'CREATE_DATE'
GO

-- ----------------------------
-- Records of sys_auth
-- ----------------------------
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'90fe309f54f947b9b13f3dd959b4a10a', N'1', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'6bb90bcd86d9453085fbafa012e96dd9', N'e3847665344d4f98b12b68d33ddb64b3', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'43de08e69efd4e40938988e550a5b1df', N'1286ec2599504306ac85c2bc10faa081', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'822a6bdb374b4ebaa9c3807b72c45c64', N'3845a0c2e0cd4464860bfae14334a538', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'2ac290df34a44e3e9b96bcccbb77975d', N'41024b8a9b264549baf87ae005a5ec97', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'689fdd1019be4dafbd1c255fb669c6c1', N'02c4d07a4ff84b5db1ed5934224dd482', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'3666b2d3e37c468598b1043cc675f7b1', N'c14e397fd57b401f8df47f2ce88f5917', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'd2efb024900644e09da4af9ea36472bc', N'969f514260804b4a8d70a4c68595effc', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'669cab16354241fba85e3fd983af32ec', N'7a2b745dfef6489b9915476178240ce4', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'abe14897d8ef4a859c36fd9922bb550d', N'c0e2af23122749d6a3976451b3ef06fc', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'242a74191e294941b09069569a84ac7c', N'402880ec2af47efb012af48398a30001', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'798af7ead16049d38d770d27cc13793c', N'14d02052ca24408fb6edf26f16394983', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'd58a520bf4814d64989e4f7f91fbccdf', N'40bf5c941428428f92a13b1c5763c544', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'8660288d6bb242c080006cabfd9ceeec', N'ef33d21e9d8945b2ac813408866e028c', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'a8e4c1a1d5b240d592737d369dd05a2f', N'33ac8a8ece714f3998215db84a045083', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'e2962250adac4c18b522b9d74f52ebde', N'64e4716f5311449188aec9b9db4cd82a', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'542b957cf1fc43d3abaf4114c572f639', N'a98721606eb1495d964f2a499a7ff793', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'6321a1029a054378ad01cf4102dd3bce', N'e326f8963b244a5cac0a27767134b26d', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'2681cfa39346499e900656d47b6a23d2', N'cf997dfd0a1e4a0d91651ebfee9774bd', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'97b51fae0cb642989b0a3e376db4b2a4', N'9fe11e2f455a46b2a6874fa57cc80ff8', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'ee285be198fd4e8392c7e1ec83e9e786', N'e4914f8c5c4b4c68b6772666e761cb88', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'935fb69159e34295bb61837cbf4b7d52', N'85b7c116755749159df8fa8708fda0ce', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'1028cbad98f7411ba64764db51400f97', N'1680d38101de482dbb031c38e79d70df', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'2a9fe770ed9d424d8182bedb143524ac', N'26c7a48d9e7f415e9da8befd4d345164', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'e9a032c9d4a249e0ac0a4f80077ecf7f', N'98a28ff9511e433fa92122a2e7977bcb', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'3a38b4d75d864b2097e771747d838fee', N'a66b367e69004b6b85bfb0f8dd1f521b', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'ec2f56d447734773ae90fe324a28f142', N'c7a24d7c15aa4dfa802be36f1e42b746', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'a6a810c2066d4c65a6826f3bc0cad2b4', N'344339314ca24c6e9c3900e11259d6bc', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'53cc91da51694b0d975d4426b72ba7f1', N'8f13c12b3fb1457ab70186edb5e61a3f', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'c1e3a45bb4bf48fd8070b17099387a3b', N'f7b8e889f4ae4a51bc27f1e00cbabfbe', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'3db1d761685e4ddf91833b2aac68f313', N'1df1f4c83d4f4e759142b33e06fac781', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'986f7b099f3e41e49869947d9d83ce7f', N'0b028484e5ec44119c898a9311ea8ad3', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'657ad6346c874eab838f356db6540634', N'16b9ab1c36b64b76a117b6952c5eac31', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'038ac06b853c489c96cf21f97e6e13bf', N'a4ca5d50a8654b21b9ef23e1d0c205e2', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'a048246b5e75493798bd08fab3630425', N'292328216ef04fd388f8892fd7de8533', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'59958a9982734349a93091b45e419f2c', N'70f521c60fbd4612a1b36728ba387084', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'f5334632d18f4a8ba193b2b844a4a829', N'3c570fea2d494a168f30abfe96c8ca1b', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'8ef3672345e64c58a0247c4ffc48f7d2', N'd85857424dae4fa9a9ed2842be64994a', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'7f152059c3c34907af17f4eebd0e368f', N'a1099e6ef3c34824a10eae77bced21aa', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'2a70767d50b84cabaac2c5aadf251e3a', N'a8194ffc1cc84ba78f4e77b201e0a13d', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'bfd360d7ff3e4dcc93c6134180c4528e', N'591d21094c3e40f1b91716b8ff0e1fa2', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'89a311ad625a4c6cb8a21d6af40f6993', N'da3e987e2b214e4d9a1b5e291967b295', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'84fabf8b2ba34752ad6c4c4ad45f9ac1', N'7bfe54c137dc4fefb7274daa89134174', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'8b680ff04f7f4e668fb7052d5f596607', N'e0dc351a58794708b02f12eac767f446', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'5cdfcf89842b45a7853453694f0af220', N'b6dd5ca4c9d34ce79fb3acf4957a9984', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'ea14c9c5cc344ed187cecfa17c81f9de', N'bfba2d6e4a974173a2480e393fec7793', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'aedc69bbb67245bb966b4eb831ac2fff', N'671fa7bffe9e4ee8ad1f54179b3ac533', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'e9b431d3106f462e870cb7512a035c45', N'f3b30cf3d3e9461391934b1fd713c7e2', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'fa27226d035b440dae083b56189e3da2', N'd41d8c7a89204d6281c3522ae7833255', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'0d77f2d3e45a402db2690b74d966b6fa', N'9f0e91810dc648839ce006c27152d443', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'1d2e8be188f54e8ab72e1b4fc54f4695', N'ff77aeb846e34fd384e192362b247079', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'660be76d48c843ea866c5fb04f00c40b', N'0ecd54dab2f64e99815b5a6d3cd0e68d', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'b404b2c6d48f4a0c8e6e13aabbec40f2', N'962c6d910bbf4f319eda2d020acdd9f8', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'2eb490d064134eec9985550522ef45bb', N'2498f8a266e74fb880b8b6c3a009f730', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'0da0bf96f1c040108585ee379b2b555d', N'7386dd576d3d4014b61c6c40fdd09e1f', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'011a1978600e4cdca87238864cea85e2', N'cf166b22a3d546c19473160850af8c46', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'acba2b593cc54e2ba88ff99eb69b8725', N'0f218335b745497cb810a4baf4c088e2', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'e54f8f31bfde431e8e4ae4c8df1921ca', N'3c55feccaf5144059b4d04f7083227b1', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'0925929e171d4f5b8674a15929c8b8ce', N'59d7ff4985294f47bb5de36732d67d29', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'037e13dd221e471dad2a1ebfe2affa23', N'a328f829a1d6479eb7bcea0cad70b176', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'a5b108250ecd45d59bd17d6209c1c595', N'2b026c826f08479e86ce8424272b90cb', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'84bc85911f1d4382942c8af0222f4a8f', N'88582afa953840e9bb17cce6f11385c6', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'219e17478fe34feb87bf7b37fc3e877e', N'1470a1b5115d49c7927d432908f8dbb0', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'609839d70da84239bd7177294d16f098', N'2b6327c0bd3041fd96d8a683be38428b', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'e3fb8a80419443df8440704a459928d1', N'afc976b3aa264802854f6522d332d16c', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'6ba39f13e00e4ca9a426fc1cee4dbebb', N'be977428afed46ee998266c820b20749', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'55c0da665492482c9fdbb016374cb49b', N'101a321401264424bb7abaedca13134a', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'5000c3f74e3f4920bc6b7c5d6899d740', N'780333c4c22c49d48614dde3eadca0ff', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'75be9ff5490e4585a739932f1bbc10c1', N'd37a8b391721497d91817c3cb213955d', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'007296cf161c4b35ace3c5b2b9a1904b', N'9d97614a4be242e18e75c2ec47a9b368', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'af971eb7cb9f4b2eb08d3ad639f64549', N'1a8929561871402099bf5a217531177c', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'd88cf5d06a9546a79e7dfd1e0e5276ef', N'65e4ab28d3124ce0b90ff5a3aee25d09', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'feefeb1d1f1b47218694c3ab3ce82353', N'40c8990117ab42efb7b13b024a3f151f', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'221765f11b4243c3b64db0a5b4347dcc', N'52704cebbcff4430b22b10051fda4492', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'3fe3201d5c0742a79035f06ec2e3a637', N'ea8bfe2c1c834a708d0e0444f4d11907', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'153b97ab733f4f938f30ef4ac7d5f3d4', N'0e8bece8d7c1493f9cf6a684ef3e1583', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO
INSERT INTO [dbo].[sys_auth] ([AUTHORITY_ID], [RESOURCE_ID], [RESOURCE_TYPE], [VISITOR_ID], [REMARK], [CREATE_DATE]) VALUES (N'9de94b7b8eaa49f7870ec1c7e62e9383', N'0060f53644c149d9993442d50bd90b68', N'Menu', N'adf1eb3cd6684c7a92200bd8938fe45b', N'', N'2015-10-26 14:18:35.837')
GO
GO

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE [dbo].[sys_dept]
GO
CREATE TABLE [dbo].[sys_dept] (
[ID] varchar(32) NOT NULL ,
[NAME] varchar(60) NULL ,
[PARENT_ID] varchar(32) NULL ,
[IS_LEAF] decimal(1) NULL ,
[ORDER_CODE] varchar(10) NULL ,
[REMARK] varchar(200) NULL ,
[TS] datetime NULL ,
[DR] decimal(1) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dept', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dept'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dept'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dept', 
'COLUMN', N'ID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dept'
, @level2type = 'COLUMN', @level2name = N'ID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dept'
, @level2type = 'COLUMN', @level2name = N'ID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dept', 
'COLUMN', N'NAME')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dept'
, @level2type = 'COLUMN', @level2name = N'NAME'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dept'
, @level2type = 'COLUMN', @level2name = N'NAME'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dept', 
'COLUMN', N'PARENT_ID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'父结点'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dept'
, @level2type = 'COLUMN', @level2name = N'PARENT_ID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'父结点'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dept'
, @level2type = 'COLUMN', @level2name = N'PARENT_ID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dept', 
'COLUMN', N'IS_LEAF')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否叶子'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dept'
, @level2type = 'COLUMN', @level2name = N'IS_LEAF'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否叶子'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dept'
, @level2type = 'COLUMN', @level2name = N'IS_LEAF'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dept', 
'COLUMN', N'ORDER_CODE')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dept'
, @level2type = 'COLUMN', @level2name = N'ORDER_CODE'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dept'
, @level2type = 'COLUMN', @level2name = N'ORDER_CODE'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dept', 
'COLUMN', N'REMARK')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dept'
, @level2type = 'COLUMN', @level2name = N'REMARK'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dept'
, @level2type = 'COLUMN', @level2name = N'REMARK'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dept', 
'COLUMN', N'TS')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'时间戳'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dept'
, @level2type = 'COLUMN', @level2name = N'TS'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'时间戳'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dept'
, @level2type = 'COLUMN', @level2name = N'TS'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dept', 
'COLUMN', N'DR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dept'
, @level2type = 'COLUMN', @level2name = N'DR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dept'
, @level2type = 'COLUMN', @level2name = N'DR'
GO

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO [dbo].[sys_dept] ([ID], [NAME], [PARENT_ID], [IS_LEAF], [ORDER_CODE], [REMARK], [TS], [DR]) VALUES (N'27dc825c651342da8a8b8c2342fbac79', N'审核组', N'1', N'1', N'', N'', N'2015-01-22 19:27:41.690', N'0')
GO
GO
INSERT INTO [dbo].[sys_dept] ([ID], [NAME], [PARENT_ID], [IS_LEAF], [ORDER_CODE], [REMARK], [TS], [DR]) VALUES (N'1', N'随变科技', N'', N'0', N'0', N'', N'2015-01-21 20:53:34.160', N'0')
GO
GO
INSERT INTO [dbo].[sys_dept] ([ID], [NAME], [PARENT_ID], [IS_LEAF], [ORDER_CODE], [REMARK], [TS], [DR]) VALUES (N'29176d46665d43b88d124fe49385aeb2', N'必要', N'1', N'0', N'1', N'', N'2015-10-08 17:17:27.193', N'0')
GO
GO
INSERT INTO [dbo].[sys_dept] ([ID], [NAME], [PARENT_ID], [IS_LEAF], [ORDER_CODE], [REMARK], [TS], [DR]) VALUES (N'3a00f44eef73467fb87d3828bc79d9e2', N'运营', N'29176d46665d43b88d124fe49385aeb2', N'1', N'1', N'', N'2015-01-22 14:41:21.507', N'0')
GO
GO
INSERT INTO [dbo].[sys_dept] ([ID], [NAME], [PARENT_ID], [IS_LEAF], [ORDER_CODE], [REMARK], [TS], [DR]) VALUES (N'9972f1515bd54e9dac56cbdd859a1124', N'运维', N'29176d46665d43b88d124fe49385aeb2', N'1', N'1', N'', N'2015-01-22 20:44:52.407', N'0')
GO
GO
INSERT INTO [dbo].[sys_dept] ([ID], [NAME], [PARENT_ID], [IS_LEAF], [ORDER_CODE], [REMARK], [TS], [DR]) VALUES (N'65675bb2fd5e4c53aca971e0505a14c8', N'开发', N'29176d46665d43b88d124fe49385aeb2', N'1', N'1', N'', N'2015-01-22 14:41:29.290', N'0')
GO
GO
INSERT INTO [dbo].[sys_dept] ([ID], [NAME], [PARENT_ID], [IS_LEAF], [ORDER_CODE], [REMARK], [TS], [DR]) VALUES (N'72da0f0b28694b539ebbf8ac5807ad83', N'米兰港', N'1', N'1', N'0', N'', N'2015-01-21 20:54:25.337', N'0')
GO
GO
INSERT INTO [dbo].[sys_dept] ([ID], [NAME], [PARENT_ID], [IS_LEAF], [ORDER_CODE], [REMARK], [TS], [DR]) VALUES (N'c7d72b3b18b54ce78c3ba15708d9325d', N'测试', N'29176d46665d43b88d124fe49385aeb2', N'1', N'1', N'qqqq', N'2015-01-22 14:41:37.200', N'0')
GO
GO
INSERT INTO [dbo].[sys_dept] ([ID], [NAME], [PARENT_ID], [IS_LEAF], [ORDER_CODE], [REMARK], [TS], [DR]) VALUES (N'd067969b8fca46e089a04916b3905fd8', N'产品', N'29176d46665d43b88d124fe49385aeb2', N'1', N'3', N'', N'2015-10-08 17:17:52.103', N'0')
GO
GO
INSERT INTO [dbo].[sys_dept] ([ID], [NAME], [PARENT_ID], [IS_LEAF], [ORDER_CODE], [REMARK], [TS], [DR]) VALUES (N'f4fe17830f414427bd7072c67b9a7681', N'策划', N'29176d46665d43b88d124fe49385aeb2', N'1', N'2', N'', N'2015-01-22 14:56:47.667', N'0')
GO
GO

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE [dbo].[sys_dict]
GO
CREATE TABLE [dbo].[sys_dict] (
[ID] varchar(32) NOT NULL ,
[TYPE_CODE] numeric(3) NULL ,
[DATA_KEY] numeric(3) NULL ,
[DATA_VALUE] varchar(50) NULL ,
[TYPE_ID] varchar(32) NULL ,
[IMG_URL] varchar(300) NULL ,
[REMARK] varchar(300) NULL ,
[TS] datetime NULL ,
[DR] decimal(1) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dict', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据字典'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据字典'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dict', 
'COLUMN', N'ID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict'
, @level2type = 'COLUMN', @level2name = N'ID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict'
, @level2type = 'COLUMN', @level2name = N'ID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dict', 
'COLUMN', N'TYPE_CODE')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'类型编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict'
, @level2type = 'COLUMN', @level2name = N'TYPE_CODE'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'类型编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict'
, @level2type = 'COLUMN', @level2name = N'TYPE_CODE'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dict', 
'COLUMN', N'DATA_KEY')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict'
, @level2type = 'COLUMN', @level2name = N'DATA_KEY'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict'
, @level2type = 'COLUMN', @level2name = N'DATA_KEY'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dict', 
'COLUMN', N'DATA_VALUE')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict'
, @level2type = 'COLUMN', @level2name = N'DATA_VALUE'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict'
, @level2type = 'COLUMN', @level2name = N'DATA_VALUE'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dict', 
'COLUMN', N'TYPE_ID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'类型名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict'
, @level2type = 'COLUMN', @level2name = N'TYPE_ID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'类型名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict'
, @level2type = 'COLUMN', @level2name = N'TYPE_ID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dict', 
'COLUMN', N'REMARK')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict'
, @level2type = 'COLUMN', @level2name = N'REMARK'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict'
, @level2type = 'COLUMN', @level2name = N'REMARK'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dict', 
'COLUMN', N'TS')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'时间戳'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict'
, @level2type = 'COLUMN', @level2name = N'TS'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'时间戳'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict'
, @level2type = 'COLUMN', @level2name = N'TS'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dict', 
'COLUMN', N'DR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除标记'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict'
, @level2type = 'COLUMN', @level2name = N'DR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标记'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict'
, @level2type = 'COLUMN', @level2name = N'DR'
GO

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'e86023f8d9d6470aa3ff6686137f95c0', N'27', N'1', N'38,38,100', N'cfc0475ad97f4ae6b475d22995f6e056', N'', N'', N'2015-03-06 15:45:11.100', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'2eac06af3cde4c53aa9c91b7033e6033', N'27', N'2', N'40,40,100', N'cfc0475ad97f4ae6b475d22995f6e056', N'', N'', N'2015-03-06 15:45:17.890', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'b0856f4417574eff84e89e9b5d150aa7', N'34', N'3', N'40,40,100', N'29b71ec539fc455eb8ee6abb9a91deb2', N'', N'', N'2015-03-06 15:45:27.387', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'39f4ece2308940418a4bdf00a55705d9', N'28', N'1', N'1', N'17afd3d7d13a4516a0902650433b65f3', N'', N'', N'2015-03-09 16:45:51.957', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'992e3b6be203477eba27d4015316383e', N'28', N'2', N'2', N'17afd3d7d13a4516a0902650433b65f3', N'', N'', N'2015-03-09 16:45:56.247', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'9eb89f405fb144fc87adfa71351f4588', N'29', N'1', N'星期日', N'48142b25333e4d5792882baa568d12c5', N'', N'', N'2015-03-16 11:34:57.687', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'bcb924a5a0c24aacb4776848feaa3b14', N'29', N'2', N'星期一', N'48142b25333e4d5792882baa568d12c5', N'', N'', N'2015-03-16 11:35:06.733', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'4239f8e8a43b4073be4c20843b1accae', N'29', N'3', N'星期二', N'48142b25333e4d5792882baa568d12c5', N'', N'', N'2015-03-16 11:35:13.487', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'378982b68d2b491f80394f19b83755c5', N'29', N'4', N'星期三', N'48142b25333e4d5792882baa568d12c5', N'', N'', N'2015-03-16 11:35:21.377', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'2cfafbdf29974a7eaa34a83c4ac2f8f1', N'29', N'5', N'星期四', N'48142b25333e4d5792882baa568d12c5', N'', N'', N'2015-03-16 11:35:27.257', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'57d020b38b6f43ceb214e0157014afe0', N'29', N'6', N'星期五', N'48142b25333e4d5792882baa568d12c5', N'', N'', N'2015-03-16 11:35:33.193', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'af3309a82391424a86b8cfb3e65272aa', N'29', N'7', N'星期六', N'48142b25333e4d5792882baa568d12c5', N'', N'', N'2015-03-16 11:35:39.267', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'a0776181e289400183f7a006dddf2078', N'31', N'1', N'短信', N'1e54bd0de542485ba065c5586758ee5d', N'', N'', N'2015-04-02 16:56:12.340', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'914bc3c3a04b43f2930546d1587cc71a', N'31', N'2', N'站内信', N'1e54bd0de542485ba065c5586758ee5d', N'', N'', N'2015-04-02 16:56:17.570', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'8e3b2e45c528446bb8a87ebf5e912715', N'33', N'1', N'pc', N'f71cbcf09c9a4212917320f1259ae4b6', N'', N'', N'2015-06-23 15:08:48.977', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'5564972f637c45338cd06d788ba2f512', N'33', N'2', N'mweb', N'f71cbcf09c9a4212917320f1259ae4b6', N'', N'', N'2015-06-23 15:08:59.217', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'359a4008cbf340a3b0c4dee40f136961', N'34', N'1', N'215,180,80', N'29b71ec539fc455eb8ee6abb9a91deb2', N'', N'web端宽，高，大小', N'2015-07-09 12:58:20.507', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'4562a0181ed14fb7be230dc8f7ac9058', N'41', N'2', N'必要市场部', N'd1ad0a62ebea49e890a49fa0c54f2017', N'', N'', N'2015-07-16 16:28:27.210', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'8ece27d2ce75489e92356178c0575e86', N'41', N'3', N'必要运营部', N'd1ad0a62ebea49e890a49fa0c54f2017', N'', N'', N'2015-07-16 16:28:39.640', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'9941f8d3e2624274ab998122840db3e1', N'41', N'4', N'必要BD', N'd1ad0a62ebea49e890a49fa0c54f2017', N'', N'', N'2015-07-16 16:28:53.300', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'8dcd5024b4e64571b3d9d0ac1c621994', N'41', N'5', N'必要供应链', N'd1ad0a62ebea49e890a49fa0c54f2017', N'', N'', N'2015-07-16 16:29:09.970', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'5dc6abddcd864c148c041551c0e29313', N'41', N'6', N'米兰港', N'd1ad0a62ebea49e890a49fa0c54f2017', N'', N'', N'2015-07-16 16:29:24.427', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'b9c566e95c71404b948eb9b23e00b9b7', N'41', N'7', N'随变总裁办', N'd1ad0a62ebea49e890a49fa0c54f2017', N'', N'', N'2015-07-16 16:29:39.627', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'f399d3270879462b8927dcead8603179', N'41', N'8', N'活动合作方', N'd1ad0a62ebea49e890a49fa0c54f2017', N'', N'', N'2015-07-16 16:29:51.210', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'c118b6f78b2f42949684c50bf53270b0', N'34', N'2', N'215,180,800', N'29b71ec539fc455eb8ee6abb9a91deb2', N'', N'', N'2015-08-21 12:05:18.363', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'63a82428854f42b49770c08582e91758', N'42', N'0', N'全店通用', N'dcc0498b055b4aa7bebdabacd0044741', N'', N'全店通用', N'2015-07-18 10:37:37.737', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'04cb8040522c49538b11cde9e2a38266', N'42', N'1', N'指定模型', N'dcc0498b055b4aa7bebdabacd0044741', N'', N'', N'2015-07-18 10:37:42.993', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'26be560f1b6243e2ab8c67afe173a28d', N'200', N'1', N'待审核', N'db1d0c6b6bca4c45a643f4d659b96faf', N'', N'', N'2016-01-15 15:53:55.670', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'2428276c19164e7aae129abd3a96083a', N'50', N'2', N'楼层标题', N'1164f999287447c0a18fbbd404f3e9f2', N'', N'', N'2015-09-08 14:01:47.760', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'ba1f24803f0b4dca9cf8de79d8580dd2', N'50', N'3', N'商品图', N'1164f999287447c0a18fbbd404f3e9f2', N'', N'', N'2015-09-09 19:40:32.503', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'53e5c2e1bc6945a38b5b719820007480', N'200', N'2', N'待发布', N'db1d0c6b6bca4c45a643f4d659b96faf', N'', N'', N'2016-01-15 15:53:55.670', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'24c911e06ff641e28c2eecd425a34118', N'52', N'1', N'楼层在上买点在下', N'b1c874e0047a44ddaec8943c531f93a9', N'', N'', N'2015-09-23 16:22:51.417', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'0788781662874ff7abd2605a1cbf4445', N'52', N'2', N'楼层在下买点在上', N'b1c874e0047a44ddaec8943c531f93a9', N'', N'', N'2015-09-23 16:23:15.290', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'f39f73b40c104d609426fbed30a2bad9', N'62', N'1', N'800,600,1000', N'1e049b1ccf7a42399e3a450b2ff6a1af', N'', N'PC', N'2015-10-14 11:05:10.997', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'd1683805d29749e9822317d9023c5b32', N'62', N'2', N'800,600,1000', N'1e049b1ccf7a42399e3a450b2ff6a1af', N'', N'M站', N'2015-10-14 11:04:51.963', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'e3c74f54cee84e8fb303ba24f9ae608d', N'62', N'3', N'800,600,1000', N'1e049b1ccf7a42399e3a450b2ff6a1af', N'', N'APP', N'2015-10-14 11:05:02.100', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'b68dfa3669e6423283079fcbe509bbf5', N'28', N'4', N'4', N'17afd3d7d13a4516a0902650433b65f3', N'', N'', N'2015-10-16 10:00:27.930', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'25bf81ce68ae4964af22bfac827f0ef7', N'63', N'1', N'800,600,1000', N'a9175c3be50e47e98e6d896319b4d4f6', N'', N'PC', N'2015-10-19 19:16:57.313', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'ec2ddea0196547a4b36d945b1f0d4023', N'63', N'2', N'800,600,1000', N'a9175c3be50e47e98e6d896319b4d4f6', N'', N'M站', N'2015-10-19 19:17:10.300', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'69c575ff4efd4c8e8d48877299539446', N'63', N'3', N'800,600,1000', N'a9175c3be50e47e98e6d896319b4d4f6', N'', N'APP', N'2015-10-19 19:17:27.200', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'dbb7dc74aa73449b9488e5051c552ac8', N'65', N'1', N'1200,300,1000', N'de6e6fc3791c426c96af2ff25c21c06e', N'', N'这是PC端图片标题尺寸要求，长、宽、图片大小', N'2015-10-19 20:20:35.423', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'db173a90dce04eeca42fa946d4676c75', N'65', N'2', N'592,200,1000', N'de6e6fc3791c426c96af2ff25c21c06e', N'', N'这是M站图片标题尺寸要求，长、宽、图片大小', N'2015-10-19 20:21:10.430', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'0df51014d77744e6af32fe64bd1244c4', N'65', N'3', N'592,200,1000', N'de6e6fc3791c426c96af2ff25c21c06e', N'', N'这是APP端图片标题尺寸要求，长、宽、图片大小', N'2015-10-19 20:21:38.193', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'af52ecc796754663beccb42bffeb2913', N'66', N'1', N'800,600,1000', N'165d9775fcae4cb3a15c69635bd08e1a', N'', N'PC', N'2015-10-24 10:23:05.830', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'7f226898b4fb40c3adf67656cb150129', N'66', N'2', N'800,600,1000', N'165d9775fcae4cb3a15c69635bd08e1a', N'', N'M', N'2015-10-24 10:23:21.377', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'892093c2ff264c7b8baf6bae006e3985', N'66', N'3', N'8000,600,1000', N'165d9775fcae4cb3a15c69635bd08e1a', N'', N'APP', N'2015-10-24 10:25:05.863', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'f276eefc97db4434b2b964fdfd59b62b', N'200', N'3', N'已发布', N'db1d0c6b6bca4c45a643f4d659b96faf', N'', N'', N'2016-01-15 15:53:55.670', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'fd8f4d05eee64eadab08c6dcbfc1446f', N'200', N'4', N'已驳回', N'db1d0c6b6bca4c45a643f4d659b96faf', N'', N'', N'2016-01-15 15:53:55.670', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'4330661bb9204e1491f0b90ccb0f695c', N'200', N'5', N'已下架', N'db1d0c6b6bca4c45a643f4d659b96faf', N'', N'', N'2016-01-15 15:53:55.670', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'22300d22fe9a4576b3752bdb8b3cdea3', N'201', N'1', N'未收到', N'9b3cac711a90479fa1f8246b333c7617', N'', N'', N'2016-01-15 15:54:59.430', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'dcc9940085cd40d098108ddc4f957d84', N'201', N'6', N'已通过', N'9b3cac711a90479fa1f8246b333c7617', N'', N'', N'2016-01-15 16:03:20.957', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'341fa185b3664ae8a25875e07fe1dfb1', N'203', N'1', N'普通', N'df1b1472b18b4602a3146cb6f6210737', N'', N'', N'2016-01-20 14:55:18.750', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'40a43e37b49840348cf42680377e4e0b', N'30', N'1', N'站内链接', N'8b84ffdee0864b44b6a64ab8cd214dba', N'', N'', N'2015-02-26 10:22:52.183', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'639b49d69580419988d93ce5e37227ba', N'30', N'2', N'对外推广', N'8b84ffdee0864b44b6a64ab8cd214dba', N'', N'', N'2015-02-26 10:22:45.230', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'96ebd14653314df3a00265112d8082a4', N'201', N'2', N'已收到', N'9b3cac711a90479fa1f8246b333c7617', N'', N'', N'2016-01-15 15:56:53.720', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'e7e0d25485b748e6ae94bd28f35a878d', N'201', N'3', N'未发布', N'9b3cac711a90479fa1f8246b333c7617', N'', N'', N'2016-01-15 16:02:44.393', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'0719e6d0c53d4dabb795bfe4f9b2c1a2', N'68', N'1', N'暂时没有相关内容', N'6dfc5216b1694b938007057107c4e060', N'', N'', N'2016-01-27 10:19:44.493', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'4d250d8f48c4479585db65042de779c2', N'28', N'3', N'3', N'17afd3d7d13a4516a0902650433b65f3', N'', N'', N'2015-03-09 16:45:59.707', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'a68cb8b33edf470f8105e57d1f11ff14', N'201', N'5', N'未通过', N'9b3cac711a90479fa1f8246b333c7617', N'', N'', N'2016-01-15 16:03:08.193', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'b798f0cf0bb7424fa4b431410e5db271', N'202', N'0', N'不可用', N'de26bfc5b9284a57b8da2c670ca501a0', N'', N'', N'2016-01-19 11:53:47.337', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'9c0e01f6cda34e559f4f783b6cfb5791', N'41', N'1', N'老毕', N'd1ad0a62ebea49e890a49fa0c54f2017', N'', N'', N'2015-07-16 16:28:16.337', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'78fb6e75739348aaa858a0c673047451', N'32', N'0', N'首页', N'211b42acbe9448b99b9e378bbbb8982b', N'', N'', N'2015-09-21 13:54:58.320', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'cdfbedbb45c94c96ad60c33d5f51627f', N'32', N'1', N'单品页', N'211b42acbe9448b99b9e378bbbb8982b', N'', N'', N'2015-09-21 13:55:06.137', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'eb64d908d2ba48e39fb7f102b94e3b63', N'32', N'2', N'活动页', N'211b42acbe9448b99b9e378bbbb8982b', N'', N'', N'2015-09-21 13:55:16.793', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'9701cef8371b4204a417bdb7f04edaac', N'61', N'1', N'楼层', N'f779295446f34f27ad3d321020e7d6be', N'', N'', N'2015-10-14 09:53:02.240', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'0e5cda1dc4da45fe94d30c535c8638c1', N'61', N'2', N'广告位', N'f779295446f34f27ad3d321020e7d6be', N'', N'', N'2015-10-14 09:53:02.240', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'e51904a310a94289bfd060a75158dee0', N'203', N'2', N'精选', N'df1b1472b18b4602a3146cb6f6210737', N'', N'', N'2016-01-20 14:55:29.710', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'4bdcc8646b7145b6af3829079d2c6a9f', N'1', N'1', N'20-25岁', N'9b262042fe97447c8122e68e7ff2fe94', N'无', N'', N'2014-12-03 20:00:50.877', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'7389b4731dda4e35af10023f813bf8fc', N'100', N'1', N'男', N'1644a80d78f44095923fd8a6dd01f07d', N'', N'', N'2014-12-03 20:12:30.120', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'88267456f03845148576bdb5251479da', N'100', N'2', N'女', N'1644a80d78f44095923fd8a6dd01f07d', N'', N'', N'2014-12-03 20:12:43.567', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'9042389e8d1149d3aae8ff4d8676dad8', N'1', N'2', N'26~30岁', N'9b262042fe97447c8122e68e7ff2fe94', null, N'', N'2014-12-04 17:37:01.467', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'3a87283f377b44dd8a0314f53e2e88e9', N'1', N'4', N'35岁以上', N'9b262042fe97447c8122e68e7ff2fe94', N'', N'', N'2015-02-02 12:10:59.147', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'802a9785efbe4ebc84dd56234a2746d5', N'1', N'3', N'31~35岁', N'9b262042fe97447c8122e68e7ff2fe94', null, N'', N'2014-12-04 17:37:13.450', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'50ee9c417a8746dc8b1402b60db3f2f6', N'2', N'1', N'黑', N'35a34fd4b52740f8a3f4d06522cd3297', N'', N'', N'2014-12-15 09:58:23.353', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'4456e88668b84ac0b8e77a426083cb0c', N'2', N'2', N'蓝', N'35a34fd4b52740f8a3f4d06522cd3297', N'', N'', N'2014-12-15 09:58:30.723', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'f58c415ea70748bf94e9081a44a13b63', N'2', N'3', N'棕', N'35a34fd4b52740f8a3f4d06522cd3297', N'', N'', N'2014-12-15 09:58:38.397', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'7d344782c9994301aa6b7a36b6ef032c', N'2', N'4', N'金', N'35a34fd4b52740f8a3f4d06522cd3297', N'', N'', N'2014-12-15 09:58:53.770', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'c9eb1f5d53d549398d85718ff5d85b9a', N'2', N'5', N'红', N'35a34fd4b52740f8a3f4d06522cd3297', N'', N'', N'2014-12-15 09:59:00.843', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'00a5fcdc48bc4678974cac5462966a96', N'3', N'1', N'15mm', N'066d1c87edd44570b6d282f4bf6bc18a', null, N'', N'2014-12-04 17:43:21.577', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'02a6fcec321d48ba923e17498ec6dcb7', N'3', N'2', N'45mm', N'066d1c87edd44570b6d282f4bf6bc18a', null, N'', N'2014-12-04 17:43:33.300', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'd41e05fcc2cb426ba38baabc7c17e63d', N'3', N'3', N'65mm', N'066d1c87edd44570b6d282f4bf6bc18a', null, N'', N'2014-12-04 17:43:41.543', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'9a69d7a224cb4eaa805b1989c0bf62a9', N'3', N'4', N'85mm', N'066d1c87edd44570b6d282f4bf6bc18a', null, N'', N'2014-12-04 17:43:51.497', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'894147596df14e0bb7fa502b674333d5', N'3', N'5', N'100mm', N'066d1c87edd44570b6d282f4bf6bc18a', null, N'', N'2014-12-04 17:44:06.877', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'7de0fae61f9a4db8846d6bc6426b5b4b', N'4', N'1', N'电镀鞋跟', N'08c8a6450e104144bec142f1053b1147', null, N'', N'2014-12-04 17:44:54.993', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'56c67b4b1fce46e597f18c182300ff02', N'4', N'2', N'包料鞋跟', N'08c8a6450e104144bec142f1053b1147', null, N'', N'2014-12-04 17:45:05.550', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'66725def157942af8816a7d38cff8fcb', N'5', N'1', N'33码', N'dedcfb0e1c274fb59df1becb4f08c617', null, N'', N'2014-12-04 17:45:53.570', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'c26b50b519fd47afba0644f66bcbf4b8', N'5', N'2', N'34码', N'dedcfb0e1c274fb59df1becb4f08c617', null, N'', N'2014-12-04 17:46:03.490', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'566602921de1499399a60af6bddf045e', N'5', N'3', N'35码', N'dedcfb0e1c274fb59df1becb4f08c617', null, N'', N'2014-12-04 17:46:13.230', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'56f7faee9ab54183932c8c49ae7921af', N'5', N'4', N'36码', N'dedcfb0e1c274fb59df1becb4f08c617', null, N'', N'2014-12-04 17:46:27.903', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'c377f77fa99f47d4825aee178e62f95d', N'5', N'5', N'37码', N'dedcfb0e1c274fb59df1becb4f08c617', null, N'', N'2014-12-04 17:46:44.743', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'b05b523531014b0e83abbf5bd7ec5cfe', N'5', N'6', N'38码', N'dedcfb0e1c274fb59df1becb4f08c617', null, N'', N'2014-12-04 17:47:00.577', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'5ad9be5a0105466f8a086aa462091b66', N'5', N'7', N'39码', N'dedcfb0e1c274fb59df1becb4f08c617', null, N'', N'2014-12-04 17:47:19.337', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'6d884d2c60e94ff5a711cc2346a69719', N'5', N'8', N'40码', N'dedcfb0e1c274fb59df1becb4f08c617', null, N'', N'2014-12-04 17:47:32.543', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'1713255fd5db4eb7bd078b502e95e02f', N'5', N'9', N'41码', N'dedcfb0e1c274fb59df1becb4f08c617', null, N'', N'2014-12-04 17:47:50.173', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'e3d87e39894641ea997be9c76eaf2ec7', N'5', N'10', N'42码', N'dedcfb0e1c274fb59df1becb4f08c617', null, N'', N'2014-12-04 17:48:01.703', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'1ef1009bffd14987aaabf405e8cbba04', N'6', N'1', N'3000以上', N'fbb88d5e9582453391cb1ab64b7f03f2', null, N'', N'2014-12-04 17:48:41.170', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'6e2471590f7a488b9e1df2a141a29434', N'6', N'2', N'1000~3000', N'fbb88d5e9582453391cb1ab64b7f03f2', null, N'', N'2014-12-04 17:48:56.533', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'c15f2207b909416ea59ab0a2c57aa06d', N'6', N'3', N'500~1000', N'fbb88d5e9582453391cb1ab64b7f03f2', null, N'', N'2014-12-04 17:49:07.733', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'b81b2958ca944df786ca4d9bb1e96ef3', N'6', N'4', N'200~500', N'fbb88d5e9582453391cb1ab64b7f03f2', null, N'', N'2014-12-04 17:49:19.213', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'a825a44f23b14038bec42dd650477d3d', N'7', N'1', N'已中奖', N'db32214220444ac4b9a4bb4894082e4b', N'', N'', N'2014-12-05 16:44:43.473', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'16083b0a11814f4c9da40ea810a0a1fa', N'7', N'0', N'未中奖', N'db32214220444ac4b9a4bb4894082e4b', N'', N'', N'2014-12-05 16:45:32.697', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'c906b9c1bc684bc699659693676f831c', N'8', N'1', N'WEB端', N'0e8c944c2b094a378531f8cf977ecd93', N'', N'', N'2014-12-04 18:25:07.723', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'2b0b3a2a659e44e09e982ab212e0ed34', N'8', N'2', N'MOBILE端', N'0e8c944c2b094a378531f8cf977ecd93', N'', N'', N'2014-12-04 18:25:20.530', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'a17088b566c64375afe069e6c0aa677c', N'9', N'1', N'启用', N'9de1336ac93f42d9a7ec6d742bd55a5c', N'', N'', N'2014-12-04 18:26:45.493', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'e1c7f9906c6e4f94b63f68bfc2a538d8', N'9', N'0', N'禁用', N'9de1336ac93f42d9a7ec6d742bd55a5c', N'', N'', N'2014-12-04 18:26:57.817', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'4643e3c9f14c427f96e2f7b3e3588b9b', N'2', N'6', N'银', N'35a34fd4b52740f8a3f4d06522cd3297', N'', N'', N'2014-12-15 09:59:16.700', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'c7e820aee1cb476eac57fb5b289af6bd', N'10', N'1', N'跳转到list页', N'b5593c423bce4ca9864cfd6507276476', N'', N'', N'2014-12-29 17:23:09.513', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'200b5be59bdd4475a48a69d852b37daa', N'10', N'2', N'跳转单品页', N'b5593c423bce4ca9864cfd6507276476', N'', N'', N'2014-12-29 17:23:22.630', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'e4467060fc1d44338a6ee0d20191d629', N'10', N'3', N'预告', N'b5593c423bce4ca9864cfd6507276476', N'', N'', N'2014-12-27 16:35:41.317', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'a586f83ddbc247f9833c5110cf27c900', N'11', N'1', N'web端', N'0c20bad4e41042bc9fc8bc63e75f3b79', N'', N'', N'2015-01-22 15:55:38.470', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'dae23001e77d4b608191ca6fac46571b', N'11', N'2', N'M站', N'0c20bad4e41042bc9fc8bc63e75f3b79', N'', N'', N'2015-01-22 15:55:53.320', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'52620c06151a4960a4f9db5cb6522f9a', N'11', N'3', N'APP', N'0c20bad4e41042bc9fc8bc63e75f3b79', N'', N'', N'2015-01-22 15:56:05.677', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'd5012311fef448faa94b35144b3a6fe2', N'12', N'1', N'跳转到活动页面', N'd6d4c31b60ea491cae76d5bb6ac29356', N'', N'', N'2015-01-26 14:16:22.537', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'35f1d7fde16c457897d587eb6f210bb0', N'12', N'2', N'跳转到单品页', N'd6d4c31b60ea491cae76d5bb6ac29356', N'', N'', N'2015-01-26 14:16:48.707', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'563e5684c1ff40abaf6f58fddaeacdee', N'13', N'0', N'禁用', N'66df182f9fd349d08605618c1750ad9b', N'', N'', N'2015-01-22 15:58:08.957', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'fb602d68a0da46229eeb46c1079cc29b', N'13', N'1', N'启用', N'66df182f9fd349d08605618c1750ad9b', N'', N'', N'2015-01-22 15:58:15.980', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'a447c060a9494357b4fe75382f65751b', N'14', N'1', N'左小右大', N'9810d0e861dd4710a1371753316e6ef2', N'', N'', N'2015-01-22 15:58:59.853', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'bad196c6729d40688a99f8a4f04bfddb', N'14', N'2', N'左大右小', N'9810d0e861dd4710a1371753316e6ef2', N'', N'', N'2015-01-22 15:59:07.230', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'c1469927efa84c53a4fb9ce125f4cde4', N'15', N'0', N'禁用', N'fe09657fa586489fa71082c3ea35028d', N'', N'', N'2015-01-22 15:59:37.920', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'ef1458eb3017424dbf5d0f98b4dc519f', N'15', N'1', N'启用', N'fe09657fa586489fa71082c3ea35028d', N'', N'', N'2015-01-22 15:59:44.333', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'f4556665d3234e42b98f1cc2db098bf3', N'16', N'0', N'禁用', N'3de078da3fe84a0d9b241c0624465cde', N'', N'', N'2015-01-22 16:00:17.440', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'd63106105af1457b87975d095467906a', N'16', N'1', N'启用', N'3de078da3fe84a0d9b241c0624465cde', N'', N'', N'2015-01-22 16:00:23.307', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'34aeb03778b3408b9f8890cbcb60a475', N'17', N'1', N'未发布', N'4fbd04422f244eeb920efd44c27d6fa9', N'', N'', N'2015-02-27 10:19:26.170', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'6b638b5e82b3469aa4e0ffa6837e9558', N'17', N'2', N'已发布', N'4fbd04422f244eeb920efd44c27d6fa9', N'', N'', N'2015-02-27 10:19:38.730', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'4712d9be73c54b58a6d6e93a6616d47c', N'17', N'3', N'已下线', N'4fbd04422f244eeb920efd44c27d6fa9', N'', N'', N'2015-02-27 10:19:29.827', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'5ad29128534a4bfebe13ffff1c434b3d', N'19', N'0', N'投票区主标题', N'b5497b9abd9c4639b96e275e2c077e3c', N'', N'', N'2015-02-05 15:53:58.433', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'03b7ab4c973346d3a0d41804cd910453', N'19', N'1', N'投票区副标题', N'b5497b9abd9c4639b96e275e2c077e3c', N'', N'', N'2015-02-05 15:54:19.310', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'a1295edfb5f24f87a6379219a893d5c7', N'21', N'1', N'Web页面', N'24895aa9aac84878a6cd3be7509c684b', N'', N'', N'2015-02-07 17:18:08.740', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'cf840802e97b47a0ab87fcc82550e50d', N'21', N'2', N'移动端页面', N'24895aa9aac84878a6cd3be7509c684b', N'', N'', N'2015-02-07 17:18:17.740', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'1b726a4051e14650915cea6a45ded2bc', N'21', N'3', N'APP页面', N'24895aa9aac84878a6cd3be7509c684b', N'', N'', N'2015-02-07 17:18:26.930', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'5aa31dd648cb4e99aa6fc4c6a14a0c7e', N'18', N'1', N'轮播图下卖点区', N'd753baf586274e39924eed4b29db1850', N'', N'', N'2015-02-05 15:51:53.660', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'20ebbe1314e9467e8a9b3ee7035d3618', N'24', N'0', N'未审核', N'536a564cead148958bf1c9f4444937df', N'', N'', N'2015-02-11 14:57:19.000', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'871a8f02942c4e62a35cfdcd0211150f', N'24', N'1', N'审核通过', N'536a564cead148958bf1c9f4444937df', N'', N'', N'2015-02-11 14:57:30.520', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'99484b215e3d4b788e88bdd294dc217f', N'24', N'2', N'审核未通过', N'536a564cead148958bf1c9f4444937df', N'', N'', N'2015-02-11 14:57:39.653', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'70c28497b4a9461f92f2f4267b128f68', N'24', N'3', N'已发货', N'536a564cead148958bf1c9f4444937df', N'', N'', N'2015-02-11 14:57:49.973', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'340e599495f94d05b42abd5e97d0c703', N'24', N'4', N'已反馈', N'536a564cead148958bf1c9f4444937df', N'', N'', N'2015-02-11 14:58:03.230', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'34740955be064277ae3548ef29f1ea74', N'18', N'0', N'头部卖点区', N'd753baf586274e39924eed4b29db1850', N'', N'', N'2015-02-05 15:51:37.140', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'9ea008b8a70448ab9f634b2535ab162f', N'22', N'1', N'690,280,100◆80,80,20', N'3adca82a357d48c3a3de717fe21b4096', N'', N'大图片1920X1080,500K图标50X60,30k,web端', N'2015-03-06 16:19:29.263', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'651049741a9042d492301cd74f1f8931', N'22', N'2', N'198,262,150◆80,80,100', N'3adca82a357d48c3a3de717fe21b4096', N'', N'M站', N'2015-03-16 10:22:24.257', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'bb09315952934eb2a543821056358224', N'22', N'3', N'198,262,100◆80,80,100', N'3adca82a357d48c3a3de717fe21b4096', N'', N'APP端', N'2015-02-28 16:06:13.607', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'6d24a9548c9547b7bef28e7a8761aae1', N'23', N'1', N'1200,300,10000', N'c7c64b3fed024b5682b175a24a2391b0', N'', N'', N'2015-05-07 11:04:28.197', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'c4b4d7dd6d974aca93601e3ad8f06fce', N'23', N'2', N'592,196,30000', N'c7c64b3fed024b5682b175a24a2391b0', N'', N'', N'2015-05-07 11:04:37.307', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'bb4d97b8407244f2a6cbcecfb05113ee', N'23', N'3', N'592,200,30000', N'c7c64b3fed024b5682b175a24a2391b0', N'', N'', N'2015-05-07 11:04:32.610', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'a53b116eb05046fa988f518424abe406', N'20', N'1', N'1920,380,150000', N'cbfab114a5d949029685be77653d8e66', N'', N'', N'2015-05-07 10:06:00.603', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'b65e7dbcd6ee4e83b920b826b68d9be4', N'20', N'2', N'640,440,400', N'cbfab114a5d949029685be77653d8e66', N'', N'', N'2015-03-24 11:51:40.380', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'194937a7a9dc40ac81c08552633e9d6e', N'20', N'3', N'640,400,400', N'cbfab114a5d949029685be77653d8e66', N'', N'', N'2015-09-09 19:47:17.420', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'961da5709f394c51b9e243d32bae14e3', N'25', N'1', N'40,40,100', N'06cc4f43c8b841e68bbb0fa9f519bc3d', N'', N'', N'2015-02-12 19:02:38.447', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'699299ecfa2046b8875712101acdfd54', N'25', N'2', N'40,40,100', N'06cc4f43c8b841e68bbb0fa9f519bc3d', N'', N'', N'2015-02-12 19:02:56.890', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'f3826dd0404c491aaae7a71b1cf4025f', N'25', N'3', N'40,40,100', N'06cc4f43c8b841e68bbb0fa9f519bc3d', N'', N'', N'2015-02-12 19:03:23.347', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'62399882a0e04b6fb8474d0f468fe243', N'26', N'1', N'20', N'5335f377aadb4fdeaad020c93025488a', N'', N'web端主标题', N'2015-03-02 15:24:03.923', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'92593fe3707f4f189cbc93209f08eac3', N'26', N'2', N'30', N'5335f377aadb4fdeaad020c93025488a', N'', N'web端英文标题', N'2015-03-02 15:24:47.810', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'bccb457ac934496a8bb171e7c7caba16', N'26', N'3', N'20', N'5335f377aadb4fdeaad020c93025488a', N'', N'web端副标题', N'2015-03-02 15:24:57.770', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'd67047b79fad47088a0bc1bb12592b7c', N'26', N'4', N'10', N'5335f377aadb4fdeaad020c93025488a', N'', N'移动端', N'2015-03-02 15:25:16.947', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'09f245d3ddb1469bb1f417a66c595255', N'67', N'1', N'800,600,1000', N'b403d5a2781d410fb51516b4d9919fc1', N'', N'pc', N'2015-10-24 12:15:59.700', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'd1c570686d3b48fc97de5f15ae86f0cb', N'67', N'2', N'800,600,1000', N'b403d5a2781d410fb51516b4d9919fc1', N'', N'm', N'2015-10-24 12:16:12.827', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'59869039b614401d9956cced1c6069a7', N'67', N'3', N'800,6000,1000', N'b403d5a2781d410fb51516b4d9919fc1', N'', N'app', N'2015-10-24 12:17:25.490', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'c32c45fa45684f788ed3e827c05f16a3', N'51', N'1', N'1000', N'eec019845f474e2e81a464b241a8104b', N'', N'头图大小k', N'2015-09-09 15:11:31.470', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'bbd14d007cc4454691f782160fe67a59', N'51', N'2', N'1000', N'eec019845f474e2e81a464b241a8104b', N'', N'标题图大小k', N'2015-09-09 15:11:17.443', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'e0aff49bd65241d6bc1f634355adcdb1', N'51', N'3', N'1000', N'eec019845f474e2e81a464b241a8104b', N'', N'商品图大小k', N'2015-09-09 15:11:52.217', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'5b78988b8cef499b955dccb1b7516ecb', N'51', N'4', N'1000', N'eec019845f474e2e81a464b241a8104b', N'', N'买点图大小k', N'2015-09-09 15:11:05.527', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'd027c0522ab54f6ab7133ea9dd8ac99b', N'201', N'7', N'已驳回', N'9b3cac711a90479fa1f8246b333c7617', N'', N'', N'2016-01-15 16:04:28.807', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'c2bfe9ce71d048c88e84ee392b9cc5ef', N'202', N'1', N'可用', N'de26bfc5b9284a57b8da2c670ca501a0', N'', N'', N'2016-01-19 12:03:19.457', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict] ([ID], [TYPE_CODE], [DATA_KEY], [DATA_VALUE], [TYPE_ID], [IMG_URL], [REMARK], [TS], [DR]) VALUES (N'59d67017a2784c51b4e6afc9a395f379', N'201', N'4', N'已发布', N'9b3cac711a90479fa1f8246b333c7617', N'', N'', N'2016-01-15 16:02:54.977', N'0')
GO
GO

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE [dbo].[sys_dict_type]
GO
CREATE TABLE [dbo].[sys_dict_type] (
[ID] varchar(32) NOT NULL ,
[TYPE_CODE] numeric(3) NULL ,
[TYPE_NAME] varchar(50) NULL ,
[REMARK] varchar(200) NULL ,
[TS] datetime NULL ,
[DR] decimal(1) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dict_type', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'字典类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict_type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'字典类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict_type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dict_type', 
'COLUMN', N'ID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict_type'
, @level2type = 'COLUMN', @level2name = N'ID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict_type'
, @level2type = 'COLUMN', @level2name = N'ID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dict_type', 
'COLUMN', N'TYPE_CODE')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'类型标识'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict_type'
, @level2type = 'COLUMN', @level2name = N'TYPE_CODE'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'类型标识'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict_type'
, @level2type = 'COLUMN', @level2name = N'TYPE_CODE'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dict_type', 
'COLUMN', N'TYPE_NAME')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'类型名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict_type'
, @level2type = 'COLUMN', @level2name = N'TYPE_NAME'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'类型名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict_type'
, @level2type = 'COLUMN', @level2name = N'TYPE_NAME'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dict_type', 
'COLUMN', N'REMARK')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict_type'
, @level2type = 'COLUMN', @level2name = N'REMARK'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict_type'
, @level2type = 'COLUMN', @level2name = N'REMARK'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dict_type', 
'COLUMN', N'TS')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'时间戳'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict_type'
, @level2type = 'COLUMN', @level2name = N'TS'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'时间戳'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict_type'
, @level2type = 'COLUMN', @level2name = N'TS'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_dict_type', 
'COLUMN', N'DR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除标记'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict_type'
, @level2type = 'COLUMN', @level2name = N'DR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标记'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_dict_type'
, @level2type = 'COLUMN', @level2name = N'DR'
GO

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'cfc0475ad97f4ae6b475d22995f6e056', N'27', N'平台卖点轮播图卖点区图片尺寸', N'', N'2015-03-06 15:44:21.233', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'17afd3d7d13a4516a0902650433b65f3', N'28', N'卖点显示顺序', N'', N'2015-03-09 16:43:48.900', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'48142b25333e4d5792882baa568d12c5', N'29', N'星期几', N'用于预约管理', N'2015-03-11 16:18:45.300', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'f71cbcf09c9a4212917320f1259ae4b6', N'33', N'渠道链接平台', N'渠道链接平台', N'2015-06-23 15:08:09.830', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'29b71ec539fc455eb8ee6abb9a91deb2', N'34', N'社区广告位图片尺寸', N'社区广告位图片尺寸', N'2015-07-09 12:58:20.507', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'd1ad0a62ebea49e890a49fa0c54f2017', N'41', N'费用承担', N'费用承担', N'2015-07-16 16:27:11.303', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'dcc0498b055b4aa7bebdabacd0044741', N'42', N'体验码使用范围', N'体验码使用范围', N'2015-07-16 17:37:27.373', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'1164f999287447c0a18fbbd404f3e9f2', N'50', N'专题页元素类型', N'', N'2015-09-08 14:00:43.350', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'b1c874e0047a44ddaec8943c531f93a9', N'52', N'专题页布局', N'', N'2015-09-23 16:21:57.597', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'1e049b1ccf7a42399e3a450b2ff6a1af', N'62', N'广告位标题尺寸', N'广告位标题尺寸', N'2015-10-14 11:03:33.277', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'a9175c3be50e47e98e6d896319b4d4f6', N'63', N'导航栏图标尺寸', N'', N'2015-10-19 19:16:02.813', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'165d9775fcae4cb3a15c69635bd08e1a', N'66', N'广告位图片尺村V2', N'', N'2015-10-24 10:22:35.460', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'db1d0c6b6bca4c45a643f4d659b96faf', N'200', N'试用活动状态', N'', N'2016-01-15 15:53:55.670', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'9b3cac711a90479fa1f8246b333c7617', N'201', N'报告单状态', N'', N'2016-01-15 15:54:20.853', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'1e54bd0de542485ba065c5586758ee5d', N'31', N'F码发放通道', N'', N'2015-04-02 16:42:24.527', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'9b262042fe97447c8122e68e7ff2fe94', N'1', N'年龄范围', N'年龄范围', N'2015-02-02 11:29:07.823', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'1644a80d78f44095923fd8a6dd01f07d', N'100', N'性别', N'', N'2014-12-03 20:12:16.127', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'35a34fd4b52740f8a3f4d06522cd3297', N'2', N'鞋面颜色', N'有图', N'2014-12-04 17:40:16.107', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'066d1c87edd44570b6d282f4bf6bc18a', N'3', N'鞋跟高度', N'有图', N'2014-12-04 17:42:57.617', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'08c8a6450e104144bec142f1053b1147', N'4', N'鞋跟类型', N'有图', N'2014-12-04 17:44:36.197', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'dedcfb0e1c274fb59df1becb4f08c617', N'5', N'鞋码', N'', N'2014-12-04 17:45:32.873', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'fbb88d5e9582453391cb1ab64b7f03f2', N'6', N'价格范围 ', N'', N'2014-12-04 17:48:27.823', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'db32214220444ac4b9a4bb4894082e4b', N'7', N'是否中奖', N'', N'2014-12-04 18:23:09.610', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'0e8c944c2b094a378531f8cf977ecd93', N'8', N'来源', N'', N'2014-12-04 18:24:38.630', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'9de1336ac93f42d9a7ec6d742bd55a5c', N'9', N'状态', N'', N'2014-12-04 18:26:19.400', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'b5593c423bce4ca9864cfd6507276476', N'10', N'跳转类型', N'跳转类型', N'2015-01-04 15:50:52.543', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'0c20bad4e41042bc9fc8bc63e75f3b79', N'11', N'终端类型', N'', N'2015-01-22 15:54:35.293', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'd6d4c31b60ea491cae76d5bb6ac29356', N'12', N'轮播图跳转类型', N'', N'2015-01-22 15:56:53.213', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'66df182f9fd349d08605618c1750ad9b', N'13', N'轮播图状态', N'', N'2015-01-22 15:57:50.427', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'9810d0e861dd4710a1371753316e6ef2', N'14', N'广告位板式', N'', N'2015-01-22 15:58:45.233', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'fe09657fa586489fa71082c3ea35028d', N'15', N'广告位状态', N'', N'2015-01-22 15:59:25.190', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'3de078da3fe84a0d9b241c0624465cde', N'16', N'楼层状态', N'', N'2015-01-22 16:00:03.380', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'4fbd04422f244eeb920efd44c27d6fa9', N'17', N'Minisite状态', N'', N'2015-01-22 16:00:45.230', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'd753baf586274e39924eed4b29db1850', N'18', N'卖点位置', N'', N'2015-02-05 15:50:56.543', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'b5497b9abd9c4639b96e275e2c077e3c', N'19', N'投票位标题类型', N'', N'2015-02-05 15:52:25.770', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'24895aa9aac84878a6cd3be7509c684b', N'21', N'CMS所属终端', N'', N'2015-02-07 17:17:49.787', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'8b84ffdee0864b44b6a64ab8cd214dba', N'30', N'minisite类型', N'', N'2015-02-26 10:21:50.650', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'536a564cead148958bf1c9f4444937df', N'24', N'招募状态字典', N'', N'2015-02-11 14:56:55.363', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'de26bfc5b9284a57b8da2c670ca501a0', N'202', N'商品规格状态', N'', N'2016-01-19 11:51:24.803', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'c7c64b3fed024b5682b175a24a2391b0', N'23', N'广告位图片尺寸', N'', N'2015-02-12 19:01:32.700', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'cbfab114a5d949029685be77653d8e66', N'20', N'轮播图尺寸', N'三个站点的轮播图要求不同的尺寸', N'2015-02-06 13:14:26.317', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'3adca82a357d48c3a3de717fe21b4096', N'22', N'投票位图片参数', N'以逗号分隔长X宽,文件大小', N'2015-02-10 11:26:02.870', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'06cc4f43c8b841e68bbb0fa9f519bc3d', N'25', N'平台卖点头部卖点区尺寸', N'', N'2015-03-06 15:43:12.897', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'211b42acbe9448b99b9e378bbbb8982b', N'32', N'客户端表现类型', N'', N'2015-09-21 13:54:03.407', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'f779295446f34f27ad3d321020e7d6be', N'61', N'广告位元素类型', N'广告位元素类型', N'2015-10-14 09:53:02.240', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'df1b1472b18b4602a3146cb6f6210737', N'203', N'报告单类型', N'', N'2016-01-20 14:54:49.840', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'5335f377aadb4fdeaad020c93025488a', N'26', N'卖点文案字数', N'平台卖点标题文案的字数限制', N'2015-03-02 15:22:42.287', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'eec019845f474e2e81a464b241a8104b', N'51', N'专题页图片尺寸', N'', N'2015-09-08 19:48:45.500', N'0')
GO
GO
INSERT INTO [dbo].[sys_dict_type] ([ID], [TYPE_CODE], [TYPE_NAME], [REMARK], [TS], [DR]) VALUES (N'b403d5a2781d410fb51516b4d9919fc1', N'67', N'轮播图尺寸v2', N'', N'2015-10-24 12:15:06.690', N'0')
GO
GO

-- ----------------------------
-- Table structure for sys_func
-- ----------------------------
DROP TABLE [dbo].[sys_func]
GO
CREATE TABLE [dbo].[sys_func] (
[FUNC_ID] varchar(32) NOT NULL ,
[NAME] varchar(50) NULL ,
[TYPE] varchar(6) NULL ,
[IS_LEAF] decimal(1) NULL ,
[URL] varchar(200) NULL ,
[PARENT_ID] varchar(32) NULL ,
[ORDER_CODE] varchar(10) NULL ,
[REMARK] varchar(200) NULL ,
[DR] tinyint NULL ,
[TS] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_func', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'功能菜单'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'功能菜单'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_func', 
'COLUMN', N'FUNC_ID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'FUNC_ID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'FUNC_ID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_func', 
'COLUMN', N'NAME')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'NAME'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'NAME'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_func', 
'COLUMN', N'TYPE')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'TYPE'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'TYPE'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_func', 
'COLUMN', N'IS_LEAF')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否叶子'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'IS_LEAF'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否叶子'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'IS_LEAF'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_func', 
'COLUMN', N'URL')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'地址或按钮键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'URL'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'地址或按钮键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'URL'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_func', 
'COLUMN', N'PARENT_ID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'父结点'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'PARENT_ID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'父结点'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'PARENT_ID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_func', 
'COLUMN', N'ORDER_CODE')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'ORDER_CODE'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'ORDER_CODE'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_func', 
'COLUMN', N'REMARK')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'REMARK'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'REMARK'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_func', 
'COLUMN', N'DR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'DR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'DR'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_func', 
'COLUMN', N'TS')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'时间戳'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'TS'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'时间戳'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_func'
, @level2type = 'COLUMN', @level2name = N'TS'
GO

-- ----------------------------
-- Records of sys_func
-- ----------------------------
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'98a28ff9511e433fa92122a2e7977bcb', N'minisite管理', N'MENU', N'1', N'/cmsminisite/list?terminal_type=1', N'26c7a48d9e7f415e9da8befd4d345164', N'', N'', N'0', N'2015-02-25 17:55:16.177')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'1', N'功能菜单', N'MENU', N'0', N'', N'', N'0010', N'', N'0', null)
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'101a321401264424bb7abaedca13134a', N'下拉列表实例', N'MENU', N'1', N'/exp/select ', N'be977428afed46ee998266c820b20749', N'01', N'', N'0', null)
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'14d02052ca24408fb6edf26f16394983', N'用户管理', N'MENU', N'1', N'/user/list', N'402880ec2af47efb012af48398a30001', N'', N'', N'0', N'2015-01-22 20:26:18.470')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'33ac8a8ece714f3998215db84a045083', N'修改密码', N'MENU', N'1', N'/user/toEditPws', N'402880ec2af47efb012af48398a30001', N'020', N'', N'0', N'2015-01-22 20:33:11.900')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'402880ec2af47efb012af48398a30001', N'系统管理', N'MENU', N'0', N'', N'1', N'778', N'', N'0', N'2015-09-11 14:58:56.467')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'0b028484e5ec44119c898a9311ea8ad3', N'minisite管理', N'MENU', N'1', N'/cmsminisite/list?terminal_type=2', N'1df1f4c83d4f4e759142b33e06fac781', N'', N'', N'0', N'2015-02-26 19:12:27.790')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'a1099e6ef3c34824a10eae77bced21aa', N'minisite管理', N'MENU', N'1', N'/cmsminisite/list?terminal_type=3', N'd85857424dae4fa9a9ed2842be64994a', N'', N'', N'0', N'2015-02-26 19:12:41.970')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'969f514260804b4a8d70a4c68595effc', N'M站端导航树', N'MENU', N'1', N'/cmsappbar/totree?terminal_type=2', N'e3847665344d4f98b12b68d33ddb64b3', N'', N'', N'0', N'2015-10-14 13:43:11.340')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'64e4716f5311449188aec9b9db4cd82a', N'字典管理', N'MENU', N'1', N'/dicttype/list', N'402880ec2af47efb012af48398a30001', N'040', N'', N'0', null)
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'780333c4c22c49d48614dde3eadca0ff', N'选择参照页', N'MENU', N'1', N'/common/ref ', N'be977428afed46ee998266c820b20749', N'02', N'', N'0', null)
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'9fe11e2f455a46b2a6874fa57cc80ff8', N'菜单维护', N'MENU', N'1', N'/sysfunc/totree', N'402880ec2af47efb012af48398a30001', N'080', N'', N'0', N'2015-04-10 18:57:39.760')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'a98721606eb1495d964f2a499a7ff793', N'参数维护', N'MENU', N'1', N'/param/list', N'402880ec2af47efb012af48398a30001', N'050', N'', N'0', null)
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'be977428afed46ee998266c820b20749', N'开发辅助', N'MENU', N'0', N'', N'1', N'998', N'', N'0', N'2015-07-08 09:51:33.997')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'cf997dfd0a1e4a0d91651ebfee9774bd', N'机构管理', N'MENU', N'1', N'/sysdept/totree', N'402880ec2af47efb012af48398a30001', N'080', N'', N'0', N'2014-07-29 20:10:31.000')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'e326f8963b244a5cac0a27767134b26d', N'日志管理', N'MENU', N'1', N'/syslog/list', N'402880ec2af47efb012af48398a30001', N'060', N'', N'0', null)
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'f2b05b04b3e74b26b4d6e14a963d44e7', N'minisite静态化', N'MENU', N'1', N'/minisite/static', N'402880ec2af47efb012af48398a30001', N'', N'', N'1', N'2015-11-03 17:30:01.400')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'ef33d21e9d8945b2ac813408866e028c', N'角色管理', N'MENU', N'1', N'/role/list', N'402880ec2af47efb012af48398a30001', N'010', N'', N'0', null)
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'd41d8c7a89204d6281c3522ae7833255', N'活动管理', N'MENU', N'0', N'', N'1', N'995', N'', N'0', N'2015-04-07 13:55:38.407')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'9f0e91810dc648839ce006c27152d443', N'申请记录', N'MENU', N'1', N'/actapplyinfo/list', N'd41d8c7a89204d6281c3522ae7833255', N'', N'', N'0', N'2014-12-12 19:29:37.993')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'ff77aeb846e34fd384e192362b247079', N'活动内容', N'MENU', N'1', N'/actcontent/list', N'd41d8c7a89204d6281c3522ae7833255', N'', N'', N'0', N'2014-12-12 19:30:37.410')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'0ecd54dab2f64e99815b5a6d3cd0e68d', N'预约详情', N'MENU', N'1', N'/bookactivity/info', N'd41d8c7a89204d6281c3522ae7833255', N'', N'', N'0', N'2015-03-23 18:52:30.480')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'afd8f4beccc34c0a929883ebb2b45150', N'minisite静态化', N'MENU', N'1', N'/minisite/toStatic', N'e4914f8c5c4b4c68b6772666e761cb88', N'', N'', N'0', N'2015-11-04 10:13:56.557')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'962c6d910bbf4f319eda2d020acdd9f8', N'体验码管理', N'MENU', N'1', N'/discountcodeinfo/list', N'd41d8c7a89204d6281c3522ae7833255', N'', N'', N'0', N'2015-04-29 15:28:09.693')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'a00765e041124c34af35538c1875d235', N'品类上线预约', N'MENU', N'1', N'/furniturebook/list', N'd41d8c7a89204d6281c3522ae7833255', N'', N'', N'0', N'2015-12-17 16:28:08.397')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'2498f8a266e74fb880b8b6c3a009f730', N'招募管理', N'MENU', N'1', N'/recruitactivities/list', N'd41d8c7a89204d6281c3522ae7833255', N'', N'', N'0', N'2015-02-11 11:02:40.457')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'7386dd576d3d4014b61c6c40fdd09e1f', N'免单活动管理', N'MENU', N'1', N'/activityt/list', N'd41d8c7a89204d6281c3522ae7833255', N'', N'', N'0', N'2015-06-03 17:39:27.100')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'cf166b22a3d546c19473160850af8c46', N'F码发放', N'MENU', N'1', N'/fcodeinfo/list', N'd41d8c7a89204d6281c3522ae7833255', N'', N'', N'0', N'2015-01-05 10:41:41.700')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'b6dd5ca4c9d34ce79fb3acf4957a9984', N'ICP管理', N'MENU', N'0', N'', N'1', N'994', N'', N'0', N'2015-04-07 13:55:44.570')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'bfba2d6e4a974173a2480e393fec7793', N'投诉管理', N'MENU', N'1', N'/icpcomplaint/list', N'b6dd5ca4c9d34ce79fb3acf4957a9984', N'', N'', N'0', N'2015-01-19 19:10:18.433')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'671fa7bffe9e4ee8ad1f54179b3ac533', N'登录日志', N'MENU', N'1', N'/icploginlog/list', N'b6dd5ca4c9d34ce79fb3acf4957a9984', N'', N'', N'0', N'2015-01-19 19:10:54.220')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'f3b30cf3d3e9461391934b1fd713c7e2', N'词语过滤', N'MENU', N'1', N'/icpwordfilter/list', N'b6dd5ca4c9d34ce79fb3acf4957a9984', N'', N'', N'0', N'2015-01-19 19:11:40.570')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'0f218335b745497cb810a4baf4c088e2', N'中奖名单管理', N'MENU', N'1', N'/orderusert/list', N'd41d8c7a89204d6281c3522ae7833255', N'', N'', N'0', N'2015-06-03 18:13:25.333')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'cc14a31351a14817989c3cc0db3e38d4', N'试用活动', N'MENU', N'0', N'', N'1', N'', N'', N'0', N'2016-01-14 11:31:19.323')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'a328f829a1d6479eb7bcea0cad70b176', N'GMV管理', N'MENU', N'0', N'', N'1', N'997', N'', N'0', N'2015-07-08 09:51:44.637')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'88582afa953840e9bb17cce6f11385c6', N'全局日GMV', N'MENU', N'1', N'/gmvday/list', N'a328f829a1d6479eb7bcea0cad70b176', N'01', N'', N'0', N'2015-06-24 14:50:05.947')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'7de705bda39e42888c9e3a234728d436', N'渠道管理', N'MENU', N'0', N'', N'e4914f8c5c4b4c68b6772666e761cb88', N'', N'', N'1', N'2015-06-23 14:24:09.417')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'f3f704b46ec44be99409e9d11e90d97a', N'商务渠道', N'MENU', N'1', N'/sourcemanager/list', N'7de705bda39e42888c9e3a234728d436', N'', N'', N'1', N'2015-09-11 13:32:05.633')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'2b026c826f08479e86ce8424272b90cb', N'测试品类', N'MENU', N'1', N'/category/totree', N'a328f829a1d6479eb7bcea0cad70b176', N'', N'', N'0', N'2015-06-23 17:05:48.983')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'd5fe44799c594457b5a887561ea41454', N'待发布商品审核', N'MENU', N'1', N'/ptactivity/list', N'cc14a31351a14817989c3cc0db3e38d4', N'', N'', N'0', N'2016-01-14 11:32:00.973')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'ea8bfe2c1c834a708d0e0444f4d11907', N'权限按钮', N'BUTTON', N'0', N'', N'1', N'999', N'', N'0', N'2015-06-24 13:50:39.963')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'0e8bece8d7c1493f9cf6a684ef3e1583', N'品类月GMV删除按钮', N'BUTTON', N'1', N'MonthGmvCatDelete', N'ea8bfe2c1c834a708d0e0444f4d11907', N'', N'', N'0', N'2015-06-24 11:53:47.187')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'a66b367e69004b6b85bfb0f8dd1f521b', N'社区内容管理', N'MENU', N'1', N'/cmsbbs/list?terminal_type=1', N'26c7a48d9e7f415e9da8befd4d345164', N'', N'', N'0', N'2015-07-07 13:38:36.630')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'16b9ab1c36b64b76a117b6952c5eac31', N'社区内容管理', N'MENU', N'1', N'/cmsbbs/list?terminal_type=2', N'1df1f4c83d4f4e759142b33e06fac781', N'', N'', N'0', N'2015-07-08 09:50:50.160')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'85b7c116755749159df8fa8708fda0ce', N'首页发布', N'MENU', N'1', N'/home/toPublish', N'e4914f8c5c4b4c68b6772666e761cb88', N'', N'', N'0', N'2015-07-24 20:12:50.717')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'337e947baf4a41a5898957d4699192f7', N'试用商品列表', N'MENU', N'1', N'/ptactivity/listSimple', N'cc14a31351a14817989c3cc0db3e38d4', N'', N'', N'0', N'2016-01-15 10:14:31.833')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'0060f53644c149d9993442d50bd90b68', N'渠道管理删除权限', N'BUTTON', N'0', N'', N'ea8bfe2c1c834a708d0e0444f4d11907', N'', N'', N'0', N'2015-06-24 11:52:33.407')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'2b6327c0bd3041fd96d8a683be38428b', N'品类日GMV', N'MENU', N'1', N'/catgmvday/list', N'a328f829a1d6479eb7bcea0cad70b176', N'03', N'', N'0', N'2015-06-24 14:50:22.330')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'40bf5c941428428f92a13b1c5763c544', N'招募管理', N'MENU', N'1', N'/recruitactivities/list', N'402880ec2af47efb012af48398a30001', N'', N'', N'0', N'2015-02-11 11:28:12.383')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'cdbd12b40f6e41a5b5179daf6535f6d6', N'黑名单列表', N'MENU', N'1', N'/ptactivityblacklist/list', N'cc14a31351a14817989c3cc0db3e38d4', N'', N'', N'0', N'2016-01-14 16:23:23.860')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'b70ad39530484d0eb6e60497a629e644', N'商品明细', N'MENU', N'1', N'/production/detail?id=1', N'cc14a31351a14817989c3cc0db3e38d4', N'', N'', N'1', N'2016-01-19 11:37:19.270')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'9d97614a4be242e18e75c2ec47a9b368', N'推送管理', N'MENU', N'0', N'', N'1', N'998', N'', N'0', N'2015-06-24 13:50:52.543')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'1a8929561871402099bf5a217531177c', N'用户分组管理', N'MENU', N'1', N'/apppushgroup/list', N'9d97614a4be242e18e75c2ec47a9b368', N'', N'', N'0', N'2015-02-11 17:32:02.870')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'65e4ab28d3124ce0b90ff5a3aee25d09', N'IOS推送管理', N'MENU', N'1', N'/apppushmessage/list?platform=1', N'9d97614a4be242e18e75c2ec47a9b368', N'', N'', N'0', N'2015-02-13 15:03:42.510')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'40c8990117ab42efb7b13b024a3f151f', N'Andriod推送管理', N'MENU', N'1', N'/apppushmessage/list?platform=2', N'9d97614a4be242e18e75c2ec47a9b368', N'', N'', N'0', N'2015-02-13 15:03:53.630')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'52704cebbcff4430b22b10051fda4492', N'推送数据', N'MENU', N'1', N'/apppushdata/list', N'9d97614a4be242e18e75c2ec47a9b368', N'', N'', N'0', N'2015-02-11 17:35:07.570')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'1680d38101de482dbb031c38e79d70df', N'新闻管理', N'MENU', N'1', N'/cmsnews/toAdd', N'e4914f8c5c4b4c68b6772666e761cb88', N'', N'', N'0', N'2015-08-31 15:58:23.223')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'a8194ffc1cc84ba78f4e77b201e0a13d', N'专题页管理', N'MENU', N'1', N'/cmscategory/list', N'd85857424dae4fa9a9ed2842be64994a', N'', N'', N'0', N'2015-09-09 17:59:15.200')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'591d21094c3e40f1b91716b8ff0e1fa2', N'轮播图管理', N'MENU', N'1', N'/cmsbanner/list/?terminal_type=3', N'd85857424dae4fa9a9ed2842be64994a', N'', N'', N'0', N'2015-01-26 20:20:21.230')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'a4ca5d50a8654b21b9ef23e1d0c205e2', N'轮播图管理', N'MENU', N'1', N'/cmsbanner/list/?terminal_type=2', N'1df1f4c83d4f4e759142b33e06fac781', N'', N'', N'0', N'2015-01-26 20:30:12.423')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'c7a24d7c15aa4dfa802be36f1e42b746', N'轮播图管理', N'MENU', N'1', N'/cmsbanner/list/?terminal_type=1', N'26c7a48d9e7f415e9da8befd4d345164', N'', N'', N'0', N'2015-01-26 17:52:29.670')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'da3e987e2b214e4d9a1b5e291967b295', N'平台卖点管理', N'MENU', N'1', N'/cmssellingpoint/list?terminal_type=3', N'd85857424dae4fa9a9ed2842be64994a', N'', N'', N'0', N'2015-02-07 13:18:33.113')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'292328216ef04fd388f8892fd7de8533', N'平台卖点管理', N'MENU', N'1', N'/cmssellingpoint/list?terminal_type=2', N'1df1f4c83d4f4e759142b33e06fac781', N'', N'', N'0', N'2015-02-07 13:20:16.330')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'344339314ca24c6e9c3900e11259d6bc', N'平台卖点管理', N'MENU', N'1', N'/cmssellingpoint/list?terminal_type=1', N'26c7a48d9e7f415e9da8befd4d345164', N'', N'', N'0', N'2015-02-07 13:20:03.520')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'8f13c12b3fb1457ab70186edb5e61a3f', N'广告位管理', N'MENU', N'1', N'/cmsadvertising/list?terminal_type=1', N'26c7a48d9e7f415e9da8befd4d345164', N'', N'', N'0', N'2015-02-07 13:23:44.233')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'70f521c60fbd4612a1b36728ba387084', N'投票位管理', N'MENU', N'1', N'/cmsballot/list?terminal_type=2', N'1df1f4c83d4f4e759142b33e06fac781', N'', N'', N'0', N'2015-02-09 18:37:25.900')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'7bfe54c137dc4fefb7274daa89134174', N'投票标题管理', N'MENU', N'1', N'/cmsballot/list?terminal_type=3', N'd85857424dae4fa9a9ed2842be64994a', N'', N'', N'0', N'2015-02-12 11:45:30.227')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'3c570fea2d494a168f30abfe96c8ca1b', N'广告位管理', N'MENU', N'1', N'/cmsadvertising/list?terminal_type=2', N'1df1f4c83d4f4e759142b33e06fac781', N'', N'', N'0', N'2015-02-10 13:57:41.943')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'e0dc351a58794708b02f12eac767f446', N'广告位管理', N'MENU', N'1', N'/cmsadvertising/list?terminal_type=3', N'd85857424dae4fa9a9ed2842be64994a', N'', N'', N'0', N'2015-02-10 13:57:58.677')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'f7b8e889f4ae4a51bc27f1e00cbabfbe', N'投票位管理', N'MENU', N'1', N'/cmsballot/list?terminal_type=1', N'26c7a48d9e7f415e9da8befd4d345164', N'', N'', N'0', N'2015-02-09 15:39:21.477')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'3c55feccaf5144059b4d04f7083227b1', N'预约管理', N'MENU', N'1', N'/bookactivity/list', N'd41d8c7a89204d6281c3522ae7833255', N'', N'', N'0', N'2015-03-16 11:34:17.543')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'e3847665344d4f98b12b68d33ddb64b3', N'APP管理', N'MENU', N'0', N'', N'1', N'777', N'', N'0', N'2015-09-11 13:33:08.720')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'7a2b745dfef6489b9915476178240ce4', N'APP升级管理', N'MENU', N'1', N'/appupdateinfo/list', N'e3847665344d4f98b12b68d33ddb64b3', N'001', N'', N'0', N'2015-04-07 13:57:34.370')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'c0e2af23122749d6a3976451b3ef06fc', N'增加评论', N'MENU', N'1', N'/commentmodelpost/toAdd', N'e3847665344d4f98b12b68d33ddb64b3', N'5', N'', N'0', N'2015-10-12 14:18:52.947')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'1286ec2599504306ac85c2bc10faa081', N'测试', N'MENU', N'1', N'/cmstopic/list', N'e3847665344d4f98b12b68d33ddb64b3', N'', N'', N'0', N'2015-09-28 11:38:27.737')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'59d7ff4985294f47bb5de36732d67d29', N'F码发放记录', N'MENU', N'1', N'/fcodebatch/list', N'd41d8c7a89204d6281c3522ae7833255', N'', N'', N'0', N'2015-04-02 11:02:19.607')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'3845a0c2e0cd4464860bfae14334a538', N'web端导航树', N'MENU', N'1', N'/cmsappbar/totree?terminal_type=1', N'e3847665344d4f98b12b68d33ddb64b3', N'', N'', N'0', N'2015-10-14 13:19:17.857')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'e4914f8c5c4b4c68b6772666e761cb88', N'CMS管理', N'MENU', N'0', N'', N'1', N'888', N'', N'0', N'2015-07-08 09:52:22.657')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'afc976b3aa264802854f6522d332d16c', N'品类月GMV', N'MENU', N'1', N'/catgmvmonth/list', N'a328f829a1d6479eb7bcea0cad70b176', N'04', N'', N'0', N'2015-06-24 14:50:30.333')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'41024b8a9b264549baf87ae005a5ec97', N'APP活动管理', N'MENU', N'1', N'/appactivity/list', N'e3847665344d4f98b12b68d33ddb64b3', N'', N'', N'0', N'2015-09-11 11:50:40.670')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'f9b998661dc2404e9558c7a1c52cd626', N'报告单列表', N'MENU', N'1', N'/ptactivityreport/list', N'cc14a31351a14817989c3cc0db3e38d4', N'', N'', N'1', N'2016-01-15 10:39:43.840')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'd85857424dae4fa9a9ed2842be64994a', N'APP页面管理', N'MENU', N'0', N'', N'e4914f8c5c4b4c68b6772666e761cb88', N'03', N'', N'0', N'2015-02-07 13:19:22.820')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'1df1f4c83d4f4e759142b33e06fac781', N'移动端页面管理', N'MENU', N'0', N'', N'e4914f8c5c4b4c68b6772666e761cb88', N'02', N'', N'0', N'2015-02-07 13:19:14.987')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'26c7a48d9e7f415e9da8befd4d345164', N'web页面管理', N'MENU', N'0', N'', N'e4914f8c5c4b4c68b6772666e761cb88', N'01', N'', N'0', N'2015-02-07 13:18:59.900')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'02c4d07a4ff84b5db1ed5934224dd482', N'评论列表', N'MENU', N'1', N'/evaluate/list?menu=1', N'e3847665344d4f98b12b68d33ddb64b3', N'', N'', N'0', N'2015-12-15 15:14:29.107')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'1470a1b5115d49c7927d432908f8dbb0', N'全局月GMV', N'MENU', N'1', N'/gmvmonth/list', N'a328f829a1d6479eb7bcea0cad70b176', N'02', N'', N'0', N'2015-06-24 14:53:01.943')
GO
GO
INSERT INTO [dbo].[sys_func] ([FUNC_ID], [NAME], [TYPE], [IS_LEAF], [URL], [PARENT_ID], [ORDER_CODE], [REMARK], [DR], [TS]) VALUES (N'c14e397fd57b401f8df47f2ce88f5917', N'APP端导航树', N'MENU', N'1', N'/cmsappbar/totree?terminal_type=3', N'e3847665344d4f98b12b68d33ddb64b3', N'', N'', N'0', N'2015-10-14 14:46:40.590')
GO
GO

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE [dbo].[sys_log]
GO
CREATE TABLE [dbo].[sys_log] (
[ID] varchar(32) NOT NULL ,
[LOG_TYPE] varchar(50) NULL ,
[POSITION] varchar(50) NULL ,
[IP] varchar(50) NULL ,
[USER_NAME] varchar(50) NULL ,
[DETAIL] varchar(200) NULL ,
[REMARK] varchar(200) NULL ,
[DR] varchar(1) NULL ,
[OCCUR_TIME] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_log', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'系统日志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'系统日志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_log', 
'COLUMN', N'ID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
, @level2type = 'COLUMN', @level2name = N'ID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
, @level2type = 'COLUMN', @level2name = N'ID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_log', 
'COLUMN', N'LOG_TYPE')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
, @level2type = 'COLUMN', @level2name = N'LOG_TYPE'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
, @level2type = 'COLUMN', @level2name = N'LOG_TYPE'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_log', 
'COLUMN', N'POSITION')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'发生位置'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
, @level2type = 'COLUMN', @level2name = N'POSITION'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'发生位置'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
, @level2type = 'COLUMN', @level2name = N'POSITION'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_log', 
'COLUMN', N'IP')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'IP地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
, @level2type = 'COLUMN', @level2name = N'IP'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'IP地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
, @level2type = 'COLUMN', @level2name = N'IP'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_log', 
'COLUMN', N'USER_NAME')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'操作用户'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
, @level2type = 'COLUMN', @level2name = N'USER_NAME'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'操作用户'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
, @level2type = 'COLUMN', @level2name = N'USER_NAME'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_log', 
'COLUMN', N'DETAIL')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'详细'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
, @level2type = 'COLUMN', @level2name = N'DETAIL'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'详细'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
, @level2type = 'COLUMN', @level2name = N'DETAIL'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_log', 
'COLUMN', N'REMARK')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
, @level2type = 'COLUMN', @level2name = N'REMARK'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
, @level2type = 'COLUMN', @level2name = N'REMARK'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_log', 
'COLUMN', N'DR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
, @level2type = 'COLUMN', @level2name = N'DR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
, @level2type = 'COLUMN', @level2name = N'DR'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_log', 
'COLUMN', N'OCCUR_TIME')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'发生时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
, @level2type = 'COLUMN', @level2name = N'OCCUR_TIME'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'发生时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_log'
, @level2type = 'COLUMN', @level2name = N'OCCUR_TIME'
GO

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_para
-- ----------------------------
DROP TABLE [dbo].[sys_para]
GO
CREATE TABLE [dbo].[sys_para] (
[ID] varchar(32) NOT NULL ,
[NAME] varchar(50) NULL ,
[PARAM_KEY] varchar(50) NULL ,
[REMARK] varchar(200) NULL ,
[TS] datetime NULL ,
[PARAM_VALUE] varchar(100) NULL ,
[DR] decimal(1) NULL ,
[USABLE] decimal(1) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_para', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'系统参数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_para'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'系统参数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_para'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_para', 
'COLUMN', N'ID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_para'
, @level2type = 'COLUMN', @level2name = N'ID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_para'
, @level2type = 'COLUMN', @level2name = N'ID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_para', 
'COLUMN', N'NAME')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'参数名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_para'
, @level2type = 'COLUMN', @level2name = N'NAME'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'参数名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_para'
, @level2type = 'COLUMN', @level2name = N'NAME'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_para', 
'COLUMN', N'PARAM_KEY')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'参数键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_para'
, @level2type = 'COLUMN', @level2name = N'PARAM_KEY'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'参数键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_para'
, @level2type = 'COLUMN', @level2name = N'PARAM_KEY'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_para', 
'COLUMN', N'REMARK')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_para'
, @level2type = 'COLUMN', @level2name = N'REMARK'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_para'
, @level2type = 'COLUMN', @level2name = N'REMARK'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_para', 
'COLUMN', N'TS')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'时间戳'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_para'
, @level2type = 'COLUMN', @level2name = N'TS'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'时间戳'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_para'
, @level2type = 'COLUMN', @level2name = N'TS'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_para', 
'COLUMN', N'PARAM_VALUE')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'参数值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_para'
, @level2type = 'COLUMN', @level2name = N'PARAM_VALUE'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'参数值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_para'
, @level2type = 'COLUMN', @level2name = N'PARAM_VALUE'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_para', 
'COLUMN', N'DR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除标记'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_para'
, @level2type = 'COLUMN', @level2name = N'DR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标记'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_para'
, @level2type = 'COLUMN', @level2name = N'DR'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_para', 
'COLUMN', N'USABLE')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否启用'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_para'
, @level2type = 'COLUMN', @level2name = N'USABLE'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否启用'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_para'
, @level2type = 'COLUMN', @level2name = N'USABLE'
GO

-- ----------------------------
-- Records of sys_para
-- ----------------------------
INSERT INTO [dbo].[sys_para] ([ID], [NAME], [PARAM_KEY], [REMARK], [TS], [PARAM_VALUE], [DR], [USABLE]) VALUES (N'111', N'重置密码', N'defalt_password', N'重置密码时的默认值', N'2014-12-31 15:24:59.977', N'111111', N'0', N'1')
GO
GO
INSERT INTO [dbo].[sys_para] ([ID], [NAME], [PARAM_KEY], [REMARK], [TS], [PARAM_VALUE], [DR], [USABLE]) VALUES (N'a006ebf9500845fbb4f7f2036fa682ab', N'时间秒数', N'time_second', N'', N'2015-11-04 17:58:15.977', N'MjAxODEwMDE=', N'0', N'1')
GO
GO
INSERT INTO [dbo].[sys_para] ([ID], [NAME], [PARAM_KEY], [REMARK], [TS], [PARAM_VALUE], [DR], [USABLE]) VALUES (N'f59b5ed5ba4f4548b2f1356634529100', N'每页记录个数', N'PAGE_SIZE', N'每页记录个数', N'2015-01-19 17:12:54.410', N'30', N'0', N'0')
GO
GO
INSERT INTO [dbo].[sys_para] ([ID], [NAME], [PARAM_KEY], [REMARK], [TS], [PARAM_VALUE], [DR], [USABLE]) VALUES (N'494ea25575a44b01bcea13fd25625684', N'图片写入地址前缀(Windows)', N'img_url_windows', N'临时图片存在地址。', N'2016-01-27 11:04:07.837', N'\\192.168.99.210\Share\lib\', N'0', N'1')
GO
GO
INSERT INTO [dbo].[sys_para] ([ID], [NAME], [PARAM_KEY], [REMARK], [TS], [PARAM_VALUE], [DR], [USABLE]) VALUES (N'1b5bf740002842ba9b7d96f6918211c8', N'图片写入地址前缀(Linux)', N'img_url_linux', N'', N'2016-01-27 13:56:44.300', N'/opt/filesystem/lib/', N'0', N'1')
GO
GO
INSERT INTO [dbo].[sys_para] ([ID], [NAME], [PARAM_KEY], [REMARK], [TS], [PARAM_VALUE], [DR], [USABLE]) VALUES (N'4dacf30e9dc74e6aa8fe312b8c170753', N'图片访问路径', N'www_url', N'', N'2015-11-04 17:58:19.167', N'http://img.biyao.com/files/data0', N'0', null)
GO
GO
INSERT INTO [dbo].[sys_para] ([ID], [NAME], [PARAM_KEY], [REMARK], [TS], [PARAM_VALUE], [DR], [USABLE]) VALUES (N'e0624b47a74446f9a47ef0a17bd98546', N'中奖号码是否导入', N'isExport', N'', N'2014-12-15 11:55:54.637', N'0', N'0', N'1')
GO
GO
INSERT INTO [dbo].[sys_para] ([ID], [NAME], [PARAM_KEY], [REMARK], [TS], [PARAM_VALUE], [DR], [USABLE]) VALUES (N'd86cb2f8febb4765bb4bb2f6bba64d60', N'轮播图启用个数上限', N'banner_limit', N'', N'2015-02-09 10:14:02.880', N'8', N'0', N'1')
GO
GO
INSERT INTO [dbo].[sys_para] ([ID], [NAME], [PARAM_KEY], [REMARK], [TS], [PARAM_VALUE], [DR], [USABLE]) VALUES (N'092610ab9d0941378d4252c66213a345', N'卖点描述文字长度', N'sel_dsc', N'', N'2015-03-06 16:26:40.337', N'20', N'0', null)
GO
GO
INSERT INTO [dbo].[sys_para] ([ID], [NAME], [PARAM_KEY], [REMARK], [TS], [PARAM_VALUE], [DR], [USABLE]) VALUES (N'379bbbc4fd144cae9d8a9f2e9f5fc2a2', N'APP活动页图片大小', N'app_activity_img', N'单位K', N'2015-09-11 19:41:14.640', N'1000', N'0', N'1')
GO
GO
INSERT INTO [dbo].[sys_para] ([ID], [NAME], [PARAM_KEY], [REMARK], [TS], [PARAM_VALUE], [DR], [USABLE]) VALUES (N'e12c370c595243eb959bf9a4a54bef02', N'商家后台每页记录个数', N'SJ_PAGE_SIZE', N'商家后台每页记录个数', N'2015-10-28 15:35:39.577', N'15', N'0', N'1')
GO
GO
INSERT INTO [dbo].[sys_para] ([ID], [NAME], [PARAM_KEY], [REMARK], [TS], [PARAM_VALUE], [DR], [USABLE]) VALUES (N'6d59503db40c49cf97c103c6ef3207b2', N'minisite静态化文件地址(windows)', N'static_minisite_windows', N'', N'2016-01-27 11:04:02.527', N'\\192.168.99.210\Share\lib', N'0', N'1')
GO
GO
INSERT INTO [dbo].[sys_para] ([ID], [NAME], [PARAM_KEY], [REMARK], [TS], [PARAM_VALUE], [DR], [USABLE]) VALUES (N'6d59503db40c49cf97c103c6ef3207b0', N'minisite静态化文件地址(linux)', N'static_minisite_linux', N'', N'2016-01-26 21:38:22.747', N'/opt/filesystem/lib/', N'0', N'1')
GO
GO

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE [dbo].[sys_role]
GO
CREATE TABLE [dbo].[sys_role] (
[ID] varchar(32) NOT NULL ,
[NAME] varchar(32) NULL ,
[TS] datetime NULL ,
[REMARK] varchar(300) NULL ,
[DR] decimal(1) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_role', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'角色'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'角色'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_role', 
'COLUMN', N'ID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role'
, @level2type = 'COLUMN', @level2name = N'ID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role'
, @level2type = 'COLUMN', @level2name = N'ID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_role', 
'COLUMN', N'NAME')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role'
, @level2type = 'COLUMN', @level2name = N'NAME'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role'
, @level2type = 'COLUMN', @level2name = N'NAME'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_role', 
'COLUMN', N'TS')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'时间戳'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role'
, @level2type = 'COLUMN', @level2name = N'TS'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'时间戳'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role'
, @level2type = 'COLUMN', @level2name = N'TS'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_role', 
'COLUMN', N'REMARK')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role'
, @level2type = 'COLUMN', @level2name = N'REMARK'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role'
, @level2type = 'COLUMN', @level2name = N'REMARK'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_role', 
'COLUMN', N'DR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role'
, @level2type = 'COLUMN', @level2name = N'DR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role'
, @level2type = 'COLUMN', @level2name = N'DR'
GO

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO [dbo].[sys_role] ([ID], [NAME], [TS], [REMARK], [DR]) VALUES (N'adf1eb3cd6684c7a92200bd8938fe45b', N'审核组', N'2015-01-22 18:42:11.847', N'审核组', N'0')
GO
GO
INSERT INTO [dbo].[sys_role] ([ID], [NAME], [TS], [REMARK], [DR]) VALUES (N'bd165d8cfe3549d887d0bbf64cdca1c9', N'业务组', N'2015-01-22 19:45:51.740', N'', N'0')
GO
GO

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE [dbo].[sys_role_user]
GO
CREATE TABLE [dbo].[sys_role_user] (
[ID] varchar(32) NOT NULL ,
[USER_ID] varchar(32) NULL ,
[TS] datetime NULL ,
[REMARK] varchar(200) NULL ,
[role_id] varchar(32) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_role_user', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'角色用户关联'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role_user'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'角色用户关联'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role_user'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_role_user', 
'COLUMN', N'ID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role_user'
, @level2type = 'COLUMN', @level2name = N'ID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role_user'
, @level2type = 'COLUMN', @level2name = N'ID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_role_user', 
'COLUMN', N'USER_ID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role_user'
, @level2type = 'COLUMN', @level2name = N'USER_ID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role_user'
, @level2type = 'COLUMN', @level2name = N'USER_ID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_role_user', 
'COLUMN', N'TS')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'时间戳'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role_user'
, @level2type = 'COLUMN', @level2name = N'TS'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'时间戳'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role_user'
, @level2type = 'COLUMN', @level2name = N'TS'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_role_user', 
'COLUMN', N'REMARK')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role_user'
, @level2type = 'COLUMN', @level2name = N'REMARK'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_role_user'
, @level2type = 'COLUMN', @level2name = N'REMARK'
GO

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO [dbo].[sys_role_user] ([ID], [USER_ID], [TS], [REMARK], [role_id]) VALUES (N'301055e24fee4f98b9c13fa63f6c2c0e', N'0d9aa1fccfab4bdea8f47f9a8686ca55', N'2015-10-27 14:14:48.250', N'system', N'adf1eb3cd6684c7a92200bd8938fe45b')
GO
GO
INSERT INTO [dbo].[sys_role_user] ([ID], [USER_ID], [TS], [REMARK], [role_id]) VALUES (N'cafe116249d24a01ba9346eb9e652032', N'0d9aa1fccfab4bdea8f47f9a8686ca55', N'2015-06-05 21:14:52.707', N'system', N'bd165d8cfe3549d887d0bbf64cdca1c9')
GO
GO
INSERT INTO [dbo].[sys_role_user] ([ID], [USER_ID], [TS], [REMARK], [role_id]) VALUES (N'f8af7671236743b188499f0f3e46efcc', N'1769275e640f4957bfe958168edc07b7', N'2015-10-27 14:14:48.250', N'system', N'adf1eb3cd6684c7a92200bd8938fe45b')
GO
GO
INSERT INTO [dbo].[sys_role_user] ([ID], [USER_ID], [TS], [REMARK], [role_id]) VALUES (N'5278cc47b5a34cde97edf1c49c13f788', N'1769275e640f4957bfe958168edc07b7', N'2015-06-05 21:14:52.707', N'system', N'bd165d8cfe3549d887d0bbf64cdca1c9')
GO
GO
INSERT INTO [dbo].[sys_role_user] ([ID], [USER_ID], [TS], [REMARK], [role_id]) VALUES (N'0f433fdb27cf45b9888a78ca5f2ea31c', N'2a00c2e1b74e453185b50fd628ea0815', N'2015-06-05 21:14:52.707', N'system', N'bd165d8cfe3549d887d0bbf64cdca1c9')
GO
GO
INSERT INTO [dbo].[sys_role_user] ([ID], [USER_ID], [TS], [REMARK], [role_id]) VALUES (N'8c9d15c4b93e40b6be6c356247f200d0', N'3', N'2015-06-05 21:14:52.707', N'system', N'bd165d8cfe3549d887d0bbf64cdca1c9')
GO
GO
INSERT INTO [dbo].[sys_role_user] ([ID], [USER_ID], [TS], [REMARK], [role_id]) VALUES (N'7c0808a92cff43a781ea42cbe6025222', N'76d9d12258224409a4802c6c73c320a3', N'2015-06-05 21:14:52.707', N'system', N'bd165d8cfe3549d887d0bbf64cdca1c9')
GO
GO
INSERT INTO [dbo].[sys_role_user] ([ID], [USER_ID], [TS], [REMARK], [role_id]) VALUES (N'd2886d6b090e46a68985282f0ded2ecf', N'801ee0dffa254dfaa587f835d05c2e18', N'2015-06-05 21:14:52.707', N'system', N'bd165d8cfe3549d887d0bbf64cdca1c9')
GO
GO
INSERT INTO [dbo].[sys_role_user] ([ID], [USER_ID], [TS], [REMARK], [role_id]) VALUES (N'b6fe6bcbd8174417857010c697065160', N'8aa8690453874850af9ce48a411e0f86', N'2015-06-05 21:14:52.707', N'system', N'bd165d8cfe3549d887d0bbf64cdca1c9')
GO
GO
INSERT INTO [dbo].[sys_role_user] ([ID], [USER_ID], [TS], [REMARK], [role_id]) VALUES (N'b9bc7681241b45478f30b32c9ad67059', N'2a00c2e1b74e453185b50fd628ea0815', N'2015-10-27 14:14:48.250', N'system', N'adf1eb3cd6684c7a92200bd8938fe45b')
GO
GO
INSERT INTO [dbo].[sys_role_user] ([ID], [USER_ID], [TS], [REMARK], [role_id]) VALUES (N'f74e781b476747ce9bac6be33f533657', N'3', N'2015-10-27 14:14:48.250', N'system', N'adf1eb3cd6684c7a92200bd8938fe45b')
GO
GO
INSERT INTO [dbo].[sys_role_user] ([ID], [USER_ID], [TS], [REMARK], [role_id]) VALUES (N'6addbf191fec45c29ad810e97cb269bc', N'49ffdca8d7dd4ef5a5d2ef6fce1411d9', N'2015-10-27 14:14:48.250', N'system', N'adf1eb3cd6684c7a92200bd8938fe45b')
GO
GO
INSERT INTO [dbo].[sys_role_user] ([ID], [USER_ID], [TS], [REMARK], [role_id]) VALUES (N'57576180dbfa4f77a195521afa65c856', N'76d9d12258224409a4802c6c73c320a3', N'2015-10-27 14:14:48.250', N'system', N'adf1eb3cd6684c7a92200bd8938fe45b')
GO
GO
INSERT INTO [dbo].[sys_role_user] ([ID], [USER_ID], [TS], [REMARK], [role_id]) VALUES (N'72186d3c1ddf45ef99c464624abcbfe0', N'801ee0dffa254dfaa587f835d05c2e18', N'2015-10-27 14:14:48.250', N'system', N'adf1eb3cd6684c7a92200bd8938fe45b')
GO
GO
INSERT INTO [dbo].[sys_role_user] ([ID], [USER_ID], [TS], [REMARK], [role_id]) VALUES (N'a27a82f109c14d488ca9e539ea4d138a', N'8aa8690453874850af9ce48a411e0f86', N'2015-10-27 14:14:48.250', N'system', N'adf1eb3cd6684c7a92200bd8938fe45b')
GO
GO

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE [dbo].[sys_user]
GO
CREATE TABLE [dbo].[sys_user] (
[ID] varchar(32) NOT NULL ,
[ORGANIZE_ID] varchar(32) NULL ,
[LOGIN_ID] varchar(50) NULL ,
[PASSWORD] varchar(50) NULL ,
[USER_TYPE] varchar(10) NULL DEFAULT ('0') ,
[SEX_STAT] varchar(10) NULL ,
[NAME] varchar(50) NULL ,
[E_MAIL] varchar(50) NULL ,
[ID_CARD] varchar(50) NULL ,
[TEL] varchar(50) NULL ,
[REMARK] varchar(200) NULL ,
[TS] datetime NULL ,
[DR] decimal(1) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user', 
'COLUMN', N'ID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'ID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'ID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user', 
'COLUMN', N'ORGANIZE_ID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'行政区划'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'ORGANIZE_ID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'行政区划'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'ORGANIZE_ID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user', 
'COLUMN', N'LOGIN_ID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'登录名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'LOGIN_ID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登录名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'LOGIN_ID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user', 
'COLUMN', N'PASSWORD')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'登录密码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'PASSWORD'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登录密码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'PASSWORD'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user', 
'COLUMN', N'USER_TYPE')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'USER_TYPE'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'USER_TYPE'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user', 
'COLUMN', N'SEX_STAT')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'性别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'SEX_STAT'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'性别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'SEX_STAT'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user', 
'COLUMN', N'NAME')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'姓名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'NAME'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'姓名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'NAME'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user', 
'COLUMN', N'E_MAIL')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'电邮'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'E_MAIL'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'电邮'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'E_MAIL'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user', 
'COLUMN', N'ID_CARD')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'身份证号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'ID_CARD'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'身份证号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'ID_CARD'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user', 
'COLUMN', N'TEL')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'联系电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'TEL'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'联系电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'TEL'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user', 
'COLUMN', N'REMARK')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'REMARK'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'REMARK'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user', 
'COLUMN', N'TS')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'时间戳'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'TS'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'时间戳'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'TS'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user', 
'COLUMN', N'DR')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除标记'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'DR'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标记'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user'
, @level2type = 'COLUMN', @level2name = N'DR'
GO

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO [dbo].[sys_user] ([ID], [ORGANIZE_ID], [LOGIN_ID], [PASSWORD], [USER_TYPE], [SEX_STAT], [NAME], [E_MAIL], [ID_CARD], [TEL], [REMARK], [TS], [DR]) VALUES (N'1', N'1', N'admin', N'lueSGJZetyySpUndWjMBEg==', null, N'1', N'管理员', N'5', N'5', N'5', N'5', N'2015-09-25 17:00:21.463', N'0')
GO
GO
INSERT INTO [dbo].[sys_user] ([ID], [ORGANIZE_ID], [LOGIN_ID], [PASSWORD], [USER_TYPE], [SEX_STAT], [NAME], [E_MAIL], [ID_CARD], [TEL], [REMARK], [TS], [DR]) VALUES (N'1769275e640f4957bfe958168edc07b7', N'c7d72b3b18b54ce78c3ba15708d9325d', N'liyi', N'lueSGJZetyySpUndWjMBEg==', null, N'1', N'李毅', N'1', N'2', N'2', N'2', N'2015-01-22 19:33:51.333', N'0')
GO
GO
INSERT INTO [dbo].[sys_user] ([ID], [ORGANIZE_ID], [LOGIN_ID], [PASSWORD], [USER_TYPE], [SEX_STAT], [NAME], [E_MAIL], [ID_CARD], [TEL], [REMARK], [TS], [DR]) VALUES (N'2a00c2e1b74e453185b50fd628ea0815', N'29176d46665d43b88d124fe49385aeb2', N'wangchengqing', N'lueSGJZetyySpUndWjMBEg==', null, N'1', N'王成庆', N'1', N'2', N'2', N'2', N'2015-01-22 20:45:52.383', N'0')
GO
GO
INSERT INTO [dbo].[sys_user] ([ID], [ORGANIZE_ID], [LOGIN_ID], [PASSWORD], [USER_TYPE], [SEX_STAT], [NAME], [E_MAIL], [ID_CARD], [TEL], [REMARK], [TS], [DR]) VALUES (N'3', N'27dc825c651342da8a8b8c2342fbac79', N'shenhe1', N'lueSGJZetyySpUndWjMBEg==', null, N'1', N'审核员1', N'1', N'1', N'1', N'1', N'2015-01-22 19:55:15.953', N'0')
GO
GO
INSERT INTO [dbo].[sys_user] ([ID], [ORGANIZE_ID], [LOGIN_ID], [PASSWORD], [USER_TYPE], [SEX_STAT], [NAME], [E_MAIL], [ID_CARD], [TEL], [REMARK], [TS], [DR]) VALUES (N'801ee0dffa254dfaa587f835d05c2e18', N'65675bb2fd5e4c53aca971e0505a14c8', N'liuhui', N'lueSGJZetyySpUndWjMBEg==', null, N'1', N'刘辉', N'2', N'2', N'2', N'2', N'2015-01-22 20:39:31.130', N'0')
GO
GO
INSERT INTO [dbo].[sys_user] ([ID], [ORGANIZE_ID], [LOGIN_ID], [PASSWORD], [USER_TYPE], [SEX_STAT], [NAME], [E_MAIL], [ID_CARD], [TEL], [REMARK], [TS], [DR]) VALUES (N'8aa8690453874850af9ce48a411e0f86', N'65675bb2fd5e4c53aca971e0505a14c8', N'liuzhiyong', N'lueSGJZetyySpUndWjMBEg==', null, N'1', N'李志勇', N'3', N'3', N'3', N'3', N'2015-01-22 20:40:17.607', N'0')
GO
GO
INSERT INTO [dbo].[sys_user] ([ID], [ORGANIZE_ID], [LOGIN_ID], [PASSWORD], [USER_TYPE], [SEX_STAT], [NAME], [E_MAIL], [ID_CARD], [TEL], [REMARK], [TS], [DR]) VALUES (N'76d9d12258224409a4802c6c73c320a3', N'27dc825c651342da8a8b8c2342fbac79', N'shenhe2', N'lueSGJZetyySpUndWjMBEg==', null, N'1', N'审核员2', N'string', N'string', N'string', N'string', N'2015-01-22 19:55:25.970', N'0')
GO
GO
INSERT INTO [dbo].[sys_user] ([ID], [ORGANIZE_ID], [LOGIN_ID], [PASSWORD], [USER_TYPE], [SEX_STAT], [NAME], [E_MAIL], [ID_CARD], [TEL], [REMARK], [TS], [DR]) VALUES (N'0d9aa1fccfab4bdea8f47f9a8686ca55', N'9972f1515bd54e9dac56cbdd859a1124', N'qiyong', N'lueSGJZetyySpUndWjMBEg==', null, N'1', N'祁勇', N'1', N'1', N'1', N'1', N'2015-02-28 17:52:37.437', N'0')
GO
GO
INSERT INTO [dbo].[sys_user] ([ID], [ORGANIZE_ID], [LOGIN_ID], [PASSWORD], [USER_TYPE], [SEX_STAT], [NAME], [E_MAIL], [ID_CARD], [TEL], [REMARK], [TS], [DR]) VALUES (N'49ffdca8d7dd4ef5a5d2ef6fce1411d9', N'65675bb2fd5e4c53aca971e0505a14c8', N'gzz', N'lueSGJZetyySpUndWjMBEg==', null, N'1', N'高振中', N'', N'', N'', N'', N'2015-09-14 16:55:35.910', N'0')
GO
GO

-- ----------------------------
-- Indexes structure for table sys_auth
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_auth
-- ----------------------------
ALTER TABLE [dbo].[sys_auth] ADD PRIMARY KEY NONCLUSTERED ([AUTHORITY_ID])
GO

-- ----------------------------
-- Indexes structure for table sys_dept
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_dept
-- ----------------------------
ALTER TABLE [dbo].[sys_dept] ADD PRIMARY KEY NONCLUSTERED ([ID])
GO

-- ----------------------------
-- Indexes structure for table sys_dict
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_dict
-- ----------------------------
ALTER TABLE [dbo].[sys_dict] ADD PRIMARY KEY NONCLUSTERED ([ID])
GO

-- ----------------------------
-- Indexes structure for table sys_dict_type
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_dict_type
-- ----------------------------
ALTER TABLE [dbo].[sys_dict_type] ADD PRIMARY KEY NONCLUSTERED ([ID])
GO

-- ----------------------------
-- Indexes structure for table sys_func
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_func
-- ----------------------------
ALTER TABLE [dbo].[sys_func] ADD PRIMARY KEY NONCLUSTERED ([FUNC_ID])
GO

-- ----------------------------
-- Indexes structure for table sys_log
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_log
-- ----------------------------
ALTER TABLE [dbo].[sys_log] ADD PRIMARY KEY NONCLUSTERED ([ID])
GO

-- ----------------------------
-- Indexes structure for table sys_para
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_para
-- ----------------------------
ALTER TABLE [dbo].[sys_para] ADD PRIMARY KEY NONCLUSTERED ([ID])
GO

-- ----------------------------
-- Indexes structure for table sys_role
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE [dbo].[sys_role] ADD PRIMARY KEY NONCLUSTERED ([ID])
GO

-- ----------------------------
-- Indexes structure for table sys_role_user
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_role_user
-- ----------------------------
ALTER TABLE [dbo].[sys_role_user] ADD PRIMARY KEY NONCLUSTERED ([ID])
GO

-- ----------------------------
-- Indexes structure for table sys_user
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE [dbo].[sys_user] ADD PRIMARY KEY NONCLUSTERED ([ID])
GO
