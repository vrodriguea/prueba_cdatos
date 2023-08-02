--selecionar todos los cleintes 
SELECT * FROM cliente;

--Seleccionar los clientes que pertenezcan a la región “Centro”. 
SELECT * FROM cliente
WHERE region = 'Centro';

-- Seleccionar los clientes que tengan más de 3 cuentas abiertas en estado Activo
-- inner join entre tabla clientes y cuentas, count mayor a 3 
-- cruce por cedula

SELECT cliente.cedula, cliente.nombre, cuentas.estado
FROM cliente
INNER JOIN cuentas
ON cliente.cedula = cuentas.cedula_cliente
WHERE cuentas.estado = 1
GROUP BY cliente.cedula, cliente.nombre, cuentas.estado
HAVING COUNT(*) > 3;

-- Seleccionar solamente el nombre de aquellos clientes que tienen clave dinámica

SELECT cliente.nombre
FROM cliente
INNER JOIN clave_dinamica
ON cliente.cedula = clave_dinamica.cedula_cliente;

-- Seleccionar los clientes que no tienen clave dinámica
-- left join, para solo dejar clientes sin clave 

SELECT cliente.cedula, cliente.nombre
FROM cliente
LEFT JOIN clave_dinamica
ON cliente.cedula = clave_dinamica.cedula_cliente
WHERE clave_dinamica.cedula_cliente IS NULL;

-- Mostrar el saldo total de todas las cuentas agrupado por la región del cliente
-- group por la region 

SELECT cliente.region, SUM(cuentas.saldo) AS saldo
FROM cliente
INNER JOIN cuentas
ON cliente.cedula = cuentas.cedula_cliente
GROUP BY region;

-- Seleccionar el sado total de las cuentas activas, abiertas en el mes de mayo de 
-- 2018, cuyos clientes tengan clave dinámica

SELECT cliente.cedula, cuentas.num_cuenta, cliente.nombre, cuentas.estado, cuentas.saldo, cuentas.fecha_apertura
FROM cuentas
INNER JOIN cliente
ON cuentas.cedula_cliente = cliente.cedula
INNER JOIN clave_dinamica
ON cliente.cedula = clave_dinamica.cedula_cliente
WHERE cuentas.estado = 1
AND cuentas.fecha_apertura BETWEEN '2018-05-01' AND '2018-05-31';
