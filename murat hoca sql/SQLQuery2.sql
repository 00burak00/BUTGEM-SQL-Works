create database OKULYAZILIM
use tbl2

create table tblTur(
no int not null primary key identity(1,1),
adi nvarchar(50) not null unique
)
create table TblYazar(
no int not null primary key identity(1,1),
ad nvarchar(50) not null,
soyad nvarchar(50) not null
)

create table tblKitap(
no int not null unique ,
isbnno nvarchar(13) not null primary key,
adi nvarchar(100) not null,
yazarno int not null foreign key references tblYazar(no),
turno int not null foreign key references tblTur(no),
sayfasayisi int not null check (sayfasayisi >= 200),
puan int not null
)

create table tblOgrenci(
no nvarchar(4) not null primary key,
ad nvarchar(20) not null,
soyad nvarchar(20) not null,
cinsiyet nvarchar(7) not null,
dtarih date not null,
sinif nvarchar(20) not null,
puan int not null
)

create table tblIslemler
(
no int not null primary key identity(1,1),
ogrno nvarchar(4) not null foreign  key references tblOgrenci(no),
isbnno nvarchar(13) not null unique foreign key references tblKitap(isbnno),
atarih date not null default getdate(),
vtarih date not null
)