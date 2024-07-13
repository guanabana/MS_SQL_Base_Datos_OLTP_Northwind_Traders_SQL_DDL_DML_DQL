--BD2_EjP1_practNW
USE Northwind
SET DATEFORMAT mdy

--2. Mostrar los datos de los clientes (CUSTOMERS) para todas las ordenes con destino a Brasil (Brazil)

SELECT DISTINCT customers.*
FROM CUSTOMERS,orders
WHERE customers.CUSTOMERID=orders.CUSTOMERID AND
      orders.SHIPCOUNTRY='Brazil'

/*3. Mostrar los nombres de las compañías de envío (SHIPPERS) utilizadas para 
   envíos de ordenes a Francia (France)*/

SELECT DISTINCT shippers.*
FROM orders,SHIPPERS
WHERE SHIPCOUNTRY='France' AND
      orders.SHIPVIA=shippers.SHIPPERID

/*4. Mostrar el nombre del comprador (Customers.CompanyName) , el nombre del producto (ProductName)
   y el descuento otorgado (Discount) para todas las ordenes con un descuento menor o igual a 0,15*/

SELECT customers.CompanyName,PRODUCTS.PRODUCTNAME,discount
FROM ORDERDETAILS,orders,products,customers
WHERE orders.ORDERID=ORDERDETAILS.ORDERID AND
      PRODUCTS.PRODUCTID=ORDERDETAILS.PRODUCTID AND
      orders.customerid=customers.customerid AND
      ORDERDETAILS.DISCOUNT <= 0.15

--5. Mostrar numero de orden, fecha de envío y datos de la region donde se envieron ordenes en el año 1997

SET DATEFORMAT dmy --lo seteamos asi para poder escribir las fechas segun el orden que nos gusta

SELECT * FROM Employees;
SELECT * FROM EmployeeTerritories;
SELECT * FROM orders;
SELECT * FROM TERRITORIES;
SELECT * FROM REGION;


SELECT orderid,shippeddate,region.*
FROM orders,Employees,EmployeeTerritories,Territories,Region 
WHERE orders.ShipRegion=Employees.Region AND
	Employees.EmployeeID= EmployeeTerritories.EmployeeID AND
	EmployeeTerritories.TerritoryID= Territories.TerritoryID AND
	Territories.RegionID= Region.RegionID AND
shippeddate >= '01/01/1997' AND shippeddate <= '31/12/1997'

/*6. Mostrar el nombre de los empleados que prepararon ordenes con destino Alemania (Germany) cuyo precio
   unitario es superior a 20 o cuya cantidad es mayor a 30*/

SELECT firstname,lastname,ORDERDETAILS.QUANTITY,ORDERDETAILS.UNITPRICE
FROM ORDERDETAILS,orders,EMPLOYEES
WHERE orders.EMPLOYEEID=EMPLOYEES.EMPLOYEEID AND
      orders.ORDERID=ORDERDETAILS.ORDERID AND
      orders.SHIPCOUNTRY='Germany' AND
      (ORDERDETAILS.UNITPRICE > 20 OR ORDERDETAILS.QUANTITY > 30)

--7. Mostrar los nombres de los proveedores (Supplier) que venden productos que no superen las 10 unidades en las órdenes en las que figuran.
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Products;
SELECT * FROM Suppliers;

SELECT DISTINCT s.CompanyName,s.SupplierID
FROM Orders o,OrderDetails od, Products p,Suppliers s
WHERE o.OrderID=od.OrderID AND
od.ProductID=p.ProductID AND
p.SupplierID=s.SupplierID AND
OD.Quantity <= 10;

--8. Mostrar la descirpcion de las categorias de productos que estan en ordenes que no tienen descuentos

SELECT DISTINCT CATEGORIES.CATEGORYNAME
FROM CATEGORIES,PRODUCTS,ORDERDETAILS
WHERE categories.CATEGORYID=PRODUCTS.CATEGORYID AND
      PRODUCTS.PRODUCTID=ORDERDETAILS.PRODUCTID AND
      ORDERDETAILS.DISCOUNT=0

	  
/*9. Mostrar numero de orden, nombre de la compañía cliente, contacto del cliente, codigo de producto, nombre de producto
   fecha de la orden, cantidad, precio unitario y precio total para todas las ordenes solicitadas en julio de 1996*/

SELECT ORDERS.ORDERID,CUSTOMERS.COMPANYNAME,CUSTOMERS.CONTACTNAME,
       ORDERDETAILS.PRODUCTID,PRODUCTS.PRODUCTNAME,ORDERS.REQUIREDDATE,
       ORDERDETAILS.QUANTITY,ORDERDETAILS.UNITPRICE,(ORDERDETAILS.QUANTITY*ORDERDETAILS.UNITPRICE-ORDERDETAILS.DISCOUNT) AS total
FROM ORDERS,ORDERDETAILS,CUSTOMERS,PRODUCTS
WHERE ORDERS.CUSTOMERID=CUSTOMERS.CUSTOMERID AND
      ORDERDETAILS.PRODUCTID=PRODUCTS.PRODUCTID AND
      ORDERS.ORDERID=ORDERDETAILS.ORDERID AND
      ORDERS.REQUIREDDATE >= '01/07/1996' AND
      ORDERS.REQUIREDDATE <= '31/07/1996'

--10. Mostar los nombres de los proveedores que proveen productos que estan en ordenes del año 1998 con destino USA

SELECT DISTINCT SUPPLIERS.COMPANYNAME
FROM SUPPLIERS,PRODUCTS,ORDERDETAILS,ORDERS
WHERE suppliers.SUPPLIERID=PRODUCTS.SUPPLIERID AND
      PRODUCTS.PRODUCTID = ORDERDETAILS.PRODUCTID AND
      ORDERDETAILS.ORDERID=ORDERS.ORDERID AND
      ORDERS.SHIPCOUNTRY='USA' AND orders.ORDERDATE >= '01/01/1998' AND
      orders.ORDERDATE <= '31/12/2008'

/*11. Mostrar los datos de las regiones a las que pertenecen los empleados que hicieron ordenes con destino
    a Rio de Janeiro*/

SELECT REGION.*
FROM region,TERRITORIES,EMPLOYEETERRITORIES,EMPLOYEES,ORDERS
WHERE REGION.REGIONID=TERRITORIES.REGIONID AND
      TERRITORIES.TERRITORYID=EMPLOYEETERRITORIES.TERRITORYID AND
      EMPLOYEES.EMPLOYEEID=EMPLOYEETERRITORIES.EMPLOYEEID AND
      EMPLOYEES.EMPLOYEEID=ORDERS.EMPLOYEEID AND
      ORDERS.SHIPCITY='Rio de Janeiro'

--12. Mostrar todos los datos de los productos que se ordenaron a un precio diferente al establecido para cada uno

SELECT PRODUCTS.*
FROM PRODUCTS,ORDERDETAILS
WHERE products.PRODUCTID=ORDERDETAILS.PRODUCTID
AND PRODUCTS.UNITPRICE <> ORDERDETAILS.UNITPRICE

--13. Mostrar el importe total de las ordenes del año 1996

SELECT SUM(orderdetails.unitprice*orderdetails.QUANTITY-orderdetails.discount) AS importetotal
FROM ORDERDETAILS,ORDERS
WHERE ORDERDETAILS.ORDERID=orders.ORDERID AND
      ORDERS.ORDERDATE >= '01/01/1996' AND
      orders.ORDERDATE <= '31/12/1996'

--14. Mostrar la cantidad promedio de las ordenes del año 1997

SELECT AVG(orderdetails.QUANTITY) AS promedio
FROM ORDERDETAILS,ORDERS
WHERE ORDERDETAILS.ORDERID=orders.ORDERID AND
      ORDERS.ORDERDATE >= '01/01/1997' AND
      orders.ORDERDATE <= '31/12/1997'

/*15. Mostrar el mayor importe uniario, el menor importe unitario, la mayor cantidad y la menor cantidad de las ordenes
    de los años 1996 y 1997*/

SELECT MAX(orderdetails.UNITPRICE) AS mayor_importe,MIN(orderdetails.UNITPRICE) AS menor_importe,
       max(ORDERDETAILS.QUANTITY) AS mayor_qty,min(orderdetails.QUANTITY) AS menor_qty
FROM ORDERDETAILS,ORDERS
WHERE ORDERDETAILS.ORDERID=orders.ORDERID AND
      ORDERS.ORDERDATE >= '01/01/1996' AND
      orders.ORDERDATE <= '31/12/1997'


--16. Mostrar la menor fecha de envío de todas las ordenes de 1998 con destino a Bélgica (Belgium)

SELECT MIN(orders.SHIPPEDDATE) AS menor_fecha
FROM ORDERDETAILS,ORDERS
WHERE ORDERDETAILS.ORDERID=orders.ORDERID AND
      ORDERS.ORDERDATE >= '01/01/1998' AND
      orders.ORDERDATE <= '31/12/1998' AND
      orders.SHIPCOUNTRY='Belgium'

--17. Mostrar la cantidad de paises diferentes a los que se le envían ordenes

SELECT count(DISTINCT(orders.SHIPCOUNTRY))
FROM ORDERS

/*18. Mostrar para cada cliente su nombre, la cantidad de ordenes procesadas y el importe total de las mismas en el año 1996
    Ordenar los resultados de mayor importe a menor importe*/

SELECT customers.COMPANYNAME,COUNT(DISTINCT(orders.ORDERID)) AS cantidad,
       sum(orderdetails.UNITPRICE*orderdetails.QUANTITY-ORDERDETAILS.discount) AS total
FROM ORDERDETAILS,ORDERS,CUSTOMERS
WHERE ORDERDETAILS.ORDERID=orders.ORDERID AND
      ORDERS.ORDERDATE >= '01/01/1996' AND
      orders.ORDERDATE <= '31/12/1996' AND
      ORDERS.CUSTOMERID=CUSTOMERS.CUSTOMERID
GROUP BY customers.COMPANYNAME
ORDER BY total desc     


--19. Mostrar los datos de los productos y el mayor descuento aplicado a cada uno de ellos

SELECT PRODUCTS.PRODUCTNAME,MAX(orderdetails.DISCOUNT) AS mayor_descuento
FROM PRODUCTS,ORDERDETAILS
WHERE products.PRODUCTID=ORDERDETAILS.PRODUCTID
GROUP BY PRODUCTS.PRODUCTNAME

--20. Mostrar la cantidad enviada por dia para el mes de noviembre de 1996

SELECT ORDERS.SHIPPEDDATE,sum(orderdetails.QUANTITY) AS cantidad
FROM ORDERDETAILS,ORDERS
WHERE ORDERDETAILS.ORDERID=orders.ORDERID AND
      ORDERS.ORDERDATE >= '01/11/1996' AND
      orders.ORDERDATE <= '30/11/1996' 
GROUP BY ORDERS.SHIPPEDDATE
ORDER BY ORDERS.SHIPPEDDATE

--21. Mostrar los nombres de los productos y la cantidad de ordenes en las que cada uno aparece

SELECT PRODUCTS.PRODUCTNAME,count(DISTINCT(orderdetails.ORDERID)) AS cantidad
FROM PRODUCTS,ORDERDETAILS
WHERE products.PRODUCTID=ORDERDETAILS.PRODUCTID
GROUP BY PRODUCTS.PRODUCTNAME
ORDER BY cantidad desc

