-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 10 月 16 日 01:06
-- 服务器版本: 5.5.47
-- PHP 版本: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `study`
--

-- --------------------------------------------------------

--
-- 表的结构 `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `MediaID` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('word','excel','powerpoint','photoshop') NOT NULL,
  `filename` char(20) NOT NULL,
  `title` varchar(30) NOT NULL,
  PRIMARY KEY (`MediaID`),
  UNIQUE KEY `filename` (`filename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=321 ;

--
-- 转存表中的数据 `media`
--

INSERT INTO `media` (`MediaID`, `type`, `filename`, `title`) VALUES
(1, 'word', 'word1.mp4', 'Word发展历史'),
(2, 'word', 'word2.mp4', 'Word基本界面'),
(3, 'word', 'word3.mp4', 'Word新建'),
(4, 'word', 'word4.mp4', 'Word保存'),
(5, 'word', 'word5.mp4', 'Word传播'),
(6, 'word', 'word6.mp4', 'Word选择'),
(7, 'word', 'word7.mp4', 'Word字体1'),
(8, 'word', 'word8.mp4', 'Word字体2'),
(9, 'word', 'word9.mp4', 'Word段落'),
(10, 'word', 'word10.mp4', 'Word照妖镜'),
(11, 'word', 'word11.mp4', 'Word文字方向'),
(12, 'word', 'word12.mp4', 'Word边框底纹'),
(13, 'word', 'word13.mp4', 'Word自定义符号'),
(14, 'word', 'word14.mp4', 'Word查找替换'),
(15, 'word', 'word15.mp4', 'Word综合练习'),
(16, 'word', 'word16.mp4', 'Word样式'),
(17, 'word', 'word17.mp4', 'Word宏'),
(18, 'word', 'word18.mp4', 'Word智能标记'),
(19, 'word', 'word19.mp4', 'Word图片'),
(20, 'word', 'word20.mp4', 'Word图形'),
(21, 'word', 'word21.mp4', 'WordSmartArt'),
(22, 'word', 'word22.mp4', 'Word艺术字'),
(23, 'word', 'word23.mp4', 'Word插入公式'),
(24, 'word', 'word24.mp4', 'Word插入乐谱'),
(25, 'word', 'word25.mp4', 'Word插入图表'),
(26, 'word', 'word26.mp4', 'Word英文'),
(27, 'word', 'word27.mp4', 'Word自动更正'),
(28, 'word', 'word28.mp4', 'Word分栏首字下沉'),
(29, 'word', 'word29.mp4', 'Word中文版式'),
(30, 'word', 'word30.mp4', '图片版式设计'),
(31, 'word', 'word31.mp4', 'Word表格1'),
(32, 'word', 'word32.mp4', 'Word表格2'),
(33, 'word', 'word33.mp4', 'Word表格3'),
(34, 'word', 'word34.mp4', 'Word制表符'),
(35, 'word', 'word35.mp4', 'Word页眉页脚'),
(36, 'word', 'word36.mp4', 'Word分节符'),
(37, 'word', 'word37.mp4', 'Word长文档综合练习1'),
(38, 'word', 'word38.mp4', 'Word长文档综合练习2'),
(39, 'word', 'word39.mp4', 'Word长文档综合练习3'),
(40, 'word', 'word40.mp4', 'Word主控文档'),
(41, 'word', 'word41.mp4', 'Word邮件合并'),
(42, 'word', 'word42.mp4', 'Word审阅与批注'),
(43, 'word', 'word43.mp4', 'Word打印'),
(101, 'excel', 'excel1.mp4', 'excel初步了解'),
(102, 'excel', 'excel2.mp4', '新建excel'),
(103, 'excel', 'excel3.mp4', 'excel视图'),
(104, 'excel', 'excel4.mp4', 'excel的打开和保存'),
(105, 'excel', 'excel5.mp4', 'excel管理'),
(106, 'excel', 'excel6.mp4', 'excel单元格操作'),
(107, 'excel', 'excel7.mp4', 'excel单元格类型'),
(108, 'excel', 'excel8.mp4', 'excel单元格格式'),
(109, 'excel', 'excel9.mp4', 'excel条件格式'),
(110, 'excel', 'excel10.mp4', 'excel查找定位'),
(111, 'excel', 'excel11.mp4', 'excel自定义序列'),
(112, 'excel', 'excel12.mp4', 'excel中插入各种对象'),
(113, 'excel', 'excel13.mp4', 'excel打印'),
(114, 'excel', 'excel14.mp4', 'excel分类汇总'),
(115, 'excel', 'excel15.mp4', 'excel数据筛选'),
(116, 'excel', 'excel16.mp4', 'excel获取外部数据'),
(117, 'excel', 'excel17.mp4', 'excel数据验证及工具'),
(118, 'excel', 'excel18.mp4', 'excel公式1'),
(119, 'excel', 'excel19.mp4', 'excel公式2'),
(120, 'excel', 'excel20.mp4', 'excel函数:求和函数'),
(121, 'excel', 'excel21.mp4', 'excel函数:计数函数'),
(122, 'excel', 'excel22.mp4', 'excel函数:逻辑函数'),
(123, 'excel', 'excel23.mp4', 'excel函数:计数'),
(124, 'excel', 'excel24.mp4', 'excel函数:时间函数'),
(125, 'excel', 'excel25.mp4', 'excel函数:查找'),
(126, 'excel', 'excel26.mp4', 'excel函数:引用函数'),
(127, 'excel', 'excel27.mp4', 'excel函数:数组函数'),
(128, 'excel', 'excel28.mp4', 'excel函数:等级函数1'),
(129, 'excel', 'excel29.mp4', 'excel函数:等级函数2'),
(130, 'excel', 'excel30.mp4', 'excel图表1'),
(131, 'excel', 'excel31.mp4', 'excel图表2'),
(132, 'excel', 'excel32.mp4', 'excel动态图表'),
(133, 'excel', 'excel33.mp4', 'vba_excel自定义函数'),
(134, 'excel', 'excel34.mp4', 'vba_excel函数2 条件语句'),
(135, 'excel', 'excel35.mp4', 'vba_excel函数3 循环语句'),
(136, 'excel', 'excel36.mp4', 'vba_excel函数4 其他内容'),
(137, 'excel', 'excel37.mp4', 'vba_excel函数5 提取超链接'),
(138, 'excel', 'excel38.mp4', 'vba_excel函数6 数据重整'),
(201, 'powerpoint', 'powerpoint1.mp4', '初步介绍'),
(202, 'powerpoint', 'powerpoint2.mp4', '文档的新建和打开'),
(203, 'powerpoint', 'powerpoint3.mp4', '文档的保存和属性'),
(204, 'powerpoint', 'powerpoint4.mp4', '保护文档'),
(205, 'powerpoint', 'powerpoint5.mp4', '幻灯片的操作与主题的应用'),
(206, 'powerpoint', 'powerpoint6.mp4', '大纲'),
(207, 'powerpoint', 'powerpoint7.mp4', '文本框1'),
(208, 'powerpoint', 'powerpoint8.mp4', '文本框2'),
(209, 'powerpoint', 'powerpoint9.mp4', '文本框3'),
(210, 'powerpoint', 'powerpoint10.mp4', '自定义符号和SmartArt'),
(211, 'powerpoint', 'powerpoint11.mp4', '表格'),
(212, 'powerpoint', 'powerpoint12.mp4', '图表'),
(213, 'powerpoint', 'powerpoint13.mp4', '图片与形状'),
(214, 'powerpoint', 'powerpoint14.mp4', '剪贴画'),
(215, 'powerpoint', 'powerpoint15.mp4', 'SmartArt'),
(216, 'powerpoint', 'powerpoint16.mp4', '声音'),
(217, 'powerpoint', 'powerpoint17.mp4', '视频和flash'),
(218, 'powerpoint', 'powerpoint18.mp4', '动画幻灯片切换'),
(219, 'powerpoint', 'powerpoint19.mp4', '自定义动画'),
(220, 'powerpoint', 'powerpoint20.mp4', '动画触发条件'),
(221, 'powerpoint', 'powerpoint21.mp4', '动画计时选项'),
(222, 'powerpoint', 'powerpoint22.mp4', '动画触发器和一般效果选项'),
(223, 'powerpoint', 'powerpoint23.mp4', '动画综合练习和录屏'),
(224, 'powerpoint', 'powerpoint24.mp4', '动作'),
(225, 'powerpoint', 'powerpoint25.mp4', '各种视图'),
(226, 'powerpoint', 'powerpoint26.mp4', '母版和版式'),
(227, 'powerpoint', 'powerpoint27mp4', '幻灯片放映'),
(228, 'powerpoint', 'powerpoint28.mp4', '演示者视图'),
(229, 'powerpoint', 'powerpoint29.mp4', '打印'),
(230, 'powerpoint', 'powerpoint30.mp4', '审阅'),
(231, 'powerpoint', 'powerpoint31.mp4', 'vba1'),
(232, 'powerpoint', 'powerpoint32.mp4', 'vba2_条件'),
(233, 'powerpoint', 'powerpoint33.mp4', 'vba_3 函数与循环'),
(301, 'photoshop', 'photoshop1.mp4', '窗口菜单'),
(302, 'photoshop', 'photoshop2.mp4', '视图菜单'),
(303, 'photoshop', 'photoshop3.mp4', '设置图像、画布大小'),
(304, 'photoshop', 'photoshop4.mp4', '图像的旋转与翻转'),
(305, 'photoshop', 'photoshop5.mp4', '图像的裁剪'),
(306, 'photoshop', 'photoshop6.mp4', '多张图片的拼合'),
(307, 'photoshop', 'photoshop7.mp4', '基础的选区工具'),
(308, 'photoshop', 'photoshop8.mp4', '选区的加加减减'),
(309, 'photoshop', 'photoshop9.mp4', '套出一个选区来'),
(310, 'photoshop', 'photoshop10.mp4', '神奇的魔术棒'),
(311, 'photoshop', 'photoshop11.mp4', '羽化'),
(312, 'photoshop', 'photoshop12.mp4', '选区的综合练习'),
(313, 'photoshop', 'photoshop13.mp4', '图片合成'),
(314, 'photoshop', 'photoshop14.mp4', '选区的描边与填充'),
(315, 'photoshop', 'photoshop15.mp4', '图像的变形'),
(316, 'photoshop', 'photoshop16.mp4', '螺旋结构'),
(317, 'photoshop', 'photoshop17.mp4', '选区操作'),
(318, 'photoshop', 'photoshop18.mp4', '色板'),
(319, 'photoshop', 'photoshop19.mp4', '图案'),
(320, 'photoshop', 'photoshop20.mp4', '渐变');

-- --------------------------------------------------------

--
-- 表的结构 `studytime`
--

CREATE TABLE IF NOT EXISTS `studytime` (
  `UserID` int(11) NOT NULL,
  `MediaID` int(11) NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `studytime`
--

INSERT INTO `studytime` (`UserID`, `MediaID`, `time`) VALUES
(1, 1, 11),
(1, 2, 0);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `displayName` varchar(64) NOT NULL,
  `LastWordID` int(11) NOT NULL,
  `LastExcelID` int(11) NOT NULL,
  `LastPowerpointID` int(11) NOT NULL,
  `LastPhotoshopID` int(11) NOT NULL,
  `LastID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `displayName` (`displayName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`UserID`, `displayName`, `LastWordID`, `LastExcelID`, `LastPowerpointID`, `LastPhotoshopID`, `LastID`) VALUES
(1, 'funny', 1, 0, 0, 0, 1),
(2, 'interesting', 0, 0, 0, 0, 0),
(3, 'Linkin', 0, 0, 0, 0, 0),
(4, 'Lin', 0, 0, 0, 0, 0),
(5, 'll', 0, 0, 0, 0, 0),
(6, 'lii', 0, 0, 0, 0, 0),
(7, 'hhh', 0, 0, 0, 0, 0),
(8, 'qqq', 0, 0, 0, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
