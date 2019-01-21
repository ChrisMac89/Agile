# Sequel Pro dump
# Version 1630
# http://code.google.com/p/sequel-pro
#
# Host: 127.0.0.1 (MySQL 5.1.37)
# Database: Group2Agle
# Generation Time: 2010-01-14 14:44:38 +0000
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `18agileteam2db`;

CREATE DATABASE `18agileteam2db`;

USE `18agileteam2db`;

DROP TABLE IF EXISTS `Login`;

CREATE TABLE `login` (
`loginId` int(10) UNIQUE auto_increment, 
`staffID` char(255),
`password` varchar(255),
PRIMARY KEY (`loginId`));

insert into login (staffID, password) values ('11111111', '123456');

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
`id` INT(10) Unique AUTO_INCREMENT,
`recipientId` int (10),
`senderId` int(10),
`message`  text,
`response` text,
Primary key (`id`));

insert into comments (recipientId, senderId, message, response) values ('11111111', '123456', 'this is a test', 'this is a testthis is a testthis is a testthis is a test');

CREATE TABLE `exam`(
`pdf` varchar(255),
`doc` varchar(255),
`exam` varchar(255),
`solution` varchar(255),
`resitSolution` varchar(255));






