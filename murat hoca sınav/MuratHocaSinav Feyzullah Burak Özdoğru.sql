create database sinavMuratHoca
use sinavMuratHoca

--1-soru
create table Gorevler (
GoreviID int not null primary key ,
GoreviAdi varchar(20) not null
)
create table Egitim(
ID int not null primary key,
EgitimAdi varchar(50) not null
)
create table Personel(
PersonelID int primary key not null,
PersonelAdSoyad varchar(30) not null,
Gorevi int not null foreign key references Gorevler(GoreviId),
Maas money not null,
Yasi int not null,
GirisYili int not null,
EgitimDerecesi int not null foreign key references Egitim(ID)
)
--2 Soru
create procedure BilgiEkle
as
begin 
--Gorevler
insert into Gorevler values(1,'Ýþçi')
insert into Gorevler values(2,'Memur')
insert into Gorevler values(3,'Tekniker')
insert into Gorevler values(4,'Müdür Yardýmcýsý')
insert into Gorevler values(5,'Müdür')
--Egitim
insert into Egitim values(1,'ÝlkOkul')
insert into Egitim values(2,'Ortaokul')
insert into Egitim values(3,'Lise')
insert into Egitim values(4,'Lisans')
insert into Egitim values(5,'Yüksek Lisans')
insert into Egitim values(6,'Doktora')
--Personel
insert into Personel values(1,'Tolunay Özcan',1,800,27,1950,1)
insert into Personel values(2,'Burak Özdoðru',2,100,28,1975,2)
insert into Personel values(3,'Fatma Nur Altýn',3,1200,30,1985,3)
insert into Personel values(4,'Furkan Yýldýz',4,1400,27,1990,4)
insert into Personel values(5,'Hüseyin Koçdemir',5,1600,29,1986,5)
end
execute BilgiEkle

--3 soru

create procedure MaasArttir
as
begin
update Personel set Maas = Maas + 200 from Personel,Egitim where 
Personel.EgitimDerecesi=Egitim.ID and Maas <1000 and EgitimAdi = 'Yüksek Lisans'
end
exec MaasArttir
--4
create procedure Gruplamak
as
begin
select GoreviAdi,avg(Maas)as ortalama from Personel,Gorevler where Gorevler.GoreviID = Personel.PersonelID group by GoreviAdi
end
exec Gruplamak

--5
create procedure EmekliyeAyýr
as
begin
delete from Personel where GirisYili < 1984
end
exec EmekliyeAyýr

--6
create procedure MudurMaasArttir
as
begin 
update Personel set Maas = Maas + Maas*2/10 from Personel,Gorevler  where Gorevler.GoreviID = Personel.PersonelID 
and Yasi >18 and Yasi <25  and GoreviAdi = 'Müdür Yardýmcýsý'
update personel set Maas = Maas - Maas*2/10 from Personel,Gorevler  where Gorevler.GoreviID = Personel.PersonelID 
and Yasi >18 and Yasi <25 and GoreviAdi != 'Müdür Yardýmcýsý' 
end
execute MudurMaasArttir

--7
drop database sinavMuratHoca
