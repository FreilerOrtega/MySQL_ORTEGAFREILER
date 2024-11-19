USE LABORATORIO_T2;


-- consultas y funciones 

-- 1. listar todas las columnas de la tabla sucursales que hay 

select * from sucursales ;

-- 2 lista los nombre y apellidos de la tabla empledos

select nombre1,nombre2,apellido1,apellido2 from empleados ;


-- 3.listar todos los tipos de vehiculos 

select * from vehiculos;

-- 4.lista todos los vehiculos que tengan dos puertas 

select * from vehiculos where puertas = 2;


-- 5.listar todos los vehiculos que tengan motor v8 

select * from vehiculos where motor="v8";

-- 6.lista todo los empleados que trabajen en la sucursal de bogota 

select id_empleado , nombre1,nombre2,apellido1,apellido2 , id_sucursal from empleados where id_sucursal=1 ;


-- 7. lista el numero de vehiculos por modelo 

select vehiculos.modelo, count(*) as cantidad
from vehiculos
group by vehiculos.modelo;

-- 8.  lista todos los vehiculos por la capacidad de pasajeros  

select vehiculos.capacidad, count(*) as cantidad 
from vehiculos
group by vehiculos.capacidad;


-- 9. Lista el nombre y apellidos de los empleados en una única columna.

select concat(nombre1,nombre2,apellido1,apellido2) as empleados  from empleados ;

-- 10. lista todos los clientes con nombre y apellido 

select nombre1,nombre2,apellido1,apellido2 from clientes;


-- 11. Lista los apellidos y el nombre de todos los empleados, ordenados de forma
-- alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su
-- nombre.

select  apellido1,apellido2,nombre1,nombre2  from empleados  order by 1 asc ;

-- 12. Lista el primer apellido de todos los empleados.

select apellido1 from empleados ;


-- 13. Obtener todos los empleados de una sucursal específica:

SELECT * 
FROM Empleados 
WHERE id_sucursal = 1;

-- 14. Obtener todos los vehículos de un tipo específico (por ejemplo, de tipo "SUV"):


SELECT * 
FROM Vehiculos 
WHERE id_tipoV = 2;

-- 15. Obtener todos los alquileres realizados por un cliente específico:

SELECT * 
FROM Alquileres 
WHERE id_cliente = 5;

-- 16. Obtener todos los clientes que han alquilado un vehículo de tipo "SUV":

SELECT DISTINCT C.*
FROM Clientes C
JOIN Alquileres A ON C.id_cliente = A.id_cliente
JOIN Vehiculos V ON A.id_vehiculo = V.id_vehiculo
WHERE V.id_tipoV = 2;

-- 17.Obtener los detalles de un alquiler específico por su ID:


SELECT * 
FROM Alquileres 
WHERE id_alquiler = 3;

-- 18. Obtener el total de alquileres realizados en una sucursal:

SELECT COUNT(*) AS total_alquileres
FROM Alquileres
WHERE id_sucursal = 1;

-- 19. Obtener los vehículos disponibles para alquilar (sin alquileres activos):

SELECT V.*
FROM Vehiculos V
LEFT JOIN Alquileres A ON V.id_vehiculo = A.id_vehiculo 
WHERE A.id_alquiler IS NULL;

-- 20. Obtener todos los descuentos aplicados a un tipo de vehículo específico:

SELECT * 
FROM Descuentos 
WHERE id_tipoV = 2;

-- 21. Obtener la cantidad de vehículos de cada tipo:

SELECT T.tipo, COUNT(*) AS total_vehiculos
FROM Vehiculos V
JOIN Tipo_vehiculo T ON V.id_tipoV = T.id_tipoV
GROUP BY T.tipo;

-- 22. Obtener la información de un vehículo por su placa:

SELECT * 
FROM Vehiculos 
WHERE placa = 'ABC123';

-- 23. Obtener todos los empleados de una ciudad específica:

SELECT * 
FROM Empleados 
WHERE ciudad = 'medellin';

-- 24. Obtener los clientes con un teléfono celular específico:

SELECT * 
FROM Clientes 
WHERE celular = 3123489;

-- 25. Obtener el valor total de los alquileres (sumando valor_pagado) realizados por un cliente específico:

SELECT SUM(valor_pagado) AS total_pagado
FROM Alquileres 
WHERE id_cliente = 5;

-- funciones 
-- 1 funcion de resta 

delimiter //
create function resta_valor (valor_cotizado int , valor_pagado int )
returns int
deterministic
begin
declare diferencia int ;
set diferencia = valor_cotizado-valor_pagado;
return diferencia;
end // 
delimiter ;


select resta_valor (valor_cotizado,valor_pagado) from alquileres ;
-- 2 funcion 

delimiter //
create function numero_letras (letra char )  
returns int 
deterministic
begin 
declare numero int;
select count(*) into numero from empleados where nombre1 like concat('%',letra,'%');
return numero;
end // 
delimiter ;

select numero_letras('f');


-- 3 funcion tres 

delimiter //
create function suma ()
// delimiter ;
