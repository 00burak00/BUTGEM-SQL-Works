create database OgrenciDatabase
use OgrenciDatabase

create table Bolum(
BolumNo int primary key not null,
BolumAdi nvarchar(30) not null,
)

create table Ogrenci(
OgrenciNo int primary key not null,
OgrenciAdi nvarchar(20) not null,
OgrenciSoyadi nvarchar(20) not null,
OgrenciTel nvarchar(20) not null,
OgrenciAdres nvarchar(20) not null,
BolumNo int not null foreign key references Bolum(BolumNo)
)



create table Ders(
DersNo int primary key not null,
DersAdi nvarchar(15) not null,
DersKredi int not null,
BolumNo int not null foreign key references Bolum(BolumNo),
)

create table Puan(
OgrenciNo int not null foreign key references Ogrenci(OgrenciNo),
DersNo int not null foreign key references Ders(DersNo),
VizePuan int not null,
FinalPuan int not null
)

select * from Bolum
select * from Ders
select * from Ogrenci
select * from Puan

select * from Puan where VizePuan >= 80 

select * from Puan where FinalPuan <= 50 

select count (distinct BolumAdi) from Bolum

select distinct BolumAdi from Bolum