-- MySQL dump 10.13  Distrib 5.1.28-rc, for Win32 (ia32)
--
-- Host: localhost    Database: srcms
-- ------------------------------------------------------
-- Server version	5.1.28-rc-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `blog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET gbk NOT NULL,
  `name` varchar(100) CHARACTER SET gbk NOT NULL,
  `content` text CHARACTER SET gbk NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'示例博客','移动安全','&lt;p&gt;示例博客内容&lt;/p&gt;');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '父分类ID',
  `name` varchar(20) DEFAULT NULL COMMENT '分类别名',
  `title` varchar(100) DEFAULT NULL COMMENT '分类标题',
  `keywords` varchar(255) DEFAULT NULL COMMENT '分类关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '分类描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,0,'default','默认分类','默认分类','默认分类描述'),(2,0,'Webvul','Web漏洞','',''),(3,0,'PC Clinet','PC客户端漏洞','',''),(4,0,'Sever','服务器漏洞','',''),(5,0,'Mobile Clinet','移动客户端漏洞','',''),(6,2,'SQLinjection','SQL注入','',''),(7,2,'XSS','XSS','',''),(8,2,'CSRF','CSRF','',''),(9,5,'IOS','IOS','',''),(10,5,'wordpress','Android','Android',''),(11,3,'Overflow','溢出','',''),(12,3,'DDOS','拒绝服务','',''),(13,7,'DOM XSS','基于DOM的XSS','',''),(14,7,'Stored XSS','存储型XSS','',''),(15,2,'Logic','逻辑漏洞','','');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `comments` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL COMMENT '用户id',
  `content` char(255) DEFAULT NULL COMMENT '评论内容',
  `page_id` int(11) DEFAULT NULL COMMENT '文章id',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hall`
--

DROP TABLE IF EXISTS `hall`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `hall` (
  `id` int(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `url` varchar(100) NOT NULL DEFAULT './Public/Home/images/unknow.jpeg',
  `des` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `hall`
--

LOCK TABLES `hall` WRITE;
/*!40000 ALTER TABLE `hall` DISABLE KEYS */;
INSERT INTO `hall` VALUES (0,'路人甲','./Public/Home/images/unknow.jpeg','凭借自己精湛的挖掘思路帮助我们发现十余个高危漏洞,是本月当之无愧的No.1'),(1,'David','./Public/Home/images/unknow.jpeg','帮助轻响应发现多个严重级别的权限漏洞和逻辑漏洞，帮助轻响应提升了整体业务安全水平'),(2,'Bison','./Public/Home/images/unknow.jpeg','本月发现一枚严重级别的支付问题漏洞，帮助我们快速定位问题，保障了数万用户的安全');
/*!40000 ALTER TABLE `hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `info` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `realname` varchar(20) NOT NULL,
  `location` varchar(50) NOT NULL,
  `tel` varchar(11) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `alipay` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'admin','周三&lt;input&gt;','北京市百度科技大厦','15176528910','10092@',''),(2,'admin2','王二','江苏','18712345612','214000','1009465@qq.com');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `links` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `sort` int(5) DEFAULT NULL,
  `jifen` int(10) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES (1,'蝴蝶流量100M','./Public/Upload/20160402/56ffb1a2916a3.png',100,10,1);
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `manager` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL,
  `login_ip` varchar(20) NOT NULL,
  `create_at` varchar(11) NOT NULL,
  `update_at` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'admin','491463471@qq.com','21232f297a57a5a743894a0e4a801fc3','127.0.0.1','1453778451','1459496017');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `create_at` varchar(11) DEFAULT '0',
  `update_at` varchar(11) DEFAULT '0',
  `login_ip` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '0:禁止登陆 1:正常',
  `type` tinyint(1) DEFAULT '1' COMMENT '1:前台用户 2:管理员 ',
  `jifen` int(10) NOT NULL,
  `rank` int(10) NOT NULL DEFAULT '0',
  `face` char(100) DEFAULT NULL,
  `des` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`) USING BTREE,
  KEY `password` (`password`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `realname` varchar(50) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `location` varchar(100) NOT NULL,
  `tel` int(15) NOT NULL,
  `alipay` varchar(50) NOT NULL,
  `gid` varchar(100) NOT NULL,
  `finish` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,'2015年应急响应中心漏洞奖励细节','SRC--001','&lt;p&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;strong&gt;基本原则&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;我们对于保护用户利益，帮助小米安全提升的白帽子黑客，我们给予感谢和回馈。&lt;/p&gt;&lt;p&gt;我们反对和谴责一切以漏洞测试为借口，利用安全漏洞进行破坏、损害用户利益的黑客行为，包括但不限于利用漏洞盗取用户资料、入侵业务系统、修改、窃取相关系统资料、恶意传播漏洞或数据。对于发生上述行为的、我们司将追究其法律责任。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;strong&gt;漏洞处理流程&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;对于每一个级别的漏洞，我们会根据漏洞利用的技术难度、漏洞造成的影响等进行综合考虑，分成不同的层次，并给与相应积分。&lt;/p&gt;&lt;p&gt;根据漏洞出现的业务等级，漏洞危害程度分为高危、中危、低危、忽略四个级别，每个级别涵盖的漏洞以及评分标准如下：&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;高危：&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;直接获取系统权限（服务器权限、客户端权限）的漏洞。包括但不限于远程任意命令执行、代码执行、任意文件上传获取Webshell、缓冲区溢出、SQL注入获取系统权限、服务器解析漏洞、文件包含漏洞等。&lt;/p&gt;&lt;p&gt;严重的逻辑设计缺陷。包括但不限于任意账号登陆、任意账号密码修改、短信邮件验证的绕过。&lt;/p&gt;&lt;p&gt;严重的敏感信息泄露。包括但不限于严重的SQL注入、任意文件包含等。&lt;/p&gt;&lt;p&gt;越权访问。包括但不限于绕过验证直接访问后台、后台登录弱口令、SSH弱口令，数据库弱口令等。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;中危：&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;需要交互才能获取用户身份信息的漏洞。包括存储型XSS等。&lt;/p&gt;&lt;p&gt;普通逻辑设计缺陷。包括但不限于无限制短信邮件等发送等。&lt;/p&gt;&lt;p&gt;非重点产品线、利用难度较大的SQL注入漏洞等。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;低危：&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;一般信息泄露漏洞。包括但不限于路径泄露、SVN文件泄露、LOG文件泄露、Phpinfo等。&lt;/p&gt;&lt;p&gt;无法利用或者难以利用的漏洞，包括但不限于反射型XSS和只能弹自己的XSS。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;忽略：&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;不涉及安全问题的bug。包括但不限于产品功能缺陷、页面乱码、样式混编等。&lt;/p&gt;&lt;p&gt;无法重现的漏洞、不能直接体现漏洞的其他问题。包括但不限于纯属用户猜测的问题。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;'),(2,'2015年应急响应中心漏洞收集流程','SRC--002','&lt;p&gt;&lt;strong&gt;白帽子定义：&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;白帽子指通过先知平台参与漏洞提交过程的安全专家，能够识别计算机系统或网络系统中的安全漏洞，但并不会恶意利用，而是公布漏洞，帮助厂商在被其他人恶意利用之前修补漏洞，维护计算机和互联网安全。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;漏洞收集流程：&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;1. 登录并完善资料&lt;/p&gt;&lt;p&gt;白帽子使用应急响应中心账号登录平台并完善资料，请确保资料真实有效，并及时更新。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;2. 提交漏洞&lt;/p&gt;&lt;p&gt;白帽子根据漏洞提交页面指引，提交安全漏洞信息。请务必详尽，漏洞描述越具体，越便于我们准确进行应急响应。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;3. 审核漏洞&lt;/p&gt;&lt;p&gt;漏洞提交后48小时内（法定节假日顺延），我们会对收到的漏洞按照《漏洞验收标准》进行评估同时确定奖励额度。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(15) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `advise` varchar(255) NOT NULL,
  `time` varchar(11) DEFAULT '0',
  `day` tinyint(1) NOT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rank` int(1) NOT NULL,
  `type` tinyint(1) DEFAULT '1' COMMENT '1:普通,2:置顶,3:热门,4:推荐',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL DEFAULT '',
  `value` char(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'site-name','HR·SRC','站点名'),(2,'site-keywords','关键词1,关键词2','关键词'),(3,'site-description','站点描述信息','站点描述'),(4,'site-tongji','&lt;script&gt; console.log(&quot;统计代码&quot;)&lt;/script&gt;','统计代码'),(5,'site-icp','示ICP证 100000号','ICP备案号'),(6,'site-url','http://www.src.pw','站点地址'),(7,'site-introduce','<p >华软安全应急响应中心（HR Security Response Center）是轻响应致力于维护华软内网健康生态环境，保障内务产品和网络的信息安全，促进同学们的合作与交流，而建立的漏洞收集及应急响应平台。本平台收集华软产品线及业务上存在的安全漏洞，同时，我们也希望借此平台加强同学们的网络安全意识，共同打造简单可信赖的华软内网健康生态。</p>','介绍'),(8,'site-mean','HR Security Response Center','解释');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-21  1:14:34
