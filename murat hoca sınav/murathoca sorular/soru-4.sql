--4
create procedure Gruplamak
as
begin
select GoreviAdi,avg(Maas)as ortalama from Personel,Gorevler where Gorevler.GoreviID = Personel.PersonelID group by GoreviAdi
end
exec Gruplamak
