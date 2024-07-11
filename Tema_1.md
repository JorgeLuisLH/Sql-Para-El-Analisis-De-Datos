# Sql para el Analisis de Datos
## Tema 1: Introducción a las Bases de Datos 
### 1. Introducción a las Bases de Datos Relacionales
#### 1. Conceptos Básicos

**Definición de Base de Datos:**
Una base de datos es un conjunto organizado de datos, generalmente almacenados y accesibles electrónicamente desde un sistema informático.

**Propósito de las Bases de Datos:**
Las bases de datos permiten la gestión eficiente de grandes cantidades de información, facilitando su almacenamiento, recuperación y manipulación.

**Sistemas de Gestión de Bases de Datos (SGBD):**
Un SGBD es un software que interactúa con el usuario final, las aplicaciones y la base de datos misma para capturar y analizar los datos. Ejemplos comunes incluyen MySQL, PostgreSQL, SQL Server y Oracle.

#### 2. Tipos de Bases de Datos

**Bases de Datos Relacionales:**
Estas bases de datos organizan los datos en tablas que pueden relacionarse entre sí mediante claves. Utilizan el lenguaje SQL (Structured Query Language) para la gestión y manipulación de datos.

**Bases de Datos NoSQL:**
Estas bases de datos están diseñadas para gestionar grandes volúmenes de datos no estructurados y pueden ser de diferentes tipos: clave-valor, documentales, de grafos, entre otros. Ejemplos incluyen MongoDB, Cassandra y Redis.

**Bases de Datos Distribuidas:**
Los datos están repartidos en múltiples ubicaciones geográficas o en diferentes servidores. Este tipo de bases de datos es útil para escalabilidad y disponibilidad.

#### 3. Modelo Relacional

**Tablas:**
Una tabla es una colección de datos organizados en filas y columnas. Cada tabla tiene un nombre único y está compuesta por registros (filas) y campos (columnas).

**Filas y Columnas**:

Filas (Registros): Cada fila en una tabla representa una entrada única de datos.
Columnas (Campos): Cada columna en una tabla representa una categoría de datos. Cada campo tiene un nombre y un tipo de dato asociado.

![Tabla](/imagenes/tabla.png)
> Ejemplo: en color azul tenemos las filas y en color verde las columnas

**Llave Primaria (Primary Key):** Es un campo (o combinación de campos) que identifica de manera única cada registro en una tabla.
**Llave Foránea (Foreign Key):** Es un campo en una tabla que se refiere a la llave primaria en otra tabla, estableciendo una relación entre las dos tablas.
**Integridad Referencial:**
Garantiza que las relaciones entre tablas permanezcan consistentes. Cuando se utiliza una llave foránea, esta debe referenciar una llave primaria válida o ser nula.

![Modelo Entidad Relacion](/imagenes/ER_proyecto.png)
### 2. SQL: Lenguaje de Consulta Estructurado
#### ¿Que es SQL?
SQL es un lenguaje de programación para almacenar y procesar información en una base de datos relacional en forma de tablas.
Fue desarrollado en los años 70 por IBM en San José, California
#### Herramientas y Entornos de Trabajo
##### Sistemas de Gestión de Bases de Datos (SGBD):

* **MySQL:** Un SGBD de código abierto muy popular, especialmente para aplicaciones web.
* **PostgreSQL:** Un SGBD de código abierto conocido por su robustez y características avanzadas.
* **SQL Server:** Un SGBD desarrollado por Microsoft, ampliamente utilizado en entornos empresariales.
* **Oracle:** Un SGBD de alta gama conocido por su rendimiento y escalabilidad en grandes empresas.
##### Entornos de Desarrollo Integrados (IDEs) y Herramientas:

* **MySQL Workbench:** Una herramienta visual para diseñar, desarrollar y administrar bases de datos MySQL.
* **pgAdmin:** Una herramienta de administración y desarrollo para PostgreSQL.
* **SQL Server Management Studio (SSMS):** Un entorno gráfico para la administración de bases de datos SQL Server.
* **Oracle SQL Developer:** Una herramienta para desarrollo y administración de bases de datos Oracle.
[`Atras`](/README.md) | [`Siguiente`](/Tema_2.md)