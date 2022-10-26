use NORTHWND
--t�m kay�tlar�(alanlar�) listele
SELECT * FROM Customers
--sadece m��terilerin ad� ve adresini listele
SELECT ContactName, Address from Customers
--ya�ad��� �ehit London olan ki�iler
SELECT * FROM CUSTOMERS where City='London'
--owner olan m��teriler
SELECT * FROM CUSTOMERS where ContactTitle='Owner'
--ispanya barcelona �ehrinden olan m��teri  ad� listesi
SELECT ContactName from Customers where Country='Spain' and City='Barcelona'
--ispanyadan veya london olanlar�n Adresini listeleyen
select Address from Customers where Country='Spain' or City='London'

--t�m �r�nleri listeleme
select * from Products
--2 nolu kategoriden olan �r�n adlar�
select ProductName from Products where CategoryID=2

--3 veya 4 nolu tedarik�ilerden ald���m�z �r�nler
select * from Products where SupplierID=3 or SupplierID=4

--fiyat 20 ve �zeri olan �r�nlerin ad� listesi
select ProductName from Products where UnitPrice>=20

--tedarik�isi 3,4 olmayan �r�n adlar�
select * from Products where SupplierID<>3 and SupplierID<>4

--kategorisi 3,4,5 olan �r�nleri listele
select * from Products where CategoryId=3 or CategoryId=4 or CategoryId=5
select * from Products where CategoryID in(3,4,5)

-- Tedarik�i nosu 9,10,12 olamaynlar� listele
select * from Products where SupplierID not in(9,10,12)

--�creti 10 ve 20 aras�nda olan �r�nleri listeleyen 
select * from Products where UnitPrice between 10 and 20
select * from Products where UnitPrice>=10 and UnitPrice<=20

-- �irket ad� B ile ba�layan ve N ile biten
select * from Customers where CompanyName like('B%') and CompanyName like('%N')

--ka� �e�it tedarik�i var listesi
select * from Products
select distinct  SupplierID from Products

--ka� �e�it kategori listesi
select distinct CategoryId from Products

--ka� adet �r�n�m var
select count(*) from Products

--ka� adet kategori var
select count(distinct CategoryID) from Products

--tedarik�isi 4 olan �r�n say�s�
select count(*) from Products where SupplierID=4
select * from  Products where SupplierID=4

--fiyat� 20 ve �zeri olan ka� �r�n var
select count(*) as ustu20 from Products where UnitPrice>=20
select * from Products where UnitPrice>=20

--m��terilerin benzersiz �lke say�s�
select count(distinct country) from Customers
--select count(*) as benzersizulke from select distinct country from Customers


--b�lge bilgisi girilmeyen m��terilen say�s�n� ve adlar�n� ayr� ayr� veren
select * from customers
select ContactNAme from Customers where Region is null
select count(ContactNAme) as multecisayisi from customers where Region is null

select count(region) from Customers-- bo� b�lgeleri saymaz
select count(*) from customers--t�m kay�tlar�n say�s�

--benzersiz ka� b�lge var
select count(distinct region) as bolgesay from Customers

--contact name j ile ba�lay�p e ile bitenlerin say�s�
select * from customers where ContactName like('j%e')
select count(*) as je from customers where ContactName like('j%e')

--�ehir ad� a,b,c ile ba�layan m��teri bilgileri
select * from customers where city like ('[abc]%')

--�ehir ad� a ve e aras�  ile ba�layan m��teri bilgileri
select * from customers where city like ('[a-e]%')

--customerid leri gfc ile ba�lamayan kay�tlar�n say�s�
select count(*) as notgfc from customers where CustomerID like('[!gfc]%')

--1996 y�l�nda verilen sipari�leri listele
select * from Orders
select * from Orders where OrderDate between '1996-01-01' and '1996-12-31'

--1996 y�l�nda verilen sipari� say�s�
select count(*) as yilsiparisleri96 from Orders where OrderDate between '1996-01-01' and '1996-12-31'
