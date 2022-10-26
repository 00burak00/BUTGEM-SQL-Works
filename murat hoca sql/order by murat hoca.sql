use NORTHWND

select * from Customers
select * from Customers order by City asc --ön tanýmlý olarak artan olarak yani asc olarak sýralar
select * from Customers order by City desc --azalan olarak sýralar

select * from Customers order by CompanyName desc--hocanýn sorusu

--birden fazla kritere göre sýralama
select * from Customers order by city,CustomerID 


--group by
select * from Customers
select count(*) from Customers
select count(CustomerID) from Customers
-- þehre göre kaç müþterimiz var
select count(customerID), city from Customers group by city
-- ülkeye göre kaç müþterimiz var
select count(customerID) as [Müþteri Sayýsý], Country as Ülke from Customers group by country
select * from orders

select count(orderId) as [Sipariþ sayýsý],ShipCity as [Gönderilen Þehir] from orders group by ShipCity 
order by count(orderid) 

--notlar 1: group by parametresi illaki select ile seçilmeli
--2 order by varsa select il seçilen alan olmalý


--kategoriye göre ürün adetlerini bulan sql komutu
select count(productId) as [Ürün Sayýsý], categoryid as [Kategori numarasý] from products group by CategoryID order by count(ProductID) desc

--
select count(productid) as [ürün sayýsý], categoryid from Products group by CategoryID having  count(productid)>10 order by count(ProductID) desc 
