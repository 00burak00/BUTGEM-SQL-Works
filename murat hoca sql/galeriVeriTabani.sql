--Galeri veritabaný oluþturuldu
create database GALERÝ2022
--tablolar oluþturullur
use GALERÝ2022
create table musteri
(
mno int primary key identity(1,1) not null,
madi nvarchar(20) not null default 'Müþteri adi',
msoyadi nvarchar(20) not null,
madres nvarchar(250) not null,
mtel nvarchar(11) not null
)

create table arac(
ano int primary key not null identity(1,1),
model int not null default 2022,
marka nvarchar(50) not null default 'FIAT',
plaka nvarchar(9) not null default '01XX9999',
fiyat money not null
)

create table alim(
alno int primary key not null identity(1,1),
mno int not null foreign key references musteri(mno),
ano int  not null foreign key references arac(ano),
atarih date not null default getdate(),
afiyat money not null
)

create table satis(
sno int primary key not null identity(1,1),
mno int foreign key references musteri(mno),
ano int foreign key references arac(ano),
starihi date not null default getdate(),
sfiyat money not null 
)

--tablolara kayýt ekleme
insert into musteri(Madi,msoyadi,madres,mtel) values('emrah','emre','bursa',056465465)
select * from musteri
insert into musteri values('üzeyir','yildirim','bursa',05131654)

insert into arac (model,marka,plaka,fiyat) values('1996','WolswagenPassat','27an1551','250000')
insert into arac (model,marka,plaka,fiyat) values('1990','TofasSahin','10ank1997','45000')
insert into arac (model,marka,plaka,fiyat) values('2006','BMW','09brk0707','300000')
insert into arac (model,marka,plaka,fiyat) values('2022','Fiat','12krd1234','320000')
insert into arac (model,marka,plaka,fiyat) values('2008','opelastra','07tvf1997','250000')

select* from arac
select* from 

--****************
use NORTHWND
select * from Customers 
insert into Categories(CategoryName) Values ('Yan battý')
--****************
