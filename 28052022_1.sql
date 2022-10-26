--TSQL KOMUTLARI--
--Değişken tanımlama
declare @s1 int,@s2 int,@s3 int
set @s1=10
set @s2=20
set @s3=@s1+@s2
print('1. sayı:'+convert(varchar(3),@s1))
print('2. sayı:'+convert(varchar(3),@s2))
print('Toplam:'+convert(varchar(3),@s3))

--Tablo Tipi değişken
declare @ogrtbl TABLE(
ad nvarchar(20),
soyad nvarchar(30),
numara int
)
insert into @ogrtbl values('İbrahim','TOPTAŞ',275)
insert into @ogrtbl values('Burak','ÖZDOĞRU',575)
insert into @ogrtbl values('Fatma','ALTIN',675)
insert into @ogrtbl values('Melike','ŞİMŞEK',975)
select * from @ogrtbl
go

--if kontrol deyimi
use Hollywood
select * from Oyuncular
select * from Filmler
select * from OyuncuFilm
print('Tom Hanks')
-- Tom Hanksin filmi var mı? varsa filmlerin adlarını yazınız..
if exists(select * from Oyuncular,OyuncuFilm 
where Oyuncular.OyuncuID=OyuncuFilm.OyuncuID 
and Oyuncular.OAd='Tom' and Oyuncular.OSoyad='Hanks')
begin
print('Var')
select * from Oyuncular,OyuncuFilm,Filmler 
where Oyuncular.OyuncuID=OyuncuFilm.OyuncuID and
Filmler.FilmID=OyuncuFilm.FilmID
and Oyuncular.OAd='Tom' and Oyuncular.OSoyad='Hanks'
end
else
begin
print('Yok')
end
--Products tablosunda ürün adı,kategori adı,
--unitprice 100 ve üzeri olanlara Pahalı
--altında olanlara Uygun

use NORTHWND
select Productname,CategoryID,UnitPrice,'Durum'=
case when UnitPrice>=100 then 'Pahalı'
else
'Uygun'
end
from Products
-- İçinde bulunduğumuz yıl tek mi çift mi?
select year(getdate()), 'yıl'=
case when year(getdate())%2=0 then 'Çift yıl'
else
'Tek yıl'
end 

if(year(getdate())%2=0)
print('Çift yıl')
else
print('Tek yıl')

