create database butgemRestaurant
use butgemRestaurant



create table mutfaklar(
mutfakId int not null primary key ,
tanim nvarchar(20) not null
)

create table mekanlar(
mekanId int not null primary key,
mekanAdi nvarchar(20) not null

)

create table ilTablo(
ilId int not null primary key,
tanim nvarchar(20) not null
)
create table ilce(
ilceId int not null primary key,
tanim nvarchar(20) not null
)

create table yerSecimi(
yerSecimId int not null primary key  ,
ilId int not null foreign key references ilTablo(ilId),
ilceId int not null foreign key references ilce(ilceId),
mutfakId int not null foreign key references mutfaklar(mutfakId),
mekanId int not null foreign key references mekanlar(mekanId) 
)


create table rezervasyon(
rezarvasyonId int not null primary key,
rezarvasyonTarihi date not null,
rezarvasyonSaati datetime not null,
kisiSayisi int not null
)

create table musteriler(
musteriId int not null primary key,
musteriAd nvarchar(20) not null,
musteriSoyad nvarchar(20) not null,
rezarvasyonId int not null foreign key references rezervasyon(rezarvasyonId),
musteriMail nvarchar(50) not null,
Acýklama nvarchar(150) not null
)