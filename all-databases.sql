/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_views_hierarchy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`,`parentId`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compoundEventDetectors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xid` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `alarmLevel` int(11) NOT NULL,
  `returnToNormal` char(1) NOT NULL,
  `disabled` char(1) NOT NULL,
  `conditionText` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `compoundEventDetectorsUn1` (`xid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataPointUsers` (
  `dataPointId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `permission` int(11) NOT NULL,
  KEY `dataPointUsersFk1` (`dataPointId`),
  KEY `dataPointUsersFk2` (`userId`),
  CONSTRAINT `dataPointUsersFk1` FOREIGN KEY (`dataPointId`) REFERENCES `dataPoints` (`id`),
  CONSTRAINT `dataPointUsersFk2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataPointUsersProfiles` (
  `dataPointId` int(11) NOT NULL,
  `userProfileId` int(11) NOT NULL,
  `permission` int(11) NOT NULL,
  KEY `dataPointUsersProfilesFk1` (`dataPointId`),
  KEY `dataPointUsersProfilesFk2` (`userProfileId`),
  CONSTRAINT `dataPointUsersProfilesFk1` FOREIGN KEY (`dataPointId`) REFERENCES `dataPoints` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dataPointUsersProfilesFk2` FOREIGN KEY (`userProfileId`) REFERENCES `usersProfiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataPoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xid` varchar(50) NOT NULL,
  `dataSourceId` int(11) NOT NULL,
  `data` longblob NOT NULL,
  `pointName` varchar(250) DEFAULT NULL COMMENT 'copy point name from data',
  `plcAlarmLevel` tinyint(8) DEFAULT NULL COMMENT '1 - FAULT, 2 - ALARM',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dataPointsUn1` (`xid`),
  KEY `dataPointsFk1` (`dataSourceId`),
  CONSTRAINT `dataPointsFk1` FOREIGN KEY (`dataSourceId`) REFERENCES `dataSources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `dataPoints` VALUES (1,'DP_820683',1,'¨\Ì\0sr\0\"com.serotonin.mango.vo.DataPointVOˇˇˇˇˇˇˇˇ\0 I\0dataSourceIdI\0dataSourceTypeIdI\0defaultCacheSizeZ\0discardExtremeValuesD\0discardHighLimitD\0discardLowLimitZ\0enabledI\0engineeringUnitsI\0idI\0intervalLoggingPeriodI\0intervalLoggingPeriodTypeI\0intervalLoggingTypeI\0loggingTypeI\0\rpointFolderIdI\0purgePeriodI\0	purgeTypeZ\0settableD\0	toleranceL\0chartColourt\0Ljava/lang/String;L\0\rchartRenderert\0.Lcom/serotonin/mango/view/chart/ChartRenderer;L\0commentst\0Ljava/util/List;L\0dataSourceNameq\0~\0L\0\rdataSourceXidq\0~\0L\0descriptionq\0~\0L\0\ndeviceNameq\0~\0L\0eventDetectorsq\0~\0L\0eventTextRenderert\02Lcom/serotonin/mango/view/event/EventTextRenderer;L\0	lastValuet\01Lcom/serotonin/mango/rt/dataImage/PointValueTime;L\0nameq\0~\0L\0pointLocatort\02Lcom/serotonin/mango/vo/dataSource/PointLocatorVO;L\0textRenderert\0,Lcom/serotonin/mango/view/text/TextRenderer;L\0xidq\0~\0xpwG\0\0\0	\0\rVazao-Entrada\0Virtual-lab\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sr\0+com.serotonin.mango.view.text.PlainRendererˇˇˇˇˇˇˇˇ\0L\0suffixq\0~\0xr\0.com.serotonin.mango.view.text.BaseTextRendererˇˇˇˇˇˇˇˇ\0\0xpw\0\0\0xw\0\0\0\0\0xpsr\0=com.serotonin.mango.vo.dataSource.modbus.ModbusPointLocatorVOˇˇˇˇˇˇˇˇ\0D\0additiveB\0bitI\0modbusDataTypeD\0\nmultiplierI\0offsetI\0rangeI\0\rregisterCountZ\0settableOverrideI\0slaveIdZ\0slaveMonitorZ\0\rsocketMonitorL\0charsetq\0~\0xr\08com.serotonin.mango.vo.dataSource.AbstractPointLocatorVOˇˇˇˇˇˇˇˇ\0\0xpw\0\0\0xw4\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ASCII\0?\0\0\0\0\0\0\0\0\0\0\0\0\0\0xw\0\0\0\0ˇ\Ôˇˇˇˇˇˇ\Ôˇˇˇˇˇˇ\0\0\0U\0\0\0sr\00com.serotonin.mango.view.event.NoneEventRendererˇˇˇˇˇˇˇˇ\0\0xr\04com.serotonin.mango.view.event.BaseEventTextRendererˇˇˇˇˇˇˇˇ\0\0xpw\0\0\0xw\0\0\0xx','Vazao-Entrada',0),(2,'DP_886720',1,'¨\Ì\0sr\0\"com.serotonin.mango.vo.DataPointVOˇˇˇˇˇˇˇˇ\0 I\0dataSourceIdI\0dataSourceTypeIdI\0defaultCacheSizeZ\0discardExtremeValuesD\0discardHighLimitD\0discardLowLimitZ\0enabledI\0engineeringUnitsI\0idI\0intervalLoggingPeriodI\0intervalLoggingPeriodTypeI\0intervalLoggingTypeI\0loggingTypeI\0\rpointFolderIdI\0purgePeriodI\0	purgeTypeZ\0settableD\0	toleranceL\0chartColourt\0Ljava/lang/String;L\0\rchartRenderert\0.Lcom/serotonin/mango/view/chart/ChartRenderer;L\0commentst\0Ljava/util/List;L\0dataSourceNameq\0~\0L\0\rdataSourceXidq\0~\0L\0descriptionq\0~\0L\0\ndeviceNameq\0~\0L\0eventDetectorsq\0~\0L\0eventTextRenderert\02Lcom/serotonin/mango/view/event/EventTextRenderer;L\0	lastValuet\01Lcom/serotonin/mango/rt/dataImage/PointValueTime;L\0nameq\0~\0L\0pointLocatort\02Lcom/serotonin/mango/vo/dataSource/PointLocatorVO;L\0textRenderert\0,Lcom/serotonin/mango/view/text/TextRenderer;L\0xidq\0~\0xpwJ\0\0\0	\0Abertura-Valvula\0Virtual-lab\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sr\0+com.serotonin.mango.view.text.PlainRendererˇˇˇˇˇˇˇˇ\0L\0suffixq\0~\0xr\0.com.serotonin.mango.view.text.BaseTextRendererˇˇˇˇˇˇˇˇ\0\0xpw\0\0\0xw\0\0\0\0\0xpsr\0=com.serotonin.mango.vo.dataSource.modbus.ModbusPointLocatorVOˇˇˇˇˇˇˇˇ\0D\0additiveB\0bitI\0modbusDataTypeD\0\nmultiplierI\0offsetI\0rangeI\0\rregisterCountZ\0settableOverrideI\0slaveIdZ\0slaveMonitorZ\0\rsocketMonitorL\0charsetq\0~\0xr\08com.serotonin.mango.vo.dataSource.AbstractPointLocatorVOˇˇˇˇˇˇˇˇ\0\0xpw\0\0\0xw4\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ASCII?\0\0\0\0\0\0\0\0\0\0\0\0\0\0xw\0\0\0\0ˇ\Ôˇˇˇˇˇˇ\Ôˇˇˇˇˇˇ\0\0\0b\0\0\0sr\00com.serotonin.mango.view.event.NoneEventRendererˇˇˇˇˇˇˇˇ\0\0xr\04com.serotonin.mango.view.event.BaseEventTextRendererˇˇˇˇˇˇˇˇ\0\0xpw\0\0\0xw\0\0\0xx','Abertura-Valvula',0),(3,'DP_731728',1,'¨\Ì\0sr\0\"com.serotonin.mango.vo.DataPointVOˇˇˇˇˇˇˇˇ\0 I\0dataSourceIdI\0dataSourceTypeIdI\0defaultCacheSizeZ\0discardExtremeValuesD\0discardHighLimitD\0discardLowLimitZ\0enabledI\0engineeringUnitsI\0idI\0intervalLoggingPeriodI\0intervalLoggingPeriodTypeI\0intervalLoggingTypeI\0loggingTypeI\0\rpointFolderIdI\0purgePeriodI\0	purgeTypeZ\0settableD\0	toleranceL\0chartColourt\0Ljava/lang/String;L\0\rchartRenderert\0.Lcom/serotonin/mango/view/chart/ChartRenderer;L\0commentst\0Ljava/util/List;L\0dataSourceNameq\0~\0L\0\rdataSourceXidq\0~\0L\0descriptionq\0~\0L\0\ndeviceNameq\0~\0L\0eventDetectorsq\0~\0L\0eventTextRenderert\02Lcom/serotonin/mango/view/event/EventTextRenderer;L\0	lastValuet\01Lcom/serotonin/mango/rt/dataImage/PointValueTime;L\0nameq\0~\0L\0pointLocatort\02Lcom/serotonin/mango/vo/dataSource/PointLocatorVO;L\0textRenderert\0,Lcom/serotonin/mango/view/text/TextRenderer;L\0xidq\0~\0xpwF\0\0\0	\0Nivel-Tanque\0Virtual-lab\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sr\0+com.serotonin.mango.view.text.PlainRendererˇˇˇˇˇˇˇˇ\0L\0suffixq\0~\0xr\0.com.serotonin.mango.view.text.BaseTextRendererˇˇˇˇˇˇˇˇ\0\0xpw\0\0\0xw\0\0\0\0\0xpsr\0=com.serotonin.mango.vo.dataSource.modbus.ModbusPointLocatorVOˇˇˇˇˇˇˇˇ\0D\0additiveB\0bitI\0modbusDataTypeD\0\nmultiplierI\0offsetI\0rangeI\0\rregisterCountZ\0settableOverrideI\0slaveIdZ\0slaveMonitorZ\0\rsocketMonitorL\0charsetq\0~\0xr\08com.serotonin.mango.vo.dataSource.AbstractPointLocatorVOˇˇˇˇˇˇˇˇ\0\0xpw\0\0\0xw4\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ASCII\0?\0\0\0\0\0\0\0\0\0\0\0\0\0\0xw\0\0\0\0ˇ\Ôˇˇˇˇˇˇ\Ôˇˇˇˇˇˇ\0\0\0\0\0\0sr\00com.serotonin.mango.view.event.NoneEventRendererˇˇˇˇˇˇˇˇ\0\0xr\04com.serotonin.mango.view.event.BaseEventTextRendererˇˇˇˇˇˇˇˇ\0\0xpw\0\0\0xw\0\0\0xx','Nivel-Tanque',0),(4,'DP_033822',1,'¨\Ì\0sr\0\"com.serotonin.mango.vo.DataPointVOˇˇˇˇˇˇˇˇ\0 I\0dataSourceIdI\0dataSourceTypeIdI\0defaultCacheSizeZ\0discardExtremeValuesD\0discardHighLimitD\0discardLowLimitZ\0enabledI\0engineeringUnitsI\0idI\0intervalLoggingPeriodI\0intervalLoggingPeriodTypeI\0intervalLoggingTypeI\0loggingTypeI\0\rpointFolderIdI\0purgePeriodI\0	purgeTypeZ\0settableD\0	toleranceL\0chartColourt\0Ljava/lang/String;L\0\rchartRenderert\0.Lcom/serotonin/mango/view/chart/ChartRenderer;L\0commentst\0Ljava/util/List;L\0dataSourceNameq\0~\0L\0\rdataSourceXidq\0~\0L\0descriptionq\0~\0L\0\ndeviceNameq\0~\0L\0eventDetectorsq\0~\0L\0eventTextRenderert\02Lcom/serotonin/mango/view/event/EventTextRenderer;L\0	lastValuet\01Lcom/serotonin/mango/rt/dataImage/PointValueTime;L\0nameq\0~\0L\0pointLocatort\02Lcom/serotonin/mango/vo/dataSource/PointLocatorVO;L\0textRenderert\0,Lcom/serotonin/mango/view/text/TextRenderer;L\0xidq\0~\0xpwE\0\0\0	\0Vazao-Saida\0Virtual-lab\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sr\0+com.serotonin.mango.view.text.PlainRendererˇˇˇˇˇˇˇˇ\0L\0suffixq\0~\0xr\0.com.serotonin.mango.view.text.BaseTextRendererˇˇˇˇˇˇˇˇ\0\0xpw\0\0\0xw\0\0\0\0\0xpsr\0=com.serotonin.mango.vo.dataSource.modbus.ModbusPointLocatorVOˇˇˇˇˇˇˇˇ\0D\0additiveB\0bitI\0modbusDataTypeD\0\nmultiplierI\0offsetI\0rangeI\0\rregisterCountZ\0settableOverrideI\0slaveIdZ\0slaveMonitorZ\0\rsocketMonitorL\0charsetq\0~\0xr\08com.serotonin.mango.vo.dataSource.AbstractPointLocatorVOˇˇˇˇˇˇˇˇ\0\0xpw\0\0\0xw4\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ASCII\0?\0\0\0\0\0\0\0\0\0\0\0\0\0\0xw\0\0\0\0ˇ\Ôˇˇˇˇˇˇ\Ôˇˇˇˇˇˇ\0\0\0U\0\0\0sr\00com.serotonin.mango.view.event.NoneEventRendererˇˇˇˇˇˇˇˇ\0\0xr\04com.serotonin.mango.view.event.BaseEventTextRendererˇˇˇˇˇˇˇˇ\0\0xpw\0\0\0xw\0\0\0xx','Vazao-Saida',0);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataSourceUsers` (
  `dataSourceId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  KEY `dataSourceUsersFk1` (`dataSourceId`),
  KEY `dataSourceUsersFk2` (`userId`),
  CONSTRAINT `dataSourceUsersFk1` FOREIGN KEY (`dataSourceId`) REFERENCES `dataSources` (`id`),
  CONSTRAINT `dataSourceUsersFk2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataSourceUsersProfiles` (
  `dataSourceId` int(11) NOT NULL,
  `userProfileId` int(11) NOT NULL,
  KEY `dataSourceUsersProfilesFk1` (`dataSourceId`),
  KEY `dataSourceUsersProfilesFk2` (`userProfileId`),
  CONSTRAINT `dataSourceUsersProfilesFk1` FOREIGN KEY (`dataSourceId`) REFERENCES `dataSources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dataSourceUsersProfilesFk2` FOREIGN KEY (`userProfileId`) REFERENCES `usersProfiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataSources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xid` varchar(50) NOT NULL,
  `name` varchar(40) NOT NULL,
  `dataSourceType` int(11) NOT NULL,
  `data` longblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dataSourcesUn1` (`xid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `dataSources` VALUES (1,'DS_875460','Virtual-lab',3,'¨\Ì\0sr\0=com.serotonin.mango.vo.dataSource.modbus.ModbusIpDataSourceVOˇˇˇˇˇˇˇˇ\0Z\0createSocketMonitorPointZ\0encapsulatedI\0portL\0hostt\0Ljava/lang/String;L\0\rtransportTypet\0MLcom/serotonin/mango/vo/dataSource/modbus/ModbusIpDataSourceVO$TransportType;xr\0;com.serotonin.mango.vo.dataSource.modbus.ModbusDataSourceVOˇˇˇˇˇˇˇˇ\0\nZ\0contiguousBatchesZ\0createSlaveMonitorPointsI\0maxReadBitCountI\0maxReadRegisterCountI\0maxWriteRegisterCountZ\0quantizeI\0retriesI\0timeoutI\0updatePeriodTypeI\0\rupdatePeriodsxr\0.com.serotonin.mango.vo.dataSource.DataSourceVOˇˇˇˇˇˇˇˇ\0Z\0enabledI\0idL\0alarmLevelst\0Ljava/util/Map;L\0nameq\0~\0L\0statet\0!Lorg/scada_lts/ds/state/IStateDs;L\0xidq\0~\0xpw\0\0\0sr\0java.util.HashMap\⁄¡\√`\—\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0sr\0java.lang.Integer‚†§˜Åá8\0I\0valuexr\0java.lang.NumberÜ¨ïî\‡ã\0\0xp\0\0\0sq\0~\0\n\0\0\0\0sq\0~\0\n\0\0\0q\0~\0\rsq\0~\0\n\0\0\0q\0~\0\rxsr\00org.scada_lts.ds.state.ImportChangeEnableStateDs/èõ\Ët£}\0\0xpxw#\0\0\0\0\0\0\0\0\0\0\0\0Ù\0\0\0\0\0\0\0\–\0\0\0}\0\0\0xxw\0\0\0~r\0Kcom.serotonin.mango.vo.dataSource.modbus.ModbusIpDataSourceVO$TransportType\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0TCPw\0\nvirtuallab\0\0ˆ\0\0x');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventDetectorTemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventHandlers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xid` varchar(50) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `eventTypeId` int(11) NOT NULL,
  `eventTypeRef1` int(11) NOT NULL,
  `eventTypeRef2` int(11) NOT NULL,
  `data` longblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `eventHandlersUn1` (`xid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeId` int(11) NOT NULL,
  `typeRef1` int(11) NOT NULL,
  `typeRef2` int(11) NOT NULL,
  `activeTs` bigint(20) NOT NULL,
  `rtnApplicable` char(1) NOT NULL,
  `rtnTs` bigint(20) DEFAULT NULL,
  `rtnCause` int(11) DEFAULT NULL,
  `alarmLevel` int(11) NOT NULL,
  `message` longtext,
  `ackTs` bigint(20) DEFAULT NULL,
  `ackUserId` int(11) DEFAULT NULL,
  `alternateAckSource` int(11) DEFAULT NULL,
  `shortMessage` longtext,
  PRIMARY KEY (`id`),
  KEY `eventsFk1` (`ackUserId`),
  CONSTRAINT `eventsFk1` FOREIGN KEY (`ackUserId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `events` VALUES (3,4,4,3,1646938831282,'Y',1646945976020,1,1,'event.login|admin|',0,NULL,NULL,'event.login|admin|'),(4,4,1,0,1647111853085,'N',0,0,1,'event.system.startup|',0,NULL,NULL,'event.system.startup|'),(5,4,4,3,1647112757471,'Y',1647458769139,1,1,'event.login|admin|',0,NULL,NULL,'event.login|admin|'),(6,4,1,0,1647300451973,'N',0,0,1,'event.system.startup|',0,NULL,NULL,'event.system.startup|'),(7,4,4,3,1647300489913,'Y',1647458769139,1,1,'event.login|admin|',0,NULL,NULL,'event.login|admin|'),(8,4,1,0,1647377473255,'N',0,0,1,'event.system.startup|',0,NULL,NULL,'event.system.startup|'),(9,4,4,3,1647378000687,'Y',1647458769139,1,1,'event.login|admin|',0,NULL,NULL,'event.login|admin|'),(10,4,1,0,1647432838154,'N',0,0,1,'event.system.startup|',0,NULL,NULL,'event.system.startup|'),(11,4,4,3,1647436796141,'Y',1647458769139,1,1,'event.login|admin|',0,NULL,NULL,'event.login|admin|'),(12,4,1,0,1648066237567,'N',0,0,1,'event.system.startup|',0,NULL,NULL,'event.system.startup|'),(13,4,4,3,1648067002133,'Y',0,0,1,'event.login|admin|',0,NULL,NULL,'event.login|admin|');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flexProjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `xmlConfig` varchar(16384) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `historyalarms` AS SELECT 
 1 AS `activeTime`,
 1 AS `inactiveTime`,
 1 AS `acknowledgeTime`,
 1 AS `level`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `livealarms` AS SELECT 
 1 AS `id`,
 1 AS `activation-time`,
 1 AS `inactivation-time`,
 1 AS `level`,
 1 AS `name`,
 1 AS `dataPointId`*/;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailingListInactive` (
  `mailingListId` int(11) NOT NULL,
  `inactiveInterval` int(11) NOT NULL,
  KEY `mailingListInactiveFk1` (`mailingListId`),
  CONSTRAINT `mailingListInactiveFk1` FOREIGN KEY (`mailingListId`) REFERENCES `mailingLists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailingListMembers` (
  `mailingListId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  KEY `mailingListMembersFk1` (`mailingListId`),
  CONSTRAINT `mailingListMembersFk1` FOREIGN KEY (`mailingListId`) REFERENCES `mailingLists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailingLists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xid` varchar(50) NOT NULL,
  `name` varchar(40) NOT NULL,
  `cronPattern` varchar(100) DEFAULT NULL COMMENT 'cron pattern',
  `collectInactiveEmails` binary(1) DEFAULT '0' COMMENT 'Collect inactive emails and send when activated',
  `dailyLimitSentEmails` binary(1) DEFAULT '0' COMMENT 'Daily limit sent emails',
  `dailyLimitSentEmailsNumber` int(11) DEFAULT '0' COMMENT 'Daily limit sent emails number',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mailingListsUn1` (`xid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenanceEvents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xid` varchar(50) NOT NULL,
  `dataSourceId` int(11) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `alarmLevel` int(11) NOT NULL,
  `scheduleType` int(11) NOT NULL,
  `disabled` char(1) NOT NULL,
  `activeYear` int(11) DEFAULT NULL,
  `activeMonth` int(11) DEFAULT NULL,
  `activeDay` int(11) DEFAULT NULL,
  `activeHour` int(11) DEFAULT NULL,
  `activeMinute` int(11) DEFAULT NULL,
  `activeSecond` int(11) DEFAULT NULL,
  `activeCron` varchar(25) DEFAULT NULL,
  `inactiveYear` int(11) DEFAULT NULL,
  `inactiveMonth` int(11) DEFAULT NULL,
  `inactiveDay` int(11) DEFAULT NULL,
  `inactiveHour` int(11) DEFAULT NULL,
  `inactiveMinute` int(11) DEFAULT NULL,
  `inactiveSecond` int(11) DEFAULT NULL,
  `inactiveCron` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `maintenanceEventsUn1` (`xid`),
  KEY `maintenanceEventsFk1` (`dataSourceId`),
  CONSTRAINT `maintenanceEventsFk1` FOREIGN KEY (`dataSourceId`) REFERENCES `dataSources` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mangoViewUsers` (
  `mangoViewId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessType` int(11) NOT NULL,
  PRIMARY KEY (`mangoViewId`,`userId`),
  KEY `mangoViewUsersFk2` (`userId`),
  CONSTRAINT `mangoViewUsersFk1` FOREIGN KEY (`mangoViewId`) REFERENCES `mangoViews` (`id`) ON DELETE CASCADE,
  CONSTRAINT `mangoViewUsersFk2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mangoViews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `background` varchar(255) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `anonymousAccess` int(11) NOT NULL,
  `data` longblob NOT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `modification_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mangoViewsUn1` (`xid`),
  KEY `mangoViewsFk1` (`userId`),
  CONSTRAINT `mangoViewsFk1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `mangoViews` VALUES (1,'GV_414996','Controle Nivel','uploads/5.png',3,0,'¨\Ì\0sr\0com.serotonin.mango.view.Viewˇˇˇˇˇˇˇˇ\0I\0anonymousAccessI\0idI\0userIdL\0backgroundFilenamet\0Ljava/lang/String;L\0nameq\0~\0L\0viewComponentst\0Ljava/util/List;L\0	viewUsersq\0~\0L\0xidq\0~\0xpw\0\0\0sr\0)java.util.concurrent.CopyOnWriteArrayListx]ü\’F´ê\√\0\0xpw\0\0\0sr\06com.serotonin.mango.view.component.ImageChartComponentˇˇˇˇˇˇˇˇ\0I\0durationPeriodsI\0durationTypeI\0heightI\0widthxr\04com.serotonin.mango.view.component.CompoundComponentˇˇˇˇˇˇˇˇ\0Z\0visibleL\0childrenq\0~\0L\0nameq\0~\0xr\00com.serotonin.mango.view.component.ViewComponentˇˇˇˇˇˇˇˇ\0I\0indexI\0xI\0yI\0zL\0idSuffixq\0~\0L\0styleq\0~\0xpw\0\0\0\0\0\0\0\0\0\0\0\0\0,\0\0\0xwâ\0\0\0\0Vazao\0\0\0\n\0point1\0\0\0\0point2\0\0\0\0point3\0\0\0\0\0point4\0\0\0\0\0point5\0\0\0\0\0point6\0\0\0\0\0point7\0\0\0\0\0point8\0\0\0\0\0point9\0\0\0\0\0point10\0\0\0\0xw\0\0\0\0\0 \0\0,\0\0\0\0\0\0¥xsr\09com.serotonin.mango.view.component.AnalogGraphicComponentˇˇˇˇˇˇˇˇ\0D\0maxD\0minxr\04com.serotonin.mango.view.component.ImageSetComponentˇˇˇˇˇˇˇˇ\0Z\0displayTextL\0imageSett\0#Lcom/serotonin/mango/view/ImageSet;xr\01com.serotonin.mango.view.component.PointComponentˇˇˇˇˇˇˇˇ\0Z\0displayControlsZ\0settableOverrideZ\0validZ\0visibleL\0bkgdColorOverrideq\0~\0L\0	dataPointt\0$Lcom/serotonin/mango/vo/DataPointVO;L\0nameOverrideq\0~\0xq\0~\0w\0\0\0\0\0\0\0\0\0e\0\0\0e\0\0\0xw\0\0\0\0\0\0\0\0\0\0\0xw\0\0\0\0Tanque-Nivel-med\0xw\0\0\0\0\0\0\0\0\0\0\0@(\0\0\0\0\0\0xsq\0~\0\nw\0\0\0\0\0\0\0\0\0J\0\0\0\√\0\0\0xw\0\0\0\0\0\0\0\0\0\0xw\0\0\0\0\nValvula-3D\0xw\0\0\0\0\0\0\0\0\0\0\0@Y\0\0\0\0\0\0xsr\02com.serotonin.mango.view.component.ScriptComponentˇˇˇˇˇˇˇˇ\0L\0scriptq\0~\0xq\0~\0\rw\0\0\0\0\0\0\0\0\0{\0\0\0î\0\0\0xw\0\0\0\0\0\0\0\0\0\0\0xwZ\0\0\0\0Sreturn (\"<b><font size=5 face=Arial color=black> \"+value.toFixed(3) + \"m </font>\");xsq\0~\0w\0\0\0\0\0\0\0\0\0\0\0\0\0©\0\0\0xw\0\0\0\0\0\0\0\0\0\0\0xw]\0\0\0\0Vreturn (\"<b><font size=5 face=Arial color=black> \"+value.toFixed(3) + \"m3/s </font>\");xsq\0~\0w\0\0\0\0\0\0\0\0\0ô\0\0\0\”\0\0\0xw\0\0\0\0\0\0\0\0\0\0\0xw]\0\0\0\0Vreturn (\"<b><font size=5 face=Arial color=black> \"+value.toFixed(3) + \"m3/s </font>\");xsq\0~\0w\0\0\0\0\0\0\0\0\0V\0\0\0ß\0\0\0xw\0\0\0\0\0\0\0\0\0\0xwZ\0\0\0\0Sreturn (\"<b><font size=5 face=Arial color=black> \"+value.toFixed(0) + \"% </font>\");xxx',1024,768,'2022-03-16 16:41:26');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multi_changes_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `viewAndComponentIdentification` varchar(50) NOT NULL,
  `interpretedState` varchar(50) NOT NULL,
  `ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plcAlarms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dataPointId` int(11) NOT NULL,
  `dataPointXid` varchar(50) DEFAULT NULL,
  `dataPointType` varchar(45) DEFAULT NULL,
  `dataPointName` varchar(45) DEFAULT NULL,
  `activeTime` bigint(20) DEFAULT '0',
  `inactiveTime` bigint(20) DEFAULT '0',
  `acknowledgeTime` bigint(20) DEFAULT '0',
  `level` tinyint(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dataPointId` (`dataPointId`,`inactiveTime`),
  CONSTRAINT `plcalarms_ibfk_1` FOREIGN KEY (`dataPointId`) REFERENCES `dataPoints` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pointEventDetectors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xid` varchar(50) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `dataPointId` int(11) NOT NULL,
  `detectorType` int(11) NOT NULL,
  `alarmLevel` int(11) NOT NULL,
  `stateLimit` double DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `durationType` int(11) DEFAULT NULL,
  `binaryState` char(1) DEFAULT NULL,
  `multistateState` int(11) DEFAULT NULL,
  `changeCount` int(11) DEFAULT NULL,
  `alphanumericState` varchar(128) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pointEventDetectorsUn1` (`xid`,`dataPointId`),
  KEY `pointEventDetectorsFk1` (`dataPointId`),
  CONSTRAINT `pointEventDetectorsFk1` FOREIGN KEY (`dataPointId`) REFERENCES `dataPoints` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pointHierarchy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `xid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_xid_point_hierarchy` (`xid`),
  KEY `idx_xid_point_hierarchy` (`xid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pointLinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xid` varchar(50) NOT NULL,
  `sourcePointId` int(11) NOT NULL,
  `targetPointId` int(11) NOT NULL,
  `script` longtext,
  `eventType` int(11) NOT NULL,
  `disabled` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pointLinksUn1` (`xid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publishers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xid` varchar(50) NOT NULL,
  `data` longblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `publishersUn1` (`xid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportInstanceData` (
  `pointValueId` bigint(20) NOT NULL,
  `reportInstancePointId` int(11) NOT NULL,
  `pointValue` double DEFAULT NULL,
  `ts` bigint(20) NOT NULL,
  PRIMARY KEY (`pointValueId`,`reportInstancePointId`),
  KEY `reportInstanceDataFk1` (`reportInstancePointId`),
  CONSTRAINT `reportInstanceDataFk1` FOREIGN KEY (`reportInstancePointId`) REFERENCES `reportInstancePoints` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportInstanceDataAnnotations` (
  `pointValueId` bigint(20) NOT NULL,
  `reportInstancePointId` int(11) NOT NULL,
  `textPointValueShort` varchar(128) DEFAULT NULL,
  `textPointValueLong` longtext,
  `sourceValue` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`pointValueId`,`reportInstancePointId`),
  CONSTRAINT `reportInstanceDataAnnotationsFk1` FOREIGN KEY (`pointValueId`, `reportInstancePointId`) REFERENCES `reportInstanceData` (`pointValueId`, `reportInstancePointId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportInstanceEvents` (
  `eventId` int(11) NOT NULL,
  `reportInstanceId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `typeRef1` int(11) NOT NULL,
  `typeRef2` int(11) NOT NULL,
  `activeTs` bigint(20) NOT NULL,
  `rtnApplicable` char(1) NOT NULL,
  `rtnTs` bigint(20) DEFAULT NULL,
  `rtnCause` int(11) DEFAULT NULL,
  `alarmLevel` int(11) NOT NULL,
  `message` longtext,
  `ackTs` bigint(20) DEFAULT NULL,
  `ackUsername` varchar(40) DEFAULT NULL,
  `alternateAckSource` int(11) DEFAULT NULL,
  PRIMARY KEY (`eventId`,`reportInstanceId`),
  KEY `reportInstanceEventsFk1` (`reportInstanceId`),
  CONSTRAINT `reportInstanceEventsFk1` FOREIGN KEY (`reportInstanceId`) REFERENCES `reportInstances` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportInstancePoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reportInstanceId` int(11) NOT NULL,
  `dataSourceName` varchar(40) NOT NULL,
  `pointName` varchar(100) NOT NULL,
  `dataType` int(11) NOT NULL,
  `startValue` varchar(4096) DEFAULT NULL,
  `textRenderer` longblob,
  `colour` varchar(6) DEFAULT NULL,
  `consolidatedChart` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reportInstancePointsFk1` (`reportInstanceId`),
  CONSTRAINT `reportInstancePointsFk1` FOREIGN KEY (`reportInstanceId`) REFERENCES `reportInstances` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportInstanceUserComments` (
  `reportInstanceId` int(11) NOT NULL,
  `username` varchar(40) DEFAULT NULL,
  `commentType` int(11) NOT NULL,
  `typeKey` int(11) NOT NULL,
  `ts` bigint(20) NOT NULL,
  `commentText` varchar(1024) NOT NULL,
  KEY `reportInstanceUserCommentsFk1` (`reportInstanceId`),
  CONSTRAINT `reportInstanceUserCommentsFk1` FOREIGN KEY (`reportInstanceId`) REFERENCES `reportInstances` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportInstances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `includeEvents` int(11) NOT NULL,
  `includeUserComments` char(1) NOT NULL,
  `reportStartTime` bigint(20) NOT NULL,
  `reportEndTime` bigint(20) NOT NULL,
  `runStartTime` bigint(20) DEFAULT NULL,
  `runEndTime` bigint(20) DEFAULT NULL,
  `recordCount` int(11) DEFAULT NULL,
  `preventPurge` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reportInstancesFk1` (`userId`),
  CONSTRAINT `reportInstancesFk1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `data` longblob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reportsFk1` (`userId`),
  CONSTRAINT `reportsFk1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduledEvents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xid` varchar(50) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `alarmLevel` int(11) NOT NULL,
  `scheduleType` int(11) NOT NULL,
  `returnToNormal` char(1) NOT NULL,
  `disabled` char(1) NOT NULL,
  `activeYear` int(11) DEFAULT NULL,
  `activeMonth` int(11) DEFAULT NULL,
  `activeDay` int(11) DEFAULT NULL,
  `activeHour` int(11) DEFAULT NULL,
  `activeMinute` int(11) DEFAULT NULL,
  `activeSecond` int(11) DEFAULT NULL,
  `activeCron` varchar(25) DEFAULT NULL,
  `inactiveYear` int(11) DEFAULT NULL,
  `inactiveMonth` int(11) DEFAULT NULL,
  `inactiveDay` int(11) DEFAULT NULL,
  `inactiveHour` int(11) DEFAULT NULL,
  `inactiveMinute` int(11) DEFAULT NULL,
  `inactiveSecond` int(11) DEFAULT NULL,
  `inactiveCron` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scheduledEventsUn1` (`xid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduledExecuteInactiveEvent` (
  `mailingListId` int(11) NOT NULL,
  `sourceEventId` int(11) NOT NULL,
  `eventHandlerId` int(11) NOT NULL,
  UNIQUE KEY `mailingListId` (`mailingListId`,`sourceEventId`,`eventHandlerId`),
  KEY `sourceEventId` (`sourceEventId`),
  KEY `eventHandlerId` (`eventHandlerId`),
  CONSTRAINT `scheduledexecuteinactiveevent_ibfk_1` FOREIGN KEY (`sourceEventId`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `scheduledexecuteinactiveevent_ibfk_2` FOREIGN KEY (`mailingListId`) REFERENCES `mailingLists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `scheduledexecuteinactiveevent_ibfk_3` FOREIGN KEY (`eventHandlerId`) REFERENCES `eventHandlers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_version` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `schema_version` VALUES (1,'1','BaseVersion','JDBC','org.scada_lts.dao.migration.mysql.V1__BaseVersion',NULL,'root','2022-03-10 18:59:19',25373,1),(2,'1.1','ViewsHierarchy','JDBC','org.scada_lts.dao.migration.mysql.V1_1__ViewsHierarchy',NULL,'root','2022-03-10 18:59:19',313,1),(3,'1.2','SetViewSizeProperties','JDBC','org.scada_lts.dao.migration.mysql.V1_2__SetViewSizeProperties',NULL,'root','2022-03-10 18:59:19',253,1),(4,'1.3','SetXidPointHierarchy','JDBC','org.scada_lts.dao.migration.mysql.V1_3__SetXidPointHierarchy',NULL,'root','2022-03-10 18:59:20',637,1),(5,'2.0','CMP history','JDBC','org.scada_lts.dao.migration.mysql.V2_0__CMP_history',NULL,'root','2022-03-10 18:59:20',148,1),(6,'2.3','FaultsAndAlarms','JDBC','org.scada_lts.dao.migration.mysql.V2_3__FaultsAndAlarms',NULL,'root','2022-03-10 18:59:22',1461,1),(7,'2.4','','JDBC','org.scada_lts.dao.migration.mysql.V2_4__',NULL,'root','2022-03-10 18:59:22',172,1),(8,'2.5','ScheduledExecuteInactiveEvent','JDBC','org.scada_lts.dao.migration.mysql.V2_5__ScheduledExecuteInactiveEvent',NULL,'root','2022-03-10 18:59:23',1297,1),(9,'2.6','','JDBC','org.scada_lts.dao.migration.mysql.V2_6__',NULL,'root','2022-03-10 18:59:24',237,1),(10,'2.6.5.0','ZIndexForViewComponent','JDBC','org.scada_lts.dao.migration.mysql.V2_6_5_0__ZIndexForViewComponent',NULL,'root','2022-03-10 18:59:24',9,1),(11,'2.7.0.1','UserParameters','JDBC','org.scada_lts.dao.migration.mysql.V2_7_0_1__UserParameters',NULL,'root','2022-03-10 18:59:24',206,1),(12,'2.7.0.2','FixViewPermissions','JDBC','org.scada_lts.dao.migration.mysql.V2_7_0_2__FixViewPermissions',NULL,'root','2022-03-10 18:59:24',48,1),(13,'2.7.0.3','AnonymousUser','JDBC','org.scada_lts.dao.migration.mysql.V2_7_0_3__AnonymousUser',NULL,'root','2022-03-10 18:59:24',14,1),(14,'2.7.0.4','ExtendedDelayForMetaDatapoints','JDBC','org.scada_lts.dao.migration.mysql.V2_7_0_4__ExtendedDelayForMetaDatapoints',NULL,'root','2022-03-10 18:59:24',8,1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scripts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `xid` varchar(50) NOT NULL,
  `name` varchar(40) NOT NULL,
  `script` varchar(16384) NOT NULL,
  `data` longblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scriptsUn1` (`xid`),
  KEY `scriptsFk1` (`userId`),
  CONSTRAINT `scriptsFk1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemSettings` (
  `settingName` varchar(32) NOT NULL,
  `settingValue` longtext,
  PRIMARY KEY (`settingName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `systemSettings` VALUES ('databaseSchemaVersion','2.6.10'),('defaultLoggingType','1'),('eventPurgePeriodType','7'),('filedata.path','~/WEB-INF/filedata'),('futureDateLimitPeriodType','3'),('httpClientProxyUsername',''),('language','pt'),('reportPurgePeriods','1'),('servletContextPath','/Scada-LTS'),('systemEventAlarmLevel1','0'),('systemEventAlarmLevel10','2'),('systemEventAlarmLevel2','0'),('systemEventAlarmLevel3','0'),('systemEventAlarmLevel4','0'),('systemEventAlarmLevel6','2'),('systemEventAlarmLevel7','2'),('systemEventAlarmLevel8','1'),('systemEventAlarmLevel9','2');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatesDetectors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xid` varchar(50) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `detectorType` int(11) NOT NULL,
  `alarmLevel` int(11) NOT NULL,
  `stateLimit` float DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `durationType` int(11) DEFAULT NULL,
  `binaryState` char(1) DEFAULT NULL,
  `multistateState` int(11) DEFAULT NULL,
  `changeCount` int(11) DEFAULT NULL,
  `alphanumericState` varchar(128) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `threshold` double DEFAULT NULL,
  `eventDetectorTemplateId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatesDetectorsFk1` (`eventDetectorTemplateId`),
  CONSTRAINT `templatesDetectorsFk1` FOREIGN KEY (`eventDetectorTemplateId`) REFERENCES `eventDetectorTemplates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userComments` (
  `userId` int(11) DEFAULT NULL,
  `commentType` int(11) NOT NULL,
  `typeKey` int(11) NOT NULL,
  `ts` bigint(20) NOT NULL,
  `commentText` varchar(1024) NOT NULL,
  KEY `userCommentsFk1` (`userId`),
  CONSTRAINT `userCommentsFk1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userEvents` (
  `eventId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `silenced` char(1) NOT NULL,
  PRIMARY KEY (`eventId`,`userId`),
  KEY `userEventsFk2` (`userId`),
  CONSTRAINT `userEventsFk1` FOREIGN KEY (`eventId`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userEventsFk2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `userEvents` VALUES (3,3,'N'),(4,3,'N'),(5,3,'N'),(6,3,'N'),(7,3,'N'),(8,3,'N'),(9,3,'N'),(10,3,'N'),(11,3,'N'),(12,3,'N'),(13,3,'N');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `admin` char(1) NOT NULL,
  `disabled` char(1) NOT NULL,
  `lastLogin` bigint(20) DEFAULT NULL,
  `selectedWatchList` int(11) DEFAULT NULL,
  `homeUrl` varchar(255) DEFAULT NULL,
  `receiveAlarmEmails` int(11) NOT NULL,
  `receiveOwnAuditEvents` char(1) NOT NULL,
  `hideMenu` tinyint(1) DEFAULT '0',
  `theme` varchar(255) DEFAULT 'DEFAULT',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `users` VALUES (3,'admin','0DPiKuNIrrVmD8IUCuw1hQxNqZc=','admin@yourMangoDomain.com','','Y','N',1648067002126,4,'',0,'N',0,'DEFAULT'),(4,'anonymous-user','CpL6syMBNMym6t2YmDJbmyrmeZg=','anonymous@mail.com','','N','Y',NULL,NULL,'',0,'N',0,'DEFAULT');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersProfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xid` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usersProfilesUn1` (`xid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersUsersProfiles` (
  `userProfileId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  KEY `usersUsersProfilesFk1` (`userProfileId`),
  KEY `usersUsersProfilesFk2` (`userId`),
  CONSTRAINT `usersUsersProfilesFk1` FOREIGN KEY (`userProfileId`) REFERENCES `usersProfiles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `usersUsersProfilesFk2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `values_multi_changes_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `multiChangesHistoryId` int(11) DEFAULT NULL,
  `valueId` bigint(20) DEFAULT NULL,
  `value` varchar(50) NOT NULL,
  `dataPointId` int(11) DEFAULT NULL,
  `ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viewUsersProfiles` (
  `viewId` int(11) NOT NULL,
  `userProfileId` int(11) NOT NULL,
  `permission` int(11) NOT NULL,
  KEY `viewUsersProfilesFk1` (`viewId`),
  KEY `viewUsersProfilesFk2` (`userProfileId`),
  CONSTRAINT `viewUsersProfilesFk1` FOREIGN KEY (`viewId`) REFERENCES `mangoViews` (`id`) ON DELETE CASCADE,
  CONSTRAINT `viewUsersProfilesFk2` FOREIGN KEY (`userProfileId`) REFERENCES `usersProfiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `views_category_views_hierarchy` (
  `view_id` int(11) NOT NULL,
  `folder_views_hierarchy_id` int(11) NOT NULL,
  PRIMARY KEY (`view_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchListPoints` (
  `watchListId` int(11) NOT NULL,
  `dataPointId` int(11) NOT NULL,
  `sortOrder` int(11) NOT NULL,
  KEY `watchListPointsFk1` (`watchListId`),
  KEY `watchListPointsFk2` (`dataPointId`),
  CONSTRAINT `watchListPointsFk1` FOREIGN KEY (`watchListId`) REFERENCES `watchLists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `watchListPointsFk2` FOREIGN KEY (`dataPointId`) REFERENCES `dataPoints` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `watchListPoints` VALUES (2,2,0),(2,1,1),(2,4,2),(2,3,3),(3,3,0),(3,1,1),(4,3,0),(4,1,1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchListUsers` (
  `watchListId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessType` int(11) NOT NULL,
  PRIMARY KEY (`watchListId`,`userId`),
  KEY `watchListUsersFk2` (`userId`),
  CONSTRAINT `watchListUsersFk1` FOREIGN KEY (`watchListId`) REFERENCES `watchLists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `watchListUsersFk2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchListUsersProfiles` (
  `watchlistId` int(11) NOT NULL,
  `userProfileId` int(11) NOT NULL,
  `permission` int(11) NOT NULL,
  KEY `watchlistUsersProfilesFk1` (`watchlistId`),
  KEY `watchlistUsersProfilesFk2` (`userProfileId`),
  CONSTRAINT `watchlistUsersProfilesFk1` FOREIGN KEY (`watchlistId`) REFERENCES `watchLists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `watchlistUsersProfilesFk2` FOREIGN KEY (`userProfileId`) REFERENCES `usersProfiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchLists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xid` varchar(50) NOT NULL,
  `userId` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `watchListsUn1` (`xid`),
  KEY `watchListsFk1` (`userId`),
  CONSTRAINT `watchListsFk1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `watchLists` VALUES (2,'WL_204043',3,'View'),(3,'WL_566688',3,'Degrau'),(4,'WL_638833',3,'Controle');
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `func_fromats_date`(ts BIGINT) RETURNS varchar(19) CHARSET utf8
BEGIN  
	IF(ts = 0) THEN
		RETURN ' ';
	END IF;
    
	IF(ts <> 0) THEN
		RETURN substring(from_unixtime(ts/1000),1,19);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `func_gen_xid_point_hierarchy`(id INT(10)) RETURNS varchar(100) CHARSET utf8
BEGIN  RETURN CONCAT("DIR_", UNIX_TIMESTAMP(),"_", id); END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `func_views_hierarchy_add`( a_parentId int(11),a_name CHAR(100)) RETURNS int(11)
BEGIN DECLARE specialty CONDITION FOR SQLSTATE '45000'; IF ( (CHARACTER_LENGTH(a_name)>2) and (CHARACTER_LENGTH(a_name)<100) )  THEN SIGNAL SQLSTATE '01000'; insert into category_views_hierarchy (parentId, name) values ( a_parentId, a_name); return last_insert_id(); ELSE SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='#error.view_hierarchy.add.error1# '; END IF;END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `func_views_hierarchy_folder_delete`( a_id int(11)) RETURNS int(11)
BEGIN DELETE FROM category_views_hierarchy WHERE id=a_id; SET SQL_SAFE_UPDATES = 0;UPDATE category_views_hierarchy SET parentId=-1 WHERE parentId=a_id; return a_id; END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `func_views_hierarchy_move_folder`( a_id INT, a_new_parent_id INT) RETURNS int(11)
BEGIN UPDATE category_views_hierarchy SET parentId=a_new_parent_id WHERE id=a_id; return a_id; END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `func_views_hierarchy_move_view`(a_id INT, a_new_parent_id INT) RETURNS int(11)
BEGIN DECLARE varExistId INT default 0; SELECT view_id into varExistId FROM views_category_views_hierarchy WHERE view_id=a_id; IF varExistId = 0 THEN INSERT INTO views_category_views_hierarchy (view_id, folder_views_hierarchy_id) VALUES (a_id, a_new_parent_id); ELSE UPDATE views_category_views_hierarchy SET folder_views_hierarchy_id=a_new_parent_id WHERE view_id=a_id; END IF; return a_id; END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `func_views_hierarchy_update`( a_id int(11),a_parentId int(11),a_name CHAR(100)) RETURNS int(11)
BEGIN update category_views_hierarchy set parentId=a_parentId, name=a_name where id=a_id; return a_id; END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `func_views_hierarchy_view_delete`( a_id int(11)) RETURNS int(11)
BEGIN DELETE FROM views_category_views_hierarchy WHERE view_id=a_id; return a_id; END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `prc_add_cmp_history`( in a_userId int(11), in a_viewAndCmpId varchar(50), in a_interpretedState varchar(50), in a_ts bigint(20), in a_list_of_values JSON)
begin declare v_usr_name varchar(50); declare v_multiChangesHistoryId int(11); declare v_length bigint unsigned default JSON_LENGTH(a_list_of_values); declare v_index bigint unsigned default 0; declare v_data_point_id int(11); declare v_data_point_value varchar(50); select username into v_usr_name from users where id=a_userId; insert into multi_changes_history ( userId, username, viewAndComponentIdentification, interpretedState, ts ) values ( a_userId, v_usr_name, a_viewAndCmpId, a_interpretedState, a_ts); select last_insert_id() into v_multiChangesHistoryId; while v_index < v_length DO set v_data_point_value = (select JSON_EXTRACT(a_list_of_values, CONCAT('$[', v_index, '].value'))); set v_data_point_id = (select id from dataPoints where xid=(select JSON_EXTRACT(a_list_of_values, CONCAT('$[',v_index,'].xid')))); insert into values_multi_changes_history ( multiChangesHistoryId, value, dataPointId, ts) values ( v_multiChangesHistoryId, v_data_point_value, v_data_point_id, a_ts ); set v_index = v_index + 1; end while; CREATE TEMPORARY TABLE tmp_to_delete select id from multi_changes_history where viewAndComponentIdentification=a_viewAndCmpId order by ts desc limit 10; delete from multi_changes_history where id not in (select id from tmp_to_delete); DROP TEMPORARY TABLE tmp_to_delete; end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `prc_alarms_notify`(IN newDataPointId INT, IN newTs BIGINT, IN newPointValue VARCHAR(45))
BEGIN
	DECLARE PLC_ALARM_LEVEL INT(1);
	DECLARE PRESENT_POINT_VALUE INT(1);
	DECLARE ACTUAL_ID_ROW INT UNSIGNED;
	DECLARE IS_RISING_SLOPE BOOLEAN DEFAULT FALSE;
    DECLARE IS_FALLING_SLOPE BOOLEAN DEFAULT FALSE;

	SELECT plcAlarmLevel INTO PLC_ALARM_LEVEL FROM dataPoints WHERE id = newDataPointId;
    SELECT newPointValue INTO PRESENT_POINT_VALUE;

	IF (PLC_ALARM_LEVEL = 1 OR PLC_ALARM_LEVEl = 2) THEN

		SELECT id INTO ACTUAL_ID_ROW FROM plcAlarms WHERE
			dataPointId = newDataPointId AND
            inactiveTime = 0;

		SET IS_RISING_SLOPE = PRESENT_POINT_VALUE = 1 AND ACTUAL_ID_ROW IS NULL;
        SET IS_FALLING_SLOPE = PRESENT_POINT_VALUE = 0 AND ACTUAL_ID_ROW IS NOT NULL;

        IF (IS_RISING_SLOPE OR IS_FALLING_SLOPE) THEN
			INSERT INTO plcAlarms (
					dataPointId,
					dataPointXid,
					dataPointType,
					dataPointName,
					activeTime,
					inactiveTime,
					acknowledgeTime,
					level
				)
				VALUES (
					newDataPointId,
					(SELECT xid FROM dataPoints WHERE id = newDataPointId),
					PLC_ALARM_LEVEL,
					(SELECT pointName FROM dataPoints WHERE id = newDataPointId),
					newTs,
					0,
					0,
					PLC_ALARM_LEVEL
				) ON DUPLICATE KEY UPDATE
					inactiveTime = newTs;
		END IF;
	END IF;END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `prc_views_category_views_hierarchy_select`()
BEGIN SELECT * FROM views_category_views_hierarchy Order by view_id ASC;END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `prc_views_hierarchy_select`()
BEGIN SELECT * FROM category_views_hierarchy Order by parentId ASC; END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `prc_views_hierarchy_select_node`(a_parent_id INT(11))
BEGIN SELECT * FROM category_views_hierarchy WHERE parentid=a_parent_id; END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50001 DROP VIEW IF EXISTS `historyalarms`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `historyalarms` AS select `func_fromats_date`(`plcalarms`.`activeTime`) AS `activeTime`,`func_fromats_date`(`plcalarms`.`inactiveTime`) AS `inactiveTime`,`func_fromats_date`(`plcalarms`.`acknowledgeTime`) AS `acknowledgeTime`,`plcalarms`.`level` AS `level`,`plcalarms`.`dataPointName` AS `name` from `plcalarms` order by (`plcalarms`.`inactiveTime` = 0) desc,`func_fromats_date`(`plcalarms`.`inactiveTime`) desc,`plcalarms`.`id` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `livealarms`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `livealarms` AS select `plcalarms`.`id` AS `id`,`func_fromats_date`(`plcalarms`.`activeTime`) AS `activation-time`,`func_fromats_date`(`plcalarms`.`inactiveTime`) AS `inactivation-time`,`plcalarms`.`dataPointType` AS `level`,`plcalarms`.`dataPointName` AS `name`,`plcalarms`.`dataPointId` AS `dataPointId` from `plcalarms` where ((`plcalarms`.`acknowledgeTime` = 0) and ((`plcalarms`.`inactiveTime` = 0) or (`plcalarms`.`inactiveTime` > (unix_timestamp((now() - interval 24 hour)) * 1000)))) order by (`plcalarms`.`inactiveTime` = 0) desc,`plcalarms`.`activeTime` desc,`plcalarms`.`inactiveTime` desc,`plcalarms`.`id` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
