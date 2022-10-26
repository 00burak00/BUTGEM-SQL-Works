--murat hoca ödevi

use GALERÝ2022
select * from musteri
insert into musteri values('turgut','özseven','Turhal/Tokat',0565156165)
select * from musteri
insert into musteri values('mustafa','çaðlayan','Meram/Konya',016515615)
select * from musteri
insert into musteri values('ahmet','kara','zile/tokat',05131654)
select * from musteri
insert into musteri values('murat','beyaz','Turhal/Tokat',05131654)
select * from musteri
insert into musteri values('elif','kurt','Beþiktaþ/Ýstanbul',05131654)
select * from musteri
insert into musteri values('Ayþe','Uçar','Taþova/Amasya',05131654)
select * from musteri
insert into musteri values('Bülent','ayar','Turhal/tokat',05131654)

select * from arac
insert into arac values(2004,'Fiat Marea','60TT6060','0565156165')
select * from arac
insert into arac values(2000,'Renault Megane','60TT6061','0565156165')
select * from arac
insert into arac values(2007,'Ford Focus','60TT6062',0565156165)
select * from arac
insert into arac values(2005,'Wolswagen Golf','60TT6063',0565156165)
select * from arac
insert into arac values(1998,'Opel Astra','60TT6064',0565156165)

select * from satis
insert into satis values('5','26','2010-05-04','17000')
select * from satis
insert into satis values('6','27','2010-06-01','11500')
select * from satis
insert into satis values('7','28','2010-06-15','27000')
select * from satis
insert into satis values('8','29','2010-07-02','17500')

select * from alim
insert into alim values('5','26','2010-02-08','15000')
select * from alim
insert into alim values('6','27','2010-12-04','15500')
select * from alim
insert into alim values('7','28','2010-04-15','9500')
select * from alim
insert into satis values('8','29','2010-05-15','14000')
select * from alim
insert into alim values('9','30','2010-08-22','26000')

--1
select madi from musteri order by madi

--2
select model from arac order by model desc
select fiyat from arac order by fiyat asc
select * from arac order by model desc, fiyat
--3
select ano as [Araç Numarasý],starihi as [Satýþ Tarihi],sfiyat as [Satýþ Fiyatý] from satis

--4
select * from arac where fiyat <=12000 order by fiyat desc
select * from arac where fiyat <=20000 order by fiyat desc

--5
select * from satis where sfiyat > 10000 and mno = 4

--6
select * from satis where starihi >= '2010-06-01' --mayýstan sonrasý

--7
select * from alim where atarih between '2010-02-1' and '2010-06-30' and afiyat > 10000 order by atarih desc,afiyat desc

--8
select * from satis where mno in(2,4) and sfiyat between 10000 and 20000  
--9********--iki tablodan veri çekme
--10
select * from musteri where madres like '%tokat%'

--11
select * from musteri where  mtel like '%6%'

--12
select madres,mtel from musteri where madi like 'a%'

--13
select model,marka,fiyat from arac where marka like '%opel%' or marka like '%fiat%' order by marka asc

--14
select * from arac where model in(1998,2005,1997) order by model asc

---birden fazla tablodan veri çekme
select* from alim
select * from musteri
select afiyat,madi from alim, musteri where alim.mno=musteri.mno