
-- Tabla de Clientes
CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    contraseña VARCHAR(100) NOT NULL
);

-- Tabla de Técnicos
CREATE TABLE tecnicos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    contraseña VARCHAR(100) NOT NULL
);

-- Tabla de Ubicaciones
CREATE TABLE ubicaciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    longitud DECIMAL(10, 8),
    latitud DECIMAL(10, 8),
    ciudad VARCHAR(100),
    provincia VARCHAR(100),
    codigo_postal VARCHAR(10),
    telefono_contacto VARCHAR(15),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

-- Tabla de Solicitudes de Soporte
CREATE TABLE solicitudes_soporte (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    fecha_solicitud DATETIME DEFAULT CURRENT_TIMESTAMP,
    descripcion TEXT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

-- Tabla de Instalaciones
CREATE TABLE instalaciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    solicitud_id INT,
    tecnico_id INT,
    fecha_instalacion DATETIME,
    descripcion TEXT,
    FOREIGN KEY (solicitud_id) REFERENCES solicitudes_soporte(id) ON DELETE CASCADE,
    FOREIGN KEY (tecnico_id) REFERENCES tecnicos(id) ON DELETE SET NULL
);

-- Tabla de Estados (Catálogo de estados para las instalaciones)
CREATE TABLE estados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

-- Insertar estados iniciales
INSERT INTO estados (nombre) VALUES
    ('Pendiente'),
    ('Concluido'),
    ('Cancelado');

-- Tabla de Estados de Instalaciones (registro histórico de cambios de estado)
CREATE TABLE estados_instalaciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    instalacion_id INT,
    estado_id INT,
    tecnico_id INT,
    fecha_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    precio DECIMAL(10, 2),
    FOREIGN KEY (instalacion_id) REFERENCES instalaciones(id) ON DELETE CASCADE,
    FOREIGN KEY (estado_id) REFERENCES estados(id) ON DELETE RESTRICT,
    FOREIGN KEY (tecnico_id) REFERENCES tecnicos(id) ON DELETE SET NULL
);

-- Tabla de Comentarios
CREATE TABLE comentarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    solicitud_id INT,
    tecnico_id INT,
    comentario TEXT NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (solicitud_id) REFERENCES solicitudes_soporte(id) ON DELETE CASCADE,
    FOREIGN KEY (tecnico_id) REFERENCES tecnicos(id) ON DELETE SET NULL
);
