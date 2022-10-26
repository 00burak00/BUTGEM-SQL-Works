select * from TblOgrenci
--ad� ve soyad� k���k harfe �eviren fonksiyon kucuk
alter function kucuk(@a nvarchar(20),@b nvarchar(20))
returns nvarchar(40)
as 
begin
return lower(@a)+' '+lower(@b)
end
go

select lower(ad) from TblOgrenci
select dbo.kucuk(ad,soyad) from TblOgrenci

--parametre olarak g�nderilen say� pozitif ise
--'Say� pozitif', negatif ise
--'Say� negatif' ya da 'Say� 0' d�nd�ren isaret fonksiyonu yaz�n�z
alter function isaret(@sayi int)
returns nvarchar(50)
as
begin
declare @sonuc nvarchar(50)
if @sayi>0
set @sonuc= 'Say� + pozitif'
if @sayi<0
set @sonuc= 'Say� - negatif'
if @sayi=0
set @sonuc= 'Say� 0'
return @sonuc
end
go
select dbo.isaret(10)

create function isaret2(@sayi int)
returns int
as
begin
if @sayi>0
return 1
if @sayi<0
return -1
return 0
end
go
 
 select dbo.isaret2(0)
  select dbo.isaret2(-76)
    select dbo.isaret2(176)
--ogrenci no parametre al�p ��rencinin okudu�u kitap say�s�n� d�nd�ren
--ogrkitapsay isimli fonks.

create function ogrkitapsay(@nosu nvarchar(4))
returns int
as
begin
return (select count(*) from TblIslemler where TblIslemler.ogrno=@nosu)
end

select dbo.ogrkitapsay(858)
as [Okudu�u Kitap Say�s�]
----ogrenci no parametre al�p 
--��rencinin okudu�u kitap say�s�n� d�nd�ren
--ogrkitapsay isimli procedure.

create procedure ogrkitapsay1
@nosu nvarchar(4),@sayi int output
as
begin
select @sayi=count(*) from TblIslemler where TblIslemler.ogrno=@nosu
end

declare @sonuc int
exec ogrkitapsay1 '858',@sonuc output
print @sonuc

--Girilen 1. parametreninn 
--2.parametreye tam b�l�n�p b�l�nmedi�ini yazd�ran fonksiyonu yap�n�z.

alter function bolum(@s1 int,@s2 int)
returns nvarchar(50)
as
begin
declare @durum nvarchar(50)
if @s1%@s2=0 set @durum= cast(@s1 as nvarchar)+' say�s� '+cast(@s2 as nvarchar)+' say�sana tam b�l�n�r'
else
set @durum= cast(@s1 as nvarchar)+' say�s� '+cast(@s2 as nvarchar)+' say�sana tam b�l�nemez'
return @durum
end

select dbo.bolum(8,2) as [Tam B�l�nme durumu]

--Girilen iki parametreyi birbirinden ��kar�p 
--geriye pozitif sonuc d�nd�ren fonksiyon olu�turunuz.

alter function cikar(@s1 int,@s2 int)
returns nvarchar(100)
as
begin
declare @sonuc  nvarchar(100)
set @sonuc=cast(@s1 as nvarchar)+' say�s�ndan '+cast(@s2 as nvarchar)+
' ��kar�ld���nda, sonucun mutlak de�eri '+cast(abs(@s1-@s2) as nvarchar)

return @sonuc
end
select dbo.cikar(5,8) as [Mutlak fark]

--Tablo de�erli fonksiyonlar (Table-valued functions)
--parametre olarak girilen ��renci ad�na g�re okunan kitap ad�,yazar ad�
--ve soyad�n� bulan fonksiyon
alter function ogrkitapyazarbul1(@adi nvarchar(20))
returns table
as
return (select TblOgrenci.ad as ograd, TblOgrenci.soyad as ogrsoyad,
TblKitap.adi,TblYazar.ad as yazad,TblYazar.soyad
from TblOgrenci,TblIslemler,TblKitap,TblYazar
where TblOgrenci.no=TblIslemler.ogrno
and TblIslemler.isbnno=TblKitap.isbnno
and TblKitap.yazarno=TblYazar.no
and TblOgrenci.ad=@adi)
go
use Kutuphane
select * from dbo.ogrkitapyazarbul1('emrah')

-----T�r� parametre olan girilen filmlerin Adlar�n� ve IMDB Puanlar�n� 
--table d�nd�re fonksiyon ile haz�rlay�n�z
use Hollywood
select Filmler.FAd as [Film Ad�],filmler.IMDBPuan as[Puan],Turler.TurAd from Filmler
inner join FilmTur on filmler.FilmID=FilmTur.FilmID
inner join Turler on FilmTur.TurID=Turler.TurID where turler.TurAd='Macera'

create function fti(@tur nvarchar(20))
returns table
as

return (select Filmler.FAd as [Film Ad�],filmler.IMDBPuan as[Puan],Turler.TurAd from Filmler
inner join FilmTur on filmler.FilmID=FilmTur.FilmID
inner join Turler on FilmTur.TurID=Turler.TurID where turler.TurAd=@tur)

select * from dbo.fti('macera')

----Tablo olu�turup d�nd�re fonksiyonlar (aggregate functions)
--parametre olarak girilen ��renci ad�na g�re okunan kitap ad�,yazar ad�
--ve soyad�n� bulan fonksiyon
create function ogrkitapyazarbult(@adi nvarchar(20))
returns @ogrkitapyazartablo table(
 tad nvarchar(20),
 tsoyad nvarchar(20),
 tkad nvarchar(100),
 tyad nvarchar(50),
 tysoyad nvarchar(50)
) 
as
begin
 insert into @ogrkitapyazartablo(tad, tsoyad,tkad,tyad,tysoyad )  
 (select TblOgrenci.ad as ograd, TblOgrenci.soyad as ogrsoyad,
TblKitap.adi,TblYazar.ad as yazad,TblYazar.soyad
from TblOgrenci,TblIslemler,TblKitap,TblYazar
where TblOgrenci.no=TblIslemler.ogrno
and TblIslemler.isbnno=TblKitap.isbnno
and TblKitap.yazarno=TblYazar.no
and TblOgrenci.ad=@adi)
return
end
go
use Kutuphane
select * from dbo.ogrkitapyazarbult('emrah')