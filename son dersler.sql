--tsq komutlar�--
--De�i�ken tan�mlama
declare @s1 int, @s2 int,@s3 int
set @s1=10
set @s2 = 20

set @s3=@s1+@s2
print ('1.Say�:'+ convert(varchar(3),@s1))
print ('2.Say�:'+ convert(varchar(3),@s2))
print ('3.Say�:'+ convert(varchar(3),@s3))

--Tablo tipi de�i�ken
declare @ogrtabl Table(
ad nvarchar(20),
soyad nvarchar(30),
numara int
)
insert into @ogrtabl values('�brahim','Topba�',275)
insert into @ogrtabl values('Burak','�zdo�ru',575)
insert into @ogrtabl values('Fatma','Altun',675)
insert into @ogrtabl values('Melike','�im�ek',975)
select * from @ogrtabl
go

--if kontorl deyimi
use filmler
select * from Oyuncular
select * from filmler
select * from Oyuncu_Film
print('Tom Hanks')
--tom hanskin filmi varm�? varsa adlar�n� yaz�n�z.
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
--products tablosunda �r�n ad�,kategori ad�, unitprice 100 ve �zeri olanlara pahal� alt�nda olanlara uygun

select ProductName,CategoryName,UnitPrice,Durum=
case
when UnitPrice > 100 then 'Pahal�'
else 'Uygun'
end
from Products,Categories where Products.CategoryID=Categories.CategoryID

--i�inde bulund�umuz y�l tek mi �iftmi?

select year(getdate()), 'y�l'=
case when year(getdate()) % 2=0 then '�ift y�l'
else 
'Tek y�l'
end

if(year(GETDATE()) %2 =0)
print('�ift y�l')
else
print('Tek y�l')



