CREATE ROLE soporte_max;

CREATE VIEW v_clientes_soporte AS
SELECT
    id,
    nombre,

    CONCAT(
        LEFT(correo, 2),
        '*****',
        SUBSTRING(correo FROM POSITION('@' IN correo))
    ) AS correo,

    CONCAT(
        '******',
        RIGHT(telefono, 4)
    ) AS telefono,

    CONCAT(
        '*********',
        RIGHT(rfc, 4)
    ) AS rfc

FROM clientes;

SELECT *
FROM v_clientes_soporte;

-- Conceder acceso a la vista

GRANT USAGE
ON SCHEMA public
TO soporte;

GRANT SELECT
ON v_clientes_soporte
TO soporte;

REVOKE ALL
ON clientes
FROM soporte;

--Verificar el resultado
SELECT *
FROM v_clientes_soporte;


SELECT *
FROM clientes;