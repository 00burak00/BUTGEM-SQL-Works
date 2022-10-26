--1employee tablosundaki t�m kay�tlar� g�r�nt�leme
use NORTHWND
select * from Employees
--2employee tablosundaki adres,�ehir ve posta kodunu g�r�nt�leme
select address,city,postalcode from Employees
--3employee tablosunda �lkesi amerika olanlar� g�r�nt�leme
select * from Employees where Country='usa'
--4 employee tablosunda employid si 5 den b�y�k olanlar� g�r�nt�leme
select * from Employees where EmployeeID>5
--5 toplam ka� employee var
select count(*) as kayitsayisi from Employees
--6 employee tablosunda ka� farkl� �ehirde ya��yorlar
select distinct(city) from Employees
--7 repotrtsto alan� 2,5,7 olanlar� listeleme
select * from Employees where ReportsTo in(2,5,7)
--8 �al��anlar�n soyadlar�n� ka�ar karakterden olu�tu�unu listeleyen sql
select lastname,len(lastname) as [karakter say�s�] from Employees
--9 extension � en b�y�k olan� listelyen
select max(extension) as [en b�y�k] from Employees
--10 extension � en k���k olan� listeleyen
select min(extension) as [en k���k] from Employees
--11 �ehirlerin ilk 3 harfini listeleyen
select SUBSTRING(city,1,3) as [ilk 3] from Employees
select LEFT(city,3) as [ilk 3] from Employees
--12 empleyee tablosunda isimleri b�y�k harfe �eviren sql kodlar�
select UPPER(firstname) as B�Y�K from Employees