select * from Personel
select * from Bolum
select max(maas) as [En Y�ksek Maa�] from Personel
--select top(1) personel.ad,max(Personel.maas) as [En Y�ksek Maa�] from
--Personel group by Personel.ad order by max(personel.maas) desc
select * from Personel where maas=(select max(maas) from Personel)
--her bir b�l�mden en y�ksek maa�� alan personel bilgileri
select * from Personel
select * from Personel where maas 
in(select max(maas) from Personel group by bolNo having bolNo>0 )order by bolNo
--1. b�l�m d���nda en y�ksek maa�� alanlar
select * from Personel where personel.bolNo<>1 and maas 
in(select max(maas) from Personel group by bolNo)order by bolNo
select * from Personel where  maas 
in(select max(maas) from Personel group by bolNo having personel.bolNo<>1)order by bolNo
-- En y�ksek maa�� alan personelin ad� maa�� ve y�neticisinin ismi?
select Personel.ad,Personel.maas,Yonetici.yonAdiSoyadi from Personel
inner join Yonetici on Personel.ySosGuvNo=Yonetici.yonSosGno
where maas=(select max(maas) from Personel)
select Personel.ad,Personel.maas,Yonetici.yonAdiSoyadi from Personel,Yonetici
where Personel.ySosGuvNo=Yonetici.yonSosGno and maas=(select max(maas) from Personel)
--herbir bl�mden En y�ksek maa�� alan personelin ad� maa�� ve y�neticisinin ismi?
select Personel.bolNo,Personel.ad,Personel.maas,Yonetici.yonAdiSoyadi from Personel
inner join Yonetici on Personel.ySosGuvNo=Yonetici.yonSosGno
where maas in(select max(maas) from Personel group by Personel.bolNo having bolNo>0) 
order by Personel.bolNo
 --En d���k maa�� alan personelin y�neticisinin b�l�m�?
 select * from Personel
 select * from Yonetici
 select * from Bolum
 select Personel.ad as [Personel Ad�],Personel.maas,Yonetici.yonAdiSoyadi as [Y�netici Ad�],
 Bolum.bolAd from Personel,Yonetici,Bolum where Personel.ySosGuvNo=Bolum.yonSosGno and Yonetici.yonSosGno=Bolum.yonSosGno
 and maas=(select min(maas) from Personel)

  select Personel.ad as [Personel Ad�],Personel.maas,Yonetici.yonAdiSoyadi as [Y�netici Ad�],
 Bolum.bolAd from Personel right join Yonetici on  Personel.ySosGuvNo=Yonetici.yonSosGno 
right join Bolum on Yonetici.yonSosGno=Bolum.yonSosGno
where maas=(select min(maas) from Personel)
