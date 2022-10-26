select 5*3 as �arp�m
select 10 as sayi1, 6 as sayi2, (10+6)/2 as ortalama
select 5+3 as toplam
 --+ opret�r�, string birle�tirme
 use NORTHWND
 select * from Customers
 select 'Say�n:'+ ContactName+ ' G�reviniz '+ContactTitle+'
 Ba�ar�lar Dileriz'
 from Customers
 --********************STRING FONKS�YONLAR*******************************
 --substring
 select City, SUBSTRING(City,1,3) as '3 karakter' from Customers

 --left ve right
select city, LEFT(city,2) as 'ilk 2',RIGHT(city,3) as 'son 3'
from Customers

--lower upper
select UPPER('butgem') as ad
select UPPER(country) as Ulke from Customers
select lower(country) as Ulke from Customers
--trim ba�taki ve sondaki bo�luklar� atar
select TRIM('   butgem bursa tasar�m ve geli�tirme merkezi   ') as k�rp

--len karakter say�s�**bo�luklar say�l�r
select len(Contactname) as karaktersay�s� from Customers
 select * from Customers

 --initcap????????
 --select INITCAP('murat') as ilk
 select replace('butgem','e','a')
 select REPLACE(Country,'e','a') from Customers where Country='Germany'

 --charindex ilk s�ra no verir
 select CHARINDEX('t','butgem') as s�rano
 select CHARINDEX('t','butgtm') as s�rano

 --reverse tersini yazar
 select city,upper(REVERSE(city)) as tersbuyuk from Customers

 -- ***********************SAYISAL FONKS�YONLAR*************************
 --ABS MUTLAK DE�ER
 SELECT ABS(-19.5) AS MUTLAK

 --CEILING FLOOR
 SELECT -9.82 AS SAYI,CEILING(-9.82) AS YUKARI,FLOOR(-9.82) AS A�A�I

 --ROUND
SELECT ROUND(9.8256,1) AS YUVARLA
SELECT ROUND(9.8256,2) AS YUVARLA
SELECT ROUND(9.8256,3) AS YUVARLA
SELECT ROUND(-45.7845,3) AS YUVARLA
SELECT ROUND(45.7855,2) AS YUVARLA

--POWER
SELECT POWER(2,4) AS G��

--SQRT
SELECT ROUND(SQRT(3),2) AS K�K

-- SUM TOPLAMI VER�R
SELECT * FROM [Order Details]
SELECT round(SUM(UnitPrice),0) from [Order Details]

--avg ortalama
select round(avg(unitprice),0) as [ortalama fiyat] from [Order Details]

--max en fazla
select max(UnitPrice) as [en y�ksek fiyat] from [Order Details]

--min en d���k
select min(unitprice) as [en d���k fiyat] from [Order Details]

--mod alma
select (990%8) as kalan

---***************************TAR�H SAAT FONKS�YONLARI-----------------

select GETDATE() as tarih
select CURRENT_TIMESTAMP
--tarihi par�alara ay�r�yoruz
select DATEPART(year,getdate()) as y�l
select datepart(month,getdate()) as ay
select month(getdate()) as ay
select datepart(day,getdate()) as g�n
--isdate tarih mi kontrol� yapar
SELECT ISDATE('butgem')
--tarih ekleme dateadd
select DATEADD(year,3,getdate()) as [3 y�l sonra]
select dateadd(month,2,'2012-12-15') as [2 ay sonra]
select dateadd(day,175,'2012-12-15') as [175 g�n sonra]

SELECT DATEADD(month, -2, '2017/08/25') AS DateAdd

--iki tarih aras�ndaki fark� verir(2. tarihten 1. tarihin fark�n� al�r)

select DATEDIFF(month,'2015/08/25','2017/09/15')








