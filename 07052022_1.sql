use GALER�2022
select * from MUSTER�
select * from ALIM
select * from SATIS
select * from ARAC


-- musteri al�m ili�kli tablodan veri �ekme
select Madi,Msoyadi,ATarih,Afiyat from MUSTER�,ALIM 
where MUSTER�.Mno=ALIM.Mno
--INNER JOIN ile 2 ili�kii tablodan veri �ekme
select Madi,Msoyadi,ATarih,Afiyat from MUSTER�
inner join ALIM on MUSTER�.Mno=ALIM.Mno

--hangi marka,model ara� hangi tarihte ka�a sat�lm��?
select MArka,Model,Starihi,SFiyat from Arac
inner join SATIS on Arac.Ano=SATIS.Ano
select MArka,Model,Starihi,SFiyat from SATIS,ARAC
where SATIS.Ano=ARAC.Ano order by Starihi desc
--hangi marka ara�tan ka� adet sat�lm��
select count(sno) as [KA� ADET SATILDI], marka from ARAC
inner join SATIS on ARAC.Ano=SATIS.Ano group by Marka 

--hangi m��teri  ka�a alm��, ka�a satm��
select madi,msoyadi,afiyat,sfiyat from MUSTER�,ALIM,SATIS
where MUSTER�.Mno=ALIM.Mno and MUSTER�.Mno=SATIS.Mno

select madi,msoyadi,afiyat,sfiyat from MUSTER� 
full join ALIM on MUSTER�.Mno=ALIM.Mno
full join SATIS on MUSTER�.Mno=SATIS.Mno

use NORTHWND
select * from Orders
select * from Customers
select ContactNAme,OrderDate from Customers
inner join Orders on Customers.CustomerID=Orders.CustomerID 
order by Customers.CustomerID

select ContactNAme,OrderDate from Customers
right join Orders on Customers.CustomerID=Orders.CustomerID 



