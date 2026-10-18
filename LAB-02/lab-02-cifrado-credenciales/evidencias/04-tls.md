Verificación de TLS

#Objetivo

Revisar si PostgreSQL tiene configurada la seguridad para proteger las conexiones.

Comando o procedimiento

Primero ejecuté los comandos `SHOW ssl;` y `SHOW ssl_min_protocol_version;` en pgAdmin para ver cómo está configurada la conexión. También revisé la versión de PostgreSQL, la base de datos y el usuario con el que estoy trabajando.

 Resultado obtenido

Los comandos me mostraron la información de la configuración SSL y los datos de mi conexión a la base de datos.

Análisis

Con esta práctica entendí que es importante revisar la seguridad de las conexiones, porque por ahí se envía información de la base de datos. También aprendí que tener SSL activado no significa que mi conexión ya esté cifrada.

Conclusión

Aprendí que TLS sirve para proteger la información que se envía entre PostgreSQL y el usuario. Por eso es importante revisar que la conexión sea segura.