--TSQL KOMUTLARI--
--De�i�ken tan�mlama
declare @s1 int,@s2 int,@s3 int
set @s1=10
set @s2=20
set @s3=@s1+@s2
print('1. say�:'+convert(varchar(3),@s1))
print('2. say�:'+convert(varchar(3),@s2))
print('Toplam:'+convert(varchar(3),@s3))

--Tablo Tipi de�i�ken
declare @ogrtbl TABLE(
ad nvarchar(20),
soyad nvarchar(30),
numara int
)
insert into @ogrtbl values('�brahim','TOPTA�',275)
insert into @ogrtbl values('Burak','�ZDO�RU',575)
insert into @ogrtbl values('Fatma','ALTIN',675)
insert into @ogrtbl values('Melike','��M�EK',975)
select * from @ogrtbl
go

--if kontrol deyimi
use Hollywood
select * from Oyuncular
select * from Filmler
select * from OyuncuFilm
print('Tom Hanks')
-- Tom Hanksin filmi var m�? varsa filmlerin adlar�n� yaz�n�z..
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
--Products tablosunda �r�n ad�,kategori ad�,
--unitprice 100 ve �zeri olanlara Pahal�
--alt�nda olanlara Uygun

use NORTHWND
select Productname,CategoryID,UnitPrice,'Durum'=
case when UnitPrice>=100 then 'Pahal�'
else
'Uygun'
end
from Products
-- ��inde bulundu�umuz y�l tek mi �ift mi?
select year(getdate()), 'y�l'=
case when year(getdate())%2=0 then '�ift y�l'
else
'Tek y�l'
end 

if(year(getdate())%2=0)
print('�ift y�l')
else
print('Tek y�l')

