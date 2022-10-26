use sinavGaleri

--1
select count(madres) from Musteri where Madres like '%tokat%' 
--2
SELECT AVG(Fiyat)  from Arac where convert( int ,DATEPART (YEAR, GETDATE())) - model > 3
--3
select avg(Sfiyati) as ortalama from satis
--4
select marka,model from alim,Arac where alim.Aracno=Arac.aracno group by Arac.Marka,Arac.model having avg(Afiyat)>10000
--5
--select distinct Marka,Afiyat,MAX(Afiyat)-MIN(Afiyat) from Arac,alim where alim.Aracno= arac.aracno group by Marka,Afiyat 