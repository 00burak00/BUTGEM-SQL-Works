CREATE DATABASE OKULYAZILIM
use OKULYAZILIM
CREATE TABLE TblTur(
no int not null primary key identity(1,1),
adi nvarchar(50) not null unique
)
CREATE Table TblYazar
(
no int not null primary key identity(1,1),
ad nvarchar(50) not null,
soyad nvarchar(50) not null
)
CREATE TABLE TblKitap
(
no int not null unique,
isbnno nvarchar(13) not null primary key,
adi nvarchar(100) not null,
yazarno int not null foreign key references TblYazar(no),
turno int not null foreign key references TblTur(no),
sayfasayisi int not null check (sayfasayisi>=200),
puan int not null
)
CREATE TABLE TblOgrenci
(
no nvarchar(4) not null primary key,
ad nvarchar(20) not null,
soyad nvarchar(20) not null,
cinsiyet nvarchar(7) not null,
dtarih date not null,
sinif nvarchar(20) not null,
puan int not null
)

CREATE TABLE TblIslemler
(
no int not null primary key identity(1,1),
ogrno nvarchar(4) not null foreign key references TblOgrenci(no),
isbnno nvarchar(13) not null unique foreign key references TblKitap(isbnno),
atarih date not null default GETDATE(),
vtarih date not null
)

