use filmler
select * from Oyuncular
--tabloya yeni alan ekleme
alter table oyuncular add GercekAdSoyad nvarchar(50)
select * from Oyuncular
--tablodan alan siler
alter table oyuncular drop column GercekAdSoyad
select * from Oyuncular

select * from Filmler
alter table filmler add yonetmen nvarchar(25)
select * from Filmler
update filmler set yonetmen='Abdürrezzak Traore Abdürrezzak Traore'
alter table filmler alter column yonetmen nvarchar(50)
--kýsýtlama deðiþtirme
alter table OyuncuFilm alter column OyuncuId int not null
alter table OyuncuFilm alter column FilmId int not null
select * from Turler
--insert into Turler values('Dram')
--delete from turler where TurID=8
-- tablonun istenile alanýný unique benzersiz yapar
alter table turler add unique(TurAd)

create table yonetmenler(
id int not null  identity(1,1),
ad nvarchar(20) not null default('osman'),
soyad nvarchar(20) not null default 'sýnav',
constraint pk_id primary key(id)
)
select * from yonetmenler
alter table yonetmenler drop constraint pk_id
alter table yonetmenler add constraint pk_no primary key(id)

--örnekler
alter table filmler alter column yonetmen nvarchar(50) not null
alter table filmler alter column yonetmen nvarchar(50) null
update filmler set yonetmen=null 
alter table filmler alter column yonetmen int not null
alter table filmler add constraint fk_yonetmenfilm 
foreign key(yonetmen) references yonetmenler(id)


--check özelliði ekleme
select * from filmler
alter table filmler add check(IMDB_Puan>7)
insert into filmler values('Recep Ývedik 1',2000,7.0001,1)

--default özelliði ekleme silme
alter table Turler add constraint dfturad default 'komik' for TurAd
select * from Turler
alter table Turler add deneme nvarchar(20)
insert into Turler(deneme) values('hoppa')
alter table Turler drop constraint dfturad
insert into Turler(ad,deneme) values('Biyografi','hoppa2')

--cascade özelliði ekleme çýkarma
alter table filmler drop constraint fk_yonetmenfilm
alter table filmler add constraint fk_yonetmenfilm1 foreign key(yonetmen)
references yonetmenler(id) on delete cascade on update cascade

select * from yonetmenler
select * from filmler
delete from filmler where yonetmen=1
delete from yonetmenler where id=1



















