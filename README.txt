This is a software to analyze network topology based on the OSPF and BGP protocol. It uses Quagga to realize the function of message collection.

The RouterAnaly.rar is the source packages.
quagga-11-6.rar is the source packages of virtual routers.
ospf-message-format.docx is the new message format.
rtxpert(2014-01-03).sql is sql file.

(2013-03-14)新增SNMP上报模块，解决程序运行时部分Bug
(2013-03-18)新增BGP信息添加方式，同时增加BGP链接信息模块
(2013-04-10)新增启动数据库连接检测功能，去掉命令行功能
(2013-04-20)新增广播网链路告警功能，没有完善
(2013-05-20)简单的做个备份而已
(2013-05-21)新增过滤功能RouterLSA和NetWorkLSA功能，完善广播网链路新增告警，完善数据库存储异常处理，完善路由器30分钟洪泛功能模块。。
(2013-09-12)包含链路丢失检测，还没有数据同步功能，其他告警功能也没有。
(2013-11-18)包含链路异常、路由器异常、配置异常、数据同步功能，流量汇集功能待测
(2014-01-21)测试流量汇集，完善批量存储数据。