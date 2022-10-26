create database sinavGaleri
use sinavGaleri

create table Musteri(
mno int identity(1,1) not null primary key,
Madi nvarchar(30) not null,
Msoyadi nvarchar(30) not null,
Madres nvarchar(250) not null,
Mtelefon decimal(11) not null
)
create table Arac(
aracno int identity(1,1) not null primary key,
model int not null ,
Marka nvarchar(25) not null,
Plaka nvarchar(15) not null,
Fiyat money not null 
)

create table Satis(
satno int not null identity(1,1) primary key,
mno int not null foreign key references Musteri(mno),
Aracno int not null foreign key references arac(aracno),
sat_Tarihi date not null,
Sfiyati money not null
)

create table alim(
AlimNo int identity(1,1) not null,
Mno int not null foreign key references Musteri(mno),
Aracno int not null foreign key references arac(aracno),
alim_Tarihi date not null,
Afiyat money not null
)

insert into Musteri values('Turgut','Özseven','Turhal/Tokat',03562222222)
insert into Musteri values('Mustafa','Çaðlayan','Meram/Konya',05112111111)
insert into Musteri values('Ahmet','Kara','Zile/Tokat',03563333333)
insert into Musteri values('Murat','Beyaz','Turhal/Tokat',03565555555)
insert into Musteri values('Elif','Kurt','Beþiktaþ/Ýstanbul',05781471414)
insert into Musteri values('Ayþe','Uçar','Taþova/Amasya',035866666666)
insert into Musteri values('Bülent','Ayar','Turhal/Tokat',03568888888)
select * from Musteri

insert into Arac values(2004,'Fiat Marea','60TT6060',16000)
insert into Arac values(2000,'Reanult Megane','60TT6061',14000)
insert into Arac values(2007,'Ford Focus','60TT6062',28000)
insert into Arac values(2005,'Volkswagen Golf','60TT6063',26000)
insert into Arac values(1998,'Opel Astra','60TT6064',9000)
select * from Arac

insert into Satis values(1,1,'2010-05-04',17000)
insert into Satis values(4,5,'2010-01-06',11500)
insert into Satis values(7,4,'2010-06-15',27000)
insert into Satis values(2,1,'2010-02-07',17500)
select * from Satis

insert into alim values(3,1,'2010-02-08',15000)
insert into alim values(6,1,'2010-04-12',15500)
insert into alim values(2,5,'2010-04-15',9500)
insert into alim values(1,2,'2010-05-15',14000)
insert into alim values(5,3,'2010-08-22',26000)

select *from Musteri
select *from Arac
select *from alim
select *from Satis
--1
select  Madi,Msoyadi from Musteri,Satis where Musteri.mno=Satis.mno
--2
select  Madi,Msoyadi,alim.aracno,Marka,model from Musteri,alim,Arac 
where Musteri.mno=alim.mno and alim.Aracno=arac.aracno
--3
select Madi,Msoyadi,count(alim.Aracno) from Musteri,alim 
where alim.Mno=musteri.mno group by Madi,Msoyadi
--4
select marka,model from Arac,Satis where arac.aracno=Satis.Aracno
--5
select sum(alim.Afiyat) as [Alým Fiyatý Toplamý],SUM(Satis.Sfiyati) as
[Satýþ Fiyat Toplamý],sum(satis.Sfiyati-alim.Afiyat) as [Aralarýndaki fark] from alim,Satis 
--6
select arac.aracno,arac.model,arac.Marka from arac where  
arac.aracno not in (select Satis.satno from Satis)
--7
select aracno,Marka,avg(fiyat) as ortalama from Arac group by aracno,marka
select Arac.aracno,Marka,avg(fiyat) as ortalama from 
Arac,Satis where Satis.Aracno = arac.aracno group by Arac.aracno,Marka
--8
select arac.Marka,arac.model,COUNT(alim.Aracno) as [Alým Sayýsý],
count(Satis.Aracno) as [Satýþ Sayýsý] from Arac,alim,satis where Arac.aracno= 
alim.Aracno and Arac.aracno=Satis.Aracno group by arac.Marka,Arac.model

--9
--select *from alim,musteri where Musteri.mno=alim.Mno and Afiyat in (select )
--Satis,Musteri where Musteri.mno=Satis.mno and Sfiyati > 20000  

--10

select Madi,Msoyadi,Marka,model,Madres from Musteri, Satis,Arac where musteri.mno= Satis.mno and arac.aracno=Satis.Aracno and Madres like '%Tokat%'