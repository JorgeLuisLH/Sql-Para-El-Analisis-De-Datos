## Tema 2: Consultas

### 1. Funciones de Agregacion

#### 1. COUNT, SUM, AVG, MIN, MAX:
- **SUM:** Suma de valores en una columna
```sql
-- Suma los salarios de todos los empleados
SELECT SUM(salario) AS total_salarios FROM EMPLEADOS;
```
![sum](/imagenes/sum.png)
- **AVG:**  Promedio de valores en una columna.
```sql
-- Calcular el salario promedio de todos los empleados
SELECT AVG(salario) AS salario_promedio FROM EMPLEADOS;

```
![promedio](/imagenes/avg.png)
- **MAX:** Valor máximo en una columna.
```sql
-- Encontrar el salario máximo
SELECT MAX(salario) AS salario_maximo FROM EMPLEADOS;
```
![maximo](/imagenes/max.png)

[`Atras`](/Tema_2.md)|[`Siguiente`](/Tema_2.md)
- **MIN:** Valor minimo en una columna.
```sql
-- Encontrar el salario mínimo
SELECT MIN(salario) AS salario_minimo FROM EMPLEADOS;

```
![minimo](/imagenes/min.png)
- **COUNT:** Cuenta el número de registros.
```sql
-- Contar el número de empleados
SELECT COUNT(*) AS numero_empleados FROM EMPLEADOS;

```
![count](/imagenes/count.png)

#### 2. Agrupación de datos con GROUP BY:
- **GROUP BY:** Agrupar datos para obtener información resumida.
```SQL
-- Número de proyectos por gerente de proyecto:
SELECT concat(e.nombre,' ',e.apellido) AS Gerente, COUNT(p.proyecto_id) AS Numero_Proyectos
FROM PROYECTOS p
JOIN EMPLEADOS e ON p.gerente_proyecto_id = e.empleado_id
GROUP BY e.nombre, e.apellido;
```
> Esta consulta cuenta el número de proyectos gestionados por cada gerente de proyecto. Se usa GROUP BY para agrupar por el nombre y apellido del gerente.

![group_by](/imagenes/group_by.png)
- **HAVING:** filtra los grupos resultantes de una agregacion
```SQL
-- Departamentos con dos o mas empleados:
SELECT d.nombre AS Departamento, COUNT(e.empleado_id) AS Numero_Empleados
FROM EMPLEADOS e
JOIN DEPARTAMENTOS d ON e.departamento_id = d.departamento_id
GROUP BY d.nombre
HAVING COUNT(e.empleado_id) >= 2;

```
> Having se usa para filtrar los grupos que tienen 2 o más empleados, después de que los datos han sido agrupados por departamento.

![having](/imagenes/having.png)
### 2. Union o cruce de Tablas
#### 1. Tipos de uniones: INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN

![union_de_tablas](/imagenes/Union_de_Tablas.png)

- **INNER JOIN:** Obtener todos los empleados y sus respectivos departamentos.

```sql
SELECT e.nombre, e.apellido, d.nombre AS Departamento
FROM EMPLEADOS e
INNER JOIN DEPARTAMENTOS d ON e.departamento_id = d.departamento_id;
```
> Devuelve solo las filas donde hay una coincidencia en ambas tablas (EMPLEADOS y DEPARTAMENTOS).

![inner_join](/imagenes/inner_join.png)

- **LEFT JOIN:** Devuelde todas las filas de la tabla izquierda y las coincidencias con la tabla izquierda, si no hay coincidencia el valor es NULL.
```sql
--  Lista todos los empleados y sus tareas, incluyendo aquellos que no tienen tareas asignadas.
SELECT e.nombre, e.apellido, t.nombre AS Tarea
FROM EMPLEADOS e
LEFT JOIN TAREAS t ON e.empleado_id = t.asignado_a;
```
> Devuelve todas las filas de la tabla EMPLEADOS y las filas coincidentes de la tabla TAREAS. Si no hay coincidencia, los campos de TAREAS serán NULL.

![left_join](/imagenes/left_join.png)

**RIGHT JOIN:** Devuelde todas las filas  de la tabla derecha y las coincidencias con la tabla izquierda, si no hay coincidencia el valor es NULL.
> la eleccion entre usar LEFT JOIN o RIGHT JOIN depende que tablabla queremos proirizar en la consulta

- **FULL JOIN:** Devuelve todas las filas de ambas tablas, si una fila en alguna tabla no tiene coincidencia con la otra el campo sera NULL.
**No es soportado por todas las bases de datos** pero se puede simular combinando left join y right join y usando UNION
```sql
SELECT e.nombre, e.apellido, t.nombre AS Tarea
FROM EMPLEADOS e
FULL JOIN TAREAS t ON e.departamento_id = t.asignado_a ;
-- Equivalencia a FULL JOIN
SELECT e.nombre, e.apellido, t.nombre AS Tarea
FROM EMPLEADOS e
LEFT JOIN TAREAS t ON e.departamento_id = t.asignado_a 
UNION
SELECT e.nombre, e.apellido, t.nombre AS Tarea
FROM TAREAS t
RIGHT JOIN EMPLEADOS e ON e.departamento_id = t.asignado_a 
```
> devuelve todas las filas cuando hay una coincidencia en EMPLEADOS o TAREAS. Las filas no coincidentes se muestran con NULL en el lugar de la columna que falta.

![full_join](/imagenes/full_join.png)

### 3. SUBCONSULTAS
En SQL las subconsultas son consultas anidadas dentro de otra consulta
#### 1. Subconsulta en un SELECT

Una subconsulta dentro de del SELECT puede devolver un valor que se usa como columna en el resultado de la consulta principal


```sql
-- Obtener el salario promedio de cada empleado comparado con el salario promedio general:
SELECT e.nombre, e.apellido, e.salario,
    (SELECT AVG(salario) FROM EMPLEADOS) AS Salario_Promedio_General
FROM EMPLEADOS e;
 
```
> La subconsulta dentro del SELECT calcula el salario promedio general de todos los empleados y lo compara con el salario individual de cada empleado.

![subquery_select](/imagenes/subquery_select.png)
#### 2. Subconsulta en un WHERE
Las subconsultas dentro de un WHERE son muy comunes para filtrar los resultados basandose en valores resultantes de otra consulta.

```sql
-- Obtener empleados que ganan más que el salario promedio de su departamento:
SELECT e.nombre, e.apellido, e.salario
FROM EMPLEADOS e
WHERE e.salario > (SELECT AVG(salario) 
                   FROM EMPLEADOS 
                   WHERE departamento_id = e.departamento_id);
```
![subquery_where](/imagenes/subquery_where.png)

> La subconsulta dentro el WHERE calcula el salario promedio para cada departamento y la consulta principal selecciona a los empleados cuyo salario es mayor que este promedio.
#### 3. Subconsulta en un FROM
Las subconsultas dentro de un FROM actuan como una tabla temporal, se utiliza reutilizar los resultados de subconsultas o simplificar consultas complejas.

```sql
-- Obtener el salario promedio por departamento y listar los departamentos con salario promedio mayor a un valor específico:
SELECT sub.Departamento, sub.Salario_Promedio
FROM (SELECT d.nombre AS Departamento, AVG(e.salario) AS Salario_Promedio
      FROM EMPLEADOS e
      JOIN DEPARTAMENTOS d ON e.departamento_id = d.departamento_id
      GROUP BY d.nombre) sub
WHERE sub.Salario_Promedio > 30000;

```
![subquery_from](/imagenes/subquery_from.png)

> La subconsulta dentro el WHERE calcula el salario promedio para cada departamento y la consulta principal selecciona a los empleados cuyo salario es mayor que este promedio.


[`Atras`](/Tema_2.md)|[`Siguiente`](/Tema_4.md)