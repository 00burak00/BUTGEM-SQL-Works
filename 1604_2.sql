CREATE DATABASE BUTGEMSIRKET
USE BUTGEMSIRKET
CREATE TABLE PERSONEL
(
id int primary key not null identity(1,1),
ad nvarchar(20) not null,
soyad nvarchar(20) not null,
bolum nvarchar(30) not null check (bolum in('kumaþ kesim','dikim','ütü','satýþ')),
--maas int not null check (maas>=4250 and maas<=1000)
maas int not null check (maas BETWEEN 4250 and 10000),
istarih date not null check (istarih>='2001-01-01') default GETDATE() 
)