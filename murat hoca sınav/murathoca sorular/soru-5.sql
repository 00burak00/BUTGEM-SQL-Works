--5
create procedure EmekliyeAy�r
as
begin
delete from Personel where GirisYili < 1984
end
exec EmekliyeAy�r
