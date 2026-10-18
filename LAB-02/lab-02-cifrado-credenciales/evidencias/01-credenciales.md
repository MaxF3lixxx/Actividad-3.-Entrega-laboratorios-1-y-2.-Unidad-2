 Protección de credenciales

Objetivo

Aprender por qué no es bueno guardar las contraseñas tal como son y cómo se pueden proteger usando un hash.

Comando o procedimiento

Primero hice la tabla `usuarios_insegura` y agregué un usuario con su contraseña. Después consulté la tabla y vi que la contraseña aparecía directamente.

Luego utilicé `crypt()` y `gen_salt('bf')` para proteger la contraseña. Creé la tabla `usuarios_segura` y guardé el hash. Al final hice dos pruebas, una con la contraseña correcta y otra con una incorrecta.

Resultado obtenido

En la primera tabla se podía ver la contraseña completa, mientras que en la segunda aparecía una cadena de caracteres. Cuando probé la contraseña correcta salió `true` y cuando probé la incorrecta salió `false`.

 Análisis

Me di cuenta de que guardar las contraseñas directamente es peligroso, porque cualquier persona que tenga acceso a la tabla podría verlas. En cambio, con el hash se puede comprobar si la contraseña es correcta sin tener que mostrar la original.

Conclusión

Con esta actividad aprendí que no se deben guardar las contraseñas directamente en la base de datos. Es mejor protegerlas con un método adecuado para evitar que otras personas puedan conocerlas fácilmente.