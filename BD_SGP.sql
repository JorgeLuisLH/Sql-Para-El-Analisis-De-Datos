-- Crear base de datos
CREATE SCHEMA proyectos;

-- Crear tabla DEPARTAMENTOS

CREATE TABLE DEPARTAMENTOS (
    departamento_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);
-- Crear tabla Empleados
CREATE TABLE EMPLEADOS (
    empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    departamento_id INT,
    salario decimal(7,2),
    FOREIGN KEY (departamento_id) REFERENCES DEPARTAMENTOS(departamento_id)
);

-- Crear tabla PROYECTOS
CREATE TABLE PROYECTOS (
    proyecto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    gerente_proyecto_id INT,
    FOREIGN KEY (gerente_proyecto_id) REFERENCES EMPLEADOS(empleado_id)
);

-- Crear tabla TAREAS

CREATE TABLE TAREAS (
    tarea_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    proyecto_id INT,
    asignado_a INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(50) NOT NULL,
    FOREIGN KEY (proyecto_id) REFERENCES PROYECTOS(proyecto_id),
    FOREIGN KEY (asignado_a) REFERENCES EMPLEADOS(empleado_id)
);

-- Crear Tabla SEGUIMIENTOS

CREATE TABLE SEGUIMIENTOS (
    seguimiento_id INT PRIMARY KEY AUTO_INCREMENT,
    tarea_id INT,
    fecha DATE NOT NULL,
    comentarios TEXT,
    empleado_id INT,
    FOREIGN KEY (tarea_id) REFERENCES TAREAS(tarea_id),
    FOREIGN KEY (empleado_id) REFERENCES EMPLEADOS(empleado_id)
);

INSERT INTO Departamentos (nombre) VALUES
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

INSERT INTO Empleados (nombre, apellido, email, telefono, departamento_id, salario) VALUES
('Juan', 'Pérez', 'juan.perez@empresa.com', '555-1234', 1, 200000),
('Ana', 'García', 'ana.garcia@empresa.com', '555-5678', 2,25000),
('Luis', 'Martínez', 'luis.martinez@empresa.com', '555-8765', 1,30000),
('María', 'Rodríguez', 'maria.rodriguez@empresa.com', '555-4321', 3,25000),
('Pedro', 'López', 'pedro.lopez@empresa.com', '555-6789', 4,30000),
('José', 'González', 'jose.gonzalez@empresa.com', '555-0006', 5,35000),
('Laura', 'Sánchez', 'laura.sanchez@empresa.com', '555-0007', 6,40000),
('Miguel', 'Ramírez', 'miguel.ramirez@empresa.com', '555-0008', 7,25000),
('Lucía', 'Torres', 'lucia.torres@empresa.com', '555-0009', 8,60000),
('Javier', 'Díaz', 'javier.diaz@empresa.com', '555-0010', 9,30000);

INSERT INTO Proyectos (nombre, descripcion, fecha_inicio, fecha_fin, gerente_proyecto_id) VALUES
('Desarrollo Web', 'Proyecto de desarrollo de una aplicación web.', '2024-01-01', '2024-06-30', 1),
('Campaña de Marketing', 'Campaña de marketing para el nuevo producto.', '2024-02-01', '2024-05-31', 2),
('Automatización de Ventas', 'Implementación de un sistema de automatización de ventas.', '2024-03-01', '2024-09-30', 4);

INSERT INTO Tareas (nombre, descripcion, proyecto_id, asignado_a, fecha_inicio, fecha_fin, estado) VALUES
('Diseño de UI', 'Crear el diseño de la interfaz de usuario.', 1, 3, '2024-01-01', '2024-02-15', 'Completada'),
('Desarrollo del Backend', 'Implementar la lógica del servidor.', 1, 1, '2024-01-15', '2024-04-30', 'En Progreso'),
('Pruebas de Integración', 'Realizar pruebas de integración del sistema.', 1, 3, '2024-05-01', '2024-06-15', 'Pendiente'),
('Investigación de Mercado', 'Realizar investigación de mercado.', 2, 2, '2024-02-01', '2024-03-15', 'Completada'),
('Diseño de Publicidad', 'Crear material publicitario.', 2, 2, '2024-03-16', '2024-04-30', 'En Progreso'),
('Configuración del CRM', 'Configurar el sistema de gestión de relaciones con clientes.', 3, 4, '2024-03-01', '2024-06-30', 'Pendiente');

INSERT INTO Seguimientos (tarea_id, fecha, comentarios, empleado_id) VALUES
(1, '2024-01-05', 'Iniciado el diseño de la UI.', 3),
(1, '2024-01-20', 'Progreso del 50% en el diseño de la UI.', 3),
(1, '2024-02-10', 'Diseño de UI completado.', 3),
(2, '2024-01-20', 'Inicio del desarrollo del backend.', 1),
(2, '2024-03-15', 'Progreso del 60% en el desarrollo del backend.', 1),
(4, '2024-02-15', 'Investigación de mercado completada en un 70%.', 2),
(4, '2024-03-10', 'Investigación de mercado completada.', 2),
(5, '2024-03-20', 'Iniciado el diseño de publicidad.', 2);

