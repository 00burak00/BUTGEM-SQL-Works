select * from Customers
--ORDER BY SIRALAMA
select * from Customers order by City-- artan
select * from Customers order by city asc--artan

select * from Customers order by city desc--azalan s�rada 
--�irket ad�na g�re azalan s�ra
select * from Customers order by CompanyName desc

--birden fazla kritere g�re s�ralama
select * from Customers order by City desc, CustomerID

--GROUP BY
select * from Customers
select count(*) from customers
select count(customerid) from Customers
--�ehre g�re ka� m��terimiz var
SELECT COUNT(CustomerID), City FROM Customers group by city
--�lkeye g�re ka�ar m��terimiz var
select count(customerid) as [M��teri say�s�],country as �lke from customers group by country
select * from orders
--�ehire g�re gruplanm�� sipari�lerimizi sipari� say�s�na g�re artan s�rada s�ralama
select count(orderid) as sipari�say�s�,shipcity from orders group by ShipCity
order by count(orderid) desc
---NOTLAR 1: GROUP BY PARAMETRES� �LLA K� SELECT �LE SE��LMEL�
--2: ORDER BY VARSA SELECT �LE SE��LEN ALAN OLMALI
--kategoriye g�re �r�n adetlerini bulup �r�n say�s�na g�re azalan s�rada listeleyen sql
select * from Products
select count(productid) as [�r�n say�s�],categoryid from Products group by CategoryID
order by count(productid) desc

--
select count(productid) as [�r�n say�s�], categoryid from Products
group by CategoryID having count(productid)>10 order by count(productid) desc