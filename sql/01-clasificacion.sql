-- Actividad 01 
--Clasificacion de datos


SELECT
    'id' AS campo,
    'No necesariamente' AS identifica_directamente,
    'Si' AS puede_contribuir,
    'Si' AS requiere_proteccion
UNION ALL SELECT 'nombre', 'Si', 'Si', 'Si'
UNION ALL SELECT 'correo', 'Generalmente si', 'Si', 'Si'
UNION ALL SELECT 'telefono', 'Puede hacerlo', 'Si', 'Si'
UNION ALL SELECT 'rfc', 'Si', 'Si', 'Si'
UNION ALL SELECT 'edad', 'No', 'Si', 'Si'
UNION ALL SELECT 'ciudad', 'No', 'Si', 'Si'
UNION ALL SELECT 'codigo_postal', 'No', 'Si', 'Si'
UNION ALL SELECT 'fecha_alta', 'No', 'Si', 'Si';
