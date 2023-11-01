USE [test]
go

DROP TABLE IF EXISTS dbo.Students;
DROP TABLE IF EXISTS dbo.Groups;


go

CREATE TABLE dbo.Groups(
	GroupId int NOT NULL IDENTITY (1, 1) primary key,
	GroupName nvarchar(255) NOT NULL unique,
	Notes text NULL
);

Go

CREATE TABLE dbo.Students(
	StudentId int NOT NULL IDENTITY (1000, 1) primary key,
	GroupId int not null,
	FirstName varchar(30) not null,
	LastName varchar(30) not null,
	BirthDate DATE Not NULL,
    Email varchar(40) NULL ,
    Mobile varchar(20) NULL,
	Notes varchar(500) NULL,
	foreign key(GroupId) references Groups on update cascade
);

 insert into dbo.Groups(GroupName, Notes)
 values 
	('Group 1', ''),
	('Group 2', ''),
	('Group 3', '');

INSERT INTO STUDENTS(GroupId, LastName, FirstName, BirthDate, Email) VALUES

(1, 'Paolo', 'Accorti', 'Aug 27 1992 12:00AM',  'Paolo.Accorti@test.com'),
(1, 'Pedro', 'Afonso', 'Dec 24 1990 12:00AM',  'Pedro.Afonso@test.com'),
(1, 'Victoria', 'Ashworth', 'Sep 13 1990 12:00AM',  'Victoria.Ashworth@test.com'),
(1, 'Helen', 'Bennett', 'Sep 21 1989 12:00AM',  'Helen.Bennett@test.com'),
(1, 'Lesley', 'Brown', 'Feb 13 1991 12:00AM',  'Lesley.Brown@test.com'),
(1, 'Francisco', 'Chang', 'Nov  3 1990 12:00AM',  'Francisco.Chang@test.com'),
(1, 'Philip', 'Cramer', 'Nov 11 1989 12:00AM',  'Philip.Cramer@test.com'),
(1, 'Aria', 'Cruz', 'Oct 26 1991 12:00AM',  'Aria.Cruz@test.com'),
(1, 'Ann', 'Devon', 'Jul 16 1991 12:00AM',  'Ann.Devon@test.com'),
(1, 'Anabela', 'Domingues', 'Jan 27 1993 12:00AM',  'Anabela.Domingues@test.com'),
(1, 'Peter', 'Franken', 'May 17 1992 12:00AM',  'Peter.Franken@test.com'),
(1, 'Paul', 'Henriot', 'Aug 19 1993 12:00AM',  'Paul.Henriot@test.com'),
(1, 'Carlos', 'Hernadez', 'Apr 21 1989 12:00AM',  'Carlos.Hernadez@test.com'),
(1, 'Palle', 'Ibsen', 'May  9 1993 12:00AM',  'Palle.Ibsen@test.com'),
(1, 'Karla', 'Jablonski', 'Mar 11 1994 12:00AM',  'Karla.Jablonski@test.com'),
(1, 'Karin', 'Josephs', 'Oct 17 1992 12:00AM',  'Karin.Josephs@test.com'),
(2, 'Matti', 'Karttunen', 'May  1 1994 12:00AM',  'Matti.Karttunen@test.com'),
(2, 'Pirkko', 'Koskitalo', 'Nov 29 1993 12:00AM',  'Pirkko.Koskitalo@test.com'),
(2, 'Janine', 'Labrune', 'May 26 1991 12:00AM',  'Janine.Labrune@test.com'),
(2, 'Maria', 'Larsson', 'Mar 27 1992 12:00AM',  'Maria.Larsson@test.com'),
(2, 'Yoshi', 'Latimer', 'Jun 11 1989 12:00AM',  'Yoshi.Latimer@test.com'),
(2, 'Laurence', 'Lebihan', 'Jun  3 1990 12:00AM',  'Laurence.Lebihan@test.com'),
(2, 'Elizabeth', 'Lincoln', 'Jul 24 1990 12:00AM',  'Elizabeth.Lincoln@test.com'),
(2, 'Patricia', 'McKenna', 'Aug  1 1989 12:00AM',  'Patricia.McKenna@test.com'),
(2, 'Roland', 'Mendel', 'Sep  5 1991 12:00AM',  'Roland.Mendel@test.com'),
(2, 'Rita', 'Muller', 'Oct  9 1993 12:00AM',  'Rita.Muller@test.com'),
(2, 'Helvetius', 'Nagy', 'Mar 19 1993 12:00AM',  'Helvetius.Nagy@test.com'),
(2, 'Timothy', 'Rourke', 'Jun 19 1988 12:00AM',  'Timothy.Rourke@test.com'),
(2, 'Sven', 'Ottlieb', 'Apr  5 1991 12:00AM',  'Sven.Ottlieb@test.com'),
(2, 'Miguel', 'Paolino', 'Dec  7 1992 12:00AM',  'Miguel.Paolino@test.com'),
(3, 'Paula', 'Parente', 'Jan 19 1994 12:00AM',  'Paula.Parente@test.com'),
(3, 'Manuel', 'Pereira', 'Jan  9 1989 12:00AM',  'Manuel.Pereira@test.com'),
(3, 'Maria', 'Pontes', 'Mar  1 1989 12:00AM',  'Maria.Pontes@test.com'),
(3, 'Martine', 'Rance', 'Feb  5 1992 12:00AM',  'Martine.Rance@test.com'),
(3, 'Diego', 'Roel', 'Dec 16 1991 12:00AM',  'Diego.Roel@test.com'),
(3, 'Annette', 'Roulet', 'Feb 21 1990 12:00AM',  'Annette.Roulet@test.com'),
(3, 'Mary', 'Saveley', 'Jun 29 1993 12:00AM',  'Mary.Saveley@test.com'),
(3, 'Carine', 'Schmitt', 'Jul  7 1992 12:00AM',  'Carine.Schmitt@test.com'),
(3, 'Margaret', 'Smith', 'Sep 29 1988 12:00AM',  'Margaret.Smith@test.com'),
(3, 'Howard', 'Snyder', 'Nov 19 1988 12:00AM',  'Howard.Snyder@test.com'),
(3, 'Martin', 'Sommer', 'Apr 13 1990 12:00AM',  'Martin.Sommer@test.com'),
(3, 'Gary', 'Thomas', 'Aug  9 1988 12:00AM',  'Gary.Thomas@test.com'),
(3, 'Daniel', 'Tonini', 'Jan  1 1990 12:00AM',  'Daniel.Tonini@test.com');