create database yazkutuphanedb
use yazkutuphanedb

create table okuyucu
(
tc nvarchar(11) primary key,
unvan nvarchar(25) not null default('öğrenci'),
cinsiyet nvarchar(5) not null default('bayan'),
dtar date default(getdate())
)
create table kitap
(
kitapno int primary key,
isbn_no nvarchar(25),
kitap_adi nvarchar(100),
yazar_numarasi int,
tur_numarasi int,
sayfa_sayisi int,
puan int 
)