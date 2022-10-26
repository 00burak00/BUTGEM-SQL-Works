use OkulMayis_2022
select * from Ogrenciler
update Ogrenciler set Yabanci_Dil='Frans�zca' where
OgrAd='Ay�eg�l' and OgrSoyad='Bayraktar'
select * from Ogrenciler

--procedure nas�l �a�r�l�r
use NORTHWND
exec CustOrdersDetail 10250

--prosed�r olu�turma
use OgrenciDatabase

CREATE PROCEDURE ogrliste 	
AS
BEGIN
	select * from Ogrenci
END
GO

---procedure �al��t�rma
exec ogrliste


--ogrencidersleri ad�nda bir procedure haz�rlay�n�z. her bir ��rencin
--ad�n�,soyad�n�,dersinad�n�, vize, final notlar�n� listelesin

create procedure ogrencidersleri
as
begin
select ogrenci.OgrenciAdi,ogrenci.OgrenciSoyadi,Ders.DersAdi,Puan.VizePuan,
Puan.FinalPuan from ogrenci 
inner join puan on ogrenci.OgrenciNo=Puan.OgrenciNo
inner join Ders on Ders.DersNo=Puan.DersNo order by ogrenci.OgrenciAdi
end

exec ogrencidersleri

--herbir b�l�m i�in bu b�l�me kay�tl� ��renci say�s�n� bulan 
--procedeure bolumogrsay
select * from Ogrenci
select * from bolum
create procedure bolumogrsay
as
begin
select bolum.BolumAdi,count(Ogrenci.OgrenciNo) as [Kay�t Say�s�]
from bolum,Ogrenci where Bolum.BolumNo=Ogrenci.BolumNo
group by bolum.BolumAdi
end
exec bolumogrsay
--ogrenciler tablosuna kendi bilgileriniz ekleyeb ogrekle procedure
--haz�rlay�n�z. bolumid ve yabanc�dil i�in yerel de�i�kenler kullan�n�z
--declare @bol int=300
create procedure ogrekle
as
begin
declare @bol int=300
declare @ydil nvarchar='Frans�zca'
insert into Ogrenciler 
values(35024547854,'Fatmanur','ALTIN',@bol,'1994-07-30',@ydil)
end
select * from Ogrenciler
exec ogrekle









