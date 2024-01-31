
Database: kaa
Username : root
password : 

CREATE or replace table `userlevels` (
    `levelid` int(1) UNSIGNED PRIMARY key AUTO_INCREMENT,
    `level` varchar(30) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE or replace table `users` (
    `userid` int(2) UNSIGNED PRIMARY key AUTO_INCREMENT,
    `fullname` varchar(80) DEFAULT '', 
    `username` VARCHAR(30) DEFAULT '',
    `password` VARCHAR(30),
    `levelid` int(1) UNSIGNED,
   	 foreign key (levelid) references userlevels(levelid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE or replace table `programs` (
    `programid` int(2) UNSIGNED PRIMARY key AUTO_INCREMENT,
    `program` varchar(100) DEFAULT '', 
    `duration` VARCHAR(50) DEFAULT '',
    `fees` decimal(12,2) UNSIGNED,
    `description` varchar(500)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE or replace table `staff` (
    `empid` int(2) UNSIGNED PRIMARY key AUTO_INCREMENT,
    `ename` varchar(80) DEFAULT '', 
    `job` VARCHAR(50) DEFAULT '',
    `phone` VARCHAR(30) ,
    `address` varchar(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE or replace table `contactus` (
    `conid` int(4) UNSIGNED PRIMARY key AUTO_INCREMENT,
    `fullname` varchar(80) DEFAULT '', 
    `phone` VARCHAR(30) ,
    `comment` varchar(1000),
     `rdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE or replace table `registrations` (
    `stuid` int(8) UNSIGNED PRIMARY key AUTO_INCREMENT,
    `stuname` varchar(80) DEFAULT '', 
    `nationality` VARCHAR(50) ,
    `phone` varchar(30),
    `programid` int(2) UNSIGNED,
   	 foreign key (programid) references programs(programid),
     `rdate` date
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE or replace table `results` (
    `resid` int(8) UNSIGNED PRIMARY key AUTO_INCREMENT,
    `ayear` varchar(10) DEFAULT '', 
    `semister` VARCHAR(30) ,
    `stuid` int(8),
    `stname` varchar(80),
    `programid` int(2) UNSIGNED,
   	 foreign key (programid) references programs(programid),
    `total` int(3),
    `grade` varchar(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE or replace TABLE `events` (
  `eveid` int(3) UNSIGNED PRIMARY key AUTO_INCREMENT,
  `evedate` date DEFAULT NULL,
  `evetitle` varchar(200) NOT NULL DEFAULT '',
  `evetext` text NOT NULL,
  `eimage` varchar(50) NOT NULL DEFAULT ''
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;












Views :
create or replace view qry_users
as
(select 
    users.userid,
    users.fullname,
	users.username,
    users.password,
    userlevels.levelid,
    userlevels.level
   	from 
    users,userlevels
	where
    users.levelid=userlevels.levelid 
);