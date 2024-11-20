-- procedimiento 

-- 1. buscar un cliente por su cedula 

delimiter //
create function busqueda_cedula (cedula_num int (30) )
returns varchar(50)
deterministic
begin
declare busqueda varchar (50);
select concat(nombre1,'',nombre2,'',apellido1,'',apellido2) into busqueda
from clientes 
where cedula = cedula_num
limit 1;

if busqueda is null then
set busqueda = 'cedula no encontrada';
 end if;


return busqueda;

 
end//
 delimiter ;
 

-- procedimientos 

-- 1. Aplicar un descuento a un tipo de vehículo

DELIMITER //
CREATE PROCEDURE descuento(IN fechaInicio_descuento DATE, IN fechaFin_descuento DATE, IN porcentaje_descuentoB DECIMAL(5,2), IN idTipoV_descuento INT)
BEGIN
	INSERT INTO Descuentos(fecha_inicio, fecha_fin, porcentaje_descuento,id_tipoV) 
    VALUES (fechaInicio_descuento, fechaFin_descuento, porcentaje_descuentoB, idTipoV_descuento);
END
// DELIMITER ;

CALL descuento('2024-05-01', '2024-05-18', 15, 1);
SELECT * FROM Descuentos;



-- 2. Actualizar los datos de una sucursal 
DELIMITER //
CREATE PROCEDURE ActualizarSucursal (
    IN p_id_sucursal INT,
    IN p_ciudad VARCHAR(100),
    IN p_direccion VARCHAR(255),
    IN p_telefono_fijo VARCHAR(20),
    IN p_telefono_celular VARCHAR(20),
    IN p_correo_electronico VARCHAR(100)
)
BEGIN
    UPDATE Sucursal
    SET ciudad = p_ciudad,
        direccion = p_direccion,
        telefono_fijo = p_telefono_fijo,
        telefono_celular = p_telefono_celular,
        correo_electronico = p_correo_electronico
    WHERE id_sucursal = p_id_sucursal;
END //
DELIMITER ;

CALL ActualizarSucursal(
    6, 
    'Cucuta', 
    'Av. Motiles calle 20 #13-35', 
    '55-1234-5678', 
    '55-9876-5432', 
    'contacto@cucuta.com'
);
select * from Sucursal;


-- 3. Eliminar Surcursal 
DELIMITER //
CREATE PROCEDURE EliminarSucursal (IN p_id_sucursal INT)
BEGIN
    DELETE FROM Sucursal WHERE id_sucursal = p_id_sucursal;
END //
DELIMITER ;
CALL EliminarSucursal(6);
select * from Sucursal;


-- 4. Actualizar la disponibilidad de un vehículo 
DELIMITER //
CREATE PROCEDURE DisponibilidadVehiculo(
    IN p_id_vehiculo INT,
    IN p_disponibilidad BOOLEAN
)
BEGIN
    UPDATE Vehiculo
    SET disponibilidad = p_disponibilidad
    WHERE id_vehiculo = p_id_vehiculo;
END //
DELIMITER ;
CALL DisponibilidadVehiculo(15, TRUE);
select * from Vehiculo;


-- 5. Calcular el total facturado por alquiler en un fecha especifica 
DELIMITER //
CREATE PROCEDURE CalcularTotalFacturado(
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    SELECT 
        SUM(a.valor_pagado) AS total_facturado
    FROM Alquiler a
    WHERE a.fecha_salida BETWEEN p_fecha_inicio AND p_fecha_fin;
END //
DELIMITER ;
CALL CalcularTotalFacturado('2024-11-01', '2025-01-31');


-- 6. Actualizar la Salida de Sucursal 
DELIMITER //
CREATE PROCEDURE ActualizarSucursalSalida(
    IN p_id_alquiler INT,
    IN p_id_sucursal_salida INT
)
BEGIN
    UPDATE Alquiler
    SET id_sucursal_salida = p_id_sucursal_salida
    WHERE id_alquiler = p_id_alquiler;
END //
DELIMITER ;
CALL ActualizarSucursalSalida(1, 3);
select * from Sucursal;

-- 7. Actualizar la llegada de Sucursal 
DELIMITER //
CREATE PROCEDURE ActualizarSucursalLlegada(
    IN p_id_alquiler INT,
    IN p_id_sucursal_llegada INT
)
BEGIN
    UPDATE Alquiler
    SET id_sucursal_llegada = p_id_sucursal_llegada
    WHERE id_alquiler = p_id_alquiler;
END //
DELIMITER ;
CALL ActualizarSucursalLlegada(1, 4);
select * from Sucursal;


-- 8. Actualizar el valor cotizado: 
DELIMITER //
CREATE PROCEDURE ActualizarValorCotizado(
    IN p_id_alquiler INT,
    IN p_valor_cotizado DECIMAL(10, 2)
)
BEGIN
    UPDATE Alquiler
    SET valor_cotizado = p_valor_cotizado
    WHERE id_alquiler = p_id_alquiler;
END //
DELIMITER ;
CALL ActualizarValorCotizado(1, 1500.00);
select * from Sucursal;
