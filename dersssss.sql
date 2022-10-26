use Kutuphane
create procedure prmogrkitapyazar @ad nvarchar(20)
as
begin
select TblOgrenci.ad,tblogrenci.soyad,tblkitap.adi,tblyazar.ad,tblyazar.soyad from TblOgrenci,TblIslemler,tblkitap,TblYazar where tblogrenci.no=TblIslemler.ogrno
and TblIslemler.isbnno=tblkitap.isbnno and tblkitap.yazarno=tblyazar.no and tblogrenci.ad=@ad
end

exec prmogrkitapyazar 'tolunay'
select * from TblIslemler
select * from TblKitap
select * from TblOgrenci
select * from tbltur
select * from tblyazar
--parametre olarak girilen kitap t�r�nde olan kitaplar ve yazarlar
--listesini veren procedure(prmturkitapyazar)
select * from tbltur
create procedure prmturkitapyazar2 @adi nvarchar(30)
as
begin
select * from TblKitap,TblYazar,TblTur where TblKitap.yazarno=TblYazar.no and tbltur.no=TblKitap.turno  and TblTur.adi=@adi
end
exec prmturkitapyazar2 'Tarih'

--kitap say�s� geri d�nd�ren kitapsay procedure
create procedure kitapsay
@sayi int output
as
begin
select @sayi=count(no) from TblKitap
end
declare @ksay int
exec kitapsay @ksay output
print @ksay

--tarhi kitap t�r�nde olan kitap says�n� bulan
--parametreli ve kitap  say�s�n� d�nd�ren procedure

create procedure pkitapsay @turu nvarchar(50),@sayi int output
as
begin
select count(tblkitap.no),tbltur.adi from tblKitap,tbltur where 
tblkitap.turno=tbltur.no and tbltur.adi=@turu group by tbltur.adi
end
declare @sonuc int
exec pkitapsay 'tarih',@sonuc output 
print 'tarih t�r�ndeki kitap say�s�:'+cast(@sonuc as varchar) 
--print 'tarih t�r�ndeki kitap say�s�:'+convert(varchar,@sonuc)

select * from TblOgrenci

--oarametre olarak girilen ��rencinin ka� farkl� kitap yazar�ndan 
--kitap okudu�unu d�nd�ren procedure
create procedure ogrencicesit @ad nvarchar(30),@soyad nvarchar(30),@sayi int output
as
begin
select @sayi=count(TblIslemler.ogrno) from TblOgrenci,
TblIslemler,TblKitap,TblYazar where TblOgrenci.no=TblIslemler.ogrno and TblIslemler.isbnno=
TblKitap.isbnno and TblKitap.yazarno=TblYazar.no and 
TblOgrenci.ad=@ad and TblOgrenci.soyad=@soyad group by TblOgrenci.ad,TblOgrenci.soyad
end
declare @sonuc int 
exec ogrencicesit 'Tolunay' ,'�zcan',@sonuc output 
print @sonuc



