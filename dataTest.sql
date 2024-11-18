INSERT INTO usuarios (nombre, apellido, correo, telefono, contraseña, rol) VALUES
('Juan', 'Pérez', 'juan.perez@dominio.com', '1234567890', 'hashed_password_1', 'admin'),
('Ana', 'López', 'ana.lopez@dominio.com', '0987654321', 'hashed_password_2', 'user'),
('Carlos', 'González', 'carlos.gonzalez@dominio.com', '1122334455', 'hashed_password_3', 'tecnico'),
('Lucía', 'Martínez', 'lucia.martinez@dominio.com', '2233445566', 'hashed_password_4', 'tecnico'),
('Pedro', 'Fernández', 'pedro.fernandez@dominio.com', '3344556677', 'hashed_password_5', 'user');
INSERT INTO ubicaciones (usuario_id, longitud, latitud, ciudad, telefono_contacto) VALUES
(2, -58.4431, -17.7854, 'Santa Cruz', '111223344'),
(3, -58.4432, -17.7864, 'Santa Cruz', '222334455'),
(4, -58.4455, -17.7800, 'Cochabamba', '333445566'),
(5, -58.4467, -17.7890, 'La Paz', '444556677');
INSERT INTO solicitudes_soporte (usuario_id, descripcion) VALUES
(2, 'Problema con la conexión a internet'),
(3, 'Instalación de sistema eléctrico en nuevo local'),
(4, 'Fuga de agua en el baño principal'),
(5, 'Revisión del sistema de calefacción');
INSERT INTO instalaciones (solicitud_id, usuario_id, fecha_instalacion, descripcion) VALUES
(1, 2, '2024-11-06 10:00:00', 'Reparación de modem y router'),
(2, 3, '2024-11-07 14:00:00', 'Instalación de cableado eléctrico en oficinas'),
(3, 4, '2024-11-08 09:30:00', 'Reparación de fuga de agua en baño'),
(4, 5, '2024-11-09 11:00:00', 'Revisión y ajuste de calefacción');
INSERT INTO estados (nombre) VALUES
('Pendiente'),
('Concluido'),
('Cancelado');
INSERT INTO estados_instalaciones (instalacion_id, estado_id, usuario_id, precio) VALUES
(1, 1, 1, 50.00), 
(2, 1, 2, 150.00),
(3, 2, 3, 75.00),
(4, 2, 4, 100.00); 
INSERT INTO comentarios (solicitud_id, usuario_id, comentario) VALUES
(1, 3, 'La instalación se realizará mañana a las 10:00 AM'),
(2, 4, 'El trabajo comenzará el lunes a las 14:00 PM'),
(3, 3, 'La fuga fue reparada exitosamente. No se encontraron más problemas'),
(4, 5, 'Se realizó la revisión y se ajustaron los controles de temperatura');
