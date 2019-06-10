/*
SQLyog Ultimate v8.32 
MySQL - 5.5.36 : Database - lianxi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lianxi` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `lianxi`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_author` varchar(100) DEFAULT NULL,
  `r_summary` varchar(100) DEFAULT NULL,
  `r_content` text,
  `r_date` varchar(100) DEFAULT NULL,
  `r_verify` int(11) DEFAULT NULL,
  `r_publish` int(11) DEFAULT NULL,
  `r_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `article` */

insert  into `article`(`r_id`,`r_author`,`r_summary`,`r_content`,`r_date`,`r_verify`,`r_publish`,`r_status`) values (1,'喵喵喵','今天一定搞定','2019-06-07 01:56:51 星期五','2019-06-07',1,1,0);

/*Table structure for table `base_dict` */

DROP TABLE IF EXISTS `base_dict`;

CREATE TABLE `base_dict` (
  `dict_id` varchar(32) NOT NULL COMMENT '数据字典id(主键)',
  `dict_type_code` varchar(10) NOT NULL COMMENT '数据字典类别代码',
  `dict_type_name` varchar(64) NOT NULL COMMENT '数据字典类别名称',
  `dict_item_name` varchar(64) NOT NULL COMMENT '数据字典项目名称',
  `dict_item_code` varchar(10) DEFAULT NULL COMMENT '数据字典项目代码(可为空)',
  `dict_sort` int(10) DEFAULT NULL COMMENT '排序字段',
  `dict_enable` char(1) NOT NULL COMMENT '1:使用 0:停用',
  `dict_memo` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `base_dict` */

insert  into `base_dict`(`dict_id`,`dict_type_code`,`dict_type_name`,`dict_item_name`,`dict_item_code`,`dict_sort`,`dict_enable`,`dict_memo`) values ('1','001','客户行业','教育培训 ',NULL,1,'1',NULL),('10','003','公司性质','民企',NULL,3,'1',NULL),('12','004','年营业额','1-10万',NULL,1,'1',NULL),('13','004','年营业额','10-20万',NULL,2,'1',NULL),('14','004','年营业额','20-50万',NULL,3,'1',NULL),('15','004','年营业额','50-100万',NULL,4,'1',NULL),('16','004','年营业额','100-500万',NULL,5,'1',NULL),('17','004','年营业额','500-1000万',NULL,6,'1',NULL),('18','005','客户状态','基础客户',NULL,1,'1',NULL),('19','005','客户状态','潜在客户',NULL,2,'1',NULL),('2','001','客户行业','电子商务',NULL,2,'1',NULL),('20','005','客户状态','成功客户',NULL,3,'1',NULL),('21','005','客户状态','无效客户',NULL,4,'1',NULL),('22','006','客户级别','普通客户',NULL,1,'1',NULL),('23','006','客户级别','VIP客户',NULL,2,'1',NULL),('24','007','商机状态','意向客户',NULL,1,'1',NULL),('25','007','商机状态','初步沟通',NULL,2,'1',NULL),('26','007','商机状态','深度沟通',NULL,3,'1',NULL),('27','007','商机状态','签订合同',NULL,4,'1',NULL),('3','001','客户行业','对外贸易',NULL,3,'1',NULL),('30','008','商机类型','新业务',NULL,1,'1',NULL),('31','008','商机类型','现有业务',NULL,2,'1',NULL),('32','009','商机来源','电话营销',NULL,1,'1',NULL),('33','009','商机来源','网络营销',NULL,2,'1',NULL),('34','009','商机来源','推广活动',NULL,3,'1',NULL),('4','001','客户行业','酒店旅游',NULL,4,'1',NULL),('5','001','客户行业','房地产',NULL,5,'1',NULL),('6','002','客户信息来源','电话营销',NULL,1,'1',NULL),('7','002','客户信息来源','网络营销',NULL,2,'1',NULL),('8','003','公司性质','合资',NULL,1,'1',NULL),('9','003','公司性质','国企',NULL,2,'1',NULL);

/*Table structure for table `book` */


/*Table structure for table `card_login` */

DROP TABLE IF EXISTS `card_login`;

CREATE TABLE `card_login` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `card_login` */

insert  into `card_login`(`username`,`password`) values ('1','1'),('123','111'),('admin','mlk'),('dod','mlk'),('dodo','mlk'),('mlk','mlk'),('qwe','qwe');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `cust_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '客户编号(主键)',
  `cust_name` varchar(32) NOT NULL COMMENT '客户名称(公司名称)',
  `cust_user_id` bigint(32) DEFAULT NULL COMMENT '负责人id',
  `cust_create_id` bigint(32) DEFAULT NULL COMMENT '创建人id',
  `cust_source` varchar(32) DEFAULT NULL COMMENT '客户信息来源',
  `cust_industry` varchar(32) DEFAULT NULL COMMENT '客户所属行业',
  `cust_level` varchar(32) DEFAULT NULL COMMENT '客户级别',
  `cust_linkman` varchar(64) DEFAULT NULL COMMENT '联系人',
  `cust_phone` varchar(64) DEFAULT NULL COMMENT '固定电话',
  `cust_mobile` varchar(16) DEFAULT NULL COMMENT '移动电话',
  `cust_zipcode` varchar(10) DEFAULT NULL,
  `cust_address` varchar(100) DEFAULT NULL,
  `cust_createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`cust_id`),
  KEY `FK_cst_customer_source` (`cust_source`),
  KEY `FK_cst_customer_industry` (`cust_industry`),
  KEY `FK_cst_customer_level` (`cust_level`),
  KEY `FK_cst_customer_user_id` (`cust_user_id`),
  KEY `FK_cst_customer_create_id` (`cust_create_id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

insert  into `customer`(`cust_id`,`cust_name`,`cust_user_id`,`cust_create_id`,`cust_source`,`cust_industry`,`cust_level`,`cust_linkman`,`cust_phone`,`cust_mobile`,`cust_zipcode`,`cust_address`,`cust_createtime`) values (16,'马苓珂',NULL,NULL,'7','5','23','马化腾','0108888887','13888888888','123456','南昌下水巷','2019-05-18 16:11:30');

/*Table structure for table `reply` */

DROP TABLE IF EXISTS `reply`;

CREATE TABLE `reply` (
  `lr_id` int(11) NOT NULL AUTO_INCREMENT,
  `lr_name` varchar(100) DEFAULT NULL,
  `lr_date` varchar(100) DEFAULT NULL,
  `lr_content` varchar(100) DEFAULT NULL,
  `lr_for_name` varchar(100) DEFAULT NULL,
  `lr_for_words` varchar(100) DEFAULT NULL,
  `lr_for_reply` varchar(100) DEFAULT NULL,
  `lr_for_article_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`lr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `reply` */

/*Table structure for table `salevisit` */

DROP TABLE IF EXISTS `salevisit`;

CREATE TABLE `salevisit` (
  `sale_createtime` datetime DEFAULT NULL,
  `sale_man` varchar(32) DEFAULT NULL,
  `visit_location` varchar(100) DEFAULT NULL,
  `visit_sum` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `salevisit` */

insert  into `salevisit`(`sale_createtime`,`sale_man`,`visit_location`,`visit_sum`) values (NULL,'mlk','ncu','未成功');


/*Table structure for table `words` */

DROP TABLE IF EXISTS `words`;

CREATE TABLE `words` (
  `lw_id` int(11) NOT NULL AUTO_INCREMENT,
  `lw_name` varchar(100) DEFAULT NULL,
  `lw_date` varchar(100) DEFAULT NULL,
  `lw_content` varchar(100) DEFAULT NULL,
  `lw_for_name` varchar(100) DEFAULT NULL,
  `lw_for_article_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`lw_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `words` */

/*!50106 set global event_scheduler = 1*/;

/* Event structure for event `limitLog` */

/*!50106 DROP EVENT IF EXISTS `limitLog`*/;

DELIMITER $$

/*!50106 CREATE DEFINER=`root`@`localhost` EVENT `limitLog` ON SCHEDULE EVERY 1 SECOND STARTS '2019-05-07 09:14:08' ON COMPLETION NOT PRESERVE ENABLE DO IF (SELECT COUNT(*) FROM book_borrow) > 8 
THEN 
DELETE FROM book_borrow order by b_name desc limit 1;
END IF */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
