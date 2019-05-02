#Daftar pelanggan yang beralamat di kota Irvine
select * from customers where city = 'Irvine';

#Daftar semua pelanggan yang pesanannya ditangani karyawan bernama Adam Barr
select DISTINCT(c.companyName) from customers c inner join orders o on o.CustomerID=c.CustomerID
inner join employees e on e.EmployeeID=o.EmployeeID 
where e.FirstName = 'Adam' and e.LastName = 'Barr';

#Daftar produk yang dipesan oleh pelanggan Contoso, Ltd
SELECT prd.* FROM products prd inner join order_details od on od.ProductID=prd.ProductID
inner join orders o on o.OrderID=od.OrderID
inner join customers c on c.CustomerID = o.CustomerID
where c.companyName='Contoso, Ltd';

#Daftar transaksi pemesanan yang dikirimkan melalui UPS Ground
SELECT od.* FROM products prd inner join order_details od on od.ProductID=prd.ProductID
inner join orders o on o.OrderID=od.OrderID
inner join shipping_methods sp on sp.ShippingMethodID=o.ShippingMethodID
where sp.ShippingMethod = 'UPS Ground';

#Daftar biaya total pemesanan (termasuk pajak dan biaya pengiriman) setiap transaksi diurut berdasarkan tanggal transaksi
SELECT od.*, o.OrderDate, o.FreightCharge, o.Taxes, 
((((od.Quantity*od.UnitPrice) - (od.Quantity*od.UnitPrice*od.Discount/100))) + (((od.Quantity*od.UnitPrice) - (od.Quantity*od.UnitPrice*od.Discount/100)) * (o.Taxes / 100))) count
FROM products prd inner join order_details od on od.ProductID=prd.ProductID
inner join orders o on o.OrderID=od.OrderID
inner join shipping_methods sp on sp.ShippingMethodID=o.ShippingMethodID
order by o.OrderDate;