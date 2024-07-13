En este proyecto trabajamos con una base de datos relacional pública de Microsoft  sobre una empresa Ficticia que tiene un sistema de datos modelado tipo OLTP (Procesamiento de Transacciones en Línea).
El objetivo es familiarizarse con la lógica de negocio y realcionamiento de Entidades y Datos para posteriormente en otros Repo empezar a trabajar Store Procedures (SP) y Triggers.
Tendremos 3 Practicos en Total, para ello contamos con un MER que nos da una idea de como es la Base de Datos y como poder construir las consultas.

Respecto a la Base de Datos: 
Si bien la tenemos en el repositorio, también la pueden encontrar en el siguiente link:
https://github.com/microsoft/sql-server-samples.git

Trabajé con Microsoft SQL Server 2019 (RTM) - 15.0.2000.5 (X64)   
Para Saber que versiòn tienes puedes utilizar este comando: SELECT @@VERSION 

MER: 
![NorthWind_ER](https://github.com/user-attachments/assets/9371f4e1-aa20-48a8-b2f0-a0e551b2c33b)

Practico_3_parte1 – SQL

1. Ejecutar el script NorthWind_SQLServer.sql (de este repo) y verificar que se crearon todas las estructuras con sus datos correspondientes.
2. Mostrar los datos de los clientes (CUSTOMERS) para todas las ordenes con
destino a Brasil (Brazil).
3. Mostrar los nombres de las compañías de envío (SHIPPERS) utilizadas para envíos de ordenes a Francia (France).
4. Mostrar el nombre del comprador (ShipName) , el nombre del producto (ProductName) y el descuento otorgado (Discount) para todas las ordenes con un descuento menor o igual a 0,15.
5. Mostrar numero de orden, fecha de envío y datos de la región donde se
enviaron ordenes en el año 1997.
6. Mostrar el nombre de los empleados que prepararon ordenes con destino Alemania (Germany) cuyo precio unitario es superior a 20 o cuya cantidad es mayor a 30.
7. Mostrar los nombres de los proveedores (Supplier) que venden productos que no superen las 10 unidades en las órdenes en las que figuran.
8. Mostrar la descripción de las categorias de productos que están en ordenes que no tienen descuentos (discount=0).
9. Mostrar numero de orden, nombre de la compañía cliente, contacto del cliente, código deproducto, nombre de producto fecha de la orden,
cantidad, precio unitario y precio total para todas las ordenes solicitadas en julio de 1996.
10. Mostar los nombres de los proveedores que proveen productos que están en
ordenes del año 1998 con destino USA.
11. Mostrar los datos de las regiones a las que pertenecen los empleados que hicieron ordenes con
destino a Rio de Janeiro.
12. Mostrar todos los datos de los productos que se ordenaron a un precio
diferente al establecido para cada uno.
13. Mostrar el importe total de las ordenes del año 1996.
14. Mostrar la cantidad promedio de las ordenes del año 1997.
15. Mostrar el mayor importe unitario, el menor importe unitario, la mayor cantidad y la menor
cantidad de las ordenes de los años 1996 y 1997.
16. Mostrar la menor fecha de envío de todas las ordenes de 1998 con destino a
Bélgica (Belgium).
17. Mostrar la cantidad de países diferentes a los que se le envían ordenes.
18. Mostrar para cada cliente su nombre, la cantidad de ordenes procesadas y el importe total de las
mismas en el año 1996 (ordenar los resultados de mayor importe a menor importe)
19. Mostrar los datos de los productos y el mayor descuento aplicado a cada uno de ellos.
20. Mostrar la cantidad enviada por día para el mes de noviembre de 1996.
21. Mostrar los nombres de los productos y la cantidad de ordenes en las que cada uno aparece.
