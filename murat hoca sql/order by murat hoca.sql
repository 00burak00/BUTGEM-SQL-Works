use NORTHWND

select * from Customers
select * from Customers order by City asc --�n tan�ml� olarak artan olarak yani asc olarak s�ralar
select * from Customers order by City desc --azalan olarak s�ralar

select * from Customers order by CompanyName desc--hocan�n sorusu

--birden fazla kritere g�re s�ralama
select * from Customers order by city,CustomerID 


--group by
select * from Customers
select count(*) from Customers
select count(CustomerID) from Customers
-- �ehre g�re ka� m��terimiz var
select count(customerID), city from Customers group by city
-- �lkeye g�re ka� m��terimiz var
select count(customerID) as [M��teri Say�s�], Country as �lke from Customers group by country
select * from orders

select count(orderId) as [Sipari� say�s�],ShipCity as [G�nderilen �ehir] from orders group by ShipCity 
order by count(orderid) 

--notlar 1: group by parametresi illaki select ile se�ilmeli
--2 order by varsa select il se�ilen alan olmal�


--kategoriye g�re �r�n adetlerini bulan sql komutu
select count(productId) as [�r�n Say�s�], categoryid as [Kategori numaras�] from products group by CategoryID order by count(ProductID) desc

--
select count(productid) as [�r�n say�s�], categoryid from Products group by CategoryID having  count(productid)>10 order by count(ProductID) desc 
