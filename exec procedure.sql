use NORTHWND
exec CustOrdersDetail 10250

use sinavGaleri

create procedure ogrenliste--procedur olu�turma �al��t�r�l�r 
as
begin
	select * from ogrenciler	
end
go

exec ogrliste--exec ile procedure �al��t�r�l�r

--ogrencidersleri ad�nda bir procedure haz�rlay�n�nz. her bir ��renicinin ad�n�,soyad�n�,
--dersinadn�,vize,final, botlar�n� listelesin


