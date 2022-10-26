--employ tabloasundaki tüm kayýtlarý görünüz
--employ tablosundaki adres þehir postakodu
--employ tablosunda ülkesi amerika olanlarý görüntüle
--emloy tablosunda employ adresi 5 ten büyük olanlar
--toplam kaç employer var 
--kaç farklý þehirde yaþýyor employerlar
--reportisto 2 5 7 olanlarý listele
--çalýþanlarýnýn soyadlarýnýn kaçar karakterden oluþtuðunu bulan
--extensioný en büyük olan çalýþaný bulmak
--extetntionu en küçük olaný listele
--þehirlerin ilk 3 harfin listeleyen
--çalýþanlarýn isimleri büyük harfe çeviren 

use NORTHWND
--
select * from Employees
--
select address, City, postalcode from Employees
--
select count(*) from Employees where Country='USA' 
select * from Employees where Country='USA'
--
select * from Employees where EmployeeID > 5
--
select Count(*) from Employees
--
select distinct(city) from Employees
--
select * from Employees where ReportsTo in (2,7,7)
--
select len(lastname) as [soyad Karakter Sayýsý] from Employees
--
select max(Extension) as [extension en büyük] from Employees
--
select min(extension) as [en küçük] from employees
--
select SUBSTRING(City,1,3) as [þehirlerin ilk üç harfi] from employees
select left(City,3) as [þehirlerin ilk üç harfi] from employees
select upper( Firstname) as [isimlerin Büyük harfleri] from employees