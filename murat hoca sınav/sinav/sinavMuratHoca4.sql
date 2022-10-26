use sinavGaleri

--1
select  * from Musteri order by Madi

--2
select * from Arac order by model desc, fiyat
--3
select Aracno,sat_Tarihi,Sfiyati as [Satýþ Fiyatý] from Satis

--4
select * from Arac where Fiyat > 12000 order by Fiyat desc
--5

select Arac.aracno,sat_Tarihi,Sfiyati,model,marka,plaka from Satis,Arac where Satis.Aracno=Arac.aracno and Sfiyati > 10000 or mno =4  group by Arac.aracno,sat_Tarihi,Sfiyati,model,marka,plaka
--6
select * from Satis where sat_Tarihi > '2010-04-30'

--7
select alim_Tarihi,Afiyat,Aracno from alim where alim_Tarihi between '2010-06-30' and '2010-12-01' and Afiyat > 10000 order by alim_Tarihi desc,Afiyat desc

--8
select * from Satis where Sfiyati between 10000 and 20000 and mno in(4,2)

--9
select * from musteri,Satis where Musteri.mno= Satis.mno and Madres like '%Turhal%'

--10
select * from musteri where Madres like '%Tokat%' and Mtelefon like '%6%'

--11
select Madi,Msoyadi,Madres,Mtelefon from Musteri where Madi like 'a%'

--12
select model,marka,Fiyat from Arac where Marka like '%Opel%' or marka like '%Fiat%' order by marka

--13
select * from Arac where model in (1997,2005,2007)