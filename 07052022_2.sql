use sirket
select * from Personel
--1.	Personel tablosundan maaþý 
--2500 ile 3700 arasýnda olan kadýn personellerin 
--ortalama maaþýný listeleyen sorguyu tasarlayarak kayýtlayýnýz.
select cinsiyet,avg(maas) as [ortalama maaþ] from Personel
where maas between 2500 and 3700 group by cinsiyet
having cinsiyet='K'
--2.	Personel tablosundan 
--4. Bölümde bulunan personellerin 
--bugün itibari ile kaç yýldýr bu iþte çalýþtýðýný 
--listeleyen sorguyu tasarlayarak kayýtlayýnýz.
select birim_no,ad,soyad,datediff(year,baslama_tarihi,getdate())
as [kaç yýldýr çalýþýyor] from personel where birim_no=4

--3.Personel tablosunda 
--kadýn personellerin 
--prim tutarlarýný %5 oranýnda artýrarak 
--güncelleyen sorguyu tasarlayarak kayýtlayýnýz.

--4.Personellerin ünvanlarýna göre 
--hangi ünvanda kaç personelin bulunduðunu listeleyen sorguyu tasarlayarak kayýtlayýnýz.
select * from personel
select * from unvan
select personel.unvan_no,unvan.unvan_ad,count(personel.unvan_no)
as [çalýþan sayýsý] from personel inner join unvan 
on unvan.unvan_no=personel.unvan_no group by personel.unvan_no,unvan_ad

--5.	Personellerin ad soyadlarýna 
--göre erkek personellerden 
--hangi personelin kaç çocuðu olduðunu listeleyen sorguyu tasarlayarak kayýtlayýnýz.
select * from personel
select * from cocuk
select  personel.ad,personel.soyad,count(cocuk.personel_no) as[çocuk sayýsý]
from cocuk inner join personel on cocuk.personel_no=personel.personel_no
where personel.cinsiyet='e' group by personel.ad,personel.soyad


--6.	proje tablosuna göre 
--tamamlanma süresi 24 aydan fazla olan projelerin 
--adlarýný ve tamamlanma sürelerini 
--ay olarak listeleyen listeleyen sorguyu tasarlayarak kayýtlayýnýz.
select * from proje 
select proje_ad,DATEDIFF(month,baslama_tarihi,planlanan_bitis_tarihi) 
as [süre(ay)]
from proje where DATEDIFF(month,baslama_tarihi,planlanan_bitis_tarihi)>24


--7.	Personel tablosundan 
--yaþý en küçük olan personeli 
--listeleyen sorguyu tasarlayarak kayýtlayýnýz. 
select * from personel
select top(1) *, datediff(year,dogum_tarihi,getdate()) as yas from personel
order by yas
select top(1) * from personel order by dogum_tarihi desc






--8.	Personel tablosuna göre adýnýn ilk karakteri 
--a-r arasýnda ve soyadýnýn ikinci karakteri a olan 
--personelleri listeleyen sorguyu tasarlayarak kayýtlayýnýz. 
select * from personel
select * from personel where ad like '[a-r]%' and soyad like '_a%'
--9.	personel ad soyada göre 
--projelerde 2 den fazla görev verilen 
--personellerin ad soyad ve görevlendirilme sayýlarýný listeleyen sorguyu tasarlayarak kayýtlayýnýz. 

select personel.ad,personel.soyad,proje.proje_no,proje.proje_ad,
count(gorevlendirme.personel_no) as gorev_say 
from gorevlendirme  inner join personel on personel.personel_no=gorevlendirme.gorevlendirme_no
inner join proje on gorevlendirme.proje_no=proje.proje_no
group by personel.ad,personel.soyad,proje.proje_no,proje.proje_ad

--9
select personel.ad+' '+personel.soyad as [Ad Soyad],
count(gorevlendirme.personel_no) as [Görev Sayýsý]
from personel,gorevlendirme 
where personel.personel_no=gorevlendirme.personel_no 
group by personel.ad+' '+personel.soyad
having count(gorevlendirme.personel_no)>2

--10.	
select * from personel
--personellerin ad, soyad, 
--çocuklarýnýn ad, soyad, doðduklarý ilçe adý ve il adýný 
--listeleyen sorguyu tasarlayarak kayýtlayýnýz. (
select personel.ad,personel.soyad,cocuk.ad,cocuk.soyad,ilce.ilce_ad,il.il_ad
from personel inner join cocuk on personel.personel_no=cocuk.personel_no
inner join ilce on cocuk.dogu_yeri=ilce.ilce_no
inner join il on ilce.il_no=il.il_no order by personel.soyad

--