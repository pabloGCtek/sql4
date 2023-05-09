--Subconsultas

-- Obtener los productos cuyo precio unitario sea mayor al precio promedio de la tabla de productos
SELECT * from products where unit_price > (SELECT AVG(unit_price) from products);
-- Obtener los productos cuya cantidad en stock sea menor al promedio de cantidad en stock de toda la tabla de productos.
SELECT * from products where units_in_stock < (SELECT AVG(units_in_stock) from products);
-- Obtener los productos cuya cantidad en Inventario (UnitsInStock) sea menor a la cantidad mínima del detalle de ordenes (Order Details)
SELECT * from products where units_in_stock < (SELECT MIN(quantity) from order_details);
--OBTENER LOS PRODUCTOS CUYA CATEGORIA SEA IGUAL A LAS CATEGORIAS DE LOS PRODUCTOS CON PROVEEDOR 1.
SELECT * from products where category_id IN(SELECT category_id from products where supplier_id = 1);

-- Subconsultas correlacionadas 

--Obtener el número de empleado y el apellido para aquellos empleados que tengan menos de 100 ordenes.
SELECT employee_id, last_name from employees e where (SELECT COUNT(order_id) from orders o where e.employee_id = o.employee_id) <100;
--Obtener la clave de cliente y el nombre de la empresa para aquellos clientes que tengan más de 20 ordenes
SELECT customer_id, company_name from customers cu where (SELECT COUNT(order_id) from orders o where cu.customer_id = o.customer_id) > 20;

--Obtener el productoid, el nombre del producto, el proveedor de la tabla de productos para aquellos productos que se hayan vendido menos de 100 unidades (Consultarlo en la tabla de Orders details).
SELECT product_id, product_name, supplier_id from products p where (SELECT SUM(quantity) from order_details o where p.product_id = o.product_id) <100;
--Obtener los datos del empleado IDEmpleado y nombre completo De aquellos que tengan mas de 100 ordenes
SELECT employee_id, CONCAT(first_name,' ', last_name) as nombre_completo from employees e where(SELECT COUNT(order_id) from orders o where e.employee_id = o.employee_id) >100;
--Obtener los datos de Producto ProductId, ProductName, UnitsinStock, UnitPrice (Tabla Products) de los productos que la sumatoria de la cantidad (Quantity) de orders details sea mayor a 450
SELECT product_id, product_name, units_in_stock, unit_price from products p where (SELECT SUM(quantity) from order_details pd where pd.product_id = p.product_id) > 450;
--Obtener la clave de cliente y el nombre de la empresa para aquellos clientes que tengan más de 20 ordenes.
SELECT customer_id, company_name from customers cu where (SELECT COUNT(order_id) from orders o where cu.customer_id = o.customer_id) > 20;

--insert

--Insertar un registro en la tabla de Categorias, únicamente se quiere insertar la información del CategoryName y la descripción los Papelería y papelería escolar
INSERT into categories VALUES(3000,'Papeleria','los Papelería y papelería escolar','');
--Dar de alta un producto con Productname, SupplierId, CategoryId, UnitPrice, UnitsInStock Como esta tabla tiene dos clave foraneas hay que ver los datos a dar de alta
INSERT into products (product_id,product_name,supplier_id,category_id,unit_price,units_in_stock,discontinued)VALUES (20000,'prducto',1,1,40.3,300,0);
--Dar de alta un empleado con LastName, FistName, Title, BrithDate
INSERT into employees (employee_id, last_name,first_name,title,birth_date) VALUES(10,'Perez','Pepe','desarrollador','09/05/2023');
--Dar de alta una orden, CustomerId, Employeeid, Orderdate, ShipVia Como esta tabla tiene dos clave foraneas hay que ver los datos a dar de alta

INSERT into orders (customer_id, employee_id,order_date,ship_via,order_id) VALUES('ALFKI',2,'09/05/2023',2,3001);
--Dar de alta un Order details, con todos los datos

INSERT INTO order_details VALUES(10248,1,100,5,20);

--update

-- Cambiar el CategoryName a Verduras de la categoria 10

UPDATE categories set category_name = 'Verduras' where category_id = 10;
-- Actualizar los precios de la tabla de Productos para incrementarlos un 10%
UPDATE products set unit_price = unit_price *1.1;
--ACTUALIZAR EL PRODUCTNAME DEL iPRODUCTO 80 A ZANAHORIA ECOLOGICA
UPDATE products set product_name = 'Zanahoria Ecologica' where product_id =80;

--ACTUALIZAR EL FIRSTNAME DEL EMPLOYEE 10 A ROSARIO 

UPDATE employees set first_name = 'ROSARIO' where employee_id =10;

--ACTUALIZAR EL ORDERS DETAILS DE LA 11079(10248) PARA QUE SU CANTIDAD SEA 10
select * from order_details;

UPDATE order_details set quantity= 10 where order_id = 10248;

--Delete

--diferencia entre delete y truncate

--BORRAR EL EMPLEADO 10
DELETE from employees where employee_id = 3000;
SELECT * from employees;


