use GALERÝ2022
select * from MUSTERÝ
select * from ALIM
select * from SATIS
select * from ARAC


-- musteri alým iliþkli tablodan veri çekme
select Madi,Msoyadi,ATarih,Afiyat from MUSTERÝ,ALIM 
where MUSTERÝ.Mno=ALIM.Mno
--INNER JOIN ile 2 iliþkii tablodan veri çekme
select Madi,Msoyadi,ATarih,Afiyat from MUSTERÝ
inner join ALIM on MUSTERÝ.Mno=ALIM.Mno

--hangi marka,model araç hangi tarihte kaça satýlmýþ?
select MArka,Model,Starihi,SFiyat from Arac
inner join SATIS on Arac.Ano=SATIS.Ano
select MArka,Model,Starihi,SFiyat from SATIS,ARAC
where SATIS.Ano=ARAC.Ano order by Starihi desc
--hangi marka araçtan kaç adet satýlmýþ
select count(sno) as [KAÇ ADET SATILDI], marka from ARAC
inner join SATIS on ARAC.Ano=SATIS.Ano group by Marka 

--hangi müþteri  kaça almýþ, kaça satmýþ
select madi,msoyadi,afiyat,sfiyat from MUSTERÝ,ALIM,SATIS
where MUSTERÝ.Mno=ALIM.Mno and MUSTERÝ.Mno=SATIS.Mno

select madi,msoyadi,afiyat,sfiyat from MUSTERÝ 
full join ALIM on MUSTERÝ.Mno=ALIM.Mno
full join SATIS on MUSTERÝ.Mno=SATIS.Mno

use NORTHWND
select * from Orders
select * from Customers
select ContactNAme,OrderDate from Customers
inner join Orders on Customers.CustomerID=Orders.CustomerID 
order by Customers.CustomerID

select ContactNAme,OrderDate from Customers
right join Orders on Customers.CustomerID=Orders.CustomerID 



