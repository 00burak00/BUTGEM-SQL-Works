use sirket
select * from Personel
--1.	Personel tablosundan maa�� 
--2500 ile 3700 aras�nda olan kad�n personellerin 
--ortalama maa��n� listeleyen sorguyu tasarlayarak kay�tlay�n�z.
select cinsiyet,avg(maas) as [ortalama maa�] from Personel
where maas between 2500 and 3700 group by cinsiyet
having cinsiyet='K'
--2.	Personel tablosundan 
--4. B�l�mde bulunan personellerin 
--bug�n itibari ile ka� y�ld�r bu i�te �al��t���n� 
--listeleyen sorguyu tasarlayarak kay�tlay�n�z.
select birim_no,ad,soyad,datediff(year,baslama_tarihi,getdate())
as [ka� y�ld�r �al���yor] from personel where birim_no=4

--3.Personel tablosunda 
--kad�n personellerin 
--prim tutarlar�n� %5 oran�nda art�rarak 
--g�ncelleyen sorguyu tasarlayarak kay�tlay�n�z.

--4.Personellerin �nvanlar�na g�re 
--hangi �nvanda ka� personelin bulundu�unu listeleyen sorguyu tasarlayarak kay�tlay�n�z.
select * from personel
select * from unvan
select personel.unvan_no,unvan.unvan_ad,count(personel.unvan_no)
as [�al��an say�s�] from personel inner join unvan 
on unvan.unvan_no=personel.unvan_no group by personel.unvan_no,unvan_ad

--5.	Personellerin ad soyadlar�na 
--g�re erkek personellerden 
--hangi personelin ka� �ocu�u oldu�unu listeleyen sorguyu tasarlayarak kay�tlay�n�z.
select * from personel
select * from cocuk
select  personel.ad,personel.soyad,count(cocuk.personel_no) as[�ocuk say�s�]
from cocuk inner join personel on cocuk.personel_no=personel.personel_no
where personel.cinsiyet='e' group by personel.ad,personel.soyad


--6.	proje tablosuna g�re 
--tamamlanma s�resi 24 aydan fazla olan projelerin 
--adlar�n� ve tamamlanma s�relerini 
--ay olarak listeleyen listeleyen sorguyu tasarlayarak kay�tlay�n�z.
select * from proje 
select proje_ad,DATEDIFF(month,baslama_tarihi,planlanan_bitis_tarihi) 
as [s�re(ay)]
from proje where DATEDIFF(month,baslama_tarihi,planlanan_bitis_tarihi)>24


--7.	Personel tablosundan 
--ya�� en k���k olan personeli 
--listeleyen sorguyu tasarlayarak kay�tlay�n�z. 
select * from personel
select top(1) *, datediff(year,dogum_tarihi,getdate()) as yas from personel
order by yas
select top(1) * from personel order by dogum_tarihi desc






--8.	Personel tablosuna g�re ad�n�n ilk karakteri 
--a-r aras�nda ve soyad�n�n ikinci karakteri a olan 
--personelleri listeleyen sorguyu tasarlayarak kay�tlay�n�z. 
select * from personel
select * from personel where ad like '[a-r]%' and soyad like '_a%'
--9.	personel ad soyada g�re 
--projelerde 2 den fazla g�rev verilen 
--personellerin ad soyad ve g�revlendirilme say�lar�n� listeleyen sorguyu tasarlayarak kay�tlay�n�z. 

select personel.ad,personel.soyad,proje.proje_no,proje.proje_ad,
count(gorevlendirme.personel_no) as gorev_say 
from gorevlendirme  inner join personel on personel.personel_no=gorevlendirme.gorevlendirme_no
inner join proje on gorevlendirme.proje_no=proje.proje_no
group by personel.ad,personel.soyad,proje.proje_no,proje.proje_ad

--9
select personel.ad+' '+personel.soyad as [Ad Soyad],
count(gorevlendirme.personel_no) as [G�rev Say�s�]
from personel,gorevlendirme 
where personel.personel_no=gorevlendirme.personel_no 
group by personel.ad+' '+personel.soyad
having count(gorevlendirme.personel_no)>2

--10.	
select * from personel
--personellerin ad, soyad, 
--�ocuklar�n�n ad, soyad, do�duklar� il�e ad� ve il ad�n� 
--listeleyen sorguyu tasarlayarak kay�tlay�n�z. (
select personel.ad,personel.soyad,cocuk.ad,cocuk.soyad,ilce.ilce_ad,il.il_ad
from personel inner join cocuk on personel.personel_no=cocuk.personel_no
inner join ilce on cocuk.dogu_yeri=ilce.ilce_no
inner join il on ilce.il_no=il.il_no order by personel.soyad

--