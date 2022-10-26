--trigger(tetikleyici)
--ddl Triggers(create,drop,alter)

use NORTHWND
--drop table categories tablo silmeyi engelleyen trigger
alter table products drop constraint FK_Products_Categories
create trigger tablosilengel
on Database for Drop_table
as
begin
print('tablo silme engellendi')
rollback
end
drop table Categories
-- fonksiyon oluþturmayý yasaklayan trigger
use GALERÝ2022
select * from arac
-- fonksiyonengelle adýnda bir trigger ile fonksiyon çalýþtýrmayý engelleyiniz
--fiyatý en pahalý aracýn markasýný bulan kalite adlý bir fonksiyon hazýrlayýnýz 
create trigger fonksiyonengelle
on database for create_function
as
begin
print('Fonksiyon oluþturma engellendi')
rollback
end

create function maxfiyat()
returns nvarchar(10)
as
begin
return (select marka from arac where fiyat = (select MAX(fiyat) from arac ))
end

--galeri2022 veritabanýna tablo eklenmesini(masraflar(aracno,masraf)) engelleyen trigger(tablo engelle)

create trigger tabloengelle
on database for create_table
as
begin
print('Tablo oluþturma engellendi')
rollback
end

create table masraflar(
aracno int foreign key references arac(ano) not null,
masraf int
)

--trigger dml

create Database market
use market 
create table urun(
Ukodu int identity(1,1) primary key,
Uadi varchar(50),
Ufiyat money,
Umiktar int
)
create table satis(
Ukodu int, 
Smiktar int, 
MusteriAdSoy varchar(100),
Strh date
)
create table alim(
Ukodu int,
almiktar int,
MusteriAdsoy varchar(100),
Altrh date 
)

--urun alýmý yapýldýðýnda urun stoðuda arttýran trigger
insert into alim values(1,100,'Tolunay ÖZCAN',getdate())
truncate table alim

create trigger alim_urun
on alim 
for insert
as
begin
declare @uk int, @amik int
select @uk=Ukodu,@amik=almiktar from inserted
update urun set Umiktar=Umiktar+@amik where Ukodu =@uk
end

select * from alim
select * from urun
insert into alim values(1,100,'Tolunay ÖZCAN',getdate())

create trigger satis_urun
on satis 
for insert
as 
begin
declare @ukod int, @smik int
select @ukod=Ukodu,@smik=Smiktar from inserted
update urun set umiktar -= @smik where Ukodu = @ukod
end

select * from satis
select * from urun
insert into satis values(1,25,'Fatma Altýn',GETDATE())


--urun tablosunda silinen 1 nolu ürüne ait stoklarý alým ve satýþ tablolarýnda silen trigger


create trigger urun_delete
on urun
for delete
as 
begin
declare @ukod int
select @ukod=Ukodu from deleted
delete from alim where Ukodu=@ukod 
delete from satis where Ukodu=@ukod 
end
select * from satis
select * from urun
select * from alim
delete  from urun where Ukodu=1 

--update triggers
create trigger guncelleme
 on alim 
 for update
 as
 begin
 declare @ukodu int, @em int,@ym int,@fark int
 select @ukodu=Ukodu,@ym=almiktar from inserted
 select @em=almiktar from deleted
 set @fark = @ym -@em
 update urun set Umiktar = Umiktar + @fark where Ukodu=@ukodu
 end

--alim tablosuna güncelleme yapýnca urun tablosunda güncelleme yapan trigger
insert into urun values('tuz',12,100)
insert into alim values(2,3,'Burak Özdoðru' ,getdate())
create trigger alimguncelle
on alim
for update
as 
begin
declare @ukod int,@emik int,@ymik int,@fark int
select @ukod=ukodu,@ymik=almiktar from inserted
select @ymik=almiktar from deleted
set @fark = @ymik-@emik
update urun set Umiktar+=@fark where Ukodu=@ukod
end
update alim set almiktar = 13 where ukodu=2

create database butgemciftlik
use butgemciftlik

create table urunler(
urunno int primary key identity(1,1),
urunad nvarchar(50) not null,
urunstok int not null,
fiyat int not null
)

create table siparis(
sipno int primary key, 
urunid int not null,
adet int not null,
starihi date,
constraint fk_siparis_urunler foreign key(urunid)
references urunler(urunno)
on delete cascade
on update cascade
)