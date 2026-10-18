Cifrado de datos sensibles

Objetivo
Aprender cómo cifrar información para que no se pueda ver directamente en la base de datos.

Comando o procedimiento

Primero activé la extensión `pgcrypto` y después creé la tabla `clientes_protegidos`. Ahí guardé un nombre y un RFC cifrado. Para hacerlo utilicé `pgp_sym_encrypt()` y para volver a ver el RFC original utilicé `pgp_sym_decrypt()` con la misma clave.

Resultado obtenido

Al consultar la tabla, el RFC aparecía cifrado. Después hice otra consulta y pude ver el RFC original `LOPA900101ABC`.

Análisis

Con esta práctica me di cuenta de que el cifrado sirve para proteger los datos y evitar que se puedan leer fácilmente. También vi que necesito la clave correcta para recuperar la información.

Conclusión

Aprendí que es importante cifrar los datos sensibles para tener más seguridad en la base de datos. También hay que cuidar las claves para que otras personas no puedan acceder a la información.