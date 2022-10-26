use GALERÝ2022
insert into MUSTERÝ values('Turgut','ÖZSEVEN','Turhal/TOKAT','03562222222')

insert into ARAC values(2004,'Fiat Marea','60TT6060',16000)

select * from MUSTERÝ
select * from ARAC

insert into SATIS values(4,2,getdate(),20000)
insert into ALIM values(4,2,GETDATE(),16000)

delete  from ALIM
delete from SATIS
delete from MUSTERÝ
delete from ARAC

truncate table musteri
truncate table ARAC
truncate table SATIS
truncate table ALIM

--sorular
--1
select * from MUSTERÝ order by madi
--2
select * from ARAC order by Model desc, Fiyat
--3
select ano,Starihi,sfiyat as [Satýþ Fiyatý] from SATIS

--4
select * from ARAC
select * from ARAC where fiyat<=20000 order by fiyat desc

--5
select * from SATIS
select * from SATIS where Sfiyat>10000 and mno=4--or

--6
select * from SATIS
select * from SATIS where Starihi>='2010-06-01'-- mayýstan sonra

--7
select atarih,afiyat,ano from ALIM where atarih between '2010-02-01' and '2010-06-30' and
afiyat>10000 order by ATarih desc, afiyat desc

--8
select * from SATIS where sfiyat between 10000 and 20000 and mno in(2,4)

--9***************ÝKÝ TABLODAN VERÝ ÇEKME

--10
SELECT * FROM MUSTERÝ WHERE madres like('%tokat%') and mtel like('%6%')

--11
select * from MUSTERÝ
select madres,mtel from MUSTERÝ where Madi like('a%')

--12
select model,marka,fiyat from ARAC where marka like('%opel%') or marka like('%fiat%')
order by marka

--13
select * from ARAC where model in(1998,2005,2007) order by fiyat
--BÝRDEN FAZLA TABLODAN VERÝ ÇEKMEK
select * from ALIM
select * from MUSTERÝ
select * from ARAC
select Afiyat,madi from ALIM,MUSTERÝ where ALIM.Mno=MUSTERÝ.Mno
select madi,madres,mtel,atarih,afiyat from ALIM,MUSTERÝ 
where ALIM.Mno=MUSTERÝ.Mno
--müþterini adý, soyadý, hangi marka aracý hangi tarihte kaça almýþ????
select madi,msoyadi,marka,atarih,afiyat from MUSTERÝ,ARAC,ALIM 
where ALIM.Mno=MUSTERÝ.Mno and ALIM.Ano=ARAC.Ano

