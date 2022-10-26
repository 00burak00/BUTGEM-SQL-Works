create database OKULBUTGEM
use OKULBUTGEM



create table Bolum(
Bolumkod int primary key not null,
BolumAd nvarchar(30) not null
)
create table Ogrenciler(
OgrNo int not null primary key,
ogrTc decimal not null unique,
ogrAd nvarchar(20) not null ,
OgrSoyad nvarchar(20) not null,
bolumid int not null foreign key references Bolum(Bolumkod),
OgrDtarih date not null,
Yabanci_dil nvarchar(12)
)
create table Hocalar(
HNo int primary key not null,
Htc decimal not null,
Had nvarchar(40) not null,
Hsoyad nvarchar(30) not null,
HDtarihi date not null
)


create table Dersler(
dersNo int not null primary key,
DersAdi nvarchar(30) not null,
H_id int not null foreign key references Hocalar(Hno)
)

create table Notlar(
S_no int primary key not null,
Ogr_id int  not null foreign key references Ogrenciler(OgrNo),
ders_id int not null foreign key references Dersler(DersNo) ,
vize int not null,
final int not null,
)

insert into Hocalar values(50,278557,'Deniz','Çatmalý','1979-06-08')
insert into Hocalar values(60,785555,'Murat','Çatmalý','1979-02-12')
insert into Hocalar values(70,788545,'Mert','Çiçek','1980-08-10')
insert into Hocalar values(80,532348,'Zeynep','Demir','1995-05-30')
insert into Hocalar values(90,851247,'Ömer','Bayram','1990-09-12')
select * from Hocalar

insert into Dersler values(1000,'VTYS',50)
insert into Dersler values(1001,'Asp.net',50)
insert into Dersler values(1002,'Matematik',50)
insert into Dersler values(1003,'Html/Css',50)
insert into Dersler values(1004,'Tarih',50)
insert into Dersler values(1005,'Fizik',50)
select * from Dersler

insert into Bolum values(100,'Biliþim Teknolojileri')
insert into Bolum values(200,'Muhasebe')
insert into Bolum values(300,'Elektrik/Elektronik')
insert into Bolum values(400,'Otomasyon')
insert into Bolum values(500,'Tekstil')
select * from Bolum

insert into Ogrenciler values(10,1124578,'Burak','Aysel',100,'1993-03-10','Ýngilizce')
insert into Ogrenciler values(11,1247855,'Atahan','Özkelebek',400,'1993-03-10','Ýngilizce')
insert into Ogrenciler values(12,4782255,'Beyza','Akdað',200,'1993-03-10','Ýngilizce')
insert into Ogrenciler values(13,2785252,'Ayþegül','Bayraktar',500,'1993-03-10','Ýngilizce')
insert into Ogrenciler values(14,7875552,'Fuat','Süleyman',300,'1993-03-10','Ýngilizce')
insert into Ogrenciler values(15,2244488,'Seda','Aydemir',300,'1993-03-10','Ýngilizce')
select * from Ogrenciler

insert into Notlar values(1,10,1002,78,90)
insert into Notlar values(3,11,1001,50,60)
insert into Notlar values(4,12,1002,85,70)
insert into Notlar values(5,13,1004,30,50)
insert into Notlar values(6,12,1003,60,90)
insert into Notlar values(7,14,1005,38,57)
insert into Notlar values(8,15,1003,80,85)
insert into Notlar values(9,13,1002,65,92)
insert into Notlar values(10,14,1001,65,90)
insert into Notlar values(11,12,1004,90,95)

select * from Ogrenciler
select * from Hocalar
select * from Bolum
select * from Dersler
select * from Notlar

--5
alter table Notlar add check(final >= 50)

--6
select BolumAd,count(bolumid) as [kayýtlý sayý]from Bolum,ogrenciler where ogrenciler.bolumid=
bolum.Bolumkod group by BolumAd

--7
select OGrenciler.ogrAd,ogrenciler.OgrSoyad,Bolum.BolumAd ,vize*4/10+final*6/10 as[Ortalama] 
from dersler,notlar,Ogrenciler,Bolum where dersler.dersNo=Notlar.ders_id and Notlar.
Ogr_id=ogrenciler.OgrNo and Bolum.Bolumkod=Ogrenciler.bolumid  and Dersler.DersAdi='Asp.net' 

--8
select ogrenciler.OgrNo,OgrDtarih,Bolum.BolumAd,Hocalar.Had,Hocalar.Hsoyad
from ogrenciler,Bolum,Hocalar,Dersler,notlar  where Bolum.Bolumkod=Ogrenciler.bolumid 
and ogrenciler.OgrNo=Notlar.Ogr_id and dersler.dersNo=Notlar.ders_id and
Dersler.H_id= Hocalar.HNo and Dersler.DersAdi='Asp.net' order by OgrDtarih desc

--9
select Ogrenciler.ogrAd,ogrenciler.OgrSoyad,Dersler.DersAdi,Hocalar.Had,Hocalar.Hsoyad 
from Bolum join ogrenciler on bolum.Bolumkod=Ogrenciler.bolumid join Notlar on 
Notlar.Ogr_id=Ogrenciler.OgrNo join Dersler on Dersler.dersNo=Notlar.ders_id join 
Hocalar on Hocalar.HNo=H_id where Bolum.Bolumkod=100

--10
select dersler.DersAdi,COUNT(dersler.DersAdi) from Dersler,Bolum,ogrenciler,Notlar where 
Dersler.dersNo=Notlar.ders_id and Notlar.Ogr_id=Ogrenciler.OgrNo and 
ogrenciler.bolumid=Bolum.Bolumkod group by dersler.DersAdi