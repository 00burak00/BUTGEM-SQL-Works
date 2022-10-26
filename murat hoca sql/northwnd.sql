create database NORTHWND

use NORTHWND
--t�m kay�tlar�(alanlar�) listele
select * from Customers
--sadece m��terilerin ad� ve adresini listele
select ContactName Address from Customers
--ya�ad��� �ehir London olan ki�iler
select * from customers where City='London'
--owner olan m��teriler
select * from customers where ContactTitle='Owner'
--ispanya barcelona �ehrinden olan m��terilerin ad� listesi
select ContactName from Customers where Country='Spain' and City='Barcelona'
--�spanya'dan veya London'dan olanlar�n Adresini listele
select Address from Customers where Country='Spain' or City='London'
--t�m �r�nleri listeleme
select * from Products
--2 nolu kategoriden olna �r�nlerin adlar�
select ProductName from Products where CategoryID=2
--3 ve 4 nolu tedarik�ilerden ald���m�z �r�nler
select * from Products where SupplierID=3 or SupplierID=4
-- fiyat� 20 ve �zeri olan �r�nlerin ad� ve listesi
select ProductName from products where UnitPrice >= 20
--tedarik�isi 3 ve 4 olmayan �r�nler
select * from Products where SupplierID<>3 and SupplierID<>4
--kategorisi 3,4,5 olan �r�nleri listele
select * from Products where CategoryID=3 or CategoryID=4 or CategoryID=5
select * from Products where CategoryID in (3,4,5)
--Tedarik�i nosu 9 10 12 olmayanlar� listele
select * from Products where CategoryID not in(9,10,12)
--�cretleri 10 ve 20  aras�nda olan �r�rnleri listeleyen 
select* from Products where UnitPrice between  10 and 20
select * from Products where UnitPrice >=10 and UnitPrice <=20
--�irket ad� b ile ba�layan ve n ile biten 
select * from Customers where CompanyName like('B%') and  CompanyName like('%N')
--ka� �e�it tedarik�i var
select*from Products
select distinct SupplierId from Products

--ka� �e�it kategori listesi
select distinct  CategoryID from Products

--ka� adet �r�n�m var
select count(CategoryID) from Products
select count(*) from Products --bu ikisi farkl�d�r
--ka� adet kategori var 
select count(distinct CategoryId) from Products

-- 4 numaral� tedarik�iden ka� tane �r�n ald�k
select count(*) from Products where SupplierID=4


--fiyat� 20 ve �zeri olan ka� �r�n var
select count(*) from Products where UnitPrice >=20
select * from Products where UnitPrice >=20
select count(*) as ustu20 from Products where UnitPrice >=20

--m��terilerin benzersiz �lke say�s�
select count(distinct country) as ulkeSayi from Customers
--select count(*) as DistinctCountries from (select distinct Country from Customers)

--g�lge bilgisi girilmeyen m��terilerin say�s�n� ve adlar�n� ayr� ayr� veren 
select * from Customers 
select ContactName from Customers where Region is null
select count(ContactName) as multeciSayisi from Customers where region is null

select count(Region) from Customers --bo� b�lgeleri saymaz
select count(*) from Customers--t�m kay�tlar�n say�s�

--benzersiz ka� b�lge var
select count(distinct Region ) as bolgeSayisi from Customers

--countries name s-j ile ba�lay�p n-e ile bitenlerin say�s�
select * from Customers where ContactName like('s%') and  ContactName like('%n')
select count(*) as je  from  Customers where ContactName like('j%') and  ContactName like('%e')


--�ehir ad� a,b,c ile ba�layan m��teri bilgileri 
select * from Customers where City like('[abc]%')
--�ehir ad� a ve e aras� ile ba�layan m��teri bilgileri
select * from Customers where City like('[a-e]%')
--CustomerId leri fgc ile ba�lamayan kay�tlar�n say�s�
select count(*) as fgc_ile_Baslamayan from Customers where CustomerID like('[!gfc]%')
--1996 y�l�nda verilen sipari�leri listele
select * from Orders
select Count(*) as y�lsiparisleri96 from Orders where OrderDate between '1996-01-01' and '1996-12-31'

--benim �al��malar�m burdan sonrakiler

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