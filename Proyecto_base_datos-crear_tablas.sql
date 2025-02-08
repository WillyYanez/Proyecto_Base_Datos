-- Create tables
CREATE TABLE gerencias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

CREATE TABLE coordinaciones (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    gerencia_id INTEGER,
    nombre TEXT NOT NULL,
    FOREIGN KEY (gerencia_id) REFERENCES gerencias(id)
);

CREATE TABLE empleados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    coordinacion_id INTEGER,
    cedula TEXT NOT NULL CHECK (cedula GLOB '[0-9]*'),
    edad INTEGER NOT NULL CHECK (edad > 18 AND edad < 60),
    codigo_empleado TEXT UNIQUE NOT NULL CHECK (LENGTH(codigo_empleado) = 6 AND codigo_empleado GLOB '[0-9]*'),
    estado TEXT NOT NULL CHECK (estado IN ('active', 'inactive')),
    FOREIGN KEY (coordinacion_id) REFERENCES coordinaciones(id)
);

CREATE TABLE proyectos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_final DATE,
    activo BOOLEAN NOT NULL DEFAULT 1
);

CREATE TABLE empleados_proyectos (
    empleado_id INTEGER,
    proyecto_id INTEGER,
    PRIMARY KEY (empleado_id, proyecto_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(id),
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(id)
);

-- Insert sample data (optional)
INSERT INTO gerencias (id, nombre) VALUES (1, 'Gerencia 1');
INSERT INTO gerencias (id, nombre) VALUES (2, 'Gerencia 2');
INSERT INTO gerencias (id, nombre) VALUES (3, 'Gerencia 3');
INSERT INTO coordinaciones (id, gerencia_id, nombre) VALUES (1, 1, 'Coordinacion 1-1');
INSERT INTO coordinaciones (id, gerencia_id, nombre) VALUES (2, 1, 'Coordinacion 1-2');
INSERT INTO coordinaciones (id, gerencia_id, nombre) VALUES (3, 2, 'Coordinacion 2-1');
INSERT INTO coordinaciones (id, gerencia_id, nombre) VALUES (4, 3, 'Coordinacion 3-1');
INSERT INTO empleados (id, nombre, apellido, email, coordinacion_id, cedula, edad, codigo_empleado, estado) VALUES (1, 'Juan', 'Perez', 'juan.perez@example.com', 1, '12345678', 30, '123456', 'active');
INSERT INTO empleados (id, nombre, apellido, email, coordinacion_id, cedula, edad, codigo_empleado, estado) VALUES (2, 'Pepe', 'Trueno', 'pepe.trueno@gmail.com', 2, '12345679', 40, '123457', 'active');
INSERT INTO empleados (id, nombre, apellido, email, coordinacion_id, cedula, edad, codigo_empleado, estado) VALUES (3, 'Maria', 'Lopez', 'maria.lopez@example.com', 3, '12345670', 25, '123458', 'inactive');

INSERT INTO proyectos (id, nombre, descripcion, fecha_inicio, fecha_final, activo) VALUES (1, 'Project 1', 'Description of project 1', '2024-01-01', '2024-12-31', 0);
INSERT INTO proyectos (id, nombre, descripcion, fecha_inicio, fecha_final, activo) VALUES (2, 'Project 2', 'Description of project 2', '2025-02-01', '2025-07-31', 1);
INSERT INTO proyectos (id, nombre, descripcion, fecha_inicio, fecha_final, activo) VALUES (3, 'Project 3', 'Description of project 3', '2025-01-01', '2025-12-31', 1);

INSERT INTO empleados_proyectos (empleado_id, proyecto_id) VALUES (1, 1);
INSERT INTO empleados_proyectos (empleado_id, proyecto_id) VALUES (2, 1);
INSERT INTO empleados_proyectos (empleado_id, proyecto_id) VALUES (3, 2);
INSERT INTO empleados_proyectos (empleado_id, proyecto_id) VALUES (2, 2);
INSERT INTO empleados_proyectos (empleado_id, proyecto_id) VALUES (1, 2);

