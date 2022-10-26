use Kutuphane
select * from TblOgrenci
create procedure ogrliste
as
begin
select * from TblOgrenci
end
exec ogrliste
--hangi ��renci, hangi yazara ait hangi kitab� �d�n� alm��
select * from TblOgrenci
select * from TblYazar
select * from TblKitap
select * from TblIslemler
create procedure ogrkitapyazar
as
begin
select TblOgrenci.ad, TblOgrenci.soyad,
TblKitap.adi,TblYazar.ad,TblYazar.soyad
from TblOgrenci,TblIslemler,TblKitap,TblYazar
where TblOgrenci.no=TblIslemler.ogrno
and TblIslemler.isbnno=TblKitap.isbnno
and TblKitap.yazarno=TblYazar.no
end
exec ogrkitapyazar

--emrah isimli ��renci ��renci, hangi yazara ait hangi kitab� �d�n� alm��
select TblOgrenci.ad, TblOgrenci.soyad,
TblKitap.adi,TblYazar.ad,TblYazar.soyad
from TblOgrenci,TblIslemler,TblKitap,TblYazar
where TblOgrenci.no=TblIslemler.ogrno
and TblIslemler.isbnno=TblKitap.isbnno
and TblKitap.yazarno=TblYazar.no
and TblOgrenci.ad='Emrah'
-- .. isimli ��renci, hangi yazara ait hangi kitab� �d�n� alm��
create procedure prmogrkitapyazar @ad nvarchar(20)
as
begin
select TblOgrenci.ad, TblOgrenci.soyad,
TblKitap.adi,TblYazar.ad,TblYazar.soyad
from TblOgrenci,TblIslemler,TblKitap,TblYazar
where TblOgrenci.no=TblIslemler.ogrno
and TblIslemler.isbnno=TblKitap.isbnno
and TblKitap.yazarno=TblYazar.no
and TblOgrenci.ad=@ad
end
exec prmogrkitapyazar 'tolunay'

--parametre olarak girilen kitap t�r�nde olan kitaplar ve yazarlar 
--listesini veren procedure(prmturkitapyazar)
select * from TblTur
create procedure prmturkitapyazar @turad nvarchar(50)
as
begin
select TblTur.adi,TblKitap.adi,TblYazar.ad,TblYazar.soyad
from TblTur inner join TblKitap on TblKitap.turno=TblTur.no
inner join TblYazar on TblYazar.no=TblKitap.yazarno
where TblTur.adi=@turad
end
exec prmturkitapyazar 'macera'

--kitap say�s�n� geri d�nd�ren kitapsay procedure
create procedure kitapsay
@sayi int output
as
begin
select @sayi=count(no) from TblKitap
end

declare @ksay int
exec kitapsay @ksay output
print @ksay

--tarih kitap t�r�nde olan kitap say�s�n� bulan
--parametreli ve kitap say�s�n� d�nd�ren procedeure

create procedure pkitapsay @turu nvarchar(50),
@sayi int output
as
begin
--select @sayi=count(no) from TblKitap
select @sayi=count(TblKitap.no) from TblKitap,TblTur
where TblKitap.turno=TblTur.no and TblTur.adi=@turu 
group by TblTur.adi
end
declare @sonuc int
exec pkitapsay  'tarih',@sonuc output
print 'tarih t�r�ndeki kitap say�s�:'+ cast(@sonuc as varchar)
--print 'tarih t�r�ndeki kitap say�s�:'+ convert(varchar,@sonuc)
select * from TblOgrenci

--parametre olarak ad� soyad� girlen  ��rencinin ka�  farkl� kitap yazar�ndan kitap okudu�unu
--d�nd�ren procedure
create procedure ogrenciyazarcesit @adi nvarchar(20),@soyadi nvarchar(20),
@sayi int output
as
begin
select @sayi=count(TblIslemler.ogrno) 
from TblIslemler,TblYazar,TblOgrenci,TblKitap
where TblIslemler.ogrno=TblOgrenci.no 
and TblYazar.no=TblKitap.yazarno and TblIslemler.isbnno=TblKitap.isbnno
and TblOgrenci.ad=@adi and TblOgrenci.soyad=@soyadi group by TblOgrenci.ad,TblOgrenci.soyad
end
declare @sonuc int
exec ogrenciyazarcesit 'emrah','emre',@sonuc output
print @sonuc
