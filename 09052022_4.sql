use NORTHWND
--en yüksek sipariþi(para) veren müþteri/ler adý, ürünün adý
--customers,product,order,order details
select Customers.ContactName,Products.ProductName,[Order Details].Quantity,
Orders.OrderID from Customers,Orders,[Order Details],Products
where Customers.CustomerID=Orders.CustomerID 
and Orders.OrderID=[Order Details].OrderID
and [Order Details].ProductID=Products.ProductID
and [Order Details].Quantity=(select max([Order Details].Quantity) from [Order Details])
