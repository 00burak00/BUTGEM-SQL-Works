--Tom Hanks’in oynadýðý filmleri getirsin
select * from Oyuncular
select * from filmler
select * from OyuncuFilm
--1. yol
select Oyuncular.OAd,Oyuncular.OSoyad,Filmler.FAd
from Oyuncular,OyuncuFilm,Filmler
where Oyuncular.OyuncuId=OyuncuFilm.OyuncuID
and OyuncuFilm.FilmID=Filmler.FilmID and Oyuncular.OAd='Tom' and Oyuncular.OSoyad='Hanks'
--2. yol
select Oyuncular.OAd,Oyuncular.OSoyad,Filmler.FAd
from Oyuncular,OyuncuFilm,Filmler
where Oyuncular.OyuncuId=OyuncuFilm.OyuncuID
and OyuncuFilm.FilmID=Filmler.FilmID and Oyuncular.OyuncuID=(select Oyuncular.OyuncuID from 
Oyuncular where oad='Tom' and OSoyad='Hanks')

--Türü macera olan filmlerin Adlarýný ve IMDB Puanlarýný 
--listeleyelim 
select Filmler.FAd as [Film Adý],filmler.IMDBPuan as[Puan],Turler.TurAd from Filmler
inner join FilmTur on filmler.FilmID=FilmTur.FilmID
inner join Turler on FilmTur.TurID=Turler.TurID where turler.TurAd='Macera'
--Natalia Portman’ýn oynadýðý film sayýsýný bulalým ;
select Oyuncular.OAd+' '+Oyuncular.OSoyad,count(filmler.FilmID) from Oyuncular,OyuncuFilm,Filmler
where Oyuncular.OyuncuID=OyuncuFilm.OyuncuID and OyuncuFilm.FilmID=Filmler.FilmID
group by Oyuncular.OAd+' '+Oyuncular.OSoyad having Oyuncular.OAd+' '+Oyuncular.OSoyad='Natalia Portman'
--IMDB Puaný, tüm filmlerin IMDB Puanlarýnýn ortalamasýndan büyük olan 
--dram filmlerin adlarýný, IMDB puanlarýný ve tarihlerini listeleyelim 
select Filmler.FAd,Filmler.IMDBPuan,Turler.TurAd from Filmler
inner join FilmTur on Filmler.FilmID=FilmTur.FilmID 
inner join Turler on FilmTur.TurID=Turler.TurID where Turler.TurAd='Dram' 
and Filmler.IMDBPuan>(select avg(filmler.IMDBPuan) from filmler)
--Tom Hanks’in oynadýðý dramatik filmleri bulalým 
--1.yol
select Oyuncular.OAd,Oyuncular.OSoyad,Filmler.FAd,Turler.TurAd
from Oyuncular,OyuncuFilm,Filmler,FilmTur,Turler
where Oyuncular.OyuncuID=OyuncuFilm.OyuncuID and OyuncuFilm.FilmID=Filmler.FilmID
and filmler.FilmID=FilmTur.FilmID and FilmTur.TurID=Turler.TurID and Turler.TurAd='Dram'
and Oyuncular.OAd+' '+Oyuncular.OSoyad='Tom Hanks'
--2.yol
select Oyuncular.OAd,Oyuncular.OSoyad,Filmler.FAd,Turler.TurAd
from Oyuncular,OyuncuFilm,Filmler,FilmTur,Turler
where Oyuncular.OyuncuID=OyuncuFilm.OyuncuID and OyuncuFilm.FilmID=Filmler.FilmID
and filmler.FilmID=FilmTur.FilmID and FilmTur.TurID=Turler.TurID and 
Turler.TurID=(select TurID from Turler where TurAd='Dram')
and Oyuncular.OAd+' '+Oyuncular.OSoyad='Tom Hanks'
select * from Oyuncular
select * from Filmler
select * from OyuncuFilm
select * from FilmTur
