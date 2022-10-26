--1employee tablosundaki tüm kayýtlarý görüntüleme
use NORTHWND
select * from Employees
--2employee tablosundaki adres,þehir ve posta kodunu görüntüleme
select address,city,postalcode from Employees
--3employee tablosunda ülkesi amerika olanlarý görüntüleme
select * from Employees where Country='usa'
--4 employee tablosunda employid si 5 den büyük olanlarý görüntüleme
select * from Employees where EmployeeID>5
--5 toplam kaç employee var
select count(*) as kayitsayisi from Employees
--6 employee tablosunda kaç farklý þehirde yaþýyorlar
select distinct(city) from Employees
--7 repotrtsto alaný 2,5,7 olanlarý listeleme
select * from Employees where ReportsTo in(2,5,7)
--8 çalýþanlarýn soyadlarýný kaçar karakterden oluþtuðunu listeleyen sql
select lastname,len(lastname) as [karakter sayýsý] from Employees
--9 extension ý en büyük olaný listelyen
select max(extension) as [en büyük] from Employees
--10 extension ý en küçük olaný listeleyen
select min(extension) as [en küçük] from Employees
--11 þehirlerin ilk 3 harfini listeleyen
select SUBSTRING(city,1,3) as [ilk 3] from Employees
select LEFT(city,3) as [ilk 3] from Employees
--12 empleyee tablosunda isimleri büyük harfe çeviren sql kodlarý
select UPPER(firstname) as BÜYÜK from Employees