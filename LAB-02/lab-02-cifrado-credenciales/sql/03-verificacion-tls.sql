-- Actividad 3: Verificación de conexión segura

SHOW ssl;

SHOW ssl_min_protocol_version;

SELECT
    version(),
    current_database(),
    current_user;