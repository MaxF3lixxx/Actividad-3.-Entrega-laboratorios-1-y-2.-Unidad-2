# LAB-02 — Cifrado, credenciales y comunicaciones seguras

## 1. Introducción

En este laboratorio trabajé con PostgreSQL para aprender cómo proteger la información de una base de datos. Hice pruebas con contraseñas, cifré un RFC y revisé la configuración de seguridad de las conexiones. Con esto entendí que es importante proteger los datos para evitar que otras personas puedan verlos sin permiso.

## 2. Protección de credenciales

Primero hice una tabla donde guardé una contraseña normal y me di cuenta de que se podía ver completa. Después utilicé un hash para que la contraseña ya no apareciera directamente.

Aprendí que el texto claro muestra la contraseña original, el hash sirve para comprobar si una contraseña es correcta y el cifrado permite recuperar la información cuando se tiene la clave adecuada.

## 3. Protección de datos sensibles

En esta actividad utilicé un RFC de prueba y lo guardé cifrado en PostgreSQL. Para hacerlo utilicé las funciones `pgp_sym_encrypt()` y `pgp_sym_decrypt()`.

Al consultar la tabla, el RFC aparecía cifrado y después pude recuperar el dato original utilizando la misma clave. Esto me ayudó a entender cómo se puede proteger información personal.

## 4. TLS

En esta parte revisé algunos valores de SSL en PostgreSQL para conocer la configuración de seguridad. Utilicé los comandos `SHOW ssl;` y `SHOW ssl_min_protocol_version;`.

Aprendí que TLS sirve para proteger la información que se envía entre el cliente y el servidor. También entendí que revisar la configuración de SSL no es suficiente para asegurar que mi conexión esté cifrada, sino que hay que comprobar el estado de la conexión.

## 5. Gestión de claves

Las claves son importantes porque se necesitan para recuperar la información cifrada. Si las guardamos junto con los scripts, alguien podría encontrarlas y utilizarlas para acceder a los datos.

Por eso aprendí que es mejor guardar las claves en un lugar seguro y no publicarlas en GitLab ni dejarlas escritas directamente en el código.

## 6. Resultados

En las prácticas pude ver que una contraseña guardada como texto normal se muestra completa, pero cuando se utiliza un hash aparece una cadena de caracteres.

También logré cifrar un RFC y después recuperarlo con la clave correcta. Por último, revisé la configuración SSL de PostgreSQL para conocer algunos aspectos de la seguridad de la conexión.

## 7. Problemas encontrados

Durante el laboratorio tuve que crear los archivos en VS Code y ejecutar las consultas desde pgAdmin. También tuve que revisar dónde guardar cada archivo para mantener el orden que pidió el profesor.

## 8. Conclusiones

Con este laboratorio aprendí diferentes formas de proteger la información en una base de datos. Entendí que las contraseñas no se deben guardar directamente, que los datos importantes se pueden cifrar y que también es necesario proteger las conexiones.

En un sistema real utilizaría estas medidas, cuidaría las claves y revisaría los permisos de cada usuario para evitar que alguien pueda acceder a información que no le corresponde.

## 9. Preguntas de reflexión

### 1. ¿Por qué una contraseña no debe almacenarse como texto claro?

Porque si alguien entra a la base de datos podría ver la contraseña completa y utilizarla. Por eso es mejor guardarla con un hash seguro.

### 2. ¿Por qué un hash no es equivalente a un cifrado?

Porque el hash sirve para comprobar una contraseña, pero no para recuperar la original. En cambio, el cifrado permite recuperar la información si tenemos la clave correcta.

### 3. ¿Por qué el cifrado de una columna no sustituye al control de acceso?

Porque aunque los datos estén cifrados, también necesitamos controlar quién puede entrar a la base de datos y quién puede consultar o modificar la información.

### 4. ¿Por qué TLS no sustituye a los mecanismos de autorización de PostgreSQL?

Porque TLS protege la información que se envía entre el cliente y el servidor, pero los permisos de PostgreSQL controlan lo que puede hacer cada usuario.

### 5. ¿Qué ocurriría si una organización pierde una clave utilizada para cifrar información?

Podría quedarse sin poder recuperar sus datos cifrados si no tiene una copia segura de la clave.

### 6. ¿Qué ocurriría si una clave criptográfica se publica accidentalmente en GitLab?

Alguien podría encontrarla y utilizarla para acceder a la información protegida. Por eso habría que cambiar la clave y revisar si alguien la utilizó sin permiso.

### 7. ¿Por qué un repositorio privado no debe considerarse un almacén de secretos?

Porque aunque sea privado, otras personas con acceso podrían ver los archivos. Por eso no es recomendable guardar claves o contraseñas ahí.

### 8. ¿Qué diferencia existe entre proteger información almacenada y proteger información durante su transmisión?

La información almacenada se protege cuando ya está guardada en la base de datos. La información durante su transmisión se protege mientras se envía de un lugar a otro.

### 9. ¿Por qué la gestión de claves es tan importante como el algoritmo criptográfico?

Porque si alguien consigue la clave puede acceder a la información cifrada. También debemos cuidarla para no perder el acceso a nuestros propios datos.

### 10. ¿Qué mecanismo adicional implementarías en una organización para proteger los respaldos de las bases de datos?

Cifraría los respaldos, limitaría quién puede acceder a ellos y guardaría las claves en un lugar seguro. También haría pruebas para asegurarme de que los respaldos se puedan recuperar correctamente.