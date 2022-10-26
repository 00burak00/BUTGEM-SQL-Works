create database filmler
use filmler

create table filmler(
film_ID int primary key not null identity(1,1),
Ad nvarchar(75) not null,
Tarih int not null,
IMDB_Puan int not null)

create table turler(
tur_Id int primary key ,
ad nvarchar(20) not null
)
create table Film_Tur(
film_ID int not null foreign key references filmler(Film_ID),
tur_Id int foreign key references turler(tur_Id) )

create table Oyuncular(
oyuncu_Id int not null identity(1,1) primary key ,
Ad nvarchar(30) not null,
Soyad nvarchar(20) not null)

create table Oyuncu_Film(
oyuncu_Id int not null foreign key references Oyuncular(oyuncu_Id),
Film_Id int not null foreign key references filmler(film_Id)
)



insert into filmler values ('The Shawshank Redemption','1994',9.2)
insert into filmler values ('The Dark Knight','2008',8.8)
insert into filmler values ('Fight Club','1999',8.8)
insert into filmler values ('Forrest Gump','1994',8.6)
insert into filmler values ('Leon','1994',8.6)
insert into filmler values ('V For Vandetta','2006',8.1)
insert into filmler values ('A Beautiful Mind','2006',8)
insert into filmler values ('Eternal Sunshine of the Spotless Mind','2004',8.4)
insert into filmler values ('Inception','2010',8.8)
insert into filmler values ('Good Will Hunting','1997',8.1)

select * from filmler
insert into Film_Tur values(1,7) 
insert into Film_Tur values(2,7) 
insert into Film_Tur values(3,1) 
insert into Film_Tur values(4,null) 
insert into Film_Tur values(5,4) 
insert into Film_Tur values(6,2) 
insert into Film_Tur values(7,null) 
insert into Film_Tur values(8,3) 
delete  from Film_Tur
select * from Film_Tur

insert into turler values (1,'Dram')
insert into turler values (2,'Romnatik')
insert into turler values (3,'Bilim Kurgu')
insert into turler values (4,'Macera')
insert into turler values (5,'Gerilim')
insert into turler values (6,'Korku')
insert into turler values (7,'Suç')
select * from turler

insert into Oyuncular values('Tom','Hanks')
insert into Oyuncular values('natalia','Portman')
insert into Oyuncular values('jim','carrey')
insert into Oyuncular values('max','style')
select * from Oyuncular
insert into Oyuncu_Film values(1,1)
insert into Oyuncu_Film values(2,2)
insert into Oyuncu_Film values(1,4)
insert into Oyuncu_Film values(3,5)
insert into Oyuncu_Film values(4,6)
insert into Oyuncu_Film values(4,7)
insert into Oyuncu_Film values(3,3)
insert into Oyuncu_Film values(2,8)


select* from Film_Tur

--
select * from filmler
select * from Film_Tur
select * from Oyuncu_Film
select * from oyuncular
select * from turler
--
select * from filmler, Oyuncu_Film,Oyuncular where filmler.film_ID= Oyuncu_Film.Film_Id and Oyuncu_Film.oyuncu_Id = Oyuncular.oyuncu_Id and Oyuncular.oyuncu_Id = 1

select film_ID,Ad from filmler where film_ID  in 
(select film_ID from Oyuncu_Film where oyuncu_Id = (select oyuncu_Id from Oyuncular where Ad='Tom' and Soyad='Hanks'))
--
select film_Id,Ad,IMDB_Puan from filmler where film_ID in 
(select film_ID from Film_Tur where tur_Id in (select tur_Id from Turler where Ad='Macera'))

select filmler.Ad as [film Adý],filmler.IMDB_Puan as [Puan], Turler.ad from filmler inner join Film_Tur on filmler.film_ID=Film_Tur.film_ID inner join turler on Film_Tur.tur_Id=Turler.tur_Id where turler.ad = 'Macera'
--
select count(film_ID) from filmler where film_ID in 
(select film_ID from Oyuncu_Film where oyuncu_Id in 
(select oyuncu_Id from Oyuncular where Ad='Natalia' and Soyad='Portman')) 

select oyuncular.Ad+''+Oyuncular.Soyad,count(filmler.film_ID) from Oyuncular,Oyuncu_Film,filmler where oyuncular.oyuncu_Id=Oyuncu_Film.oyuncu_Id and Oyuncu_Film.Film_Id=filmler.film_ID
group by oyuncular.Ad+''+Oyuncular.Soyad having oyuncular.Ad+''+Oyuncular.Soyad = 'Natalia Portman'
--
select filmler.ad,filmler.IMDB_Puan,turler.ad from filmler inner join Film_Tur on  filmler.film_ID=Film_Tur.film_ID inner join turler on Film_Tur.film_ID=Turler.tur_Id where turler.ad = 'Dram' and filmler.IMDB_Puan > (select avg(filmler.IMDB_Puan) from filmler) 
--
select oyuncular.Ad+ '' +Oyuncular.Soyad,filmler.Ad,turler.ad from oyuncular,Oyuncu_Film,filmler,Film_Tur,turler where oyuncular.oyuncu_Id=Oyuncu_Film.oyuncu_Id and Oyuncu_Film.Film_Id= filmler.film_ID and filmler.film_ID=Film_Tur.film_ID and Film_Tur.tur_Id=turler.tur_Id and turler.tur_Id in (select tur_Id from turler where ad='Dram')

