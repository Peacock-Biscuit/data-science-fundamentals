-- CS4400: Introduction to Database Systems
-- Covid Testing Site Datebase Create Queries

DROP DATABASE IF EXISTS covidtest_fall2020;
CREATE DATABASE IF NOT EXISTS covidtest_fall2020;
USE covidtest_fall2020;

DROP TABLE IF EXISTS USER;
CREATE TABLE USER(
    username VARCHAR(40) NOT NULL,
    user_password VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL,
    fname VARCHAR(40) NOT NULL,
    lname VARCHAR(40) NOT NULL,
    PRIMARY KEY (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS LOCATION;
CREATE TABLE LOCATION(
	location_name varchar(40) NOT NULL,
    PRIMARY KEY (location_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS STUDENT;
CREATE TABLE STUDENT(
    student_username VARCHAR(40) NOT NULL,
    housing_type VARCHAR(20) NOT NULL,
    location VARCHAR(40) NOT NULL,
    PRIMARY KEY (student_username),
    FOREIGN KEY (student_username) REFERENCES USER(username),
    FOREIGN KEY (location) REFERENCES LOCATION(location_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS ADMINISTRATOR;
CREATE TABLE ADMINISTRATOR(
    admin_username VARCHAR(40) NOT NULL,
    PRIMARY KEY (admin_username),
    FOREIGN KEY (admin_username) REFERENCES USER(username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS EMPLOYEE;
CREATE TABLE EMPLOYEE(
    emp_username VARCHAR(40) NOT NULL,
    phone_num VARCHAR(10) NOT NULL,
    PRIMARY KEY (emp_username),
    FOREIGN KEY (emp_username) REFERENCES USER(username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS LABTECH;
CREATE TABLE LABTECH(
    labtech_username VARCHAR(40) NOT NULL,
    PRIMARY KEY (labtech_username),
    FOREIGN KEY (labtech_username) REFERENCES EMPLOYEE(emp_username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS SITETESTER;
CREATE TABLE SITETESTER(
	sitetester_username varchar(20) NOT NULL,
    PRIMARY KEY (sitetester_username),
    FOREIGN KEY (sitetester_username) REFERENCES EMPLOYEE(emp_username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS SITE;
CREATE TABLE SITE(
	site_name varchar(40) NOT NULL,
    street varchar(40) NOT NULL,
    city varchar(40) NOT NULL,
	state char(2) NOT NULL,
    zip char(5) NOT NULL,
    location varchar(40) NOT NULL,
    PRIMARY KEY (site_name),
    FOREIGN KEY (location) REFERENCES LOCATION(location_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS WORKING_AT;
CREATE TABLE WORKING_AT(
	username varchar(20) NOT NULL,
    site varchar(40) NOT NULL,
    PRIMARY KEY (username, site),
    FOREIGN KEY (username) REFERENCES SITETESTER(sitetester_username),
    FOREIGN KEY (site) REFERENCES SITE(site_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS POOL;
CREATE TABLE POOL(
	pool_id varchar(10) NOT NULL,
    pool_status varchar(20) NOT NULL,
    process_date date,
    processed_by varchar(40),
    PRIMARY KEY (pool_id),
    FOREIGN KEY (processed_by) REFERENCES LABTECH(labtech_username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS APPOINTMENT;
CREATE TABLE APPOINTMENT(
  username varchar(40),
  site_name varchar(40) NOT NULL,
  appt_date date NOT NULL,
  appt_time time NOT NULL,
  PRIMARY KEY (site_name, appt_date, appt_time),
  FOREIGN KEY (username) REFERENCES STUDENT(student_username),
  FOREIGN KEY (site_name) REFERENCES SITE(site_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS TEST;
CREATE TABLE TEST(
	test_id varchar(7) NOT NULL,
    test_status varchar(10) NOT NULL,
    pool_id varchar(10),
    appt_site varchar(40) NOT NULL,
    appt_date date NOT NULL,
    appt_time time NOT NULL,
	PRIMARY KEY (test_id),
    FOREIGN KEY (pool_id) REFERENCES POOL(pool_id),
    FOREIGN KEY (appt_site, appt_date, appt_time) REFERENCES APPOINTMENT(site_name, appt_date, appt_time)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO USER
VALUES
('jlionel666','password1','jlionel666@gatech.edu','John','Lionel'),
('mmoss7','password2','mmoss7@gatech.edu','Mark','Moss'),
('lchen27','password3','lchen27@gatech.edu','Liang','Chen'),
('jhilborn97','password4','jhilborn97@gatech.edu','Jack','Hilborn'),
('jhilborn98','password5','jhilborn98@gatech.edu','Jake','Hilborn'),
('ygao10','password6','ygao10@gatech.edu','Yuan','Gao'),
('jthomas520','password7','jthomas520@gatech.edu','James','Thomas'),
('cforte58','password8','cforte58@gatech.edu','Connor','Forte'),
('fdavenport49','password9','fdavenport49@gatech.edu','Felicia','Devenport'),
('hliu88','password10','hliu88@gatech.edu','Hang','Liu'),
('akarev16','password11','akarev16@gatech.edu','Alex','Karev'),
('jdoe381','password12','jdoe381@gatech.edu','Jane','Doe'),
('sstrange11','password13','sstrange11@gatech.edu','Stephen','Strange'),
('dmcstuffins7','password14','dmcstuffins7@gatech.edu','Doc','Mcstuffins'),
('mgrey91','password15','mgrey91@gatech.edu','Meredith','Grey'),
('pwallace51','password16','pwallace51@gatech.edu','Penny','Wallace'),
('jrosario34','password17','jrosario34@gatech.edu','Jon','Rosario'),
('nshea230','password18','nshea230@gatech.edu','Nicholas','Shea'),
('mgeller3','password19','mgeller3@gatech.edu','Monica','Geller'),
('rgeller9','password20','rgeller9@gatech.edu','Ross','Geller'),
('jtribbiani27','password21','jtribbiani27@gatech.edu','Joey','Tribbiani'),
('pbuffay56','password22','pbuffay56@gatech.edu','Phoebe','Buffay'),
('rgreen97','password23','rgreen97@gatech.edu','Rachel','Green'),
('cbing101','password24','cbing101@gatech.edu','Chandler','Bing'),
('pbeesly61','password25','pbeesly61@gatech.edu','Pamela','Beesly'),
('jhalpert75','password26','jhalpert75@gatech.edu','Jim','Halpert'),
('dschrute18','password27','dschrute18@gatech.edu','Dwight','Schrute'),
('amartin365','password28','amartin365@gatech.edu','Angela','Martin'),
('omartinez13','password29','omartinez13@gatech.edu','Oscar','Martinez'),
('mscott845','password30','mscott845@gatech.edu','Michael','Scott'),
('abernard224','password31','abernard224@gatech.edu','Andy','Bernard'),
('kkapoor155','password32','kkapoor155@gatech.edu','Kelly','Kapoor'),
('dphilbin81','password33','dphilbin81@gatech.edu','Darryl','Philbin'),
('sthefirst1','password34','sthefirst1@gatech.edu','Sofia','Thefirst'),
('gburdell1','password35','gburdell1@gatech.edu','George','Burdell'),
('dsmith102','password36','dsmith102@gatech.edu','Dani','Smith'),
('dbrown85','password37','dbrown85@gatech.edu','David','Brown'),
('dkim99','password38','dkim99@gatech.edu','Dave','Kim'),
('tlee984','password39','tlee984@gatech.edu','Tom','Lee'),
('jpark29','password40','jpark29@gatech.edu','Jerry','Park'),
('vneal101','password41','vneal101@gatech.edu','Vinay','Neal'),
('hpeterson55','password42','hpeterson55@gatech.edu','Haydn','Peterson'),
('lpiper20','password43','lpiper20@gatech.edu','Leroy','Piper'),
('mbob2','password44','mbob2@gatech.edu','Mary','Bob'),
('mrees785','password45','mrees785@gatech.edu','Marie','Rees'),
('wbryant23','password46','wbryant23@gatech.edu','William','Bryant'),
('aallman302','password47','aallman302@gatech.edu','Aiysha','Allman'),
('kweston85','password48','kweston85@gatech.edu','Kyle','Weston');

UPDATE USER SET user_password = MD5(user_password);

-------------------------

INSERT INTO LOCATION
VALUES
('East'),
('West');

----------------

INSERT INTO STUDENT
VALUES
('mgeller3','Off-campus Apartment','East'),
('rgeller9','Student Housing','East'),
('jtribbiani27','Greek Housing','West'),
('pbuffay56','Student Housing','East'),
('rgreen97','Student Housing','West'),
('cbing101','Greek Housing','East'),
('pbeesly61','Student Housing','West'),
('jhalpert75','Student Housing','East'),
('dschrute18','Student Housing','East'),
('amartin365','Greek Housing','East'),
('omartinez13','Student Housing','West'),
('mscott845','Student Housing','East'),
('abernard224','Greek Housing','West'),
('kkapoor155','Greek Housing','East'),
('dphilbin81','Greek Housing','West'),
('sthefirst1','Student Housing','West'),
('gburdell1','Student Housing','East'),
('dsmith102','Greek Housing','West'),
('dbrown85','Off-campus Apartment','East'),
('dkim99','Greek Housing','East'),
('tlee984','Student Housing','West'),
('jpark29','Student Housing','East'),
('vneal101','Student Housing','West'),
('hpeterson55','Greek Housing','East'),
('lpiper20','Student Housing','West'),
('mbob2','Student Housing','West'),
('mrees785','Off-campus House','West'),
('wbryant23','Greek Housing','East'),
('aallman302','Student Housing','West'),
('kweston85','Greek Housing','West');

-------------------------

INSERT INTO ADMINISTRATOR
VALUES
('jlionel666'),
('mmoss7'),
('lchen27');

---------------------

INSERT INTO EMPLOYEE
VALUES
('jhilborn97','4043802577'),
('jhilborn98','4042201897'),
('ygao10','7703928765'),
('jthomas520','7705678943'),
('cforte58','4708623384'),
('fdavenport49','7068201473'),
('hliu88','4782809765'),
('akarev16','9876543210'),
('jdoe381','1237864230'),
('sstrange11','6547891234'),
('dmcstuffins7','1236549878'),
('mgrey91','6458769523'),
('pwallace51','3788612907'),
('jrosario34','5926384247'),
('nshea230','6979064501');


-----------------------

INSERT INTO LABTECH
VALUES
('jhilborn97'),
('jhilborn98'),
('ygao10'),
('jthomas520'),
('cforte58'),
('fdavenport49'),
('hliu88');

--------------------

INSERT INTO SITETESTER
VALUES
('akarev16'),
('jdoe381'),
('sstrange11'),
('dmcstuffins7'),
('mgrey91'),
('pwallace51'),
('jrosario34'),
('nshea230');

------------------------

INSERT INTO SITE
VALUES
('Fulton County Board of Health','10 Park Place South SE','Atlanta','GA','30303','East'),
('CCBOH WIC Clinic','1895 Phoenix Blvd','College Park','GA','30339','West'),
('Kennesaw State University','3305 Busbee Drive NW','Kennesaw','GA','30144','West'),
('Stamps Health Services','740 Ferst Drive','Atlanta','GA','30332','West'),
('Bobby Dodd Stadium','150 Bobby Dodd Way NW','Atlanta','GA','30332','East'),
('Caddell Building','280 Ferst Drive NW','Atlanta','GA','30332','West'),
('Coda Building','760 Spring Street ','Atlanta','GA','30332','East'),
('GT Catholic Center','172 4th St NW','Atlanta','GA','30313','East'),
('West Village','532 8th St NW','Atlanta','GA','30318','West'),
('GT Connector','116 Bobby Dodd Way NW','Atlanta','GA','30313','East'),
('Curran St Parking Deck','564 8th St NW','Atlanta','GA','30318','West'),
('North Avenue (Centenial Room)','120 North Avenue NW','Atlanta','GA','30313','East');


--------------

INSERT INTO WORKING_AT
VALUES
('akarev16','Fulton County Board of Health'),
('akarev16','CCBOH WIC Clinic'),
('akarev16','Kennesaw State University'),
('akarev16','Stamps Health Services'),
('dmcstuffins7','Bobby Dodd Stadium'),
('dmcstuffins7','Caddell Building'),
('dmcstuffins7','Coda Building'),
('dmcstuffins7','GT Catholic Center'),
('dmcstuffins7','West Village'),
('dmcstuffins7','GT Connector'),
('jdoe381','Curran St Parking Deck'),
('jdoe381','North Avenue (Centenial Room)'),
('jdoe381','Fulton County Board of Health'),
('jdoe381','CCBOH WIC Clinic'),
('mgrey91','Kennesaw State University'),
('mgrey91','Stamps Health Services'),
('mgrey91','Bobby Dodd Stadium'),
('mgrey91','Caddell Building'),
('sstrange11','Coda Building'),
('sstrange11','GT Catholic Center'),
('sstrange11','West Village'),
('sstrange11','GT Connector'),
('sstrange11','Curran St Parking Deck'),
('sstrange11','North Avenue (Centenial Room)'),
('pwallace51','Coda Building');

--------------------------

INSERT INTO POOL
VALUES
('1','negative','2020-09-02','jhilborn97'),
('2','positive','2020-09-04','jhilborn98'),
('3','positive','2020-09-06','ygao10'),
('4','positive','2020-09-05','jthomas520'),
('5','negative','2020-09-07','fdavenport49'),
('6','positive','2020-09-05','hliu88'),
('7','negative','2020-09-11','cforte58'),
('8','positive','2020-09-11','ygao10'),
('9','pending',NULL,NULL),
('10','pending',NULL,NULL),
('11','pending',NULL,NULL),
('12','pending',NULL,NULL),
('13','pending',NULL,NULL);


----------------------


INSERT INTO APPOINTMENT
VALUES
('mgeller3','Fulton County Board of Health','2020-09-01','8:00:00'),
('rgeller9','Bobby Dodd Stadium','2020-09-01','9:00:00'),
('jtribbiani27','Caddell Building','2020-09-01','10:00:00'),
('pbuffay56','GT Catholic Center','2020-09-01','11:00:00'),
('rgreen97','West Village','2020-09-01','12:00:00'),
('cbing101','GT Catholic Center','2020-09-01','13:00:00'),
('pbeesly61','West Village','2020-09-01','14:00:00'),
('jhalpert75','North Avenue (Centenial Room)','2020-09-01','15:00:00'),
('dschrute18','North Avenue (Centenial Room)','2020-09-01','16:00:00'),
('omartinez13','Curran St Parking Deck','2020-09-03','8:00:00'),
('mscott845','Bobby Dodd Stadium','2020-09-03','9:00:00'),
('abernard224','Stamps Health Services','2020-09-03','10:00:00'),
('kkapoor155','GT Catholic Center','2020-09-03','11:00:00'),
('dphilbin81','West Village','2020-09-03','12:00:00'),
('sthefirst1','Caddell Building','2020-09-03','13:00:00'),
('gburdell1','Coda Building','2020-09-03','14:00:00'),
('dsmith102','Stamps Health Services','2020-09-03','15:00:00'),
('dbrown85','CCBOH WIC Clinic','2020-09-03','16:00:00'),
('dkim99','West Village','2020-09-03','17:00:00'),
('tlee984','Curran St Parking Deck','2020-09-04','8:00:00'),
('jpark29','GT Connector','2020-09-04','9:00:00'),
('vneal101','Curran St Parking Deck','2020-09-04','10:00:00'),
('hpeterson55','Bobby Dodd Stadium','2020-09-04','11:00:00'),
('lpiper20','Caddell Building','2020-09-04','12:00:00'),
('mbob2','Stamps Health Services','2020-09-04','13:00:00'),
('mrees785','Kennesaw State University','2020-09-04','14:00:00'),
('wbryant23','GT Catholic Center','2020-09-04','15:00:00'),
('aallman302','West Village','2020-09-04','16:00:00'),
('kweston85','West Village','2020-09-04','17:00:00'),
('mgeller3','Fulton County Board of Health','2020-09-04','8:00:00'),
('rgeller9','Bobby Dodd Stadium','2020-09-04','9:00:00'),
('jtribbiani27','Caddell Building','2020-09-04','10:00:00'),
('pbuffay56','Bobby Dodd Stadium','2020-09-10','11:00:00'),
('rgreen97','Caddell Building','2020-09-10','12:00:00'),
('cbing101','GT Catholic Center','2020-09-10','13:00:00'),
('pbeesly61','West Village','2020-09-10','14:00:00'),
('jhalpert75','Coda Building','2020-09-10','15:00:00'),
('dschrute18','Coda Building','2020-09-10','16:00:00'),
('amartin365','Coda Building','2020-09-10','17:00:00'),
('omartinez13','Stamps Health Services','2020-09-10','8:00:00'),
('mscott845','Bobby Dodd Stadium','2020-09-10','9:00:00'),
('abernard224','West Village','2020-09-10','10:00:00'),
('kkapoor155','GT Connector','2020-09-10','11:00:00'),
('dphilbin81','Curran St Parking Deck','2020-09-10','12:00:00'),
('sthefirst1','Curran St Parking Deck','2020-09-10','13:00:00'),
('gburdell1','North Avenue (Centenial Room)','2020-09-10','14:00:00'),
('dsmith102','Caddell Building','2020-09-10','15:00:00'),
('dbrown85','CCBOH WIC Clinic','2020-09-10','16:00:00'),
('dkim99','Bobby Dodd Stadium','2020-09-10','17:00:00'),
('tlee984','West Village','2020-09-10','8:00:00'),
('jpark29','GT Catholic Center','2020-09-10','9:00:00'),
('vneal101','Curran St Parking Deck','2020-09-13','10:00:00'),
('hpeterson55','Coda Building','2020-09-13','11:00:00'),
('lpiper20','Stamps Health Services','2020-09-13','12:00:00'),
('mbob2','Curran St Parking Deck','2020-09-13','13:00:00'),
('mrees785','CCBOH WIC Clinic','2020-09-13','14:00:00'),
('wbryant23','North Avenue (Centenial Room)','2020-09-16','15:00:00'),
('aallman302','West Village','2020-09-16','16:00:00'),
('kweston85','Caddell Building','2020-09-16','17:00:00'),
(NULL,'Fulton County Board of Health','2020-09-16','8:00:00'),
(NULL,'CCBOH WIC Clinic','2020-09-16','9:00:00'),
(NULL,'Kennesaw State University','2020-09-16','10:00:00'),
(NULL,'Stamps Health Services','2020-09-16','11:00:00'),
(NULL,'Bobby Dodd Stadium','2020-09-16','12:00:00'),
(NULL,'Caddell Building','2020-09-16','13:00:00'),
(NULL,'Coda Building','2020-09-16','14:00:00'),
(NULL,'GT Catholic Center','2020-09-16','15:00:00'),
(NULL,'GT Connector','2020-10-01','17:00:00'),
(NULL,'Curran St Parking Deck','2020-10-01','8:00:00'),
(NULL,'North Avenue (Centenial Room)','2020-10-01','9:00:00'),
(NULL,'Fulton County Board of Health','2020-10-01','17:00:00'),
(NULL,'CCBOH WIC Clinic','2020-10-01','8:00:00'),
(NULL,'Kennesaw State University','2020-10-01','9:00:00'),
(NULL,'Stamps Health Services','2020-10-01','10:00:00'),
(NULL,'Bobby Dodd Stadium','2020-10-01','11:00:00'),
(NULL,'Caddell Building','2020-10-02','12:00:00'),
(NULL,'Coda Building','2020-10-02','13:00:00'),
(NULL,'GT Catholic Center','2020-10-02','14:00:00'),
(NULL,'West Village','2020-10-02','15:00:00'),
(NULL,'GT Connector','2020-10-02','16:00:00'),
(NULL,'Curran St Parking Deck','2020-10-02','17:00:00'),
(NULL,'North Avenue (Centenial Room)','2020-10-06','8:00:00'),
(NULL,'Fulton County Board of Health','2020-10-06','9:00:00'),
(NULL,'CCBOH WIC Clinic','2020-10-06','10:00:00'),
(NULL,'Kennesaw State University','2020-10-06','11:00:00'),
(NULL,'Stamps Health Services','2020-10-06','12:00:00'),
(NULL,'Bobby Dodd Stadium','2020-10-07','13:00:00'),
(NULL,'Caddell Building','2020-10-07','14:00:00'),
(NULL,'Coda Building','2020-10-07','15:00:00'),
(NULL,'GT Catholic Center','2020-10-07','16:00:00'),
(NULL,'West Village','2020-10-07','17:00:00'),
(NULL,'GT Connector','2020-10-07','8:00:00'),
(NULL,'Curran St Parking Deck','2020-10-07','9:00:00'),
(NULL,'North Avenue (Centenial Room)','2020-10-07','10:00:00');

--------------
INSERT INTO TEST
VALUES
('100001','negative','1','Fulton County Board of Health','2020-09-01','8:00:00'),
('100002','negative','1','Bobby Dodd Stadium','2020-09-01','9:00:00'),
('100003','negative','1','Caddell Building','2020-09-01','10:00:00'),
('100004','negative','1','GT Catholic Center','2020-09-01','11:00:00'),
('100005','negative','1','West Village','2020-09-01','12:00:00'),
('100006','negative','1','GT Catholic Center','2020-09-01','13:00:00'),
('100007','negative','1','West Village','2020-09-01','14:00:00'),
('100008','negative','2','North Avenue (Centenial Room)','2020-09-01','15:00:00'),
('100009','positive','2','North Avenue (Centenial Room)','2020-09-01','16:00:00'),
('100011','negative','2','Curran St Parking Deck','2020-09-03','8:00:00'),
('100012','positive','2','Bobby Dodd Stadium','2020-09-03','9:00:00'),
('100013','positive','2','Stamps Health Services','2020-09-03','10:00:00'),
('100014','negative','2','GT Catholic Center','2020-09-03','11:00:00'),
('100015','negative','3','West Village','2020-09-03','12:00:00'),
('100016','positive','3','Caddell Building','2020-09-03','13:00:00'),
('100017','negative','3','Coda Building','2020-09-03','14:00:00'),
('100018','negative','3','Stamps Health Services','2020-09-03','15:00:00'),
('100019','positive','3','CCBOH WIC Clinic','2020-09-03','16:00:00'),
('100020','negative','4','West Village','2020-09-03','17:00:00'),
('100021','negative','4','Curran St Parking Deck','2020-09-04','8:00:00'),
('100022','negative','4','GT Connector','2020-09-04','9:00:00'),
('100023','negative','4','Curran St Parking Deck','2020-09-04','10:00:00'),
('100024','positive','4','Bobby Dodd Stadium','2020-09-04','11:00:00'),
('100025','negative','5','Caddell Building','2020-09-04','12:00:00'),
('100026','negative','5','Stamps Health Services','2020-09-04','13:00:00'),
('100027','negative','5','Kennesaw State University','2020-09-04','14:00:00'),
('100028','negative','5','GT Catholic Center','2020-09-04','15:00:00'),
('100029','negative','5','West Village','2020-09-04','16:00:00'),
('100030','negative','5','West Village','2020-09-04','17:00:00'),
('100031','positive','6','Fulton County Board of Health','2020-09-04','8:00:00'),
('100032','positive','6','Bobby Dodd Stadium','2020-09-04','9:00:00'),
('100033','negative','7','Caddell Building','2020-09-04','10:00:00'),
('100034','negative','7','Bobby Dodd Stadium','2020-09-10','11:00:00'),
('100035','negative','7','Caddell Building','2020-09-10','12:00:00'),
('100036','negative','7','GT Catholic Center','2020-09-10','13:00:00'),
('100037','negative','7','West Village','2020-09-10','14:00:00'),
('100038','negative','7','Coda Building','2020-09-10','15:00:00'),
('100039','negative','8','Coda Building','2020-09-10','16:00:00'),
('100040','positive','8','Coda Building','2020-09-10','17:00:00'),
('100041','negative','8','Stamps Health Services','2020-09-10','8:00:00'),
('100042','pending','9','Bobby Dodd Stadium','2020-09-10','9:00:00'),
('100043','pending','9','West Village','2020-09-10','10:00:00'),
('100044','pending','9','GT Connector','2020-09-10','11:00:00'),
('100045','pending','9','Curran St Parking Deck','2020-09-10','12:00:00'),
('100046','pending','9','Curran St Parking Deck','2020-09-10','13:00:00'),
('100047','pending','9','North Avenue (Centenial Room)','2020-09-10','14:00:00'),
('100048','pending','9','Caddell Building','2020-09-10','15:00:00'),
('100049','pending','10','CCBOH WIC Clinic','2020-09-10','16:00:00'),
('100050','pending','11','Bobby Dodd Stadium','2020-09-10','17:00:00'),
('100051','pending','11','West Village','2020-09-10','8:00:00'),
('100052','pending','11','GT Catholic Center','2020-09-10','9:00:00'),
('100053','pending','11','Curran St Parking Deck','2020-09-13','10:00:00'),
('100054','pending','11','Coda Building','2020-09-13','11:00:00'),
('100055','pending','12','Stamps Health Services','2020-09-13','12:00:00'),
('100056','pending','12','Curran St Parking Deck','2020-09-13','13:00:00'),
('100057','pending','12','CCBOH WIC Clinic','2020-09-13','14:00:00'),
('100058','pending','12','North Avenue (Centenial Room)','2020-09-16','15:00:00'),
('100059','pending','13','West Village','2020-09-16','16:00:00'),
('100060','pending','13','Caddell Building','2020-09-16','17:00:00');

