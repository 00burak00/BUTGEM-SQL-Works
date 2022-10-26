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
--parametre olarak girilen kitap türünde olan kitaplar ve yazarlar
--listesini veren procedure(prmturkitapyazar)
select * from tbltur
create procedure prmturkitapyazar2 @adi nvarchar(30)
as
begin
select * from TblKitap,TblYazar,TblTur where TblKitap.yazarno=TblYazar.no and tbltur.no=TblKitap.turno  and TblTur.adi=@adi
end
exec prmturkitapyazar2 'Tarih'

--kitap sayýsý geri döndüren kitapsay procedure
create procedure kitapsay
@sayi int output
as
begin
select @sayi=count(no) from TblKitap
end
declare @ksay int
exec kitapsay @ksay output
print @ksay

--tarhi kitap türünde olan kitap saysýný bulan
--parametreli ve kitap  sayýsýný döndüren procedure

create procedure pkitapsay @turu nvarchar(50),@sayi int output
as
begin
select count(tblkitap.no),tbltur.adi from tblKitap,tbltur where 
tblkitap.turno=tbltur.no and tbltur.adi=@turu group by tbltur.adi
end
declare @sonuc int
exec pkitapsay 'tarih',@sonuc output 
print 'tarih türündeki kitap sayýsý:'+cast(@sonuc as varchar) 
--print 'tarih türündeki kitap sayýsý:'+convert(varchar,@sonuc)

select * from TblOgrenci

--oarametre olarak girilen öðrencinin kaç farklý kitap yazarýndan 
--kitap okuduðunu döndüren procedure
create procedure ogrencicesit @ad nvarchar(30),@soyad nvarchar(30),@sayi int output
as
begin
select @sayi=count(TblIslemler.ogrno) from TblOgrenci,
TblIslemler,TblKitap,TblYazar where TblOgrenci.no=TblIslemler.ogrno and TblIslemler.isbnno=
TblKitap.isbnno and TblKitap.yazarno=TblYazar.no and 
TblOgrenci.ad=@ad and TblOgrenci.soyad=@soyad group by TblOgrenci.ad,TblOgrenci.soyad
end
declare @sonuc int 
exec ogrencicesit 'Tolunay' ,'Özcan',@sonuc output 
print @sonuc



