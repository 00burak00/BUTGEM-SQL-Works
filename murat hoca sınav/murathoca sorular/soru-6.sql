--6
create procedure MudurMaasArttir
as
begin 
update Personel set Maas = Maas + Maas*2/10 from Personel,Gorevler  where Gorevler.GoreviID = Personel.PersonelID 
and Yasi >18 and Yasi <25  and GoreviAdi = 'M�d�r Yard�mc�s�'
update personel set Maas = Maas - Maas*2/10 from Personel,Gorevler  where Gorevler.GoreviID = Personel.PersonelID 
and Yasi >18 and Yasi <25 and GoreviAdi != 'M�d�r Yard�mc�s�' 
end
execute MudurMaasArttir