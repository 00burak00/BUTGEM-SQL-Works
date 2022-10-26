--1-soru
create table Gorevler (
GoreviID int not null primary key ,
GoreviAdi varchar(20) not null
)
create table Egitim(
ID int not null primary key,
EgitimAdi varchar(50) not null
)
create table Personel(
PersonelID int primary key not null,
PersonelAdSoyad varchar(30) not null,
Gorevi int not null foreign key references Gorevler(GoreviId),
Maas money not null,
Yasi int not null,
GirisYili int not null,
EgitimDerecesi int not null foreign key references Egitim(ID)
)