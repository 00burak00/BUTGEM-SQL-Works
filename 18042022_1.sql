use NORTHWND
--tüm kayýtlarý(alanlarý) listele
SELECT * FROM Customers
--sadece müþterilerin adý ve adresini listele
SELECT ContactName, Address from Customers
--yaþadýðý þehit London olan kiþiler
SELECT * FROM CUSTOMERS where City='London'
--owner olan müþteriler
SELECT * FROM CUSTOMERS where ContactTitle='Owner'
--ispanya barcelona þehrinden olan müþteri  adý listesi
SELECT ContactName from Customers where Country='Spain' and City='Barcelona'
--ispanyadan veya london olanlarýn Adresini listeleyen
select Address from Customers where Country='Spain' or City='London'

--tüm ürünleri listeleme
select * from Products
--2 nolu kategoriden olan ürün adlarý
select ProductName from Products where CategoryID=2

--3 veya 4 nolu tedarikçilerden aldýðýmýz ürünler
select * from Products where SupplierID=3 or SupplierID=4

--fiyat 20 ve üzeri olan ürünlerin adý listesi
select ProductName from Products where UnitPrice>=20

--tedarikçisi 3,4 olmayan ürün adlarý
select * from Products where SupplierID<>3 and SupplierID<>4

--kategorisi 3,4,5 olan ürünleri listele
select * from Products where CategoryId=3 or CategoryId=4 or CategoryId=5
select * from Products where CategoryID in(3,4,5)

-- Tedarikçi nosu 9,10,12 olamaynlarý listele
select * from Products where SupplierID not in(9,10,12)

--ücreti 10 ve 20 arasýnda olan ürünleri listeleyen 
select * from Products where UnitPrice between 10 and 20
select * from Products where UnitPrice>=10 and UnitPrice<=20

-- Þirket adý B ile baþlayan ve N ile biten
select * from Customers where CompanyName like('B%') and CompanyName like('%N')

--kaç çeþit tedarikçi var listesi
select * from Products
select distinct  SupplierID from Products

--kaç çeþit kategori listesi
select distinct CategoryId from Products

--kaç adet ürünüm var
select count(*) from Products

--kaç adet kategori var
select count(distinct CategoryID) from Products

--tedarikçisi 4 olan ürün sayýsý
select count(*) from Products where SupplierID=4
select * from  Products where SupplierID=4

--fiyatý 20 ve üzeri olan kaç ürün var
select count(*) as ustu20 from Products where UnitPrice>=20
select * from Products where UnitPrice>=20

--müþterilerin benzersiz ülke sayýsý
select count(distinct country) from Customers
--select count(*) as benzersizulke from select distinct country from Customers


--bölge bilgisi girilmeyen müþterilen sayýsýný ve adlarýný ayrý ayrý veren
select * from customers
select ContactNAme from Customers where Region is null
select count(ContactNAme) as multecisayisi from customers where Region is null

select count(region) from Customers-- boþ bölgeleri saymaz
select count(*) from customers--tüm kayýtlarýn sayýsý

--benzersiz kaç bölge var
select count(distinct region) as bolgesay from Customers

--contact name j ile baþlayýp e ile bitenlerin sayýsý
select * from customers where ContactName like('j%e')
select count(*) as je from customers where ContactName like('j%e')

--þehir adý a,b,c ile baþlayan müþteri bilgileri
select * from customers where city like ('[abc]%')

--þehir adý a ve e arasý  ile baþlayan müþteri bilgileri
select * from customers where city like ('[a-e]%')

--customerid leri gfc ile baþlamayan kayýtlarýn sayýsý
select count(*) as notgfc from customers where CustomerID like('[!gfc]%')

--1996 yýlýnda verilen sipariþleri listele
select * from Orders
select * from Orders where OrderDate between '1996-01-01' and '1996-12-31'

--1996 yýlýnda verilen sipariþ sayýsý
select count(*) as yilsiparisleri96 from Orders where OrderDate between '1996-01-01' and '1996-12-31'
