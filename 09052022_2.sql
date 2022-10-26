use Sirket2
insert into Yonetici values(0371,'Ali Kulak')
insert into Yonetici values(2771,'Caner Ardýç')
insert into Yonetici values(2772,'Sanem Durdu')
insert into Yonetici values(5772,'Necati Yavaþ')
select * from Yonetici
insert into Bolum values('Satýþ',0371,'1989-01-07',5)
insert into Bolum values ('Muhasebe',2771,'1991-02-08',33)
insert into Bolum values ('Uretim',5772,'1996-05-05',55)
insert into Bolum values ('Elektrik',2772,'2005-05-06',175)
select * from Bolum
insert into Personel 
values(5,6764,'Ali','Can','1960-05-01','Karabaþ mh. Ýzmit','E',7600,1,0371,'E')
insert into Personel values (33,2764,'Serhat','Can','1960-05-01','Karabaþ Mh - Ýzmit', 'E',6666,3,5772,'E')
insert into Personel values (55,6764,'Naim','Can','1960-05-01','Karabaþ Mh - Ýzmit', 'E',6600,2,2771,'E')
insert into Personel values (112,2764,'Berk','Can','1960-05-01','Karabaþ Mh - Ýzmit', 'E',8800,4,2772,'H')
insert into Personel values (175,9674,'Aliye','Canan','1970-05-01','Sakarya', 'K',6000,1,0371,'E')
insert into Personel values (217,1762,'Akýn','Oncel','1965-07-11','Ýzmit', 'E',7700,2,2771,'H')
insert into Personel (sicilNo,ySosGuvNo) values (223,0371)

select * from Personel