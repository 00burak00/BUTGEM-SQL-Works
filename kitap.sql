create database DIJIBIL
on primary 
(
 name = DIJIBIL_Data,
 FILENAME = 'C:\Databases\DIJIBIL_Data.mdf',
 SIZE = 21632KB,
 MAXSIZE = UNLIMITED,
 FILEGROWTH = 16384KB
)

LOG on 
(
 NAME = N'DIJIBIL_Log',
 FILENAME = N'C:\Databases\DIJIBIL_Log.ldf',
 SIZE = 2048KB,
 MAXSIZE = 2048GB,
 FILEGROWTH = 16384KB 
)
go

EXEC sp_helpdb 'DIJIBIL';

USE DIJIBIL
GO
CREATE TABLE diji_Kullanicilar(
 kul_ID INT NOT NULL,
 kul_ad VARCHAR(20) NOT NULL,
 kul_soyad VARCHAR(20) NOT NULL,
 kul_telefon VARCHAR(11) NULL,
 kul_email VARCHAR(320) NOT NULL
);
EXECUTE sp_help diji_Kullanicilar

alter database DIJIBIL modify file
(
name = DIJIBIL_Data,
SIZE = 120MB,
MAXSIZE = 300MB
)

alter table diji_Kullanicilar add kul_adres varchar(150) null,
kul_kayitTarih datetime not null default getdate()
select* from diji_Kullanicilar
create table KodLab
(
ad nvarchar(20)
)
drop table KodLab

use DIJIBIL

create

SELECT
 ProductID, Name,
 COALESCE(Color,’Renk Yok’) AS Renk
FROM
 Production.Product; SELECT
 COALESCE(Title,’Kayýt Yok’),
 FirstName,
 COALESCE(MiddleName,’Kayýt Yok’),
 LastName
FROM
 Person.Person;