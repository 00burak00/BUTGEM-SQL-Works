use Kutuphane

create table TblOkuyucu(
TCkimlik nvarchar(11) null,
unvan nvarchar(30) not null,
ad nvarchar(20) null,
soyad nvarchar(20),
cinsiyet nvarchar(7),
dtarih date,
telefon nvarchar(11) not null,
sinif nvarchar(20) not null,
puan int null,
no int  not null,
) 