-- Crear los esquemas

CREATE SCHEMA pii;

CREATE SCHEMA analitica;

--Crear la tabla de correspondencia

CREATE TABLE pii.mapa_cliente (
    token UUID PRIMARY KEY,
    cliente_id BIGINT UNIQUE
        REFERENCES public.clientes(id)
);

-- Generacion de Tokens

CREATE EXTENSION IF NOT EXISTS pgcrypto;

INSERT INTO pii.mapa_cliente
(token, cliente_id)
SELECT
    gen_random_uuid(),
    id
FROM clientes;

SELECT *
FROM pii.mapa_cliente;

--Crear el conjunto de datos para analítica
CREATE TABLE analitica.clientes AS
SELECT
    m.token AS cliente_token,
    c.edad,
    c.ciudad,
    c.codigo_postal,
    c.fecha_alta
FROM pii.mapa_cliente m
JOIN clientes c
    ON c.id = m.cliente_id;


	SELECT *
FROM analitica.clientes;
