use OkulMayis_2022
select * from Ogrenciler
update Ogrenciler set Yabanci_Dil='Fransýzca' where
OgrAd='Ayþegül' and OgrSoyad='Bayraktar'
select * from Ogrenciler

--procedure nasýl çaðrýlýr
use NORTHWND
exec CustOrdersDetail 10250

--prosedür oluþturma
use OgrenciDatabase

CREATE PROCEDURE ogrliste 	
AS
BEGIN
	select * from Ogrenci
END
GO

---procedure çalýþtýrma
exec ogrliste


--ogrencidersleri adýnda bir procedure hazýrlayýnýz. her bir öðrencin
--adýný,soyadýný,dersinadýný, vize, final notlarýný listelesin

create procedure ogrencidersleri
as
begin
select ogrenci.OgrenciAdi,ogrenci.OgrenciSoyadi,Ders.DersAdi,Puan.VizePuan,
Puan.FinalPuan from ogrenci 
inner join puan on ogrenci.OgrenciNo=Puan.OgrenciNo
inner join Ders on Ders.DersNo=Puan.DersNo order by ogrenci.OgrenciAdi
end

exec ogrencidersleri

--herbir bölüm için bu bölüme kayýtlý öðrenci sayýsýný bulan 
--procedeure bolumogrsay
select * from Ogrenci
select * from bolum
create procedure bolumogrsay
as
begin
select bolum.BolumAdi,count(Ogrenci.OgrenciNo) as [Kayýt Sayýsý]
from bolum,Ogrenci where Bolum.BolumNo=Ogrenci.BolumNo
group by bolum.BolumAdi
end
exec bolumogrsay
--ogrenciler tablosuna kendi bilgileriniz ekleyeb ogrekle procedure
--hazýrlayýnýz. bolumid ve yabancýdil için yerel deðiþkenler kullanýnýz
--declare @bol int=300
create procedure ogrekle
as
begin
declare @bol int=300
declare @ydil nvarchar='Fransýzca'
insert into Ogrenciler 
values(35024547854,'Fatmanur','ALTIN',@bol,'1994-07-30',@ydil)
end
select * from Ogrenciler
exec ogrekle









