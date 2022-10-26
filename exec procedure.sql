use NORTHWND
exec CustOrdersDetail 10250

use sinavGaleri

create procedure ogrenliste--procedur oluþturma çalýþtýrýlýr 
as
begin
	select * from ogrenciler	
end
go

exec ogrliste--exec ile procedure çalýþtýrýlýr

--ogrencidersleri adýnda bir procedure hazýrlayýnýnz. her bir öðrenicinin adýný,soyadýný,
--dersinadný,vize,final, botlarýný listelesin


