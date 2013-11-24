CREATE TABLE `admin` (
  `adminId` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `email` varchar(45) DEFAULT NULL COMMENT '邮件地址',
  `name` varchar(50) DEFAULT NULL COMMENT '管理员名称',
  `password` varchar(32) DEFAULT NULL COMMENT '密码 MD5加密',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态：0 隐藏 1 显示',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`adminId`),
  UNIQUE KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

CREATE TABLE `comment` (
  `commentId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `fatherId` bigint(20) DEFAULT NULL COMMENT '父评论ID',
  `fileId` bigint(20) DEFAULT NULL COMMENT '文件ID',
  `name` varchar(45) DEFAULT NULL COMMENT '评论者',
  `email` varchar(45) DEFAULT NULL COMMENT '评论者邮件地址',
  `url` varchar(200) DEFAULT NULL COMMENT '评论者网址',
  `content` varchar(3000) DEFAULT NULL COMMENT '内容',
  `ip` varchar(45) DEFAULT NULL COMMENT 'Ip',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论';

CREATE TABLE `config` (
  `key` varchar(45) NOT NULL COMMENT 'Key',
  `value` varchar(45) DEFAULT NULL COMMENT '值',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型：0 系统定义 1 产品定义',
  `createTime` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站配置';

CREATE TABLE `file` (
  `fileId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `folderId` bigint(20) DEFAULT NULL COMMENT '目录ID',
  `adminId` bigint(20) DEFAULT NULL COMMENT '管理员ID',
  `picture` tinyint(4) DEFAULT NULL COMMENT '是否有固定图片',
  `name` varchar(200) DEFAULT NULL COMMENT '文件名称',
  `content` mediumtext COMMENT '文件内容',
  `viewCount` int(11) DEFAULT NULL COMMENT '浏览数',
  `commentCount` int(11) DEFAULT NULL COMMENT '评论数',
  `type` tinyint(4) DEFAULT NULL COMMENT '文件类型：0 文章 1 照片 2 下载 3 商品',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态：0 隐藏 1 显示',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文件';

CREATE TABLE `folder` (
  `folderId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '目录ID',
  `fatherId` bigint(20) DEFAULT NULL COMMENT '父亲Id，用于构建目录树',
  `ename` varchar(45) DEFAULT NULL COMMENT '英文名',
  `name` varchar(100) DEFAULT NULL COMMENT '中文名',
  `path` varchar(200) DEFAULT NULL COMMENT '路径',
  `level` tinyint(4) DEFAULT NULL COMMENT '层级',
  `sort` tinyint(4) DEFAULT NULL COMMENT '排序',
  `count` int(11) DEFAULT NULL COMMENT '文件数',
  `template` varchar(45) DEFAULT NULL COMMENT '模板',
  `rank` tinyint(4) DEFAULT NULL COMMENT '等级',
  `type` tinyint(4) DEFAULT NULL COMMENT '目录类型：0 文章 1 照片 2 下载 3 商品',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态：0 隐藏 1 现实',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`folderId`),
  UNIQUE KEY `ename_UNIQUE` (`ename`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='目录';

CREATE TABLE `log` (
  `logId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `content` varchar(2000) DEFAULT NULL COMMENT '日志内容',
  `level` varchar(10) DEFAULT NULL COMMENT '日志等级：0 DEBUG 1 INFO 2 WARN 3 ERROR 4 FATAL',
  `createTime` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志';

CREATE TABLE `user` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `openId` bigint(20) DEFAULT NULL COMMENT '公共用户ID，只有是师说，QQ，微博等其它网站登录时才有。',
  `type` tinyint(4) DEFAULT NULL COMMENT '帐号类型：0 本站 1 师说 2 QQ 3 微博',
  `name` varchar(45) DEFAULT NULL COMMENT '用户名',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';



# 增加系统配置
INSERT INTO `config` VALUES ('function_download','off','是否关闭下载模块',0,'2012-08-08 00:00:00');
INSERT INTO `config` VALUES ('function_photo','off','是否关闭相册模块',0,'2012-08-08 00:00:00');
INSERT INTO `config` VALUES ('function_shop','off','是否关闭商场模块',0,'2012-08-08 00:00:00');
INSERT INTO `config` VALUES ('sitedesc','这是我的个人博客','网站描述',0,'2012-08-08 00:00:00');
INSERT INTO `config` VALUES ('sitename','师说CMS','网站名称',0,'2012-08-08 00:00:00');
INSERT INTO `config` VALUES ('template','default','网站模板名称',0,'2012-08-08 00:00:00');

# 增加默认目录
INSERT INTO `folder` (`folderId`,`fatherId`,`ename`,`name`,`path`,`level`,`sort`,`count`,`template`,`rank`,`type`,`status`,`createTime`) VALUES (1,0,'default','默认','1',1,1,0,'default',0,0,0,'2012-08-08 00:00:00');

# 增加第一篇文章
INSERT INTO `file` (`fileId`, `folderId`, `adminId`,`picture`,`name`, `content`, `viewCount`, `commentCount`, `type`, `status`, `createTime`) VALUES ('1', '1', '1','0', '你好，世界！', '越过长城，走向世界。', '0', '0', '0', '1', now());



