/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : xkjs

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2017-04-18 08:55:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_academy`
-- ----------------------------
DROP TABLE IF EXISTS `t_academy`;
CREATE TABLE `t_academy` (
  `AcademyId` int(11) NOT NULL,
  `AcademyName` varchar(50) NOT NULL,
  PRIMARY KEY (`AcademyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_academy
-- ----------------------------

-- ----------------------------
-- Table structure for `t_applystate`
-- ----------------------------
DROP TABLE IF EXISTS `t_applystate`;
CREATE TABLE `t_applystate` (
  `InApplyStateId` int(11) NOT NULL,
  `InApplyStateName` varchar(50) NOT NULL,
  PRIMARY KEY (`InApplyStateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_applystate
-- ----------------------------

-- ----------------------------
-- Table structure for `t_awards`
-- ----------------------------
DROP TABLE IF EXISTS `t_awards`;
CREATE TABLE `t_awards` (
  `AwardsId` int(11) NOT NULL,
  `AwardsName` varchar(50) NOT NULL,
  PRIMARY KEY (`AwardsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_awards
-- ----------------------------

-- ----------------------------
-- Table structure for `t_class`
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class` (
  `ClassId` int(11) NOT NULL,
  `ClassName` varchar(50) DEFAULT NULL,
  `MajorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ClassId`),
  KEY `t_Class_Major` (`MajorId`),
  CONSTRAINT `t_Class_Major` FOREIGN KEY (`MajorId`) REFERENCES `t_profession` (`MajorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_class
-- ----------------------------

-- ----------------------------
-- Table structure for `t_conimplement`
-- ----------------------------
DROP TABLE IF EXISTS `t_conimplement`;
CREATE TABLE `t_conimplement` (
  `InImplId` int(11) NOT NULL,
  `InArrangeId` int(11) NOT NULL,
  `InImplStartTime` datetime NOT NULL,
  `InImplEndTime` datetime NOT NULL,
  `InImplLocal` varchar(50) NOT NULL,
  PRIMARY KEY (`InImplId`),
  KEY `t_ConImplement_InArrange` (`InArrangeId`),
  CONSTRAINT `t_ConImplement_InArrange` FOREIGN KEY (`InArrangeId`) REFERENCES `t_inconarrange` (`InArrangeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_conimplement
-- ----------------------------

-- ----------------------------
-- Table structure for `t_demo`
-- ----------------------------
DROP TABLE IF EXISTS `t_demo`;
CREATE TABLE `t_demo` (
  `SerialNumber` int(11) NOT NULL,
  `UserName` varchar(11) DEFAULT NULL,
  `ProcessId` int(11) DEFAULT NULL,
  ` NodeId` int(11) DEFAULT NULL,
  ` EndTime` date DEFAULT NULL,
  PRIMARY KEY (`SerialNumber`),
  KEY `t_Demo_Process` (`ProcessId`),
  KEY `t_Demo_Node` (` NodeId`),
  CONSTRAINT `t_Demo_Node` FOREIGN KEY (` NodeId`) REFERENCES `t_node` (`NodeId`),
  CONSTRAINT `t_Demo_Process` FOREIGN KEY (`ProcessId`) REFERENCES `t_process` (`ProcessId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_demo
-- ----------------------------
INSERT INTO `t_demo` VALUES ('1', ' 望门', '1', '1', '2015-02-04');

-- ----------------------------
-- Table structure for `t_group`
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group` (
  `GroupId` int(11) NOT NULL,
  `GroupName` varchar(50) NOT NULL,
  `StudentId` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`GroupId`),
  KEY `t_Group_Student` (`StudentId`),
  CONSTRAINT `t_Group_Student` FOREIGN KEY (`StudentId`) REFERENCES `t_student` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_group
-- ----------------------------

-- ----------------------------
-- Table structure for `t_inbaoxiao`
-- ----------------------------
DROP TABLE IF EXISTS `t_inbaoxiao`;
CREATE TABLE `t_inbaoxiao` (
  `InBaoXiaoId` int(11) NOT NULL,
  `InBudgetId` int(11) NOT NULL,
  `InBaoXiaoExplain` varchar(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `InBaoXiaoTime` datetime NOT NULL,
  PRIMARY KEY (`InBaoXiaoId`),
  KEY `t_InBaoXiao_InBudget` (`InBudgetId`),
  KEY `t_BaoXiao_User` (`UserId`),
  CONSTRAINT `t_BaoXiao_User` FOREIGN KEY (`UserId`) REFERENCES `t_user` (`UserId`),
  CONSTRAINT `t_InBaoXiao_InBudget` FOREIGN KEY (`InBudgetId`) REFERENCES `t_inbudget` (`InBudgetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_inbaoxiao
-- ----------------------------

-- ----------------------------
-- Table structure for `t_inbudget`
-- ----------------------------
DROP TABLE IF EXISTS `t_inbudget`;
CREATE TABLE `t_inbudget` (
  `InBudgetId` int(11) NOT NULL,
  `InBudgetTitle` varchar(50) NOT NULL,
  `InBudgetIntro` varchar(50) NOT NULL,
  `InBudgetTime` datetime NOT NULL,
  `InBudgetMoney` varchar(50) NOT NULL,
  `InPlanId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  PRIMARY KEY (`InBudgetId`),
  KEY `t_InBudget_InPlan` (`InPlanId`),
  KEY `t_InBudget_User` (`UserId`),
  CONSTRAINT `t_InBudget_InPlan` FOREIGN KEY (`InPlanId`) REFERENCES `t_inconplan` (`InPlanId`),
  CONSTRAINT `t_InBudget_User` FOREIGN KEY (`UserId`) REFERENCES `t_user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_inbudget
-- ----------------------------

-- ----------------------------
-- Table structure for `t_inconapply`
-- ----------------------------
DROP TABLE IF EXISTS `t_inconapply`;
CREATE TABLE `t_inconapply` (
  `InApplyId` int(11) NOT NULL,
  `TeacherId` int(11) NOT NULL,
  `InApplyTime` datetime NOT NULL,
  `InContestStartTime` datetime NOT NULL,
  `InContestEndTime` datetime NOT NULL,
  `InApplyLocal` varchar(50) NOT NULL,
  `InContestName` varchar(50) NOT NULL,
  `InContestIntroduce` varchar(255) NOT NULL,
  `InApplyStateId` int(11) DEFAULT NULL,
  `Professional` int(11) DEFAULT NULL,
  `InEntryForm` int(11) DEFAULT NULL,
  PRIMARY KEY (`InApplyId`),
  KEY `t_InConApply_Teacher` (`TeacherId`),
  KEY `t_InConApply_InApplyState` (`InApplyStateId`),
  CONSTRAINT `t_InConApply_InApplyState` FOREIGN KEY (`InApplyStateId`) REFERENCES `t_applystate` (`InApplyStateId`),
  CONSTRAINT `t_InConApply_Teacher` FOREIGN KEY (`TeacherId`) REFERENCES `t_teacher` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_inconapply
-- ----------------------------

-- ----------------------------
-- Table structure for `t_inconarrange`
-- ----------------------------
DROP TABLE IF EXISTS `t_inconarrange`;
CREATE TABLE `t_inconarrange` (
  `InArrangeId` int(11) NOT NULL,
  `InArrangeName` varchar(50) NOT NULL,
  `InArrangeContent` text,
  `InPlanId` int(11) NOT NULL,
  `InArrangeStartTime` datetime NOT NULL,
  `InArrangeEndTime` datetime NOT NULL,
  `InArrangeLocal` varchar(50) NOT NULL,
  PRIMARY KEY (`InArrangeId`),
  KEY `t_InConArrange_InPlan` (`InPlanId`),
  CONSTRAINT `t_InConArrange_InPlan` FOREIGN KEY (`InPlanId`) REFERENCES `t_inconplan` (`InPlanId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_inconarrange
-- ----------------------------

-- ----------------------------
-- Table structure for `t_inconplan`
-- ----------------------------
DROP TABLE IF EXISTS `t_inconplan`;
CREATE TABLE `t_inconplan` (
  `InPlanId` int(11) NOT NULL,
  `InConId` int(11) NOT NULL,
  `InPlanName` varchar(50) NOT NULL,
  `InConIntro` varchar(255) NOT NULL,
  `InPlanTime` datetime NOT NULL,
  `InPlanStartTime` datetime NOT NULL,
  `InPlanEndTime` datetime NOT NULL,
  `InPlanLocal` varchar(50) NOT NULL,
  `Professional` int(11) DEFAULT NULL,
  `InEntryForm` int(11) DEFAULT NULL,
  `InApplyStateId` int(11) DEFAULT NULL,
  PRIMARY KEY (`InPlanId`),
  KEY `t_InConPlan_InContest` (`InConId`),
  KEY `t_InConPlan_InApplyState` (`InApplyStateId`),
  CONSTRAINT `t_InConPlan_InApplyState` FOREIGN KEY (`InApplyStateId`) REFERENCES `t_applystate` (`InApplyStateId`),
  CONSTRAINT `t_InConPlan_InContest` FOREIGN KEY (`InConId`) REFERENCES `t_incontest` (`InContestId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_inconplan
-- ----------------------------

-- ----------------------------
-- Table structure for `t_incontest`
-- ----------------------------
DROP TABLE IF EXISTS `t_incontest`;
CREATE TABLE `t_incontest` (
  `InContestId` int(11) NOT NULL,
  `InApplyId` int(11) NOT NULL,
  PRIMARY KEY (`InContestId`),
  KEY `t_InContest_InApply` (`InApplyId`),
  CONSTRAINT `t_InContest_InApply` FOREIGN KEY (`InApplyId`) REFERENCES `t_inconapply` (`InApplyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_incontest
-- ----------------------------

-- ----------------------------
-- Table structure for `t_inenroll`
-- ----------------------------
DROP TABLE IF EXISTS `t_inenroll`;
CREATE TABLE `t_inenroll` (
  `InEnrollId` int(11) NOT NULL,
  `StudentId` int(11) NOT NULL,
  `InImplId` int(11) NOT NULL,
  `GroupId` int(11) NOT NULL,
  `InPrizeId` int(11) NOT NULL,
  `Professional` int(11) NOT NULL,
  `InEnrollState` int(11) NOT NULL,
  PRIMARY KEY (`InEnrollId`),
  KEY `t_InEnroll_Student` (`StudentId`),
  KEY `t_InEnroll_InImpl` (`InImplId`),
  KEY `t_InEnroll_Group` (`GroupId`),
  KEY `t_InEnroll_InPrize` (`InPrizeId`),
  CONSTRAINT `t_InEnroll_Group` FOREIGN KEY (`GroupId`) REFERENCES `t_group` (`GroupId`),
  CONSTRAINT `t_InEnroll_InImpl` FOREIGN KEY (`InImplId`) REFERENCES `t_conimplement` (`InImplId`),
  CONSTRAINT `t_InEnroll_InPrize` FOREIGN KEY (`InPrizeId`) REFERENCES `t_inprize` (`InPrizeId`),
  CONSTRAINT `t_InEnroll_Student` FOREIGN KEY (`StudentId`) REFERENCES `t_student` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_inenroll
-- ----------------------------

-- ----------------------------
-- Table structure for `t_inleader`
-- ----------------------------
DROP TABLE IF EXISTS `t_inleader`;
CREATE TABLE `t_inleader` (
  `InApplyId` int(11) NOT NULL,
  `TeacherId` int(11) NOT NULL,
  PRIMARY KEY (`InApplyId`),
  KEY `t_InLeader_Teacher` (`TeacherId`),
  CONSTRAINT `t_InLeader_Teacher` FOREIGN KEY (`TeacherId`) REFERENCES `t_teacher` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_inleader
-- ----------------------------

-- ----------------------------
-- Table structure for `t_inprize`
-- ----------------------------
DROP TABLE IF EXISTS `t_inprize`;
CREATE TABLE `t_inprize` (
  `InPrizeId` int(11) NOT NULL,
  `InImplId` int(11) NOT NULL,
  `AwardsId` int(11) NOT NULL,
  PRIMARY KEY (`InPrizeId`),
  KEY `t_InPrize_InImpl` (`InImplId`),
  KEY `t_InPrize_Awards` (`AwardsId`),
  CONSTRAINT `t_InPrize_Awards` FOREIGN KEY (`AwardsId`) REFERENCES `t_awards` (`AwardsId`),
  CONSTRAINT `t_InPrize_InImpl` FOREIGN KEY (`InImplId`) REFERENCES `t_conimplement` (`InImplId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_inprize
-- ----------------------------

-- ----------------------------
-- Table structure for `t_news`
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `NewsId` int(11) NOT NULL,
  `NewsTitle` varchar(50) NOT NULL,
  `NewsContent` text NOT NULL,
  `NewsTime` datetime NOT NULL,
  `NewsTypeId` int(11) NOT NULL,
  PRIMARY KEY (`NewsId`),
  KEY `t_News_NewsType` (`NewsTypeId`),
  CONSTRAINT `t_News_NewsType` FOREIGN KEY (`NewsTypeId`) REFERENCES `t_newstype` (`NewsTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------

-- ----------------------------
-- Table structure for `t_newstype`
-- ----------------------------
DROP TABLE IF EXISTS `t_newstype`;
CREATE TABLE `t_newstype` (
  `NewsTypeId` int(11) NOT NULL,
  `NewsTypeName` varchar(11) NOT NULL,
  PRIMARY KEY (`NewsTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_newstype
-- ----------------------------

-- ----------------------------
-- Table structure for `t_node`
-- ----------------------------
DROP TABLE IF EXISTS `t_node`;
CREATE TABLE `t_node` (
  `NodeId` int(11) NOT NULL,
  `NodeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NodeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_node
-- ----------------------------
INSERT INTO `t_node` VALUES ('1', '好');
INSERT INTO `t_node` VALUES ('2', '坏');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `NoticeId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `NoticeTime` datetime NOT NULL,
  `NoticeTitle` varchar(50) NOT NULL,
  `NoticeContent` text NOT NULL,
  `NoticeIsOrNotReply` int(11) NOT NULL,
  `NoticeStateId` int(11) NOT NULL,
  `NoticeAcceptTpyeId` int(11) NOT NULL,
  `NoticeOverTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`NoticeId`),
  KEY `t_Notice_NoticeAcceptType` (`NoticeAcceptTpyeId`),
  KEY `t_Notice_NoticeState` (`NoticeStateId`),
  KEY `t_Notice_User` (`UserId`),
  CONSTRAINT `t_Notice_NoticeAcceptType` FOREIGN KEY (`NoticeAcceptTpyeId`) REFERENCES `t_noticeaccepttype` (`NoticeAcceptTypeId`),
  CONSTRAINT `t_Notice_NoticeState` FOREIGN KEY (`NoticeStateId`) REFERENCES `t_noticestate` (`NoticeStateId`),
  CONSTRAINT `t_Notice_User` FOREIGN KEY (`UserId`) REFERENCES `t_user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `t_noticeaccept`
-- ----------------------------
DROP TABLE IF EXISTS `t_noticeaccept`;
CREATE TABLE `t_noticeaccept` (
  `NoticeAcceptId` int(11) NOT NULL,
  `NoticeId` int(11) NOT NULL,
  `NoticeAcceptGroupId` int(11) NOT NULL,
  `NoticeAcceptTypeId` int(11) NOT NULL,
  PRIMARY KEY (`NoticeAcceptId`),
  KEY `t_NoticeAccept_Notice` (`NoticeId`),
  KEY `t_NoticeAccept_NoticeAcceptType` (`NoticeAcceptTypeId`),
  CONSTRAINT `t_NoticeAccept_Notice` FOREIGN KEY (`NoticeId`) REFERENCES `t_notice` (`NoticeId`),
  CONSTRAINT `t_NoticeAccept_NoticeAcceptType` FOREIGN KEY (`NoticeAcceptTypeId`) REFERENCES `t_noticeaccepttype` (`NoticeAcceptTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_noticeaccept
-- ----------------------------

-- ----------------------------
-- Table structure for `t_noticeaccepttype`
-- ----------------------------
DROP TABLE IF EXISTS `t_noticeaccepttype`;
CREATE TABLE `t_noticeaccepttype` (
  `NoticeAcceptTypeId` int(11) NOT NULL,
  `NoticeAcceptTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`NoticeAcceptTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_noticeaccepttype
-- ----------------------------

-- ----------------------------
-- Table structure for `t_noticestate`
-- ----------------------------
DROP TABLE IF EXISTS `t_noticestate`;
CREATE TABLE `t_noticestate` (
  `NoticeStateId` int(11) NOT NULL,
  `NoticeStateName` varchar(50) NOT NULL,
  PRIMARY KEY (`NoticeStateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_noticestate
-- ----------------------------

-- ----------------------------
-- Table structure for `t_process`
-- ----------------------------
DROP TABLE IF EXISTS `t_process`;
CREATE TABLE `t_process` (
  `ProcessId` int(11) NOT NULL,
  `ProcessName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ProcessId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_process
-- ----------------------------
INSERT INTO `t_process` VALUES ('1', ' 好');
INSERT INTO `t_process` VALUES ('2', ' 坏');

-- ----------------------------
-- Table structure for `t_profession`
-- ----------------------------
DROP TABLE IF EXISTS `t_profession`;
CREATE TABLE `t_profession` (
  `MajorId` int(11) NOT NULL,
  `MajorName` varchar(50) DEFAULT NULL,
  ` AcademyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`MajorId`),
  KEY `t_Profession_Academy` (` AcademyId`),
  CONSTRAINT `t_Profession_Academy` FOREIGN KEY (` AcademyId`) REFERENCES `t_academy` (`AcademyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_profession
-- ----------------------------

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `RoleId` int(11) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------

-- ----------------------------
-- Table structure for `t_student`
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `UserId` int(11) NOT NULL,
  `StudentCode` varchar(50) NOT NULL,
  `ClassId` int(11) NOT NULL,
  `AcademyId` int(11) NOT NULL,
  PRIMARY KEY (`UserId`),
  KEY `t_Student_Class` (`ClassId`),
  KEY `t_Student_Academy` (`AcademyId`),
  CONSTRAINT `t_Student_Academy` FOREIGN KEY (`AcademyId`) REFERENCES `t_academy` (`AcademyId`),
  CONSTRAINT `t_Student_Class` FOREIGN KEY (`ClassId`) REFERENCES `t_class` (`ClassId`),
  CONSTRAINT `t_Student_User` FOREIGN KEY (`UserId`) REFERENCES `t_user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------

-- ----------------------------
-- Table structure for `t_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `UserId` int(11) NOT NULL,
  `TeacherCode` varchar(50) NOT NULL,
  `AcademyId` int(11) NOT NULL,
  PRIMARY KEY (`UserId`),
  KEY `t_Teacher_Academy` (`AcademyId`),
  CONSTRAINT `t_Teacher_Academy` FOREIGN KEY (`AcademyId`) REFERENCES `t_academy` (`AcademyId`),
  CONSTRAINT `t_Teacher_User` FOREIGN KEY (`UserId`) REFERENCES `t_user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `UserId` int(11) NOT NULL,
  `UserAccount` varchar(50) NOT NULL,
  `UserNickName` varchar(50) DEFAULT NULL,
  `UserPassword` varchar(50) NOT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `UserGender` int(11) NOT NULL,
  `UserBirthday` datetime DEFAULT NULL,
  `UserWeiXin` varchar(50) DEFAULT NULL,
  `UserPhone` varchar(50) DEFAULT NULL,
  `UserPhotoPath` varchar(50) DEFAULT NULL,
  `UserEmail` varchar(50) DEFAULT NULL,
  `UserQq` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `UserId` int(11) NOT NULL,
  `RoleId` int(11) NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `t_User_Role_Role` (`RoleId`),
  CONSTRAINT `t_User_Role_Role` FOREIGN KEY (`RoleId`) REFERENCES `t_role` (`RoleId`),
  CONSTRAINT `t_User_Role_User` FOREIGN KEY (`UserId`) REFERENCES `t_user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------

-- ----------------------------
-- View structure for `v_demo`
-- ----------------------------
DROP VIEW IF EXISTS `v_demo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_demo` AS select `t_demo`.`SerialNumber` AS `SerialNumber`,`t_demo`.`UserName` AS `UserName`,`t_demo`.` EndTime` AS `EndTime`,`t_process`.`ProcessId` AS `ProcessId`,`t_process`.`ProcessName` AS `ProcessName`,`t_node`.`NodeId` AS `NodeId`,`t_node`.`NodeName` AS `NodeName` from ((`t_demo` join `t_node` on((`t_node`.`NodeId` = `t_demo`.` NodeId`))) join `t_process` on((`t_process`.`ProcessId` = `t_demo`.`ProcessId`))) ;
