select * from TblOgrenci
--adý ve soyadý küçük harfe çeviren fonksiyon kucuk
alter function kucuk(@a nvarchar(20),@b nvarchar(20))
returns nvarchar(40)
as 
begin
return lower(@a)+' '+lower(@b)
end
go

select lower(ad) from TblOgrenci
select dbo.kucuk(ad,soyad) from TblOgrenci

--parametre olarak gönderilen sayý pozitif ise
--'Sayý pozitif', negatif ise
--'Sayý negatif' ya da 'Sayý 0' döndüren isaret fonksiyonu yazýnýz
alter function isaret(@sayi int)
returns nvarchar(50)
as
begin
declare @sonuc nvarchar(50)
if @sayi>0
set @sonuc= 'Sayý + pozitif'
if @sayi<0
set @sonuc= 'Sayý - negatif'
if @sayi=0
set @sonuc= 'Sayý 0'
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
--ogrenci no parametre alýp öðrencinin okuduðu kitap sayýsýný döndüren
--ogrkitapsay isimli fonks.

create function ogrkitapsay(@nosu nvarchar(4))
returns int
as
begin
return (select count(*) from TblIslemler where TblIslemler.ogrno=@nosu)
end

select dbo.ogrkitapsay(858)
as [Okuduðu Kitap Sayýsý]
----ogrenci no parametre alýp 
--öðrencinin okuduðu kitap sayýsýný döndüren
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
--2.parametreye tam bölünüp bölünmediðini yazdýran fonksiyonu yapýnýz.

alter function bolum(@s1 int,@s2 int)
returns nvarchar(50)
as
begin
declare @durum nvarchar(50)
if @s1%@s2=0 set @durum= cast(@s1 as nvarchar)+' sayýsý '+cast(@s2 as nvarchar)+' sayýsana tam bölünür'
else
set @durum= cast(@s1 as nvarchar)+' sayýsý '+cast(@s2 as nvarchar)+' sayýsana tam bölünemez'
return @durum
end

select dbo.bolum(8,2) as [Tam Bölünme durumu]

--Girilen iki parametreyi birbirinden çýkarýp 
--geriye pozitif sonuc döndüren fonksiyon oluþturunuz.

alter function cikar(@s1 int,@s2 int)
returns nvarchar(100)
as
begin
declare @sonuc  nvarchar(100)
set @sonuc=cast(@s1 as nvarchar)+' sayýsýndan '+cast(@s2 as nvarchar)+
' çýkarýldýðýnda, sonucun mutlak deðeri '+cast(abs(@s1-@s2) as nvarchar)

return @sonuc
end
select dbo.cikar(5,8) as [Mutlak fark]

--Tablo deðerli fonksiyonlar (Table-valued functions)
--parametre olarak girilen öðrenci adýna göre okunan kitap adý,yazar adý
--ve soyadýný bulan fonksiyon
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

-----Türü parametre olan girilen filmlerin Adlarýný ve IMDB Puanlarýný 
--table döndüre fonksiyon ile hazýrlayýnýz
use Hollywood
select Filmler.FAd as [Film Adý],filmler.IMDBPuan as[Puan],Turler.TurAd from Filmler
inner join FilmTur on filmler.FilmID=FilmTur.FilmID
inner join Turler on FilmTur.TurID=Turler.TurID where turler.TurAd='Macera'

create function fti(@tur nvarchar(20))
returns table
as

return (select Filmler.FAd as [Film Adý],filmler.IMDBPuan as[Puan],Turler.TurAd from Filmler
inner join FilmTur on filmler.FilmID=FilmTur.FilmID
inner join Turler on FilmTur.TurID=Turler.TurID where turler.TurAd=@tur)

select * from dbo.fti('macera')

----Tablo oluþturup döndüre fonksiyonlar (aggregate functions)
--parametre olarak girilen öðrenci adýna göre okunan kitap adý,yazar adý
--ve soyadýný bulan fonksiyon
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