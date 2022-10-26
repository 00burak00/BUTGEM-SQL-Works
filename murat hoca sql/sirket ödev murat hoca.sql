use sirket
select * from personel
--1
select cinsiyet,avg(maas) as [kadýnlarýn ortalama maaþlarý] from personel where 
maas between 2500 and 3700 group by cinsiyet having cinsiyet='K'
--2
select ad,soyad,birim_no,datediff(year,baslama_tarihi,getdate()) 
as [Çalýþma Süresi]   from personel where birim_no=4
--3
select * from personel
update  personel set prim = prim+prim*5/100 where cinsiyet='k'
--4
select  personel.unvan_no,unvan.unvan_ad,count(personel.unvan_no) as 
[unvanda bulunan kiþi sayýsý] from personel inner join unvan on 
unvan.unvan_no = personel.unvan_no group by personel.unvan_no,unvan_ad
--5
select personel.ad,personel.soyad,count(personel.personel_no) as [Çocuk Sayýsý] from 
personel join cocuk on personel.personel_no = cocuk.personel_no where 
personel.cinsiyet='E' group by personel.ad,personel.soyad
--6
select proje_ad,datediff(month,baslama_tarihi,planlanan_bitis_tarihi) as [24 aydan fazla olanlar]  
from proje where datediff(month,baslama_tarihi,planlanan_bitis_tarihi) > 24
--7
select   top(1) ad,soyad, datediff(year,dogum_tarihi,getdate()) as yas from personel order by yas
--8
select ad,soyad from personel where ad like '[a-r]%' and soyad like '_a%'
--9--yapamadým
select * from gorevlendirme join personel on personel.personel_no= gorevlendirme.gorevlendirme_no 
select count(gorevlendirme.personel_no) from gorevlendirme join personel on personel.personel_no= gorevlendirme.gorevlendirme_no where gorevlendirme.personel_no >1 group by gorevlendirme.personel_no, personel.ad


select personel.ad,personel.soyad,proje.proje_no,proje.proje_ad,count(gorevlendirme.personel_no) 
as gorev_say from gorevlendirme inner join personel on 
personel.personel_no=gorevlendirme.personel_no
inner join proje on gorevlendirme.proje_no=proje.proje_no 
group by personel.ad,personel.soyad,proje.proje_no,proje.proje_ad

select personel.ad+' '+personel.soyad as [Ad Soyad],
count(gorevlendirme.personel_no) as [Görev Sayýsý]
from personel, gorevlendirme where personel.personel_no=gorevlendirme.personel_no
group by personel.ad+' '+personel.soyad
having count(gorevlendirme.personel_no) > 2
--10
select personel.ad,personel.soyad,cocuk.ad,cocuk.soyad,ilce.ilce_ad,il.il_ad from 
personel join cocuk on personel.personel_no=cocuk.personel_no join ilce on 
cocuk.dogu_yeri=ilce_no join il on ilce.il_no=il.il_no order by personel.soyad