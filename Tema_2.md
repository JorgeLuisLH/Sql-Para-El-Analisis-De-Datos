## Tema 2: Fundamentos de SQL

### 1. Creacion y Manipulacion de tablas

#### 1. Sentencias CREATE TABLE, ALTER TABLE, DROP TABLE:
* **CREATE TABLE:**
La sentencia CREATE TABLE se utiliza para crear una nueva tabla en la base de datos.
```sql
-- Creamos la tabla DEPARTAMENTOS
CREATE TABLE DEPARTAMENTOS (
    departamento_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

-- Creamos la tabla EMPLEADOS
CREATE TABLE EMPLEADOS (
    empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES DEPARTAMENTOS(departamento_id)
);
```
* **ALTER TABLE:**
La sentencia ALTER TABLE se utiliza para modificar una tabla existente, como agregar, eliminar o modificar columnas.
```sql
-- Agregar una columna
ALTER TABLE EMPLEADOS ADD fecha_contratacion DATE;

-- Eliminar una columna
ALTER TABLE EMPLEADOS DROP COLUMN telefono;

-- Modificar una columna
ALTER TABLE EMPLEADOS MODIFY COLUMN nombre VARCHAR(150);

```
* **DROP TABLE:**
La sentencia DROP TABLE se utiliza para eliminar una tabla existente y todos sus datos.
```sql
DROP TABLE EMPLEADOS;

```
#### 2. Tipo de datos
##### **Tipos Numéricos:**

**1. INT:**
* Descripción: Almacena números enteros.
* Rango: -2,147,483,648 a 2,147,483,647 (4 bytes).
* Ejemplo: 123, -456

**2. FLOAT**
* Descripción: Almacena números en coma flotante de precisión simple.
- Precisión: Aproximadamente 7 dígitos decimales.
- Ejemplo: 123.45, -0.12345

**3. DOUBLE (o DOUBLE PRECISION)**
* Descripción: Almacena números en coma flotante de doble precisión.
* Precisión: Aproximadamente 15 dígitos decimales.
* Ejemplo: 123.456789012345, -0.123456789012345

**4. DECIMAL (o NUMERIC)**
* Descripción: Almacena números con una precisión y escala definidas.
* Formato: DECIMAL(p, s), donde p es la precisión total y s es la escala (número de dígitos después del punto decimal).
* Ejemplo: DECIMAL(10, 2) puede almacenar números como 12345.67, -12345.67

##### **Tipos de Cadena de Texto:**
**1. CHAR**
* Descripción: Almacena cadenas de longitud fija.
* Longitud: Se especifica en la definición (por ejemplo, CHAR(10) almacena exactamente 10 caracteres).
* Ejemplo: 'HELLO ' (con espacios al final si la longitud es menor que la especificada).

**2. VARCHAR**

* Descripción: Almacena cadenas de longitud variable.
* Longitud: Se especifica en la definición (por ejemplo, VARCHAR(50) puede almacenar hasta 50 caracteres).
* Ejemplo: 'HELLO'

**3. TEXT**

* Descripción: Almacena grandes cadenas de texto.
* Longitud: Variable, puede almacenar grandes cantidades de datos textuales.
* Ejemplo: 'Este es un texto muy largo...'

##### Tipos de Fecha y Hora:

**1. DATE**

* Descripción: Almacena una fecha en el formato 'YYYY-MM-DD'.
* Ejemplo: '2024-07-06'

**2. TIME**

* Descripción: Almacena una hora en el formato 'HH:MM'.
* Ejemplo: '14:30:00'

**3. DATETIME**

* Descripción: Almacena una fecha y una hora en el formato 'YYYY-MM-DD HH:MM'.
* Ejemplo: '2024-07-06 14:30:00'

**4. TIMESTAMP**

* Descripción: Almacena una marca de tiempo que incluye fecha y hora, a menudo con zona horaria y en formato 'YYYY-MM-DD HH:MM'.
* Ejemplo: '2024-07-06 14:30:00'

##### Tipos Booleanos:

**1. BOOLEAN**
* Descripción: Almacena valores de verdadero o falso.
* Valores: Típicamente 'TRUE' o 'FALSE'.
* Ejemplo: TRUE, FALSE

#### 2. Operaciones CRUD (Create, Read, Update, Delete)
**1. INSERT INTO**

* La sentencia INSERT INTO se utiliza para agregar nuevos registros a una tabla.
```sql
INSERT INTO DEPARTAMENTOS (nombre) VALUES
('Desarrollo'),
('Marketing'),
('Ventas'),
('Recursos Humanos'),
('Soporte'),
('Finanzas'),
('Operaciones'),
('IT'),
('Legal'),
('Administración');

INSERT INTO EMPLEADOS (nombre, apellido, email, telefono, departamento_id) VALUES
('Juan', 'Pérez', 'juan.perez@empresa.com', '555-1234', 1),
('Ana', 'García', 'ana.garcia@empresa.com', '555-5678', 2),
('Luis', 'Martínez', 'luis.martinez@empresa.com', '555-8765', 3);

```
**2. SELECT (Consultas basicas, WHERE,ORDER BY,LIMIT)**

* La sentencia **SELECT** se utiliza para consultar datos de una tabla.
```sql
SELECT * FROM EMPLEADOS;
```
* Filtrado de resultados con **WHERE**:
```sql
SELECT * FROM EMPLEADOS WHERE departamento_id = 1;
```
![where_empleado](/imagenes/where_empleado.png)
* Ordenar resultados con **ORDER BY**:
```sql
SELECT * FROM EMPLEADOS ORDER BY apellido ASC;
```
![order_by_asc](/imagenes/order_by_asc.png)
```sql
SELECT * FROM EMPLEADOS ORDER BY apellido DESC;
```
![order_by_desc](/imagenes/order_by_desc.png)
* Limitar resultados con **LIMIT**:
```sql 
SELECT * FROM EMPLEADOS LIMIT 5;
```
![limit](/imagenes/limit.png)
3. UPDATE
* La sentencia **UPDATE** se utiliza para modificar registros existentes en una tabla.
```sql
UPDATE EMPLEADOS SET email = 'juan.perez@gmail.com' WHERE empleado_id = 1;

```
4. DELETE

* La sentencia **DELETE** se utiliza para eliminar registros de una tabla.
```sql
DELETE FROM EMPLEADOS WHERE empleado_id = 1;

```
📝 **Actividades Prácticas**:

* Insertar varios registros en una tabla.
* Realizar consultas básicas y filtradas.
* Actualizar registros específicos.
* Eliminar registros específicos.
* Realizar consultas con diferentes * filtros.
* Ordenar resultados en diferentes órdenes.
* Limitar la cantidad de resultados devueltos.

[`Atras`](/Tema_1.md)|[`Siguiente`](/Tema_3.md)
