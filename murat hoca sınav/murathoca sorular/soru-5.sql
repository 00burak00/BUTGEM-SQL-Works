--5
create procedure EmekliyeAyýr
as
begin
delete from Personel where GirisYili < 1984
end
exec EmekliyeAyýr
