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

--sipariþlere ekleme yapýldýðý zaman ürünlere update yapýlacak

