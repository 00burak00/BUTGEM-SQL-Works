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