use Kutuphane
select * from TblOgrenci
create procedure ogrliste
as
begin
select * from TblOgrenci
end
exec ogrliste
--hangi öðrenci, hangi yazara ait hangi kitabý ödünç almýþ
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

--emrah isimli öðrenci öðrenci, hangi yazara ait hangi kitabý ödünç almýþ
select TblOgrenci.ad, TblOgrenci.soyad,
TblKitap.adi,TblYazar.ad,TblYazar.soyad
from TblOgrenci,TblIslemler,TblKitap,TblYazar
where TblOgrenci.no=TblIslemler.ogrno
and TblIslemler.isbnno=TblKitap.isbnno
and TblKitap.yazarno=TblYazar.no
and TblOgrenci.ad='Emrah'
-- .. isimli öðrenci, hangi yazara ait hangi kitabý ödünç almýþ
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

--parametre olarak girilen kitap türünde olan kitaplar ve yazarlar 
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

--kitap sayýsýný geri döndüren kitapsay procedure
create procedure kitapsay
@sayi int output
as
begin
select @sayi=count(no) from TblKitap
end

declare @ksay int
exec kitapsay @ksay output
print @ksay

--tarih kitap türünde olan kitap sayýsýný bulan
--parametreli ve kitap sayýsýný döndüren procedeure

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
print 'tarih türündeki kitap sayýsý:'+ cast(@sonuc as varchar)
--print 'tarih türündeki kitap sayýsý:'+ convert(varchar,@sonuc)
select * from TblOgrenci

--parametre olarak adý soyadý girlen  öðrencinin kaç  farklý kitap yazarýndan kitap okuduðunu
--döndüren procedure
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
