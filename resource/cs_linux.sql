-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2020-10-11 16:30:21
-- 服务器版本： 5.5.48-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs_linux`
--
CREATE DATABASE IF NOT EXISTS `cs_linux` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cs_linux`;

-- --------------------------------------------------------

--
-- 表的结构 `app_feedback_bug_info`
--

CREATE TABLE IF NOT EXISTS `app_feedback_bug_info` (
  `bugid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `modifytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `method` varchar(255) NOT NULL,
  `attr` text NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`bugid`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `app_join_info`
--

CREATE TABLE IF NOT EXISTS `app_join_info` (
  `uid` int(4) NOT NULL AUTO_INCREMENT,
  `sno` varchar(8) NOT NULL,
  `passwd` char(40) DEFAULT NULL COMMENT 'sha1(密码)',
  `name` varchar(20) NOT NULL,
  `class` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `sno` (`sno`),
  KEY `status` (`status`),
  KEY `schoolnum` (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `app_join_luck_list`
--

CREATE TABLE IF NOT EXISTS `app_join_luck_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `sno` varchar(8) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `app_join_queue`
--

CREATE TABLE IF NOT EXISTS `app_join_queue` (
  `qid` int(4) NOT NULL AUTO_INCREMENT,
  `uid` int(4) NOT NULL,
  `qstatus` int(4) NOT NULL DEFAULT '0',
  `interviewer` int(4) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `round` int(4) NOT NULL,
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `app_join_record`
--

CREATE TABLE IF NOT EXISTS `app_join_record` (
  `rid` int(4) NOT NULL AUTO_INCREMENT,
  `uid` int(4) NOT NULL,
  `basic_skill` varchar(2000) NOT NULL,
  `extra_skill` varchar(2000) NOT NULL,
  `overall` varchar(2000) NOT NULL,
  `grade` int(5) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `round` int(2) NOT NULL,
  `interviewer` int(4) NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `uid` (`uid`),
  KEY `ugr` (`uid`,`grade`,`round`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `app_lecture_info`
--

CREATE TABLE IF NOT EXISTS `app_lecture_info` (
  `lid` int(4) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `title` varchar(63) NOT NULL,
  `time` datetime NOT NULL,
  `location` varchar(63) NOT NULL,
  `tag` varchar(127) DEFAULT NULL,
  `description` varchar(1023) DEFAULT NULL,
  `slide` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cs_activity`
--

CREATE TABLE IF NOT EXISTS `cs_activity` (
  `mid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL,
  `appid` int(10) UNSIGNED NOT NULL,
  `rdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mdescribe` varchar(256) NOT NULL,
  `action` varchar(50) NOT NULL,
  `message` varchar(10240) NOT NULL,
  `href` varchar(512) NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `cs_user` (`uid`),
  KEY `cs_app` (`appid`)
) ENGINE=MyISAM AUTO_INCREMENT=388 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cs_activity_comment`
--

CREATE TABLE IF NOT EXISTS `cs_activity_comment` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `act_id` int(10) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `content` varchar(256) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=234 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cs_app`
--

CREATE TABLE IF NOT EXISTS `cs_app` (
  `appid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(32) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `attr` text NOT NULL,
  PRIMARY KEY (`appid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cs_mail`
--

CREATE TABLE IF NOT EXISTS `cs_mail` (
  `mid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fromuid` int(10) UNSIGNED NOT NULL DEFAULT '1000',
  `sdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` char(64) NOT NULL,
  `content` text NOT NULL,
  `isdraft` int(1) NOT NULL DEFAULT '0',
  `touid` mediumtext NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=296 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cs_online`
--

CREATE TABLE IF NOT EXISTS `cs_online` (
  `uid` int(10) NOT NULL,
  `time` char(16) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `cs_updata_info`
--

CREATE TABLE IF NOT EXISTS `cs_updata_info` (
  `mid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `appid` int(10) UNSIGNED NOT NULL,
  `rdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mdescribe` varchar(64) NOT NULL,
  `action` int(1) NOT NULL,
  `message` varchar(255) NOT NULL,
  `href` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cs_user`
--

CREATE TABLE IF NOT EXISTS `cs_user` (
  `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(10) NOT NULL,
  `privilege` int(1) NOT NULL DEFAULT '0',
  `password` char(32) NOT NULL,
  `sex` int(1) NOT NULL,
  `phone` char(20) DEFAULT NULL,
  `mail` char(50) NOT NULL,
  `qq` char(12) DEFAULT NULL,
  `wechat` char(32) DEFAULT NULL,
  `blog` char(128) DEFAULT NULL,
  `github` char(128) DEFAULT NULL,
  `native` char(128) DEFAULT NULL,
  `grade` char(4) NOT NULL,
  `major` char(32) NOT NULL,
  `workplace` char(128) DEFAULT NULL,
  `job` char(32) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=1270 DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
