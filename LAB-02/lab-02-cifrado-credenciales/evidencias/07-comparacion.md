Comparación de métodos de protección

Objetivo

Comparar las formas que utilicé para proteger la información en las prácticas de PostgreSQL.

Comparación

En la primera práctica guardé una contraseña directamente en la tabla y se podía ver completa. Después utilicé un hash para que la contraseña ya no apareciera tal cual.

En la segunda práctica cifré un RFC para que no se pudiera leer directamente. Después pude ver el dato original usando la clave correcta.

#Análisis

Con estas prácticas entendí que el hash y el cifrado no son lo mismo. El hash sirve para comprobar una contraseña sin guardarla directamente, mientras que el cifrado permite recuperar la información cuando se tiene la clave correcta.

 Conclusión

Aprendí que hay diferentes formas de proteger los datos y que cada una sirve para algo distinto. Es importante elegir la correcta para evitar que la información quede expuesta.