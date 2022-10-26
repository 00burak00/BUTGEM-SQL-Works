--tsq komutlarý--
--Deðiþken tanýmlama
declare @s1 int, @s2 int,@s3 int
set @s1=10
set @s2 = 20

set @s3=@s1+@s2
print ('1.Sayý:'+ convert(varchar(3),@s1))
print ('2.Sayý:'+ convert(varchar(3),@s2))
print ('3.Sayý:'+ convert(varchar(3),@s3))

--Tablo tipi deðiþken
declare @ogrtabl Table(
ad nvarchar(20),
soyad nvarchar(30),
numara int
)
insert into @ogrtabl values('Ýbrahim','Topbaþ',275)
insert into @ogrtabl values('Burak','Özdoðru',575)
insert into @ogrtabl values('Fatma','Altun',675)
insert into @ogrtabl values('Melike','Þimþek',975)
select * from @ogrtabl
go

--if kontorl deyimi
use filmler
select * from Oyuncular
select * from filmler
select * from Oyuncu_Film
print('Tom Hanks')
--tom hanskin filmi varmý? varsa adlarýný yazýnýz.
if exists(select * from Oyuncular,Oyuncu_Film where Oyuncular.oyuncu_Id=
Oyuncu_Film.oyuncu_Id and oyuncular.Ad='Tom' and Oyuncular.Soyad='Hanks')
begin
print('Var')
select * from Oyuncular,Oyuncu_Film where Oyuncular.oyuncu_Id=
Oyuncu_Film.oyuncu_Id and oyuncular.Ad='Tom' and Oyuncular.Soyad='Hanks'
end
else
begin
print('Yok')
end
use NORTHWND
--products tablosunda ürün adý,kategori adý, unitprice 100 ve üzeri olanlara pahalý altýnda olanlara uygun

select ProductName,CategoryName,UnitPrice,Durum=
case
when UnitPrice > 100 then 'Pahalý'
else 'Uygun'
end
from Products,Categories where Products.CategoryID=Categories.CategoryID

--içinde bulundðumuz yýl tek mi çiftmi?

select year(getdate()), 'yýl'=
case when year(getdate()) % 2=0 then 'çift yýl'
else 
'Tek yýl'
end

if(year(GETDATE()) %2 =0)
print('çift yýl')
else
print('Tek yýl')



