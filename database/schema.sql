-- Esquema de Base de Datos para Laboratorio Clínico DANIMAR
-- Motor Sugerido: PostgreSQL o MySQL

-- 1. Tabla de Usuarios (Personal del laboratorio)
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL, -- Almacenar hash solamente
    nombre_real VARCHAR(100),
    rol VARCHAR(20) DEFAULT 'licenciada', -- licenciada, administrador, tecnico
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tabla de Pacientes
CREATE TABLE pacientes (
    id SERIAL PRIMARY KEY,
    cedula VARCHAR(20) UNIQUE NOT NULL,
    nombre_completo VARCHAR(150) NOT NULL,
    fecha_nacimiento DATE,
    genero CHAR(1), -- M, F, O
    telefono VARCHAR(20),
    direccion TEXT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Tabla de Catálogo de Pruebas (Precios y referencias)
CREATE TABLE catalogo_pruebas (
    id SERIAL PRIMARY KEY,
    nombre_prueba VARCHAR(100) NOT NULL,
    categoria VARCHAR(50), -- Hematologia, Quimica, etc.
    precio DECIMAL(10, 2) NOT NULL,
    valores_referencia TEXT,
    unidad_medida VARCHAR(20)
);

-- 4. Tabla de Exámenes (Encabezado de la orden)
CREATE TABLE examenes (
    id SERIAL PRIMARY KEY,
    paciente_id INTEGER REFERENCES pacientes(id) ON DELETE CASCADE,
    usuario_id INTEGER REFERENCES usuarios(id),
    fecha_solicitud TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(20) DEFAULT 'pendiente', -- pendiente, procesando, completado, entregado
    costo_total DECIMAL(10, 2) DEFAULT 0.00,
    observaciones TEXT
);

-- 5. Detalle de Exámenes (Relación N:M entre Exámenes y Pruebas)
CREATE TABLE detalle_examenes (
    id SERIAL PRIMARY KEY,
    examen_id INTEGER REFERENCES examenes(id) ON DELETE CASCADE,
    prueba_id INTEGER REFERENCES catalogo_pruebas(id),
    resultado VARCHAR(100), -- Se llena al completar el análisis
    estado_resultado VARCHAR(20) DEFAULT 'pendiente'
);

-- Insertar datos de prueba iniciales
INSERT INTO usuarios (username, password, nombre_real, rol) 
VALUES ('licenciada', 'danimar2026', 'Lic. Personal Autorizado', 'licenciada');

INSERT INTO catalogo_pruebas (nombre_prueba, categoria, precio) VALUES 
('Hematología Completa', 'Hematología', 15.00),
('Glicemia', 'Química Sanguínea', 5.00),
('Perfil Lipídico', 'Química Sanguínea', 20.00),
('Examen de Orina', 'Uroanálisis', 8.00);
