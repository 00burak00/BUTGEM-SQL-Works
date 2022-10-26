CREATE DATABASE Sirket2
use Sirket2
create table Yonetici
(
yonSosGno int primary key,
yonAdiSoyadi nvarchar(20)
)

create table Bolum
(
bolAd nvarchar(20) not null,
bolNo int identity(1,1) primary key,
yonSosGno int not null foreign key references Yonetici(yonSosGno),
yIsbasTar date not null default getdate(),
sicilId int unique

)
create table Personel
(
sicilNo int primary key,
sosGuvNo int,
ad nvarchar(20),
soyad nvarchar(20),
dtarih date,
adres nvarchar(50),
cins char default 'K',
maas smallmoney default 4250,
bolNo int foreign key references Bolum(bolNo),
ySosGuvNo int foreign key references Yonetici(yonSosGno),
sosYardim char default 'E'
)

drop table Personel