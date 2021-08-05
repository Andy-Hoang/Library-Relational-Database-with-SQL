

DROP TABLE IF EXISTS LOAN;
DROP TABLE IF EXISTS USER;
DROP TABLE IF EXISTS CARD;
DROP TABLE IF EXISTS ROLE;
DROP TABLE IF EXISTS BOOK;
DROP TABLE IF EXISTS BRANCH;
DROP TABLE IF EXISTS AUTHOR;
DROP TABLE IF EXISTS PUBLISHER;
DROP TABLE IF EXISTS MATERIAL;

CREATE TABLE AUTHOR(
    AID  INTEGER  PRIMARY KEY AUTOINCREMENT,
    A_Name NVARCHAR(20),
    A_Email NVARCHAR(30)
--primary key(AID)      
);


CREATE TABLE PUBLISHER (
    PID INTEGER NOT NULL  PRIMARY KEY AUTOINCREMENT,
    P_Name NVARCHAR(30),
    P_Email NVARCHAR(20)
   --  primary key(PID)    
);

CREATE TABLE MATERIAL (
    MID NVARCHAR(8) NOT NULL,
    M_Type NVARCHAR(30),
    primary key(MID)    
);


CREATE TABLE BRANCH (
    BID NVARCHAR(30) NOT NULL,
    B_Address NVARCHAR(50),
    B_Name NVARCHAR(30),
	B_Images NVARCHAR(100),
	primary key(BID)
);

CREATE TABLE USER (
    UserID NVARCHAR(8),
    BID NVARCHAR(8),
    FName NVARCHAR(10) NOT NULL,
	LName NVARCHAR(10) NOT NULL,
	Gender NVARCHAR(8),
	DOB DATETIME (27),
	Address NVARCHAR(100),
	Email NVARCHAR(20) NOT NULL,
	Phonenr INTEGER (10),
	Student INTEGER (1) NOT NULL,
	Lecturer INTEGER (1) NOT NULL,
	Staff INTEGER (1) NOT NULL,
	Role INTEGER(2) NOT NULL,
	primary key(UserID),
	FOREIGN KEY (BID) REFERENCES BRANCH(BID),
	FOREIGN KEY (Role) REFERENCES ROLE(Role)	
);


CREATE TABLE ROLE( 
 --   ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Role INTEGER NOT NULL PRIMARY KEY,
    Role_Name NVARCHAR(15)
 --	primary key(ID),
	--FOREIGN KEY (Role) REFERENCES USER(Role)
);


CREATE TABLE CARD (
    CID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    UserID NVARCHAR(8),
    date_issue NVARCHAR(27),
	Type NVARCHAR(15),
	--primary key(CID),
	FOREIGN KEY (UserID) REFERENCES USER(UserID) ON DELETE CASCADE
);


CREATE TABLE BOOK (
    BOOKID NVARCHAR(16) NOT NULL,
    MID NVARCHAR(8),
    AID NVARCHAR(8),
	BID NVARCHAR(8),
	PID NVARCHAR(8),
	Title TEXT(50) NOT NULL,
	Call_Number NVARCHAR(7) NOT NULL,
	Category TEXT(20),
	Year INTEGER,
	Edition INTEGER,
	Availability INTEGER NOT NULL,
	primary key(BOOKID),
	FOREIGN KEY (MID) REFERENCES MATERIAL(MID),
	FOREIGN KEY (AID) REFERENCES AUTHOR(AID),
	FOREIGN KEY (BID) REFERENCES BRANCH(BID),
	FOREIGN KEY (PID) REFERENCES PUBLISHER(PID)
);


CREATE TABLE LOAN (
    LoanID INTEGER NOT NULL,
    BOOKID NVARCHAR(16),
    StaffID NVARCHAR(8),
    UserID NVARCHAR(8),	
	Loan_date NVARCHAR NOT NULL,
	Due_date NVARCHAR NOT NULL,
	Date_returned DATETIME NOT NULL,
	Fine_amount NUMERIC(10, 2),
	Fine_paid NUMERIC(10, 2),	
	primary key(LoanID,BOOKID),
	FOREIGN KEY (StaffID) REFERENCES USER(UserID),
	FOREIGN KEY (UserID) REFERENCES USER(UserID),
	FOREIGN KEY (BOOKID) REFERENCES BOOK(BOOKID)
);


---- AUTHOR-----
INSERT OR IGNORE INTO AUTHOR (A_Name ,A_Email) VALUES( 'Oreilly',	'oreilly@oreilly.com');
INSERT OR IGNORE INTO AUTHOR (A_Name ,A_Email) VALUES( 'MyApress',	'apress@myapress.com');
INSERT OR IGNORE INTO AUTHOR (A_Name ,A_Email) VALUES( 'BackBeat',	'BackBeat@BackBeat.com');
INSERT OR IGNORE INTO AUTHOR (A_Name ,A_Email) VALUES( 'Body Count',	'Body@Body.com');
INSERT OR IGNORE INTO AUTHOR (A_Name ,A_Email) VALUES( 'Cidade Negra',	'Cidade@Cidade.com');
INSERT OR IGNORE INTO AUTHOR (A_Name ,A_Email) VALUES( 'Body Count',	'apress5@myapress5.com');
INSERT OR IGNORE INTO AUTHOR (A_Name ,A_Email) VALUES( 'Marcos Valle',	'Marcos@Marcos.com');
INSERT OR IGNORE INTO AUTHOR (A_Name ,A_Email) VALUES( 'Ney Matogrosso',	'Matogrosso@Matogrosso.com');
INSERT OR IGNORE INTO AUTHOR (A_Name ,A_Email) VALUES( 'O Rappa',	'Rappa@Rappa.com');
INSERT OR IGNORE INTO AUTHOR (A_Name ,A_Email) VALUES( 'Banda Black Rio', 'Banda@Banda.com');
INSERT OR IGNORE INTO AUTHOR (A_Name ,A_Email) VALUES( 'Elis Regina', 'Elis@Elis.com');
-----
---- PUBLISHER-----
INSERT OR IGNORE INTO PUBLISHER (P_Name ,P_Email) VALUES( 'Pearson AU',	'pearsonau@pearson.com');
INSERT OR IGNORE INTO PUBLISHER (P_Name ,P_Email) VALUES( 'Apress',	'apress@apress.com');
INSERT OR IGNORE INTO PUBLISHER (P_Name ,P_Email) VALUES( 'Nando',	'Nando@Nando.com');
INSERT OR IGNORE INTO PUBLISHER (P_Name ,P_Email) VALUES( 'A Cor Do Som',	'Som@Som.com');
INSERT OR IGNORE INTO PUBLISHER (P_Name ,P_Email) VALUES( 'Cidade Negra',	'Cidade@Cidade.com');
INSERT OR IGNORE INTO PUBLISHER (P_Name ,P_Email) VALUES( 'Kid Abelha',	'Kid@KidAbelha.com');
INSERT OR IGNORE INTO PUBLISHER (P_Name ,P_Email) VALUES( 'Hermeto Pascoal',	'Hermeto@Hermeto.com');
INSERT OR IGNORE INTO PUBLISHER (P_Name ,P_Email) VALUES( 'Jorge Ben',	'Jorge@Jorge.com');
INSERT OR IGNORE INTO PUBLISHER (P_Name ,P_Email) VALUES( 'Edson, DJ Marky & DJ Patife Featuring Fernanda Porto',	'Edson@Edson.com');
INSERT OR IGNORE INTO PUBLISHER (P_Name ,P_Email) VALUES( 'Queen', 'Queen@Queen11.com');

---- BRANCH-----
INSERT OR IGNORE INTO BRANCH (BID , B_Address, B_Name, B_Images) VALUES
( 'Cas01',	'Ellengowan Dr, Casuarina NT 0810' , 'Casuarina', 'wellcome1.png');
INSERT OR IGNORE INTO BRANCH (BID , B_Address, B_Name, B_Images) VALUES
( 'Dar01',	'21 Kitchener Dr, Darwin City NT 0800' , 'Darwin', 'wellcome2.png');
INSERT OR IGNORE INTO BRANCH (BID , B_Address, B_Name, B_Images) VALUES
( 'Pal01',	'Durack NT 0830' , 'Palmerton', 'wellcome3.png');
INSERT OR IGNORE INTO BRANCH (BID , B_Address, B_Name, B_Images) VALUES
( 'AliceSping01','17 Grevillea Dr, Sadadeen NT 0870' , 'Alice Spring', 'wellcome4.png');
INSERT OR IGNORE INTO BRANCH (BID , B_Address, B_Name, B_Images) VALUES
( 'Sys01',	'185 Parramatta Road, Haberfield' , 'Sydney', 'wellcome5.png');
INSERT OR IGNORE INTO BRANCH (BID , B_Address, B_Name, B_Images) VALUES
( 'Sys02',	'48 Arthur Street, Ashfield' , 'Darlington', 'wellcome6.png');
INSERT OR IGNORE INTO BRANCH (BID , B_Address, B_Name, B_Images) VALUES
( 'Sys03',	'111 Regent Street, Chippendale' , 'Barangaroo', 'wellcome7.png');
INSERT OR IGNORE INTO BRANCH (BID , B_Address, B_Name, B_Images) VALUES
( 'Cas02',	'23 Colin Street, Lakemba' , 'Casuarina2', 'wellcome8.png');
INSERT OR IGNORE INTO BRANCH (BID , B_Address, B_Name, B_Images) VALUES
( 'Cas03',	'Carthona, 5 Carthona Avenue, Darling Point' , 'Casuarina3', 'wellcome9.png');
INSERT OR IGNORE INTO BRANCH (BID , B_Address, B_Name, B_Images) VALUES
( 'Dar02',	'8 Kent Street, Bronte' , 'Darwin ', 'wellcome10.png');

---- MATERIAL-----
INSERT OR IGNORE INTO MATERIAL(MID , M_Type) VALUES( 'book01',	'Book');
INSERT OR IGNORE INTO MATERIAL(MID , M_Type) VALUES( 'ebook01',	'Ebook');
INSERT OR IGNORE INTO MATERIAL(MID , M_Type) VALUES( 'jounal01', 'Jounal');
INSERT OR IGNORE INTO MATERIAL(MID , M_Type) VALUES( 'newspaper01', 'Newpaper');
INSERT OR IGNORE INTO MATERIAL(MID , M_Type) VALUES( 'aritcle01', 'Article');
INSERT OR IGNORE INTO MATERIAL(MID , M_Type) VALUES( 'book02',	'Book 2');
INSERT OR IGNORE INTO MATERIAL(MID , M_Type) VALUES( 'ebook02',	'Ebook 2');
INSERT OR IGNORE INTO MATERIAL(MID , M_Type) VALUES( 'jounal02', 'Jounal 2');
INSERT OR IGNORE INTO MATERIAL(MID , M_Type) VALUES( 'newspaper02', 'Newpaper 2');
INSERT OR IGNORE INTO MATERIAL(MID , M_Type) VALUES( 'aritcle02', 'Article 2');

---- ROLE-----
INSERT OR IGNORE INTO ROLE (Role ,Role_Name) VALUES(0,	'User');
INSERT OR IGNORE INTO ROLE (Role ,Role_Name) VALUES(1,	'Librarian');
INSERT OR IGNORE INTO ROLE (Role ,Role_Name) VALUES(2,	'Tutor');
INSERT OR IGNORE INTO ROLE (Role ,Role_Name) VALUES(3,	'Administrator');

---- USER-----
INSERT OR IGNORE INTO USER (UserID , BID, FName, LName,Gender, DOB, Address, Email, Phonenr, Student, Lecturer, Staff, Role) VALUES 
('s323920',	'Cas01' , 'Henry', 'Nguyen','Male', '1987-01-04 00:00:00', '11 Hickory st','henry.nguyen@students.cdu.edu.au','0412345678','1','0','0', '0');
INSERT OR IGNORE INTO USER (UserID , BID, FName, LName,Gender, DOB, Address, Email, Phonenr, Student, Lecturer, Staff, Role) VALUES 
('s323921',	'Dar01' , 'Kevin', 'Nguyen','Bisexual', '1987-01-04 00:00:00', '11 Hickory st','henry.nguyen@students.cdu.edu.au','0412345678','1','0','0', '0');
INSERT OR IGNORE INTO USER (UserID , BID, FName, LName,Gender, DOB, Address, Email, Phonenr, Student, Lecturer, Staff, Role) VALUES 
('s323922',	'Pal01' , 'Abo', 'Lix','Female', '1983-01-01 00:00:00', 'Trower st','abo.lix@students.cdu.edu.au','0411225578','1','0','0', '0');
INSERT OR IGNORE INTO USER (UserID , BID, FName, LName,Gender, DOB, Address, Email, Phonenr, Student, Lecturer, Staff, Role) VALUES 
('s423923',	'AliceSping01' , 'Thang', 'Hoang','Male', '2000-03-04 00:00:00', 'Michell st','thang.hoang@students.cdu.edu.au','0412345666','1','0','0','0');
INSERT OR IGNORE INTO USER (UserID , BID, FName, LName,Gender, DOB, Address, Email, Phonenr, Student, Lecturer, Staff, Role) VALUES 
('s323924',	'Sys01' , 'Albert', 'Shaun','Male', '1888-12-04 00:00:00', '11 Progress Drive st','shaun@students.cdu.edu.au','0412345677','1','0','0','0');
INSERT OR IGNORE INTO USER (UserID , BID, FName, LName,Gender, DOB, Address, Email, Phonenr, Student, Lecturer, Staff, Role) VALUES 
('c323925',	'Sys02' , 'Lam', 'Amber','Male', '1987-01-04 00:00:00', '13 Tran Hung Dao st','lam.amber@staff.cdu.edu.au','0412345678','0','1','0', '0'); --lecturer
INSERT OR IGNORE INTO USER (UserID , BID, FName, LName,Gender, DOB, Address, Email, Phonenr, Student, Lecturer, Staff, Role) VALUES 
('c323924',	'Sys03' , 'Laura', 'Evis','Female', '1983-12-09 00:00:00', 'Nguyen Hue st','laura.evis@staffs.cdu.edu.au','0423453456','0','0','1', '1'); --staff
INSERT OR IGNORE INTO USER (UserID , BID, FName, LName,Gender, DOB, Address, Email, Phonenr, Student, Lecturer, Staff, Role) VALUES 
('c323926',	'Cas02' , 'Justin', 'Nguyen','Male', '1987-01-04 00:00:00', '01 Ton Duc Thang st','henry.nguyen@staff.cdu.edu.au','0412345678','0','0','1', '2'); --staff
INSERT OR IGNORE INTO USER (UserID , BID, FName, LName,Gender, DOB, Address, Email, Phonenr, Student, Lecturer, Staff, Role) VALUES 
('c323928',	'Cas03' , 'Yakurt', 'Yakurt','Male', '1987-01-04 00:00:00', '3/2 st','Yakurt.Yakurt@staff.cdu.edu.au','0412345678','0','0','1', '3'); --staff
INSERT OR IGNORE INTO USER (UserID , BID, FName, LName,Gender, DOB, Address, Email, Phonenr, Student, Lecturer, Staff, Role) VALUES 
('c323923',	'Dar02' , 'Alice', 'Bob','Female', '1987-01-04 00:00:00', 'Conan st','Alice.Bob@staff.cdu.edu.au','0412345678','0','1','0', '0'); --lecturer


---- CARD-----
INSERT OR IGNORE INTO CARD (UserID ,date_issue,Type) VALUES( 's323920',	'2020-08-25 00:00:00','STU_CDU');
INSERT OR IGNORE INTO CARD (UserID ,date_issue,Type) VALUES( 'c323924',	'2020-08-25 00:00:00','STAFF_CDU');
INSERT OR IGNORE INTO CARD (UserID ,date_issue,Type) VALUES( 's323921',	'2020-08-25 00:00:00','STU_PARTNER');
INSERT OR IGNORE INTO CARD (UserID ,date_issue,Type) VALUES( 's323922',	'2020-08-25 00:00:00','COM_CDU');
INSERT OR IGNORE INTO CARD (UserID ,date_issue,Type) VALUES( 'c323925',	'2020-08-25 00:00:00','STAFF_CDU');
INSERT OR IGNORE INTO CARD (UserID ,date_issue,Type) VALUES( 's423923',	'2020-08-25 00:00:00','STU_PARTNER');
INSERT OR IGNORE INTO CARD (UserID ,date_issue,Type) VALUES( 's323924',	'2020-08-25 00:00:00','STU_CDU');
INSERT OR IGNORE INTO CARD (UserID ,date_issue,Type) VALUES( 'c323928',	'2020-08-25 00:00:00','STAFF_CDU');
INSERT OR IGNORE INTO CARD (UserID ,date_issue,Type) VALUES( 'c323926',	'2020-08-25 00:00:00','STU_CDU');

---- BOOK-----

INSERT OR IGNORE INTO BOOK (BOOKID , MID, AID, BID, PID, Title, Call_Number, Category, Year, Edition, Availability) VALUES ('9781603090254-01','book01', 1, 'Cas01',1, 'Data Advanced Management', 'Rack01', 'IT Database Book',2020,14,1);
-----
INSERT OR IGNORE INTO BOOK (BOOKID , MID, AID, BID, PID, Title, Call_Number, Category, Year, Edition, Availability) VALUES ('9781603090254-02','book01' , 1, 'Cas01',1, 'Data Advanced Management', 'Rack02','IT Database Book',2020,14,1);
----
INSERT OR IGNORE INTO BOOK (BOOKID , MID, AID, BID, PID, Title, Call_Number, Category, Year, Edition, Availability) VALUES ('9781603090254-03','book01' , 1, 'Cas01',1, 'Data Advanced Management', 'Rack003','IT Database Book',2020,14,0);
---
INSERT OR IGNORE INTO BOOK (BOOKID , MID, AID, BID, PID, Title, Call_Number, Category, Year, Edition, Availability) VALUES ('9781603090254-04','book01' , 1, 'Sys02',1, 'Data Advanced Management', 'Rack20','IT Database Book',2020,14,1);
--
INSERT OR IGNORE INTO BOOK (BOOKID , MID, AID, BID, PID, Title, Call_Number, Category, Year, Edition, Availability) VALUES ('9781603090476-01','jounal01', 2, 'Sys02',2, 'Security Report 2020', 'Rack21','IT Security Book',2020,2,1);
---
INSERT OR IGNORE INTO BOOK (BOOKID , MID, AID, BID, PID, Title, Call_Number, Category, Year, Edition, Availability) VALUES ('9781603093224-01','newspaper02', 1, 'Sys01',2, 'NT Morning', 'Rack05','NewsPaper',2020,1,1);
---
INSERT OR IGNORE INTO BOOK (BOOKID , MID, AID, BID, PID, Title, Call_Number, Category, Year, Edition, Availability) VALUES ('9781891830853-01','aritcle02', 3, 'Dar02',4, 'How to become rich', 'Rack06','Article',2015,1,1);
---
INSERT OR IGNORE INTO BOOK (BOOKID , MID, AID, BID, PID, Title, Call_Number, Category, Year, Edition, Availability) VALUES ('9781603090162-01','book01', 5, 'Sys02',1, 'How to become a white-hat hacker Part 1', 'Rack21','IT Security Book',2000,2,1);
---
INSERT OR IGNORE INTO BOOK (BOOKID , MID, AID, BID, PID, Title, Call_Number, Category, Year, Edition, Availability) VALUES ('9781603090162-02','book01', 5, 'Sys02',1, 'How to become a white-hat hacker Part 2', 'Rack21','IT Security Book',2001,2,1);
--
INSERT OR IGNORE INTO BOOK (BOOKID , MID, AID, BID, PID, Title, Call_Number, Category, Year, Edition, Availability) VALUES ('9781603092654-01','book01', 8, 'AliceSping01',8, 'Big Data - K means Algorithym', 'Racka01','IT Big Data Book',1999,5,1);
---
INSERT OR IGNORE INTO BOOK (BOOKID , MID, AID, BID, PID, Title, Call_Number, Category, Year, Edition, Availability) VALUES ('9978160309077-01','aritcle02', 9, 'Cas03',9, 'Database Concepts', 'Racka00','IT Database Book',1999,8,1);
------
INSERT OR IGNORE INTO BOOK (BOOKID , MID, AID, BID, PID, Title, Call_Number, Category, Year, Edition, Availability) VALUES ('9781603093699-01','ebook02', 10, 'Cas01',9, 'Decision Suppport System', 'Racka00','IT Database Book',1999,8,1);

INSERT OR IGNORE INTO BOOK (BOOKID , MID, AID, BID, PID, Title, Call_Number, Category, Year, Edition, Availability) VALUES ('9781603093699-02','ebook02', 10, 'Dar02',9, 'Decision Suppport System', 'Racka09','IT Database Book',2019,8,0);
--
INSERT OR IGNORE INTO BOOK (BOOKID , MID, AID, BID, PID, Title, Call_Number, Category, Year, Edition, Availability) VALUES ('9781603090421-01','aritcle01', 1, 'Sys01',null, 'Decision Makings', 'Racka10','Economy',1999,8,0);
--
INSERT OR IGNORE INTO BOOK (BOOKID , MID, AID, BID, PID, Title, Call_Number, Category, Year, Edition, Availability) VALUES ('9781603090261-01','book02', 10, 'Sys01',1, 'Sustainability', 'Rack01','Environment',2011,20,1);
 
INSERT OR IGNORE INTO BOOK (BOOKID , MID, AID, BID, PID, Title, Call_Number, Category, Year, Edition, Availability) VALUES ('9781603090261-02','book02', 10, 'Cas01',1, 'Sustainability', 'Rack05','Environment',2011,20,1);
 
INSERT OR IGNORE INTO BOOK (BOOKID , MID, AID, BID, PID, Title, Call_Number, Category, Year, Edition, Availability) VALUES ('9781603090261-03','book02', 10, 'Dar02',1, 'Sustainability', 'Racka19','Environment',2011,20,0);
 
INSERT OR IGNORE INTO BOOK (BOOKID , MID, AID, BID, PID, Title, Call_Number, Category, Year, Edition, Availability) VALUES ('9781603090261-03','book02', 10, 'AliceSping01',1, 'Sustainability', 'Rackb20','Environment',2011,20,0);

---- LOAN-----
INSERT OR IGNORE INTO LOAN (LoanID,StaffID, UserID, BOOKID, Loan_date, Due_date, Date_returned, Fine_amount, Fine_paid) VALUES 
(1,'c323924',	's323920' , '9781603090162-01',  '2020-08-25 08:30:22', '2020-09-25 08:30:22', '2020-08-30 10:30:00',5,5);
INSERT OR IGNORE INTO LOAN (LoanID,StaffID, UserID, BOOKID, Loan_date, Due_date, Date_returned, Fine_amount, Fine_paid) VALUES 
(1,'c323924',	's323920' , '9781603090162-02',  '2020-08-25 08:30:22', '2020-09-25 08:30:22', '2020-08-30 10:30:00',5,5);
INSERT OR IGNORE INTO LOAN (LoanID,StaffID, UserID, BOOKID, Loan_date, Due_date, Date_returned, Fine_amount, Fine_paid) VALUES 
(2,'c323926',	's323920' , '9781603090254-01',  '2020-08-25 08:30:22', '2020-09-25 08:30:22', '2020-08-30 10:30:00',0,0);
INSERT OR IGNORE INTO LOAN (LoanID,StaffID, UserID, BOOKID, Loan_date, Due_date, Date_returned, Fine_amount, Fine_paid) VALUES 
(3,'c323924',	's323922' , '9781603090254-02',  '2020-08-25 08:30:22', '2020-09-25 08:30:22', '2020-08-30 10:30:00',10,1);
INSERT OR IGNORE INTO LOAN (LoanID,StaffID, UserID, BOOKID, Loan_date, Due_date, Date_returned, Fine_amount, Fine_paid) VALUES 
(4,'c323928',	's323921' , '9781603090254-03',  '2020-08-25 08:30:22', '2020-09-25 08:30:22', '2020-08-30 10:30:00',0,0);
INSERT OR IGNORE INTO LOAN (LoanID,StaffID, UserID, BOOKID, Loan_date, Due_date, Date_returned, Fine_amount, Fine_paid) VALUES 
(5,'c323924',	's423923' , '9781603090254-04',  '2020-08-25 08:30:22', '2020-09-25 08:30:22', '2020-08-30 10:30:00',7,7);

INSERT OR IGNORE INTO LOAN (LoanID,StaffID, UserID, BOOKID, Loan_date, Due_date, Date_returned, Fine_amount, Fine_paid) VALUES 
(6,'c323926',	's323920' , '9781603090421-01',  '2020-08-25 08:30:22', '2020-09-25 08:30:22', '2020-08-30 10:30:00',0,0);
INSERT OR IGNORE INTO LOAN (LoanID,StaffID, UserID, BOOKID, Loan_date, Due_date, Date_returned, Fine_amount, Fine_paid) VALUES 
(7,'c323926',	's323924' , '9781891830853-01',  '2020-08-25 08:30:22', '2020-09-25 08:30:22', '2020-08-30 10:30:00',5,5);
INSERT OR IGNORE INTO LOAN (LoanID,StaffID, UserID, BOOKID, Loan_date, Due_date, Date_returned, Fine_amount, Fine_paid) VALUES 
(8,'c323924',	's423923' , '9781603090261-03',  '2020-08-25 08:30:22', '2020-09-25 08:30:22', '2020-08-30 10:30:00',0,0);
INSERT OR IGNORE INTO LOAN (LoanID,StaffID, UserID, BOOKID, Loan_date, Due_date, Date_returned, Fine_amount, Fine_paid) VALUES 
(9,'c323924',	's323920' , '9978160309077-01',  '2020-08-25 08:30:22', '2020-09-25 08:30:22', '2020-08-30 10:30:00',2.5,1);
INSERT OR IGNORE INTO LOAN (LoanID,StaffID, UserID, BOOKID, Loan_date, Due_date, Date_returned, Fine_amount, Fine_paid) VALUES 
(10,'c323928',	's323921' , '9781603093699-02',  '2020-08-25 08:30:22', '2020-09-25 08:30:22', '2020-08-30 10:30:00',3.5,1.5);
INSERT OR IGNORE INTO LOAN (LoanID,StaffID, UserID, BOOKID, Loan_date, Due_date, Date_returned, Fine_amount, Fine_paid) VALUES 
(11,'c323926',	's323920' , '9781603090476-01',  '2020-08-15 12:32:00', '2020-08-25 12:32:00', '2020-08-20 9:15:22',7.5,7);
---- LOAN-----
