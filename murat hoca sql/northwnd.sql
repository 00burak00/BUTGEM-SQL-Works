create database NORTHWND

use NORTHWND
--tüm kayýtlarý(alanlarý) listele
select * from Customers
--sadece müþterilerin adý ve adresini listele
select ContactName Address from Customers
--yaþadýðý þehir London olan kiþiler
select * from customers where City='London'
--owner olan müþteriler
select * from customers where ContactTitle='Owner'
--ispanya barcelona þehrinden olan müþterilerin adý listesi
select ContactName from Customers where Country='Spain' and City='Barcelona'
--Ýspanya'dan veya London'dan olanlarýn Adresini listele
select Address from Customers where Country='Spain' or City='London'
--tüm ürünleri listeleme
select * from Products
--2 nolu kategoriden olna ürünlerin adlarý
select ProductName from Products where CategoryID=2
--3 ve 4 nolu tedarikçilerden aldýðýmýz ürünler
select * from Products where SupplierID=3 or SupplierID=4
-- fiyatý 20 ve üzeri olan ürünlerin adý ve listesi
select ProductName from products where UnitPrice >= 20
--tedarikçisi 3 ve 4 olmayan ürünler
select * from Products where SupplierID<>3 and SupplierID<>4
--kategorisi 3,4,5 olan ürünleri listele
select * from Products where CategoryID=3 or CategoryID=4 or CategoryID=5
select * from Products where CategoryID in (3,4,5)
--Tedarikçi nosu 9 10 12 olmayanlarý listele
select * from Products where CategoryID not in(9,10,12)
--ücretleri 10 ve 20  arasýnda olan ürürnleri listeleyen 
select* from Products where UnitPrice between  10 and 20
select * from Products where UnitPrice >=10 and UnitPrice <=20
--Þirket adý b ile baþlayan ve n ile biten 
select * from Customers where CompanyName like('B%') and  CompanyName like('%N')
--kaç çeþit tedarikçi var
select*from Products
select distinct SupplierId from Products

--kaç çeþit kategori listesi
select distinct  CategoryID from Products

--kaç adet ürünüm var
select count(CategoryID) from Products
select count(*) from Products --bu ikisi farklýdýr
--kaç adet kategori var 
select count(distinct CategoryId) from Products

-- 4 numaralý tedarikçiden kaç tane ürün aldýk
select count(*) from Products where SupplierID=4


--fiyatý 20 ve üzeri olan kaç ürün var
select count(*) from Products where UnitPrice >=20
select * from Products where UnitPrice >=20
select count(*) as ustu20 from Products where UnitPrice >=20

--müþterilerin benzersiz ülke sayýsý
select count(distinct country) as ulkeSayi from Customers
--select count(*) as DistinctCountries from (select distinct Country from Customers)

--gölge bilgisi girilmeyen müþterilerin sayýsýný ve adlarýný ayrý ayrý veren 
select * from Customers 
select ContactName from Customers where Region is null
select count(ContactName) as multeciSayisi from Customers where region is null

select count(Region) from Customers --boþ bölgeleri saymaz
select count(*) from Customers--tüm kayýtlarýn sayýsý

--benzersiz kaç bölge var
select count(distinct Region ) as bolgeSayisi from Customers

--countries name s-j ile baþlayýp n-e ile bitenlerin sayýsý
select * from Customers where ContactName like('s%') and  ContactName like('%n')
select count(*) as je  from  Customers where ContactName like('j%') and  ContactName like('%e')


--þehir adý a,b,c ile baþlayan müþteri bilgileri 
select * from Customers where City like('[abc]%')
--þehir adý a ve e arasý ile baþlayan müþteri bilgileri
select * from Customers where City like('[a-e]%')
--CustomerId leri fgc ile baþlamayan kayýtlarýn sayýsý
select count(*) as fgc_ile_Baslamayan from Customers where CustomerID like('[!gfc]%')
--1996 yýlýnda verilen sipariþleri listele
select * from Orders
select Count(*) as yýlsiparisleri96 from Orders where OrderDate between '1996-01-01' and '1996-12-31'

--benim çalýþmalarým burdan sonrakiler

select Count(*) as elliPrice from Products where UnitPrice >=50
select ProductName,UnitPrice from Products  where UnitPrice >=20
select * from Products where CategoryID=3
select * from Products where ProductName like 'T%s%'

select* from Products where QuantityPerUnit like '%box%'
select * from CustomerDemographics
select * from Categories where CategoryName='Confections'
select * from Products where CategoryID=2 and UnitPrice >= 15
select * from Products where CategoryID=2 or UnitPrice >= 30
select * from Products where UnitPrice between 15 and 50
select * from Products where QuantityPerUnit in (40,50)
select * from Orders where ShipRegion is null
select * from Orders where ShipRegion is not null

select *from Products where ProductName like '_s%'