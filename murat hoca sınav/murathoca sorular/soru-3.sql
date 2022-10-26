--3 soru

create procedure MaasArttir
as
begin
update Personel set Maas = Maas + 200 from Personel,Egitim where 
Personel.EgitimDerecesi=Egitim.ID and Maas <1000 and EgitimAdi = 'Yüksek Lisans'
end
exec MaasArttir