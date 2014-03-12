/*
Navicat MySQL Data Transfer

Source Server         : MyConnection
Source Server Version : 50151
Source Host           : localhost:3306
Source Database       : rtxpert

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2014-01-03 11:21:56
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `bgp_link_info`
-- ----------------------------
DROP TABLE IF EXISTS `bgp_link_info`;
CREATE TABLE `bgp_link_info` (
  `as_num` smallint(5) unsigned NOT NULL COMMENT '本AS号',
  `router_id` varchar(15) NOT NULL COMMENT '路由器ID',
  `interface_ip` varchar(15) NOT NULL COMMENT '接口IP',
  `n_as_num` smallint(5) unsigned NOT NULL COMMENT '邻居AS号',
  `n_router_id` varchar(15) NOT NULL COMMENT '邻居路由器ID',
  `n_interface_ip` varchar(15) NOT NULL COMMENT '邻居接口IP',
  `mask` varchar(15) NOT NULL COMMENT '掩码',
  `metric` int(11) NOT NULL COMMENT '链路代价'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bgp_link_info
-- ----------------------------

-- ----------------------------
-- Table structure for `bgp_path_info`
-- ----------------------------
DROP TABLE IF EXISTS `bgp_path_info`;
CREATE TABLE `bgp_path_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `n_routerID` varchar(15) DEFAULT NULL,
  `n_asNum` int(11) DEFAULT NULL,
  `n_peerIP` varchar(15) DEFAULT NULL,
  `prefixLen` tinyint(3) DEFAULT NULL,
  `networkNum` varchar(15) DEFAULT NULL,
  `asPath` varchar(30) DEFAULT NULL,
  `nextHop` varchar(15) DEFAULT NULL,
  `origin` tinyint(4) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `med` int(11) DEFAULT NULL,
  `local_pref` int(11) DEFAULT NULL,
  `create_time` decimal(13,0) NOT NULL,
  `end_time` decimal(13,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bgp_path_info
-- ----------------------------

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `dptid` int(11) NOT NULL AUTO_INCREMENT,
  `dptname` varchar(30) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------

-- ----------------------------
-- Table structure for `hz_bgp_path_info`
-- ----------------------------
DROP TABLE IF EXISTS `hz_bgp_path_info`;
CREATE TABLE `hz_bgp_path_info` (
  `id` bigint(20) NOT NULL,
  `as_num` smallint(6) NOT NULL,
  `n_routerID` varchar(15) DEFAULT NULL,
  `n_asNum` int(11) DEFAULT NULL,
  `n_peerIP` varchar(15) DEFAULT NULL,
  `prefixLen` tinyint(3) DEFAULT NULL,
  `networkNum` varchar(15) DEFAULT NULL,
  `asPath` varchar(30) DEFAULT NULL,
  `nextHop` varchar(15) DEFAULT NULL,
  `origin` tinyint(4) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `med` int(11) DEFAULT NULL,
  `local_pref` int(11) DEFAULT NULL,
  `create_time` decimal(13,0) NOT NULL,
  `end_time` decimal(13,0) NOT NULL,
  PRIMARY KEY (`id`,`as_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hz_bgp_path_info
-- ----------------------------

-- ----------------------------
-- Table structure for `hz_ospf_asexternallsa`
-- ----------------------------
DROP TABLE IF EXISTS `hz_ospf_asexternallsa`;
CREATE TABLE `hz_ospf_asexternallsa` (
  `id` bigint(20) unsigned NOT NULL,
  `as_num` smallint(6) NOT NULL DEFAULT '0',
  `routerID` varchar(15) DEFAULT NULL,
  `areaID` varchar(15) DEFAULT NULL,
  `timeStamp` decimal(13,0) DEFAULT NULL,
  `lsAge` smallint(6) DEFAULT NULL,
  `lsaType` tinyint(4) DEFAULT NULL,
  `linkStateID` varchar(15) DEFAULT NULL,
  `adRouter` varchar(15) DEFAULT NULL,
  `networkMask` varchar(15) DEFAULT NULL,
  `externalType` tinyint(4) DEFAULT NULL,
  `metric` int(11) DEFAULT NULL,
  `forwardAddress` varchar(15) DEFAULT NULL,
  `eRouterTag` int(11) DEFAULT NULL,
  `isUseful` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`as_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hz_ospf_asexternallsa
-- ----------------------------

-- ----------------------------
-- Table structure for `hz_ospf_link_attr`
-- ----------------------------
DROP TABLE IF EXISTS `hz_ospf_link_attr`;
CREATE TABLE `hz_ospf_link_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `as_num` smallint(5) unsigned NOT NULL COMMENT '所属自治域',
  `router_id` varchar(15) NOT NULL COMMENT '路由器ID',
  `interface_ip` varchar(15) DEFAULT '' COMMENT '接口IP',
  `n_as_num` smallint(5) unsigned DEFAULT NULL COMMENT '邻居所属自治域',
  `n_router_id` varchar(15) DEFAULT NULL COMMENT '邻居路由器ID',
  `bandwidth` int(10) unsigned DEFAULT '0' COMMENT '流速阈值(单位MB)',
  `description` varchar(127) DEFAULT '' COMMENT '链路描述',
  `timestamp` decimal(10,0) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of hz_ospf_link_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `hz_ospf_link_info`
-- ----------------------------
DROP TABLE IF EXISTS `hz_ospf_link_info`;
CREATE TABLE `hz_ospf_link_info` (
  `id` bigint(20) unsigned NOT NULL,
  `as_num` smallint(5) unsigned NOT NULL COMMENT '所属自治域',
  `router_id` varchar(15) NOT NULL COMMENT '路由器ID',
  `interface_ip` varchar(15) DEFAULT '' COMMENT '接口IP',
  `mask` varchar(15) DEFAULT '' COMMENT '接口掩码',
  `n_as_num` smallint(5) unsigned DEFAULT NULL COMMENT '邻居所属自治域',
  `n_router_id` varchar(15) DEFAULT NULL COMMENT '邻居路由器ID',
  `area_id` varchar(15) DEFAULT '' COMMENT '接口IP所属area',
  `link_type` tinyint(3) unsigned DEFAULT '0' COMMENT '链路/接口类型',
  `is_static` tinyint(1) DEFAULT '0' COMMENT '是否为静态路由',
  `metric` int(11) DEFAULT '0' COMMENT '链路代价',
  `create_time` bigint(10) unsigned NOT NULL COMMENT '条目创立时间',
  `end_time` bigint(10) unsigned NOT NULL DEFAULT '9999999999' COMMENT '条目失效时间',
  PRIMARY KEY (`id`,`as_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hz_ospf_link_info
-- ----------------------------

-- ----------------------------
-- Table structure for `hz_ospf_router_attr`
-- ----------------------------
DROP TABLE IF EXISTS `hz_ospf_router_attr`;
CREATE TABLE `hz_ospf_router_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `as_num` smallint(5) unsigned NOT NULL COMMENT '所属自治域',
  `router_id` varchar(15) NOT NULL COMMENT '路由器ID',
  `alias` varchar(30) DEFAULT '' COMMENT '别名',
  `description` varchar(127) DEFAULT '' COMMENT '描述',
  `dptid` int(10) unsigned DEFAULT '0' COMMENT '所属单位',
  `x` decimal(16,12) unsigned DEFAULT '0.000000000000' COMMENT '布局x坐标',
  `y` decimal(16,12) unsigned DEFAULT '0.000000000000' COMMENT '布局y坐标',
  `timestamp` decimal(10,0) unsigned NOT NULL COMMENT '条目更新时间',
  PRIMARY KEY (`id`),
  KEY `as_router` (`as_num`,`router_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of hz_ospf_router_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `hz_ospf_router_info`
-- ----------------------------
DROP TABLE IF EXISTS `hz_ospf_router_info`;
CREATE TABLE `hz_ospf_router_info` (
  `id` bigint(11) unsigned NOT NULL,
  `as_num` smallint(5) unsigned NOT NULL COMMENT '所属自治域',
  `router_id` varchar(15) NOT NULL COMMENT '路由器ID',
  `router_type` tinyint(4) NOT NULL COMMENT '路由器类型',
  `create_time` bigint(10) unsigned NOT NULL COMMENT '条目创立时间',
  `end_time` bigint(10) unsigned NOT NULL DEFAULT '9999999999' COMMENT '条目失效时间',
  PRIMARY KEY (`id`,`as_num`),
  KEY `as_router` (`as_num`,`router_id`) USING BTREE,
  KEY `time` (`create_time`,`end_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hz_ospf_router_info
-- ----------------------------

-- ----------------------------
-- Table structure for `hz_ospf_traffic_topo`
-- ----------------------------
DROP TABLE IF EXISTS `hz_ospf_traffic_topo`;
CREATE TABLE `hz_ospf_traffic_topo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(12) unsigned NOT NULL COMMENT '周期id',
  `link_id` bigint(20) unsigned NOT NULL COMMENT '对应ospf_link_info表中的id',
  `as_num` smallint(5) NOT NULL,
  `interval` tinyint(3) unsigned DEFAULT NULL COMMENT '周期间隔',
  `bytes` bigint(20) unsigned DEFAULT '0' COMMENT '链路总流量',
  `protocol_bytes` text COMMENT '业务流量json格式',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hz_ospf_traffic_topo
-- ----------------------------

-- ----------------------------
-- Table structure for `hz_warning`
-- ----------------------------
DROP TABLE IF EXISTS `hz_warning`;
CREATE TABLE `hz_warning` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '告警ID',
  `as_num` smallint(5) NOT NULL,
  `code` smallint(4) unsigned zerofill NOT NULL COMMENT '告警类型代码',
  `parse_time` mediumint(8) unsigned DEFAULT NULL COMMENT '告警处理时间',
  `snmp_time` mediumint(8) unsigned DEFAULT NULL COMMENT 'snmp上报时间',
  `text_params` varchar(127) DEFAULT '' COMMENT '告警描述文字参数',
  `relate_id` bigint(20) unsigned DEFAULT NULL,
  `solved` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已处理',
  `timestamp` bigint(10) unsigned NOT NULL COMMENT '告警生成时间',
  PRIMARY KEY (`id`,`as_num`),
  KEY `warn_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hz_warning
-- ----------------------------

-- ----------------------------
-- Table structure for `ip_flow_in`
-- ----------------------------
DROP TABLE IF EXISTS `ip_flow_in`;
CREATE TABLE `ip_flow_in` (
  `ip` bigint(10) unsigned NOT NULL,
  `pid` bigint(20) unsigned NOT NULL,
  `hour_0` bigint(20) unsigned DEFAULT NULL,
  `hour_1` bigint(20) unsigned DEFAULT NULL,
  `hour_2` bigint(20) unsigned DEFAULT NULL,
  `hour_3` bigint(20) unsigned DEFAULT NULL,
  `hour_4` bigint(20) unsigned DEFAULT NULL,
  `hour_5` bigint(20) unsigned DEFAULT NULL,
  `hour_6` bigint(20) unsigned DEFAULT NULL,
  `hour_7` bigint(20) unsigned DEFAULT NULL,
  `hour_8` bigint(20) unsigned DEFAULT NULL,
  `hour_9` bigint(20) unsigned DEFAULT NULL,
  `hour_10` bigint(20) unsigned DEFAULT NULL,
  `hour_11` bigint(20) unsigned DEFAULT NULL,
  `hour_12` bigint(20) unsigned DEFAULT NULL,
  `hour_13` bigint(20) unsigned DEFAULT NULL,
  `hour_14` bigint(20) unsigned DEFAULT NULL,
  `hour_15` bigint(20) unsigned DEFAULT NULL,
  `hour_16` bigint(20) unsigned DEFAULT NULL,
  `hour_17` bigint(20) unsigned DEFAULT NULL,
  `hour_18` bigint(20) unsigned DEFAULT NULL,
  `hour_19` bigint(20) unsigned DEFAULT NULL,
  `hour_20` bigint(20) unsigned DEFAULT NULL,
  `hour_21` bigint(20) unsigned DEFAULT NULL,
  `hour_22` bigint(20) unsigned DEFAULT NULL,
  `hour_23` bigint(20) unsigned DEFAULT NULL,
  `Total` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ip`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ip_flow_in
-- ----------------------------

-- ----------------------------
-- Table structure for `ip_flow_out`
-- ----------------------------
DROP TABLE IF EXISTS `ip_flow_out`;
CREATE TABLE `ip_flow_out` (
  `ip` bigint(10) unsigned NOT NULL,
  `pid` bigint(20) unsigned NOT NULL,
  `hour_0` bigint(20) unsigned DEFAULT NULL,
  `hour_1` bigint(20) unsigned DEFAULT NULL,
  `hour_2` bigint(20) unsigned DEFAULT NULL,
  `hour_3` bigint(20) unsigned DEFAULT NULL,
  `hour_4` bigint(20) unsigned DEFAULT NULL,
  `hour_5` bigint(20) unsigned DEFAULT NULL,
  `hour_6` bigint(20) unsigned DEFAULT NULL,
  `hour_7` bigint(20) unsigned DEFAULT NULL,
  `hour_8` bigint(20) unsigned DEFAULT NULL,
  `hour_9` bigint(20) unsigned DEFAULT NULL,
  `hour_10` bigint(20) unsigned DEFAULT NULL,
  `hour_11` bigint(20) unsigned DEFAULT NULL,
  `hour_12` bigint(20) unsigned DEFAULT NULL,
  `hour_13` bigint(20) unsigned DEFAULT NULL,
  `hour_14` bigint(20) unsigned DEFAULT NULL,
  `hour_15` bigint(20) unsigned DEFAULT NULL,
  `hour_16` bigint(20) unsigned DEFAULT NULL,
  `hour_17` bigint(20) unsigned DEFAULT NULL,
  `hour_18` bigint(20) unsigned DEFAULT NULL,
  `hour_19` bigint(20) unsigned DEFAULT NULL,
  `hour_20` bigint(20) unsigned DEFAULT NULL,
  `hour_21` bigint(20) unsigned DEFAULT NULL,
  `hour_22` bigint(20) unsigned DEFAULT NULL,
  `hour_23` bigint(20) unsigned DEFAULT NULL,
  `Total` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ip`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ip_flow_out
-- ----------------------------

-- ----------------------------
-- Table structure for `ip_online_info`
-- ----------------------------
DROP TABLE IF EXISTS `ip_online_info`;
CREATE TABLE `ip_online_info` (
  `ip` bigint(10) unsigned NOT NULL,
  `pid` bigint(20) unsigned NOT NULL,
  `hour_0` int(10) unsigned DEFAULT '0',
  `hour_1` int(10) unsigned DEFAULT '0',
  `hour_2` int(10) unsigned DEFAULT '0',
  `hour_3` int(10) unsigned DEFAULT '0',
  `hour_4` int(10) unsigned DEFAULT NULL,
  `hour_5` int(10) unsigned DEFAULT '0',
  `hour_6` int(10) unsigned DEFAULT '0',
  `hour_7` int(10) unsigned DEFAULT '0',
  `hour_8` int(10) unsigned DEFAULT '0',
  `hour_9` int(10) unsigned DEFAULT '0',
  `hour_10` int(10) unsigned DEFAULT '0',
  `hour_11` int(10) unsigned DEFAULT '0',
  `hour_12` int(10) unsigned DEFAULT '0',
  `hour_13` int(10) unsigned DEFAULT '0',
  `hour_14` int(10) unsigned DEFAULT '0',
  `hour_15` int(10) unsigned DEFAULT '0',
  `hour_16` int(10) unsigned DEFAULT '0',
  `hour_17` int(10) unsigned DEFAULT '0',
  `hour_18` int(10) unsigned DEFAULT '0',
  `hour_19` int(10) unsigned DEFAULT '0',
  `hour_20` int(10) unsigned DEFAULT '0',
  `hour_21` int(10) unsigned DEFAULT '0',
  `hour_22` int(10) unsigned DEFAULT '0',
  `hour_23` int(10) unsigned DEFAULT '0',
  `Total` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`ip`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ip_online_info
-- ----------------------------

-- ----------------------------
-- Table structure for `ip_protocol_flow`
-- ----------------------------
DROP TABLE IF EXISTS `ip_protocol_flow`;
CREATE TABLE `ip_protocol_flow` (
  `ip` bigint(10) NOT NULL COMMENT 'IP地址',
  `date` bigint(10) NOT NULL COMMENT '时间(精确到小时)',
  `protocol` varchar(12) NOT NULL COMMENT '协议字段',
  `inflow` bigint(20) DEFAULT NULL COMMENT '入流量',
  `outflow` bigint(20) DEFAULT NULL COMMENT '出流量',
  PRIMARY KEY (`ip`,`date`,`protocol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ip_protocol_flow
-- ----------------------------

-- ----------------------------
-- Table structure for `ospf_asexternallsa`
-- ----------------------------
DROP TABLE IF EXISTS `ospf_asexternallsa`;
CREATE TABLE `ospf_asexternallsa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `asNum` smallint(6) DEFAULT NULL,
  `routerID` varchar(15) DEFAULT NULL,
  `areaID` varchar(15) DEFAULT NULL,
  `timeStamp` decimal(13,0) DEFAULT NULL,
  `lsAge` smallint(6) DEFAULT NULL,
  `lsaType` tinyint(4) DEFAULT NULL,
  `linkStateID` varchar(15) DEFAULT NULL,
  `adRouter` varchar(15) DEFAULT NULL,
  `networkMask` varchar(15) DEFAULT NULL,
  `externalType` tinyint(4) DEFAULT NULL,
  `metric` int(11) DEFAULT NULL,
  `forwardAddress` varchar(15) DEFAULT NULL,
  `eRouterTag` int(11) DEFAULT NULL,
  `isUseful` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ospf_asexternallsa
-- ----------------------------

-- ----------------------------
-- Table structure for `ospf_data_backup`
-- ----------------------------
DROP TABLE IF EXISTS `ospf_data_backup`;
CREATE TABLE `ospf_data_backup` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL COMMENT '备份数据类型',
  `tableName` varchar(40) NOT NULL DEFAULT '' COMMENT '分部表名',
  `hz_tableName` varchar(40) NOT NULL COMMENT '总部表名',
  `relate_id` bigint(20) NOT NULL COMMENT '分部表关联ID',
  `timestamp` bigint(20) NOT NULL COMMENT '备份时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ospf_data_backup
-- ----------------------------

-- ----------------------------
-- Table structure for `ospf_link_attr`
-- ----------------------------
DROP TABLE IF EXISTS `ospf_link_attr`;
CREATE TABLE `ospf_link_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `as_num` smallint(5) unsigned NOT NULL COMMENT '所属自治域',
  `router_id` varchar(15) NOT NULL COMMENT '路由器ID',
  `interface_ip` varchar(15) DEFAULT '' COMMENT '接口IP',
  `n_as_num` smallint(5) unsigned DEFAULT NULL COMMENT '邻居所属自治域',
  `n_router_id` varchar(15) DEFAULT NULL COMMENT '邻居路由器ID',
  `bandwidth` int(10) unsigned DEFAULT '0' COMMENT '流速阈值(单位MB)',
  `description` varchar(127) DEFAULT '' COMMENT '链路描述',
  `timestamp` decimal(10,0) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ospf_link_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `ospf_link_info`
-- ----------------------------
DROP TABLE IF EXISTS `ospf_link_info`;
CREATE TABLE `ospf_link_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `as_num` smallint(5) unsigned NOT NULL COMMENT '所属自治域',
  `router_id` varchar(15) NOT NULL COMMENT '路由器ID',
  `interface_ip` varchar(15) DEFAULT '' COMMENT '接口IP',
  `mask` varchar(15) DEFAULT '' COMMENT '接口掩码',
  `n_as_num` smallint(5) unsigned DEFAULT NULL COMMENT '邻居所属自治域',
  `n_router_id` varchar(15) DEFAULT NULL COMMENT '邻居路由器ID',
  `area_id` varchar(15) DEFAULT '' COMMENT '接口IP所属area',
  `link_type` tinyint(3) unsigned DEFAULT '0' COMMENT '链路/接口类型',
  `is_static` tinyint(1) DEFAULT '0' COMMENT '是否为静态路由',
  `metric` int(11) DEFAULT '0' COMMENT '链路代价',
  `create_time` bigint(10) unsigned NOT NULL COMMENT '条目创立时间',
  `end_time` bigint(10) unsigned NOT NULL DEFAULT '9999999999' COMMENT '条目失效时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ospf_link_info
-- ----------------------------

-- ----------------------------
-- Table structure for `ospf_networklsa`
-- ----------------------------
DROP TABLE IF EXISTS `ospf_networklsa`;
CREATE TABLE `ospf_networklsa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `asNum` smallint(6) DEFAULT NULL,
  `routerID` varchar(15) DEFAULT NULL,
  `areaID` varchar(15) DEFAULT NULL,
  `timeStamp` decimal(13,0) DEFAULT NULL,
  `lsAge` smallint(6) DEFAULT NULL,
  `linkStateID` varchar(15) DEFAULT NULL,
  `adRouter` varchar(15) DEFAULT NULL,
  `networkMask` varchar(15) DEFAULT NULL,
  `attachedRouter` varchar(15) DEFAULT NULL,
  `isUseful` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ospf_networklsa
-- ----------------------------

-- ----------------------------
-- Table structure for `ospf_routerlsa`
-- ----------------------------
DROP TABLE IF EXISTS `ospf_routerlsa`;
CREATE TABLE `ospf_routerlsa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `asNum` smallint(6) DEFAULT NULL,
  `routerID` varchar(15) DEFAULT NULL,
  `areaID` varchar(15) DEFAULT NULL,
  `timeStamp` decimal(13,0) DEFAULT NULL,
  `lsAge` smallint(6) DEFAULT NULL,
  `linkStateID` varchar(15) DEFAULT NULL,
  `adRouter` varchar(15) DEFAULT NULL,
  `zeroVEB` tinyint(4) DEFAULT NULL,
  `linkID` varchar(15) DEFAULT NULL,
  `linkData` varchar(15) DEFAULT NULL,
  `linkType` tinyint(4) DEFAULT NULL,
  `metric` smallint(6) DEFAULT NULL,
  `isUseful` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ospf_routerlsa
-- ----------------------------

-- ----------------------------
-- Table structure for `ospf_router_attr`
-- ----------------------------
DROP TABLE IF EXISTS `ospf_router_attr`;
CREATE TABLE `ospf_router_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `as_num` smallint(5) unsigned NOT NULL COMMENT '所属自治域',
  `router_id` varchar(15) NOT NULL COMMENT '路由器ID',
  `alias` varchar(30) DEFAULT '' COMMENT '别名',
  `description` varchar(127) DEFAULT '' COMMENT '描述',
  `dptid` int(10) unsigned DEFAULT '0' COMMENT '所属单位',
  `x` decimal(16,12) unsigned DEFAULT '0.000000000000' COMMENT '布局x坐标',
  `y` decimal(16,12) unsigned DEFAULT '0.000000000000' COMMENT '布局y坐标',
  `timestamp` decimal(10,0) unsigned NOT NULL COMMENT '条目更新时间',
  PRIMARY KEY (`id`),
  KEY `as_router` (`as_num`,`router_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ospf_router_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `ospf_router_info`
-- ----------------------------
DROP TABLE IF EXISTS `ospf_router_info`;
CREATE TABLE `ospf_router_info` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `as_num` smallint(5) unsigned NOT NULL COMMENT '所属自治域',
  `router_id` varchar(15) NOT NULL COMMENT '路由器ID',
  `router_type` tinyint(4) NOT NULL COMMENT '路由器类型',
  `create_time` bigint(10) unsigned NOT NULL COMMENT '条目创立时间',
  `end_time` bigint(10) unsigned NOT NULL DEFAULT '9999999999' COMMENT '条目失效时间',
  PRIMARY KEY (`id`),
  KEY `as_router` (`as_num`,`router_id`) USING BTREE,
  KEY `time` (`create_time`,`end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ospf_router_info
-- ----------------------------

-- ----------------------------
-- Table structure for `ospf_summarylsa`
-- ----------------------------
DROP TABLE IF EXISTS `ospf_summarylsa`;
CREATE TABLE `ospf_summarylsa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `asNum` smallint(6) DEFAULT NULL,
  `routerID` varchar(15) DEFAULT NULL,
  `areaID` varchar(15) DEFAULT NULL,
  `timeStamp` decimal(13,0) DEFAULT NULL,
  `lsAge` smallint(6) DEFAULT NULL,
  `lsaType` tinyint(4) DEFAULT NULL,
  `linkStateID` varchar(15) DEFAULT NULL,
  `adRouter` varchar(15) DEFAULT NULL,
  `networkMask` varchar(15) DEFAULT NULL,
  `metric` int(11) DEFAULT NULL,
  `isUseful` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ospf_summarylsa
-- ----------------------------

-- ----------------------------
-- Table structure for `ospf_traffic_topo`
-- ----------------------------
DROP TABLE IF EXISTS `ospf_traffic_topo`;
CREATE TABLE `ospf_traffic_topo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(12) unsigned NOT NULL COMMENT '周期id',
  `link_id` bigint(20) unsigned NOT NULL COMMENT '对应ospf_link_info表中的id',
  `period_interval` tinyint(3) unsigned DEFAULT NULL COMMENT '周期间隔',
  `bytes` bigint(20) unsigned DEFAULT '0' COMMENT '链路总流量',
  `protocol_bytes` text COMMENT '业务流量json格式',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ospf_traffic_topo
-- ----------------------------

-- ----------------------------
-- Table structure for `prefix_flow_in`
-- ----------------------------
DROP TABLE IF EXISTS `prefix_flow_in`;
CREATE TABLE `prefix_flow_in` (
  `ip` bigint(10) unsigned NOT NULL,
  `pid` bigint(20) unsigned NOT NULL,
  `hour_0` bigint(20) unsigned DEFAULT NULL,
  `hour_1` bigint(20) unsigned DEFAULT NULL,
  `hour_2` bigint(20) unsigned DEFAULT NULL,
  `hour_3` bigint(20) unsigned DEFAULT NULL,
  `hour_4` bigint(20) unsigned DEFAULT NULL,
  `hour_5` bigint(20) unsigned DEFAULT NULL,
  `hour_6` bigint(20) unsigned DEFAULT NULL,
  `hour_7` bigint(20) unsigned DEFAULT NULL,
  `hour_8` bigint(20) unsigned DEFAULT NULL,
  `hour_9` bigint(20) unsigned DEFAULT NULL,
  `hour_10` bigint(20) unsigned DEFAULT NULL,
  `hour_11` bigint(20) unsigned DEFAULT NULL,
  `hour_12` bigint(20) unsigned DEFAULT NULL,
  `hour_13` bigint(20) unsigned DEFAULT NULL,
  `hour_14` bigint(20) unsigned DEFAULT NULL,
  `hour_15` bigint(20) unsigned DEFAULT NULL,
  `hour_16` bigint(20) unsigned DEFAULT NULL,
  `hour_17` bigint(20) unsigned DEFAULT NULL,
  `hour_18` bigint(20) unsigned DEFAULT NULL,
  `hour_19` bigint(20) unsigned DEFAULT NULL,
  `hour_20` bigint(20) unsigned DEFAULT NULL,
  `hour_21` bigint(20) unsigned DEFAULT NULL,
  `hour_22` bigint(20) unsigned DEFAULT NULL,
  `hour_23` bigint(20) unsigned DEFAULT NULL,
  `Total` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ip`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of prefix_flow_in
-- ----------------------------

-- ----------------------------
-- Table structure for `prefix_flow_out`
-- ----------------------------
DROP TABLE IF EXISTS `prefix_flow_out`;
CREATE TABLE `prefix_flow_out` (
  `ip` bigint(10) unsigned NOT NULL,
  `pid` bigint(20) unsigned NOT NULL,
  `hour_0` bigint(20) unsigned DEFAULT NULL,
  `hour_1` bigint(20) unsigned DEFAULT NULL,
  `hour_2` bigint(20) unsigned DEFAULT NULL,
  `hour_3` bigint(20) unsigned DEFAULT NULL,
  `hour_4` bigint(20) unsigned DEFAULT NULL,
  `hour_5` bigint(20) unsigned DEFAULT NULL,
  `hour_6` bigint(20) unsigned DEFAULT NULL,
  `hour_7` bigint(20) unsigned DEFAULT NULL,
  `hour_8` bigint(20) unsigned DEFAULT NULL,
  `hour_9` bigint(20) unsigned DEFAULT NULL,
  `hour_10` bigint(20) unsigned DEFAULT NULL,
  `hour_11` bigint(20) unsigned DEFAULT NULL,
  `hour_12` bigint(20) unsigned DEFAULT NULL,
  `hour_13` bigint(20) unsigned DEFAULT NULL,
  `hour_14` bigint(20) unsigned DEFAULT NULL,
  `hour_15` bigint(20) unsigned DEFAULT NULL,
  `hour_16` bigint(20) unsigned DEFAULT NULL,
  `hour_17` bigint(20) unsigned DEFAULT NULL,
  `hour_18` bigint(20) unsigned DEFAULT NULL,
  `hour_19` bigint(20) unsigned DEFAULT NULL,
  `hour_20` bigint(20) unsigned DEFAULT NULL,
  `hour_21` bigint(20) unsigned DEFAULT NULL,
  `hour_22` bigint(20) unsigned DEFAULT NULL,
  `hour_23` bigint(20) unsigned DEFAULT NULL,
  `Total` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ip`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of prefix_flow_out
-- ----------------------------

-- ----------------------------
-- Table structure for `prefix_protocol_flow`
-- ----------------------------
DROP TABLE IF EXISTS `prefix_protocol_flow`;
CREATE TABLE `prefix_protocol_flow` (
  `prefix` bigint(10) NOT NULL COMMENT '前缀',
  `date` bigint(10) NOT NULL COMMENT '时间(精确到小时)',
  `protocol` varchar(12) NOT NULL COMMENT '协议字段',
  `inflow` bigint(20) DEFAULT NULL COMMENT '入流量',
  `outflow` bigint(20) DEFAULT NULL COMMENT '出流量',
  PRIMARY KEY (`prefix`,`date`,`protocol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prefix_protocol_flow
-- ----------------------------

-- ----------------------------
-- Table structure for `rta_alarm`
-- ----------------------------
DROP TABLE IF EXISTS `rta_alarm`;
CREATE TABLE `rta_alarm` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `alarmId` varchar(255) DEFAULT NULL,
  `alarmName` varchar(255) DEFAULT NULL,
  `alarmLevel` char(255) DEFAULT NULL COMMENT '1:紧急\r\n            2:重要\r\n            3:次要\r\n            4:一般\r\n            5:提示',
  `alarmLevelCode` char(255) DEFAULT NULL,
  `alarmType` varchar(255) DEFAULT NULL COMMENT '1:IS-IS\r\n            2:BGP',
  `alarmTypeCode` char(255) DEFAULT NULL,
  `alarmTime` varchar(255) DEFAULT NULL,
  `alarmLocation` varchar(255) DEFAULT NULL,
  `alarmInfo` varchar(1000) DEFAULT NULL,
  `deviceId` varchar(255) DEFAULT NULL,
  `deviceIp` varchar(255) DEFAULT NULL,
  `deviceName` varchar(255) DEFAULT NULL,
  `collectTime` varchar(255) DEFAULT NULL,
  `messageType` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196807 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rta_alarm
-- ----------------------------

-- ----------------------------
-- Table structure for `rta_alarmhistory`
-- ----------------------------
DROP TABLE IF EXISTS `rta_alarmhistory`;
CREATE TABLE `rta_alarmhistory` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `alarmName` varchar(255) DEFAULT NULL,
  `alarmLevel` varchar(255) DEFAULT NULL COMMENT '1:紧急\r\n            2:重要\r\n            3:次要\r\n            4:一般\r\n            5:提示',
  `alarmLevelCode` char(255) DEFAULT NULL,
  `alarmType` varchar(255) DEFAULT NULL COMMENT '1:IS-IS\r\n            2:BGP',
  `alarmTypeCode` char(255) DEFAULT NULL,
  `alarmTime` varchar(255) DEFAULT NULL,
  `alarmLocation` varchar(255) DEFAULT NULL,
  `affirmTime` varchar(255) DEFAULT NULL,
  `alarmId` varchar(255) DEFAULT NULL,
  `alarmInfo` varchar(1000) DEFAULT NULL,
  `deviceId` varchar(255) DEFAULT NULL,
  `deviceName` varchar(255) DEFAULT NULL,
  `deviceIp` varchar(255) DEFAULT NULL,
  `collectTime` varchar(255) DEFAULT NULL,
  `messageType` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rta_alarmhistory
-- ----------------------------

-- ----------------------------
-- Table structure for `rta_config`
-- ----------------------------
DROP TABLE IF EXISTS `rta_config`;
CREATE TABLE `rta_config` (
  `configName` varchar(255) DEFAULT NULL,
  `configValue` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rta_config
-- ----------------------------

-- ----------------------------
-- Table structure for `rta_device_parameter`
-- ----------------------------
DROP TABLE IF EXISTS `rta_device_parameter`;
CREATE TABLE `rta_device_parameter` (
  `device_id` int(11) DEFAULT NULL,
  `device_ip` varchar(15) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `dev_type_id` int(11) DEFAULT NULL,
  `area_id` varchar(255) DEFAULT NULL,
  `device_version` varchar(255) DEFAULT NULL,
  `parent_dev_id` int(11) DEFAULT NULL,
  `sys_running_time` int(11) DEFAULT NULL,
  `run_status` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rta_device_parameter
-- ----------------------------

-- ----------------------------
-- Table structure for `rta_device_record`
-- ----------------------------
DROP TABLE IF EXISTS `rta_device_record`;
CREATE TABLE `rta_device_record` (
  `device_id` int(11) DEFAULT NULL,
  `cpu_util_ratio` float DEFAULT NULL,
  `phy_util_ratio` float DEFAULT NULL,
  `phy_memory_size` int(11) DEFAULT NULL,
  `service_number` int(11) DEFAULT NULL,
  `collect_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rta_device_record
-- ----------------------------

-- ----------------------------
-- Table structure for `rta_device_type`
-- ----------------------------
DROP TABLE IF EXISTS `rta_device_type`;
CREATE TABLE `rta_device_type` (
  `type_id` int(11) DEFAULT NULL,
  `type_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rta_device_type
-- ----------------------------

-- ----------------------------
-- Table structure for `rta_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `rta_dictionary`;
CREATE TABLE `rta_dictionary` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `ncode` varchar(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `tcode` varchar(10) DEFAULT NULL,
  `englishname` varchar(30) DEFAULT NULL,
  `handleInfo` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rta_dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for `rta_dm_rount`
-- ----------------------------
DROP TABLE IF EXISTS `rta_dm_rount`;
CREATE TABLE `rta_dm_rount` (
  `interface_ip` varchar(30) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `run_status` int(11) DEFAULT NULL,
  `offline_time` int(11) DEFAULT NULL,
  `collect_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rta_dm_rount
-- ----------------------------

-- ----------------------------
-- Table structure for `rta_process_record`
-- ----------------------------
DROP TABLE IF EXISTS `rta_process_record`;
CREATE TABLE `rta_process_record` (
  `process_id` int(11) DEFAULT NULL,
  `process_name` varchar(255) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `cpu_util_ratio` float DEFAULT NULL,
  `phy_util_ratio` float DEFAULT NULL,
  `collect_time` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rta_process_record
-- ----------------------------

-- ----------------------------
-- Table structure for `syslog`
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `code` tinyint(3) unsigned zerofill NOT NULL COMMENT '日志类型代码',
  `text_params` text COMMENT '系统日志文字参数',
  `timestamp` int(10) unsigned NOT NULL COMMENT '事件时间',
  PRIMARY KEY (`id`),
  KEY `syslog_code` (`code`) USING BTREE,
  CONSTRAINT `syslog_ibfk_1` FOREIGN KEY (`code`) REFERENCES `syslog_dictionary` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syslog
-- ----------------------------

-- ----------------------------
-- Table structure for `syslog_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `syslog_dictionary`;
CREATE TABLE `syslog_dictionary` (
  `code` tinyint(3) unsigned zerofill NOT NULL COMMENT '日志类型代码',
  `name` varchar(30) NOT NULL COMMENT '事件',
  `text_template` varchar(127) DEFAULT '' COMMENT '系统日志文字模板',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syslog_dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `password` varchar(32) NOT NULL,
  `usertype` tinyint(4) NOT NULL COMMENT '用户角色',
  `usergender` tinyint(1) NOT NULL,
  `dpt` int(11) DEFAULT '0' COMMENT '所属单位',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO users VALUES ('1', 'admin', '76419c58730d9f35de7ac538c2fd6737', '1', '1', '0');

-- ----------------------------
-- Table structure for `warning`
-- ----------------------------
DROP TABLE IF EXISTS `warning`;
CREATE TABLE `warning` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '告警ID',
  `code` smallint(4) unsigned zerofill NOT NULL COMMENT '告警类型代码',
  `parse_time` mediumint(8) unsigned DEFAULT NULL COMMENT '告警处理时间',
  `snmp_time` mediumint(8) unsigned DEFAULT NULL COMMENT 'snmp上报时间',
  `text_params` varchar(127) DEFAULT '' COMMENT '告警描述文字参数',
  `relate_id` bigint(20) unsigned DEFAULT NULL,
  `solved` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已处理',
  `timestamp` bigint(10) unsigned NOT NULL COMMENT '告警生成时间',
  PRIMARY KEY (`id`),
  KEY `warn_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warning
-- ----------------------------

-- ----------------------------
-- Table structure for `warning_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `warning_dictionary`;
CREATE TABLE `warning_dictionary` (
  `code` smallint(4) unsigned zerofill NOT NULL COMMENT '告警类型代码',
  `name` varchar(30) NOT NULL COMMENT '告警名称',
  `class` tinyint(2) unsigned NOT NULL COMMENT '告警分类(一级)',
  `type` tinyint(2) NOT NULL COMMENT '告警类型(二级)',
  `text_template` varchar(127) DEFAULT '' COMMENT '告警描述文字模板',
  `level` tinyint(2) unsigned NOT NULL COMMENT '告警等级',
  `handle_info` varchar(127) DEFAULT '' COMMENT '处理信息提示',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warning_dictionary
-- ----------------------------
INSERT INTO warning_dictionary VALUES ('1101', '链路丢失', '1', '1', '路由器(AS*)*到路由器(AS*)*路由连接丢失', '1', '');
INSERT INTO warning_dictionary VALUES ('1102', '链路建立', '1', '2', '路由器(AS*)*到路由器(AS*)*路由连接建立', '1', '');
INSERT INTO warning_dictionary VALUES ('1103', '路由器脱离网络', '1', '3', '路由器(AS*)*脱离网络', '1', '');
INSERT INTO warning_dictionary VALUES ('1104', '路由器接入网络', '1', '4', '路由器(AS*)*接入网络', '1', '');
INSERT INTO warning_dictionary VALUES ('1105', '链路状态变化', '1', '5', '路由器(AS*)*到路由器(AS*)*链路metric发生改变', '2', '');
INSERT INTO warning_dictionary VALUES ('1201', '网段地址冲突', '2', '1', '路由器(AS*)*与路由器(AS*)*被配置相同网段：*', '2', '');
INSERT INTO warning_dictionary VALUES ('1202', '路由器接口IP地址冲突', '2', '2', '路由器(AS*)*与路由器(AS*)*被配置相同接口地址：*', '2', '');
INSERT INTO warning_dictionary VALUES ('2101', '链路丢失', '1', '1', '路由器(Area*)*到路由器(Area*)*路由连接丢失', '1', '');
INSERT INTO warning_dictionary VALUES ('2102', '链路建立', '1', '2', '路由器(Area*)*到路由器(Area*)*路由连接建立', '1', '');
INSERT INTO warning_dictionary VALUES ('2103', '路由器脱离网络', '1', '3', '路由器(Area*)*脱离网络', '1', '');
INSERT INTO warning_dictionary VALUES ('2104', '路由器接入网络', '1', '4', '路由器(Area*)*接入网络', '1', '');
INSERT INTO warning_dictionary VALUES ('2105', '链路状态变化', '1', '5', '路由器(Area*)*到路由器(Area*)*链路metric发生改变', '2', '');

-- ----------------------------
-- View structure for `view_bgp_path_info`
-- ----------------------------
DROP VIEW IF EXISTS `view_bgp_path_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_bgp_path_info` AS select `bgp_path_info`.`id` AS `id`,`bgp_path_info`.`n_routerID` AS `n_routerID`,`bgp_path_info`.`n_asNum` AS `n_asNum`,`bgp_path_info`.`n_peerIP` AS `n_peerIP`,`bgp_path_info`.`prefixLen` AS `prefixLen`,`bgp_path_info`.`networkNum` AS `networkNum`,`bgp_path_info`.`asPath` AS `asPath`,`bgp_path_info`.`nextHop` AS `nextHop`,`bgp_path_info`.`origin` AS `origin`,`bgp_path_info`.`weight` AS `weight`,`bgp_path_info`.`med` AS `med`,`bgp_path_info`.`local_pref` AS `local_pref`,`bgp_path_info`.`create_time` AS `create_time`,`bgp_path_info`.`end_time` AS `end_time` from `bgp_path_info` where (`bgp_path_info`.`end_time` = 9999999999);

-- ----------------------------
-- View structure for `view_hz_bgp_path_info`
-- ----------------------------
DROP VIEW IF EXISTS `view_hz_bgp_path_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_hz_bgp_path_info` AS select `hz_bgp_path_info`.`id` AS `id`,`hz_bgp_path_info`.`as_num` AS `as_num`,`hz_bgp_path_info`.`n_routerID` AS `n_routerID`,`hz_bgp_path_info`.`n_asNum` AS `n_asNum`,`hz_bgp_path_info`.`n_peerIP` AS `n_peerIP`,`hz_bgp_path_info`.`prefixLen` AS `prefixLen`,`hz_bgp_path_info`.`networkNum` AS `networkNum`,`hz_bgp_path_info`.`asPath` AS `asPath`,`hz_bgp_path_info`.`nextHop` AS `nextHop`,`hz_bgp_path_info`.`origin` AS `origin`,`hz_bgp_path_info`.`weight` AS `weight`,`hz_bgp_path_info`.`med` AS `med`,`hz_bgp_path_info`.`local_pref` AS `local_pref`,`hz_bgp_path_info`.`create_time` AS `create_time`,`hz_bgp_path_info`.`end_time` AS `end_time` from `hz_bgp_path_info` where (`hz_bgp_path_info`.`end_time` = 9999999999);

-- ----------------------------
-- View structure for `view_hz_ospf_asexternallsa`
-- ----------------------------
DROP VIEW IF EXISTS `view_hz_ospf_asexternallsa`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_hz_ospf_asexternallsa` AS select `hz_ospf_asexternallsa`.`id` AS `id`,`hz_ospf_asexternallsa`.`as_num` AS `as_num`,`hz_ospf_asexternallsa`.`routerID` AS `routerID`,`hz_ospf_asexternallsa`.`areaID` AS `areaID`,`hz_ospf_asexternallsa`.`timeStamp` AS `timeStamp`,`hz_ospf_asexternallsa`.`lsAge` AS `lsAge`,`hz_ospf_asexternallsa`.`lsaType` AS `lsaType`,`hz_ospf_asexternallsa`.`linkStateID` AS `linkStateID`,`hz_ospf_asexternallsa`.`adRouter` AS `adRouter`,`hz_ospf_asexternallsa`.`networkMask` AS `networkMask`,`hz_ospf_asexternallsa`.`externalType` AS `externalType`,`hz_ospf_asexternallsa`.`metric` AS `metric`,`hz_ospf_asexternallsa`.`forwardAddress` AS `forwardAddress`,`hz_ospf_asexternallsa`.`eRouterTag` AS `eRouterTag`,`hz_ospf_asexternallsa`.`isUseful` AS `isUseful` from `hz_ospf_asexternallsa` where (`hz_ospf_asexternallsa`.`isUseful` = 1);

-- ----------------------------
-- View structure for `view_hz_ospf_link_info`
-- ----------------------------
DROP VIEW IF EXISTS `view_hz_ospf_link_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_hz_ospf_link_info` AS select `hz_ospf_link_info`.`id` AS `id`,`hz_ospf_link_info`.`as_num` AS `as_num`,`hz_ospf_link_info`.`router_id` AS `router_id`,`hz_ospf_link_info`.`interface_ip` AS `interface_ip`,`hz_ospf_link_info`.`mask` AS `mask`,`hz_ospf_link_info`.`n_as_num` AS `n_as_num`,`hz_ospf_link_info`.`n_router_id` AS `n_router_id`,`hz_ospf_link_info`.`area_id` AS `area_id`,`hz_ospf_link_info`.`link_type` AS `link_type`,`hz_ospf_link_info`.`is_static` AS `is_static`,`hz_ospf_link_info`.`metric` AS `metric`,`hz_ospf_link_info`.`create_time` AS `create_time`,`hz_ospf_link_info`.`end_time` AS `end_time` from `hz_ospf_link_info` where (`hz_ospf_link_info`.`end_time` = 9999999999);

-- ----------------------------
-- View structure for `view_hz_ospf_router_info`
-- ----------------------------
DROP VIEW IF EXISTS `view_hz_ospf_router_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_hz_ospf_router_info` AS select `hz_ospf_router_info`.`id` AS `id`,`hz_ospf_router_info`.`as_num` AS `as_num`,`hz_ospf_router_info`.`router_id` AS `router_id`,`hz_ospf_router_info`.`router_type` AS `router_type`,`hz_ospf_router_info`.`create_time` AS `create_time`,`hz_ospf_router_info`.`end_time` AS `end_time` from `hz_ospf_router_info` where (`hz_ospf_router_info`.`end_time` = 9999999999);

-- ----------------------------
-- View structure for `view_hz_warning`
-- ----------------------------
DROP VIEW IF EXISTS `view_hz_warning`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_hz_warning` AS select `hz_warning`.`id` AS `id`,`hz_warning`.`as_num` AS `as_num`,`hz_warning`.`code` AS `code`,`hz_warning`.`parse_time` AS `parse_time`,`hz_warning`.`snmp_time` AS `snmp_time`,`hz_warning`.`text_params` AS `text_params`,`hz_warning`.`relate_id` AS `relate_id`,`hz_warning`.`solved` AS `solved`,`hz_warning`.`timestamp` AS `timestamp` from `hz_warning` where (`hz_warning`.`solved` = 0);

-- ----------------------------
-- View structure for `view_ospf_asexternallsa`
-- ----------------------------
DROP VIEW IF EXISTS `view_ospf_asexternallsa`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ospf_asexternallsa` AS select `ospf_asexternallsa`.`id` AS `id`,`ospf_asexternallsa`.`asNum` AS `asNum`,`ospf_asexternallsa`.`routerID` AS `routerID`,`ospf_asexternallsa`.`areaID` AS `areaID`,`ospf_asexternallsa`.`timeStamp` AS `timeStamp`,`ospf_asexternallsa`.`lsAge` AS `lsAge`,`ospf_asexternallsa`.`lsaType` AS `lsaType`,`ospf_asexternallsa`.`linkStateID` AS `linkStateID`,`ospf_asexternallsa`.`adRouter` AS `adRouter`,`ospf_asexternallsa`.`networkMask` AS `networkMask`,`ospf_asexternallsa`.`externalType` AS `externalType`,`ospf_asexternallsa`.`metric` AS `metric`,`ospf_asexternallsa`.`forwardAddress` AS `forwardAddress`,`ospf_asexternallsa`.`eRouterTag` AS `eRouterTag`,`ospf_asexternallsa`.`isUseful` AS `isUseful` from `ospf_asexternallsa` where (`ospf_asexternallsa`.`isUseful` = 1);

-- ----------------------------
-- View structure for `view_ospf_link_info`
-- ----------------------------
DROP VIEW IF EXISTS `view_ospf_link_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ospf_link_info` AS select `ospf_link_info`.`id` AS `id`,`ospf_link_info`.`as_num` AS `as_num`,`ospf_link_info`.`router_id` AS `router_id`,`ospf_link_info`.`interface_ip` AS `interface_ip`,`ospf_link_info`.`mask` AS `mask`,`ospf_link_info`.`n_as_num` AS `n_as_num`,`ospf_link_info`.`n_router_id` AS `n_router_id`,`ospf_link_info`.`area_id` AS `area_id`,`ospf_link_info`.`link_type` AS `link_type`,`ospf_link_info`.`is_static` AS `is_static`,`ospf_link_info`.`metric` AS `metric`,`ospf_link_info`.`create_time` AS `create_time`,`ospf_link_info`.`end_time` AS `end_time` from `ospf_link_info` where (`ospf_link_info`.`end_time` = 9999999999);

-- ----------------------------
-- View structure for `view_ospf_networklsa`
-- ----------------------------
DROP VIEW IF EXISTS `view_ospf_networklsa`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ospf_networklsa` AS select `ospf_networklsa`.`id` AS `id`,`ospf_networklsa`.`asNum` AS `asNum`,`ospf_networklsa`.`routerID` AS `routerID`,`ospf_networklsa`.`areaID` AS `areaID`,`ospf_networklsa`.`timeStamp` AS `timeStamp`,`ospf_networklsa`.`lsAge` AS `lsAge`,`ospf_networklsa`.`linkStateID` AS `linkStateID`,`ospf_networklsa`.`adRouter` AS `adRouter`,`ospf_networklsa`.`networkMask` AS `networkMask`,`ospf_networklsa`.`attachedRouter` AS `attachedRouter`,`ospf_networklsa`.`isUseful` AS `isUseful` from `ospf_networklsa` where (`ospf_networklsa`.`isUseful` = 1);

-- ----------------------------
-- View structure for `view_ospf_routerlsa`
-- ----------------------------
DROP VIEW IF EXISTS `view_ospf_routerlsa`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ospf_routerlsa` AS select `ospf_routerlsa`.`id` AS `id`,`ospf_routerlsa`.`asNum` AS `asNum`,`ospf_routerlsa`.`routerID` AS `routerID`,`ospf_routerlsa`.`areaID` AS `areaID`,`ospf_routerlsa`.`timeStamp` AS `timeStamp`,`ospf_routerlsa`.`lsAge` AS `lsAge`,`ospf_routerlsa`.`linkStateID` AS `linkStateID`,`ospf_routerlsa`.`adRouter` AS `adRouter`,`ospf_routerlsa`.`zeroVEB` AS `zeroVEB`,`ospf_routerlsa`.`linkID` AS `linkID`,`ospf_routerlsa`.`linkData` AS `linkData`,`ospf_routerlsa`.`linkType` AS `linkType`,`ospf_routerlsa`.`metric` AS `metric`,`ospf_routerlsa`.`isUseful` AS `isUseful` from `ospf_routerlsa` where (`ospf_routerlsa`.`isUseful` = 1);

-- ----------------------------
-- View structure for `view_ospf_router_info`
-- ----------------------------
DROP VIEW IF EXISTS `view_ospf_router_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ospf_router_info` AS select `ospf_router_info`.`id` AS `id`,`ospf_router_info`.`as_num` AS `as_num`,`ospf_router_info`.`router_id` AS `router_id`,`ospf_router_info`.`router_type` AS `router_type`,`ospf_router_info`.`create_time` AS `create_time`,`ospf_router_info`.`end_time` AS `end_time` from `ospf_router_info` where (`ospf_router_info`.`end_time` = 9999999999);

-- ----------------------------
-- View structure for `view_ospf_summarylsa`
-- ----------------------------
DROP VIEW IF EXISTS `view_ospf_summarylsa`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ospf_summarylsa` AS select `ospf_summarylsa`.`id` AS `id`,`ospf_summarylsa`.`asNum` AS `asNum`,`ospf_summarylsa`.`routerID` AS `routerID`,`ospf_summarylsa`.`areaID` AS `areaID`,`ospf_summarylsa`.`timeStamp` AS `timeStamp`,`ospf_summarylsa`.`lsAge` AS `lsAge`,`ospf_summarylsa`.`lsaType` AS `lsaType`,`ospf_summarylsa`.`linkStateID` AS `linkStateID`,`ospf_summarylsa`.`adRouter` AS `adRouter`,`ospf_summarylsa`.`networkMask` AS `networkMask`,`ospf_summarylsa`.`metric` AS `metric`,`ospf_summarylsa`.`isUseful` AS `isUseful` from `ospf_summarylsa` where (`ospf_summarylsa`.`isUseful` = 1);

-- ----------------------------
-- View structure for `view_warning`
-- ----------------------------
DROP VIEW IF EXISTS `view_warning`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_warning` AS select `warning`.`id` AS `id`,`warning`.`code` AS `code`,`warning`.`parse_time` AS `parse_time`,`warning`.`snmp_time` AS `snmp_time`,`warning`.`text_params` AS `text_params`,`warning`.`relate_id` AS `relate_id`,`warning`.`solved` AS `solved`,`warning`.`timestamp` AS `timestamp` from `warning` where (`warning`.`solved` = 0);
