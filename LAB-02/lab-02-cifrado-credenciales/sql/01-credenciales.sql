-- Actividad 1: Protección de credenciales

-- Crear tabla con contraseña sin protección
CREATE TABLE usuarios_insegura (
    id BIGSERIAL PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL
);

-- Insertar usuario de prueba
INSERT INTO usuarios_insegura (usuario, password)
VALUES ('juan', 'Password123');

-- Consultar tabla insegura
SELECT *
FROM usuarios_insegura;

-- Generar hash de una contraseña
SELECT crypt(
    'Password123',
    gen_salt('bf')
);

-- Crear tabla segura
CREATE TABLE usuarios_segura (
    id BIGSERIAL PRIMARY KEY,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL
);

-- Insertar contraseña protegida
INSERT INTO usuarios_segura (usuario, password_hash)
VALUES (
    'juan',
    crypt('Password123', gen_salt('bf'))
);

-- Consultar tabla segura
SELECT *
FROM usuarios_segura;

-- Verificar contraseña correcta
SELECT
    usuario,
    password_hash = crypt('Password123', password_hash)
        AS contrasena_correcta
FROM usuarios_segura
WHERE usuario = 'juan';

-- Verificar contraseña incorrecta
SELECT
    usuario,
    password_hash = crypt('OtraPassword', password_hash)
        AS contrasena_correcta
FROM usuarios_segura
WHERE usuario = 'juan';