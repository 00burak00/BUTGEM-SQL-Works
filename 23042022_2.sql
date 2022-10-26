select 5*3 as çarpým
select 10 as sayi1, 6 as sayi2, (10+6)/2 as ortalama
select 5+3 as toplam
 --+ opretörü, string birleþtirme
 use NORTHWND
 select * from Customers
 select 'Sayýn:'+ ContactName+ ' Göreviniz '+ContactTitle+'
 Baþarýlar Dileriz'
 from Customers
 --********************STRING FONKSÝYONLAR*******************************
 --substring
 select City, SUBSTRING(City,1,3) as '3 karakter' from Customers

 --left ve right
select city, LEFT(city,2) as 'ilk 2',RIGHT(city,3) as 'son 3'
from Customers

--lower upper
select UPPER('butgem') as ad
select UPPER(country) as Ulke from Customers
select lower(country) as Ulke from Customers
--trim baþtaki ve sondaki boþluklarý atar
select TRIM('   butgem bursa tasarým ve geliþtirme merkezi   ') as kýrp

--len karakter sayýsý**boþluklar sayýlýr
select len(Contactname) as karaktersayýsý from Customers
 select * from Customers

 --initcap????????
 --select INITCAP('murat') as ilk
 select replace('butgem','e','a')
 select REPLACE(Country,'e','a') from Customers where Country='Germany'

 --charindex ilk sýra no verir
 select CHARINDEX('t','butgem') as sýrano
 select CHARINDEX('t','butgtm') as sýrano

 --reverse tersini yazar
 select city,upper(REVERSE(city)) as tersbuyuk from Customers

 -- ***********************SAYISAL FONKSÝYONLAR*************************
 --ABS MUTLAK DEÐER
 SELECT ABS(-19.5) AS MUTLAK

 --CEILING FLOOR
 SELECT -9.82 AS SAYI,CEILING(-9.82) AS YUKARI,FLOOR(-9.82) AS AÞAÐI

 --ROUND
SELECT ROUND(9.8256,1) AS YUVARLA
SELECT ROUND(9.8256,2) AS YUVARLA
SELECT ROUND(9.8256,3) AS YUVARLA
SELECT ROUND(-45.7845,3) AS YUVARLA
SELECT ROUND(45.7855,2) AS YUVARLA

--POWER
SELECT POWER(2,4) AS GÜÇ

--SQRT
SELECT ROUND(SQRT(3),2) AS KÖK

-- SUM TOPLAMI VERÝR
SELECT * FROM [Order Details]
SELECT round(SUM(UnitPrice),0) from [Order Details]

--avg ortalama
select round(avg(unitprice),0) as [ortalama fiyat] from [Order Details]

--max en fazla
select max(UnitPrice) as [en yüksek fiyat] from [Order Details]

--min en düþük
select min(unitprice) as [en düþük fiyat] from [Order Details]

--mod alma
select (990%8) as kalan

---***************************TARÝH SAAT FONKSÝYONLARI-----------------

select GETDATE() as tarih
select CURRENT_TIMESTAMP
--tarihi parçalara ayýrýyoruz
select DATEPART(year,getdate()) as yýl
select datepart(month,getdate()) as ay
select month(getdate()) as ay
select datepart(day,getdate()) as gün
--isdate tarih mi kontrolü yapar
SELECT ISDATE('butgem')
--tarih ekleme dateadd
select DATEADD(year,3,getdate()) as [3 yýl sonra]
select dateadd(month,2,'2012-12-15') as [2 ay sonra]
select dateadd(day,175,'2012-12-15') as [175 gün sonra]

SELECT DATEADD(month, -2, '2017/08/25') AS DateAdd

--iki tarih arasýndaki farký verir(2. tarihten 1. tarihin farkýný alýr)

select DATEDIFF(month,'2015/08/25','2017/09/15')








