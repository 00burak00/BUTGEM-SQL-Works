--tsql d�ng�ler

--while d�ng�s�
--1 ile 8 aras�ndaki tek say�lar�n toplam�
declare @s int , @t int 
set @s=0
set @t=0
while (@s < 8)
begin
set @t = @t + @s
set @s = @s + 1
end