--5
create procedure EmekliyeAyır
as
begin
delete from Personel where GirisYili < 1984
end
exec EmekliyeAyır
