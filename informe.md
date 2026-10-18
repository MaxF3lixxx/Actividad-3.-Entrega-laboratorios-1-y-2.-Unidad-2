Informe

Clasificación:
En esta actividad revisé los datos que hay en la tabla clientes para saber cuáles necesitan protección. Me di cuenta de que datos como el nombre, correo, teléfono y RFC pueden identificar directamente a una persona, por eso es importante cuidarlos. También hay otros datos como la edad, ciudad, código postal y fecha de alta que, aunque no identifican directamente a alguien, se pueden combinar y ayudar a reconocer a una persona. Por eso no todos los datos se deben mostrar a cualquier usuario y es importante tener permisos para controlar quién puede consultarlos.

1. ¿Qué campos identifican directamente a una persona?
 El nombre, correo, teléfono y RFC, porque con esos datos se puede identificar a una persona directamente.
2. ¿Qué campos no identifican por sí solos pero podrían contribuir a hacerlo?
 La edad, ciudad, código postal y fecha de alta, porque por separado no identifican a alguien, pero juntos pueden ayudar a saber quién es.
3. ¿Qué combinación de campos podría incrementar el riesgo de reidentificación?
La edad, ciudad, código postal y fecha de alta, porque al juntarlos es más fácil distinguir a una persona de las demás.
4. ¿Todos los datos que deben protegerse son necesariamente datos personales sensibles desde el punto de vista jurídico?
No, porque hay datos que deben protegerse, pero no todos son considerados sensibles por la ley. Aun así, es importante cuidarlos para evitar que alguien los use sin permiso.

Enmascaramiento
En esta actividad se ocultaron partes del correo electrónico, teléfono y RFC de los clientes. Para hacerlo se utilizó una vista llamada v_clientes_soporte.Esta vista está pensada para el área de soporte, porque sus trabajadores necesitan consultar algunos datos para atender a los clientes, pero no necesitan ver toda su información personal. Para ocultar los datos se utilizaron funciones de PostgreSQL como LEFT, RIGHT, SUBSTRING, POSITION y CONCAT. De esta manera se muestran solamente algunas partes de la información. Considero que esto es útil porque ayuda a proteger los datos de los clientes. También es importante quitar los permisos de acceso directo a la tabla original para evitar que los usuarios puedan consultar la información completa.

1. ¿Qué información continúa existiendo en la tabla original?
En la tabla original siguen estando todos los datos de los clientes, como nombre, correo, teléfono, RFC, edad y ciudad.
2. ¿Qué información puede visualizar el usuario soporte?
El usuario soporte puede ver la información de la vista creada, donde algunos datos personales aparecen ocultos parcialmente, como el correo, teléfono y RFC.
3. ¿Por qué no es suficiente ocultar los datos únicamente en la aplicación?
Porque si los datos solo se ocultan en la aplicación, alguien podría entrar directamente a la base de datos y ver la información completa. Por eso también es necesario configurar los permisos de acceso.
4. ¿Qué ocurriría si soporte tuviera acceso directo a clientes?
Podría consultar los datos completos de los clientes y ver información privada que debería estar protegida, aumentando el riesgo de que se utilice sin autorización.

Seudonimización
La seudonimización consiste en reemplazar la identificación directa de los clientes por un token, para poder trabajar con sus registros sin mostrar directamente quiénes son.
Los tokens se generaron utilizando la función gen_random_uuid() de PostgreSQL, que crea identificadores únicos. La relación entre esos tokens y los clientes originales se guarda en la tabla pii.mapa_cliente.
Esta tabla debe estar disponible solamente para las personas que realmente necesiten consultar esa información. Por eso se separaron los permisos, para que el área de analítica pueda trabajar con los datos sin tener acceso al mapa ni a toda la información personal de los clientes.
Esto me parece importante porque así se reduce el riesgo de que alguien pueda conocer la identidad de los clientes sin autorización.

Anonimización
En esta actividad se buscó reducir la posibilidad de identificar a los clientes usando información agrupada. Para eso se dejaron fuera datos como el nombre, correo, teléfono y RFC.
También se agruparon las edades en rangos y se utilizaron los primeros dos caracteres del código postal para representar una región. Así se evita mostrar algunos datos con tanto detalle.
Además, se utilizó la condición HAVING COUNT(*) >= 5 para mostrar solamente los grupos que tienen cinco registros o más. Esto ayuda a que sea más difícil identificar a una persona dentro de un grupo pequeño.
Sin embargo, todavía puede existir riesgo de identificación si alguien combina estos datos con otra información. Por eso, aunque se oculten algunos campos, no se puede asegurar que los datos sean completamente anónimos.

Retención
Para esta actividad se utilizó un periodo de cinco años para identificar los registros antiguos de la tabla clientes. La consulta permite encontrar los registros cuya fecha de alta es anterior a ese periodo, pero no los elimina.
Antes de eliminar cualquier información, primero se debe revisar si todavía es necesaria o si existe alguna obligación de conservarla.
Los datos que todavía se necesitan para el trabajo de la organización o para cumplir obligaciones legales deben conservarse el tiempo correspondiente. En cambio, los que ya no sean necesarios podrían eliminarse, siempre que esté permitido.
Antes de hacerlo, se deben revisar los registros, pedir autorización, realizar un respaldo cuando corresponda y tener una forma de recuperar la información si ocurre algún error. Esto ayuda a evitar la pérdida de datos importantes.

Conclusiones
¿Qué técnica utilizarías para un área de soporte?
Yo utilizaría el enmascaramiento mediante una vista, porque soporte puede consultar los datos que necesita sin tener que ver toda la información personal de los clientes.
¿Qué técnica utilizarías para un área de analítica?
Utilizaría la seudonimización, porque permite trabajar con los registros sin mostrar directamente la identidad de los clientes. También mantendría protegido el mapa que relaciona los tokens con los datos originales.
¿Qué técnica utilizarías para publicar estadísticas?
Utilizaría la anonimización y los datos agrupados, porque permiten mostrar resultados generales sin exponer directamente la información de cada persona. También evitaría publicar grupos con muy pocos registros.
¿Por qué ninguna de estas técnicas sustituye al control de acceso?
Porque aunque se oculten o se agrupen los datos, todavía es necesario controlar quién puede entrar a la base de datos. Por eso se deben configurar roles y permisos para que cada usuario solamente pueda consultar la información que necesita.

20. Preguntas de reflexión

1. ¿Cuál es la diferencia entre enmascaramiento y seudonimización?
El enmascaramiento consiste en ocultar una parte de los datos para que no se vean completos. La seudonimización consiste en reemplazar la identificación directa por un token que puede relacionarse con la persona original mediante un mapa protegido.
2. ¿Por qué la seudonimización no significa anonimización?
Porque todavía se puede relacionar el token con la persona original utilizando el mapa de correspondencia. Por eso, los datos seudonimizados todavía necesitan protección.
3. ¿Por qué eliminar nombre y RFC no garantiza que un conjunto de datos sea anónimo?
Porque todavía quedan otros datos, como la edad, ciudad y código postal, que se pueden combinar y ayudar a identificar a una persona.
4. ¿Qué función tienen los cuasi-identificadores?
Son datos que por sí solos no identifican directamente a una persona, pero que al combinarse con otros pueden ayudar a reconocerla. Algunos ejemplos son la edad, ciudad y código postal.
5. ¿Por qué es importante separar el mapa de seudonimización?
Porque ese mapa permite relacionar los tokens con los clientes originales. Si se mantiene separado y solamente pueden consultarlo personas autorizadas, se reduce el riesgo de que alguien identifique a los clientes.
6. ¿Qué principio de seguridad se aplica al impedir que el analista acceda al mapa?
Se aplica el principio de mínimo privilegio, que significa darle a cada usuario solamente los permisos que necesita para realizar su trabajo.
7. ¿Por qué una vista puede ser preferible a entregar acceso directo a la tabla?
Porque una vista permite mostrar solamente la información que necesita el usuario y ocultar los datos que no debería consultar. Así se evita dar acceso a toda la tabla original.
8. ¿Qué diferencia existe entre proteger un dato para visualización y protegerlo contra acceso no autorizado?
Proteger un dato para visualización significa ocultar una parte de su contenido. Protegerlo contra accesos no autorizados significa impedir que personas sin permiso puedan consultar esa información.
9. ¿Por qué la retención forma parte de la protección de datos?
Porque no es conveniente guardar información para siempre si ya no se necesita. Establecer un periodo de retención ayuda a reducir los riesgos y a mantener los datos solamente durante el tiempo necesario.
10. ¿Qué riesgo existe si una organización conserva información indefinidamente?
Existe un mayor riesgo de que la información se filtre o sea utilizada de forma incorrecta. Además, se pueden acumular datos que ya no son necesarios y que podrían afectar la privacidad de las personas.