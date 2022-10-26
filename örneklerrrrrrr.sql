--tsql döngüler

--while döngüsü
--1 ile 8 arasýndaki tek sayýlarýn toplamý
declare @s int , @t int 
set @s=0
set @t=0
while (@s < 8)
begin
set @t = @t + @s
set @s = @s + 1
end