# UNIDAD 1 BASES DE DATOS

## Sistemas de información 

**Un sistema de información es el conjunto de elementos para la recopilación de datos y transformación en información relevantes**

Un sistema de información es especialmente adecuado en entornos complejos,
competitivos o muy cambiantes. En estos entornos los cambios son continuos, y la
rapidez en la toma de decisiones y la implementación de los cambios es crítica, por lo que
los gestores necesitan acceder de forma rápida y eficaz a las fuentes de información que
les permitan tomar las decisiones estratégicas más adecuadas.

 ### OBJETIVOS: el objetivo de un sistema de información será proveer a la organización de herramientas que le permitan:
- Automatizar los procesos operativos

- Propocionar información oportuna y exacta que sirva de apoyo para la toma de decisiones.

- obtener ventajas competitivas derivadas de su implatación y uso.

**FUNCIONES**
- Recolección de información 

- Tratamiento de la información (integración, realización de cálculos y transferencia de datos)

- difusión de la información (necesario identificar a quién,el que y el como se distribuye la información)

### Organización 

Los sistemas de información se organizan en varios niveles, cada uno de los cuales
se encarga de una función determinada:

- **Nivel operativo:** sistemas operacionales para la organización de la inforamción relevante para la organización de la propia BD. Cada departamento puede tener su propio sistema operacional y los usuarios suelen ser sus propios trabajadores.

- **Nivel de conocimento:** A este nivel corresponden los sistemas orientados al apoyo de las operaciones generadas por los sistemas del nivel operativo. Los usuarios de estos sistemas suelen ser analistas de alguna área específica de lamorganización.

- **Nivel administrativo:** los usuarios de estos sistemas son los mandos intermedios encargados de definir a medio plazo su unidad organizativa. La información es más comparativa que descriptiva, y tanto interna (data warehause) como externa. Se utilizan herramientas interactivas para investigar de manera self service, o autoservicio. Están orientados a la toma de decisiones en un área concreta de la organización a partir del seguimiento de una serie de indicadores. (PKI)

- **nivel estratégico:** Los usuarios de estos sistemas son la alta dirección con visión a medio-largo plazo. La herramienta principal son los cuadros de mando integrales (resumidos) que contienen información de todas las unidades de la organización de forma precisa.

![piramide](piramide.png)

**Un sistema de imformación tiene como principal objetivo aportar valor a la información, por lo que el sistema de almacenamiento de la información será un componente principal**

Existen varias maneras de almacenar la información:

- Sistemas de ficheros: Un fichero es un conjunto ordenado de datos que tienen entre si una relación lógica y almacenados permanentemente. Se manipulan individualmente. En este sistema las aplicaciones acceden directamente a ellos,por lo que deben conocer su estructura, contenido... por tanto son muy dependientes.

- Ficheros de texto: ficheros planos codificados como texto con distintos formatos (ascii y unicode) con extensiones (txt,html,php,java...). Los ficheros XML son un tipo especial de ficheros de texto que tienen definida una estructura.

- Ficheros binarios: Todos los que no son de texto se codifican por medio de códigos hexadecimales. Requieren un formato para ser interpretados, si se cambia el formato no se abrirán correctamente. Usan diferentes extensiones dependiendo de su tipo: imagen (jpg,gif,tiff,...),comprensión(zip,rar,gz,...).

  Las BD  guardan su información en ficheros binarios por su estructura lógica y organizada para acceder rápidamente.

- Bases de Datos: son un sistema de información que no depende de la aplicación que las utiliza. También guardan la información en ficheros pero las apps no se conectan a ellos directamente, sino que hay un software intermedio que gestiona las conexiones y peticiones. Estos sistemas son conocidos como **Sistema Gestor de Bases de Datos** (SGBD).

**Una base de datos por tanto permite almacenar datos de forma independiente de
las aplicaciones que acceden a ellos, y permite realizar sobre ellos operaciones de
consulta y manipulación**

## Arquitectura de una base de datos

