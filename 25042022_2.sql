select * from Customers
--ORDER BY SIRALAMA
select * from Customers order by City-- artan
select * from Customers order by city asc--artan

select * from Customers order by city desc--azalan sýrada 
--þirket adýna göre azalan sýra
select * from Customers order by CompanyName desc

--birden fazla kritere göre sýralama
select * from Customers order by City desc, CustomerID

--GROUP BY
select * from Customers
select count(*) from customers
select count(customerid) from Customers
--þehre göre kaç müþterimiz var
SELECT COUNT(CustomerID), City FROM Customers group by city
--ülkeye göre kaçar müþterimiz var
select count(customerid) as [Müþteri sayýsý],country as Ülke from customers group by country
select * from orders
--þehire göre gruplanmýþ sipariþlerimizi sipariþ sayýsýna göre artan sýrada sýralama
select count(orderid) as sipariþsayýsý,shipcity from orders group by ShipCity
order by count(orderid) desc
---NOTLAR 1: GROUP BY PARAMETRESÝ ÝLLA KÝ SELECT ÝLE SEÇÝLMELÝ
--2: ORDER BY VARSA SELECT ÝLE SEÇÝLEN ALAN OLMALI
--kategoriye göre ürün adetlerini bulup ürün sayýsýna göre azalan sýrada listeleyen sql
select * from Products
select count(productid) as [ürün sayýsý],categoryid from Products group by CategoryID
order by count(productid) desc

--
select count(productid) as [ürün sayýsý], categoryid from Products
group by CategoryID having count(productid)>10 order by count(productid) desc