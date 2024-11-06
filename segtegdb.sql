CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    contraseña VARCHAR(100) NOT NULL,
    rol ENUM('admin', 'user', 'tecnico') NOT NULL
);

CREATE TABLE ubicaciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT, 
    longitud DECIMAL(10, 8),
    latitud DECIMAL(10, 8),
    ciudad VARCHAR(100),
    telefono_contacto VARCHAR(15),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE solicitudes_soporte (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT, 
    fecha_solicitud DATETIME DEFAULT CURRENT_TIMESTAMP,
    descripcion TEXT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE instalaciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    solicitud_id INT,
    usuario_id INT, 
    fecha_instalacion DATETIME,
    descripcion TEXT,
    FOREIGN KEY (solicitud_id) REFERENCES solicitudes_soporte(id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE SET NULL  -- Cambiar tecnico_id por usuario_id
);

CREATE TABLE estados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO estados (nombre) VALUES
    ('Pendiente'),
    ('Concluido'),
    ('Cancelado');

CREATE TABLE estados_instalaciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    instalacion_id INT,
    estado_id INT,
    usuario_id INT, 
    fecha_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    precio DECIMAL(10, 2),
    FOREIGN KEY (instalacion_id) REFERENCES instalaciones(id) ON DELETE CASCADE,
    FOREIGN KEY (estado_id) REFERENCES estados(id) ON DELETE RESTRICT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE SET NULL 
);

CREATE TABLE comentarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    solicitud_id INT,
    usuario_id INT, 
    comentario TEXT NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (solicitud_id) REFERENCES solicitudes_soporte(id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE SET NULL 
);
