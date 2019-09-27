--CREATE DATABASE
CREATE DATABASE FINAL
DROP DATABASE FINAL
USE FINAL
--CREATE TABLE
CREATE TABLE Brand
(
	IDBrand nvarchar(30) PRIMARY KEY ,
	Name nvarchar(30) ,
)
--CREATE table brand in store 

--create table store
CREATE TABLE Store
(
	IDBrand nvarchar(30) FOREIGN KEY REFERENCES dbo.Brand(IDBrand),
	IDStore nvarchar(30) PRIMARY KEY,
	CITY_PROVINCE NVARCHAR(30),
	TOWN_DISTRICT NVARCHAR(30),
	Locations nvarchar(30),
	Phone CHAR(10) UNIQUE CHECK(Phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR Phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)
--create subtype
CREATE TABLE SubType
(
	Gender nvarchar(1) CHECK(Gender IN('F','M')),
	Age NVARCHAR(30),
	Typee nvarchar(30),
	IDSubType nvarchar(30) PRIMARY KEY,
	IDBrand nvarchar(30)FOREIGN KEY REFERENCES dbo.Brand(IDBrand),
)
--create type
CREATE TABLE Typ
(
	TypeName nvarchar(30),
	Style nvarchar(30),
	IDSubType nvarchar(30) FOREIGN KEY REFERENCES dbo.SubType(IDSubType),
	IDType nvarchar(3) PRIMARY KEY,
)
--create product
CREATE TABLE Product
(
	IDProduct nvarchar(30) PRIMARY KEY,
	NameProduct nvarchar(30),
	ProductQuantity int,
	Price int,
	Color nvarchar(30),
	Material nvarchar(30),
	Pattern nvarchar(30),
	Form nvarchar(30),
	Design nvarchar(30),
	IDType nvarchar(3) FOREIGN KEY REFERENCES dbo.Typ(IDType),
)
--insert brand
INSERT INTO dbo.Brand
(
	IDBrand,
	Name
)
VALUES
(
	N'A01', --ID
	N'VIETTIEN'--Name
)
INSERT INTO dbo.Brand
(
	IDBrand,
	Name
)
VALUES
(
	N'A02', --ID
	N'VIETTIEN SMART CASUAL'--Name
)

--INSERT STORE
INSERT INTO dbo.Store
(
	IDBrand,
	IDStore,
	CITY_PROVINCE,
	TOWN_DISTRICT,
	Locations,
	Phone
)
VALUES
(
	N'A01',
	N'1',
	N'quanh ninh',
	N'uong bi',
	N'557 QUANG TRUNG ',
	'0968745121'
)
INSERT INTO dbo.Store
(
	IDBrand,
	IDStore,
	CITY_PROVINCE,
	TOWN_DISTRICT,
	Locations,
	Phone
)
VALUES
(
	N'A02',
	N'5',
	N'binh duong',
	N'tp thu dau mot',
	N'127-128 YERSIN',
	'0937200455'
)
INSERT INTO dbo.SubType
(
	Gender,
	AGE,
	Typee,
	IDSubType,
	IDBrand
)
VALUES
(
	N'F',
	N'20-25',
	N'ÁO CÔNG SỞ',
	N'001',
	N'A02'
)
INSERT INTO dbo.Typ
(
	TypeName,
	STYLE,
	IDSubType,
	IDType
)
VALUES
(
	N'ÁO SƠ MI',
	N'DÀI TAY',
	N'001',
	N'001'
)
INSERT INTO dbo.Product
(
	IDProduct ,
	NameProduct ,
	ProductQuantity ,
	Price ,
	Color ,
	Material ,
	Pattern,
	Form ,
	IDType
)
VALUES
(
	N'8M0186NT4/L7V',
	N'ÁO SƠ MI DÀI TAY',
	1000,
	475000,
	N'WHITE',
	N'60%COTTON-40%POLY',
	N'TRƠN',
	N'REGULAR FIT',
	N'001'
)
DROP TABLE Brand