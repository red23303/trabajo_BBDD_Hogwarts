-- Creación de la base de datos
CREATE DATABASE biblioteca_hogwarts;
USE biblioteca_hogwarts;

-- Tabla de Usuarios
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    casa ENUM('Gryffindor', 'Hufflepuff', 'Ravenclaw', 'Slytherin', 'Profesor') NOT NULL,
    correo VARCHAR(100),
    fecha_registro DATE NOT NULL
);

-- Tabla de Autores
CREATE TABLE Autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_autor VARCHAR(100) NOT NULL,
    sangre_pura ENUM('Sí', 'No') NOT NULL,
    nacionalidad VARCHAR(50)
);

-- Tabla de Editoriales
CREATE TABLE Editoriales (
    id_editorial INT AUTO_INCREMENT PRIMARY KEY,
    nombre_editorial VARCHAR(100) NOT NULL,
    pais_origen VARCHAR(50)
);

-- Tabla de Secciones
CREATE TABLE Secciones (
    id_seccion INT AUTO_INCREMENT PRIMARY KEY,
    nombre_seccion VARCHAR(100) NOT NULL
);

-- Tabla de Libros
CREATE TABLE Libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    id_autor INT,
    id_editorial INT,
    id_seccion INT,
    anio_publicacion INT,
    stock INT NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES Autores(id_autor),
    FOREIGN KEY (id_editorial) REFERENCES Editoriales(id_editorial),
    FOREIGN KEY (id_seccion) REFERENCES Secciones(id_seccion)
);

-- Tabla de Préstamos
CREATE TABLE Prestamos (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_libro INT,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro)
);

-- Tabla de Reservas
CREATE TABLE Reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_libro INT,
    fecha_reserva DATE NOT NULL,
    estado ENUM('Pendiente', 'Cancelada', 'Completada') NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro)
);
-- Insertar datos en la tabla Secciones
INSERT INTO Secciones (nombre_seccion) VALUES 
('Sección de Hechizos'),
('Pociones'),
('Criaturas Mágicas'),
('Sección Prohibida'),
('Historia de la Magia'),
('Defensa Contra las Artes Oscuras'),
('Adivinación');

-- Insertar datos en la tabla Editoriales
INSERT INTO Editoriales (nombre_editorial, pais_origen) VALUES 
('Flourish & Blotts', 'Reino Unido'),
('Obscurus Books', 'Reino Unido'),
('The Daily Prophet Publishing', 'Reino Unido'),
('Magical Publications', 'Estados Unidos'),
('Sorcier Publishing', 'Francia'),
('Durmstrang Press', 'Bulgaria'),
('Beauxbatons Editions', 'Francia');

-- Insertar datos en la tabla Autores
INSERT INTO Autores (nombre_autor, sangre_pura, nacionalidad) VALUES 
('Bathilda Bagshot', 'Sí', 'Reino Unido'),
('Newt Scamander', 'No', 'Reino Unido'),
('Miranda Goshawk', 'No', 'Reino Unido'),
('Adalbert Waffling', 'Sí', 'Reino Unido'),
('Arsenius Jigger', 'No', 'Reino Unido'),
('Emeric Switch', 'Sí', 'Reino Unido'),
('Cassandra Vablatsky', 'Sí', 'Rusia'),
('Tom Riddle', 'No', 'Reino Unido'),
('Godric Gryffindor', 'Sí', 'Reino Unido'),
('Salazar Slytherin', 'Sí', 'Reino Unido'),
('Rowena Ravenclaw', 'Sí', 'Reino Unido'),
('Helga Hufflepuff', 'Sí', 'Reino Unido');

-- Insertar datos en la tabla Libros
INSERT INTO Libros (titulo, id_autor, id_editorial, id_seccion, anio_publicacion, stock) VALUES 
('Historia de la Magia', 1, 1, 5, 1947, 5),
('Animales Fantásticos y Dónde Encontrarlos', 2, 1, 3, 1927, 8),
('El Libro de los Hechizos', 3, 1, 1, 1951, 4),
('Principios Fundamentales de la Magia', 4, 1, 1, 1932, 3),
('Pociones Potentes', 5, 2, 2, 1941, 6),
('Transformaciones para Principiantes', 6, 1, 1, 1935, 5),
('Ocultismo para los Torpes', 7, 3, 7, 1912, 2),
('Secretos de los Más Oscuros Artes', 8, 2, 4, 1943, 1),
('Hechizos Avanzados', 3, 1, 1, 1962, 3),
('El Monstruoso Libro de los Monstruos', 2, 2, 3, 1978, 2),
('Magia Medieval', 1, 1, 5, 1953, 4),
('Poderes Mágicos', 9, 4, 6, 1010, 1),
('Hechizos de Sangre', 10, 5, 4, 1010, 1),
('El Arte de la Adivinación', 11, 6, 7, 1010, 3),
('Plantas Mágicas y sus Usos', 12, 7, 2, 1010, 5),
('Defensa Contra el Señor Oscuro', 8, 2, 4, 1945, 1),
('Magia Ancestral', 1, 1, 5, 1960, 2),
('Pociones Maestras', 5, 3, 2, 1955, 3),
('Hechizos Prohibidos', 10, 5, 4, 1020, 1),
('El Secreto de las Runas', 11, 6, 7, 1050, 2);

-- Insertar datos en la tabla Usuarios
INSERT INTO Usuarios (nombre, casa, correo, fecha_registro) VALUES 
('Harry Potter', 'Gryffindor', 'harry.potter@hogwarts.edu', '1991-09-01'),
('Hermione Granger', 'Gryffindor', 'hermione.granger@hogwarts.edu', '1991-09-01'),
('Ron Weasley', 'Gryffindor', 'ron.weasley@hogwarts.edu', '1991-09-01'),
('Draco Malfoy', 'Slytherin', 'draco.malfoy@hogwarts.edu', '1991-09-01'),
('Luna Lovegood', 'Ravenclaw', 'luna.lovegood@hogwarts.edu', '1992-09-01'),
('Neville Longbottom', 'Gryffindor', 'neville.longbottom@hogwarts.edu', '1991-09-01'),
('Ginny Weasley', 'Gryffindor', 'ginny.weasley@hogwarts.edu', '1992-09-01'),
('Cedric Diggory', 'Hufflepuff', 'cedric.diggory@hogwarts.edu', '1990-09-01'),
('Cho Chang', 'Ravenclaw', 'cho.chang@hogwarts.edu', '1991-09-01'),
('Albus Dumbledore', 'Profesor', 'albus.dumbledore@hogwarts.edu', '1930-09-01'),
('Severus Snape', 'Profesor', 'severus.snape@hogwarts.edu', '1981-09-01'),
('Minerva McGonagall', 'Profesor', 'minerva.mcgonagall@hogwarts.edu', '1956-09-01'),
('Rubeus Hagrid', 'Profesor', 'rubeus.hagrid@hogwarts.edu', '1968-09-01'),
('Pomona Sprout', 'Profesor', 'pomona.sprout@hogwarts.edu', '1970-09-01'),
('Filius Flitwick', 'Profesor', 'filius.flitwick@hogwarts.edu', '1975-09-01');

-- Insertar datos en la tabla Prestamos
INSERT INTO Prestamos (id_usuario, id_libro, fecha_prestamo, fecha_devolucion) VALUES 
(1, 2, '2022-01-10', '2022-02-10'),
(1, 3, '2022-01-15', '2022-02-15'),
(2, 1, '2022-01-05', '2022-02-05'),
(2, 5, '2022-01-20', '2022-02-20'),
(2, 7, '2022-02-01', '2022-03-01'),
(2, 9, '2022-02-10', '2022-03-10'),
(2, 11, '2022-03-01', '2022-04-01'),
(3, 2, '2022-01-12', '2022-02-12'),
(3, 4, '2022-02-01', '2022-03-01'),
(4, 8, '2022-01-25', '2022-02-25'),
(4, 13, '2022-02-10', '2022-03-10'),
(4, 19, '2022-03-01', '2022-04-01'),
(5, 6, '2022-01-18', '2022-02-18'),
(5, 14, '2022-02-05', '2022-03-05'),
(5, 20, '2022-03-10', '2022-04-10'),
(6, 1, '2022-01-22', '2022-02-22'),
(6, 3, '2022-02-15', '2022-03-15'),
(7, 5, '2022-01-30', '2022-02-28'),
(7, 10, '2022-02-20', '2022-03-20'),
(8, 2, '2022-01-08', '2022-02-08'),
(8, 7, '2022-02-01', '2022-03-01'),
(9, 4, '2022-01-14', '2022-02-14'),
(9, 9, '2022-02-10', '2022-03-10'),
(10, 1, '2022-01-05', '2022-02-05'),
(10, 11, '2022-02-01', '2022-03-01'),
(10, 17, '2022-03-01', '2022-04-01'),
(11, 8, '2022-01-10', '2022-02-10'),
(11, 16, '2022-02-05', '2022-03-05'),
(12, 3, '2022-01-15', '2022-02-15'),
(12, 6, '2022-02-10', '2022-03-10'),
(13, 2, '2022-01-20', '2022-02-20'),
(13, 10, '2022-02-15', '2022-03-15'),
(14, 5, '2022-01-25', '2022-02-25'),
(14, 15, '2022-02-20', '2022-03-20'),
(15, 7, '2022-01-30', '2022-02-28'),
(15, 14, '2022-02-25', '2022-03-25'),
(1, 5, '2022-03-01', '2022-04-01'),
(1, 7, '2022-03-05', '2022-04-05'),
(2, 2, '2022-03-10', '2022-04-10'),
(2, 4, '2022-03-15', '2022-04-15'),
(3, 6, '2022-03-20', '2022-04-20'),
(4, 9, '2022-03-25', '2022-04-25'),
(5, 11, '2022-03-30', '2022-04-30'),
(6, 13, '2022-04-01', '2022-05-01'),
(7, 15, '2022-04-05', '2022-05-05'),
(8, 17, '2022-04-10', '2022-05-10'),
(9, 19, '2022-04-15', '2022-05-15'),
(10, 2, '2022-04-20', '2022-05-20'),
(11, 4, '2022-04-25', '2022-05-25'),
(12, 6, '2022-04-30', '2022-05-30'),
(13, 8, '2022-05-01', '2022-06-01'),
(14, 10, '2022-05-05', '2022-06-05'),
(15, 12, '2022-05-10', '2022-06-10'),
(1, 14, '2022-05-15', '2022-06-15'),
(2, 16, '2022-05-20', '2022-06-20'),
(3, 18, '2022-05-25', '2022-06-25'),
(4, 20, '2022-05-30', '2022-06-30'),
(5, 1, '2022-06-01', '2022-07-01'),
(6, 3, '2022-06-05', '2022-07-05'),
(7, 5, '2022-06-10', '2022-07-10'),
(8, 7, '2022-06-15', '2022-07-15'),
(9, 9, '2022-06-20', '2022-07-20'),
(10, 11, '2022-06-25', '2022-07-25'),
(11, 13, '2022-06-30', '2022-07-30'),
(12, 15, '2022-07-01', '2022-08-01'),
(13, 17, '2022-07-05', '2022-08-05'),
(14, 19, '2022-07-10', '2022-08-10'),
(15, 2, '2022-07-15', '2022-08-15'),
(1, 4, '2022-07-20', '2022-08-20'),
(2, 6, '2022-07-25', '2022-08-25'),
(3, 8, '2022-07-30', '2022-08-30'),
(4, 10, '2022-08-01', '2022-09-01'),
(5, 12, '2022-08-05', '2022-09-05'),
(6, 14, '2022-08-10', '2022-09-10'),
(7, 16, '2022-08-15', '2022-09-15'),
(8, 18, '2022-08-20', '2022-09-20'),
(9, 20, '2022-08-25', '2022-09-25'),
(10, 1, '2022-08-30', '2022-09-30'),
(11, 3, '2022-09-01', '2022-10-01'),
(12, 5, '2022-09-05', '2022-10-05'),
(13, 7, '2022-09-10', '2022-10-10'),
(14, 9, '2022-09-15', '2022-10-15'),
(15, 11, '2022-09-20', '2022-10-20'),
(1, 13, '2022-09-25', '2022-10-25'),
(2, 15, '2022-09-30', '2022-10-30'),
(3, 17, '2022-10-01', '2022-11-01'),
(4, 19, '2022-10-05', '2022-11-05'),
(5, 2, '2022-10-10', '2022-11-10'),
(6, 4, '2022-10-15', '2022-11-15'),
(7, 6, '2022-10-20', '2022-11-20'),
(8, 8, '2022-10-25', '2022-11-25'),
(9, 10, '2022-10-30', '2022-11-30'),
(10, 12, '2022-11-01', '2022-12-01'),
(11, 14, '2022-11-05', '2022-12-05'),
(12, 16, '2022-11-10', '2022-12-10'),
(13, 18, '2022-11-15', '2022-12-15'),
(14, 20, '2022-11-20', '2022-12-20'),
(15, 1, '2022-11-25', '2022-12-25'),
(1, 3, '2022-11-30', '2022-12-30'),
(2, 5, '2022-12-01', '2023-01-01'),
(3, 7, '2022-12-05', '2023-01-05'),
(4, 9, '2022-12-10', '2023-01-10'),
(5, 11, '2022-12-15', '2023-01-15'),
(6, 13, '2022-12-20', '2023-01-20'),
(7, 15, '2022-12-25', '2023-01-25'),
(8, 17, '2022-12-30', '2023-01-30'),
(9, 19, '2023-01-01', '2023-02-01'),
(10, 2, '2023-01-05', '2023-02-05'),
(11, 4, '2023-01-10', '2023-02-10'),
(12, 6, '2023-01-15', '2023-02-15'),
(13, 8, '2023-01-20', '2023-02-20'),
(14, 10, '2023-01-25', '2023-02-25'),
(15, 12, '2023-01-30', '2023-02-28');

-- Insertar datos en la tabla Reservas
INSERT INTO Reservas (id_usuario, id_libro, fecha_reserva, estado) VALUES 
(1, 1, '2022-01-05', 'Completada'),
(1, 3, '2022-01-10', 'Completada'),
(2, 2, '2022-01-15', 'Completada'),
(2, 4, '2022-01-20', 'Completada'),
(3, 5, '2022-02-01', 'Completada'),
(3, 7, '2022-02-05', 'Cancelada'),
(4, 8, '2022-02-10', 'Completada'),
(4, 10, '2022-02-15', 'Cancelada'),
(5, 9, '2022-02-20', 'Completada'),
(5, 11, '2022-02-25', 'Completada'),
(6, 12, '2022-03-01', 'Completada'),
(6, 14, '2022-03-05', 'Cancelada'),
(7, 13, '2022-03-10', 'Completada'),
(7, 15, '2022-03-15', 'Completada'),
(8, 16, '2022-03-20', 'Completada'),
(8, 18, '2022-03-25', 'Cancelada'),
(9, 17, '2022-03-30', 'Completada'),
(9, 19, '2022-04-01', 'Completada'),
(10, 20, '2022-04-05', 'Completada'),
(10, 1, '2022-04-10', 'Cancelada'),
(11, 2, '2022-04-15', 'Completada'),
(11, 4, '2022-04-20', 'Completada'),
(12, 3, '2022-04-25', 'Completada'),
(12, 5, '2022-04-30', 'Cancelada'),
(13, 6, '2022-05-01', 'Completada'),
(13, 8, '2022-05-05', 'Completada'),
(14, 7, '2022-05-10', 'Completada'),
(14, 9, '2022-05-15', 'Cancelada'),
(15, 10, '2022-05-20', 'Completada'),
(15, 12, '2022-05-25', 'Completada'),
(1, 11, '2022-05-30', 'Completada'),
(1, 13, '2022-06-01', 'Cancelada'),
(2, 12, '2022-06-05', 'Completada'),
(2, 14, '2022-06-10', 'Completada'),
(3, 15, '2022-06-15', 'Completada'),
(3, 17, '2022-06-20', 'Cancelada'),
(4, 16, '2022-06-25', 'Completada'),
(4, 18, '2022-06-30', 'Completada'),
(5, 19, '2022-07-01', 'Completada'),
(5, 20, '2022-07-05', 'Cancelada'),
(6, 1, '2022-07-10', 'Completada'),
(6, 3, '2022-07-15', 'Completada'),
(7, 2, '2022-07-20', 'Completada'),
(7, 4, '2022-07-25', 'Cancelada'),
(8, 5, '2022-07-30', 'Completada'),
(8, 7, '2022-08-01', 'Completada'),
(9, 6, '2022-08-05', 'Completada'),
(9, 8, '2022-08-10', 'Cancelada'),
(10, 9, '2022-08-15', 'Completada'),
(10, 11, '2022-08-20', 'Completada'),
(11, 10, '2022-08-25', 'Completada'),
(11, 12, '2022-08-30', 'Cancelada'),
(12, 13, '2022-09-01', 'Completada'),
(12, 15, '2022-09-05', 'Completada'),
(13, 14, '2022-09-10', 'Completada'),
(13, 16, '2022-09-15', 'Cancelada'),
(14, 17, '2022-09-20', 'Completada'),
(14, 19, '2022-09-25', 'Completada'),
(15, 18, '2022-09-30', 'Completada'),
(15, 20, '2022-10-01', 'Cancelada'),
(1, 1, '2022-10-05', 'Pendiente'),
(1, 3, '2022-10-10', 'Pendiente'),
(2, 5, '2022-10-15', 'Pendiente'),
(2, 7, '2022-10-20', 'Pendiente'),
(3, 9, '2022-10-25', 'Pendiente'),
(3, 11, '2022-10-30', 'Pendiente'),
(4, 13, '2022-11-01', 'Pendiente'),
(4, 15, '2022-11-05', 'Pendiente'),
(5, 17, '2022-11-10', 'Pendiente'),
(5, 19, '2022-11-15', 'Pendiente'),
(6, 2, '2022-11-20', 'Pendiente'),
(6, 4, '2022-11-25', 'Pendiente'),
(7, 6, '2022-11-30', 'Pendiente'),
(7, 8, '2022-12-01', 'Pendiente'),
(8, 10, '2022-12-05', 'Pendiente'),
(8, 12, '2022-12-10', 'Pendiente'),
(9, 14, '2022-12-15', 'Pendiente'),
(9, 16, '2022-12-20', 'Pendiente'),
(10, 18, '2022-12-25', 'Pendiente'),
(10, 20, '2022-12-30', 'Pendiente'),
(11, 1, '2023-01-01', 'Pendiente'),
(11, 3, '2023-01-05', 'Pendiente'),
(12, 5, '2023-01-10', 'Pendiente'),
(12, 7, '2023-01-15', 'Pendiente'),
(13, 9, '2023-01-20', 'Pendiente'),
(13, 11, '2023-01-25', 'Pendiente'),
(14, 13, '2023-01-30', 'Pendiente'),
(14, 15, '2023-02-01', 'Pendiente'),
(15, 17, '2023-02-05', 'Pendiente'),
(15, 19, '2023-02-10', 'Pendiente');
-- 1. Vista de actividad reciente
CREATE VIEW vista_actividad_reciente AS
(
    SELECT 'Préstamo' AS tipo_actividad, p.id_prestamo AS id, u.nombre AS usuario, l.titulo AS libro, p.fecha_prestamo AS fecha
    FROM Prestamos p
    JOIN Usuarios u ON p.id_usuario = u.id_usuario
    JOIN Libros l ON p.id_libro = l.id_libro
    ORDER BY p.fecha_prestamo DESC
    LIMIT 10
)
UNION ALL
(
    SELECT 'Reserva' AS tipo_actividad, r.id_reserva AS id, u.nombre AS usuario, l.titulo AS libro, r.fecha_reserva AS fecha
    FROM Reservas r
    JOIN Usuarios u ON r.id_usuario = u.id_usuario
    JOIN Libros l ON r.id_libro = l.id_libro
    ORDER BY r.fecha_reserva DESC
    LIMIT 10
)
ORDER BY fecha DESC
LIMIT 10;
-- 2. Vista de libros por editorial
CREATE VIEW vista_libros_editorial AS
SELECT e.nombre_editorial, COUNT(l.id_libro) AS cantidad_libros
FROM Editoriales e
LEFT JOIN Libros l ON e.id_editorial = l.id_editorial
GROUP BY e.id_editorial
ORDER BY cantidad_libros DESC;
-- 3. Vista de libros en la Sección Prohibida
CREATE VIEW vista_libros_prohibidos AS
SELECT l.titulo, COUNT(p.id_prestamo) AS veces_prestado
FROM Libros l
JOIN Secciones s ON l.id_seccion = s.id_seccion
LEFT JOIN Prestamos p ON l.id_libro = p.id_libro
WHERE s.nombre_seccion = 'Sección Prohibida'
GROUP BY l.id_libro
ORDER BY veces_prestado DESC;
-- 4. Vista de usuarios frecuentes
CREATE VIEW vista_usuarios_frecuentes AS
SELECT u.id_usuario, u.nombre, u.casa, COUNT(p.id_prestamo) AS total_prestamos
FROM Usuarios u
JOIN Prestamos p ON u.id_usuario = p.id_usuario
WHERE p.fecha_prestamo >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
GROUP BY u.id_usuario
HAVING COUNT(p.id_prestamo) > 5
ORDER BY total_prestamos DESC;
-- Agregar más préstamos a usuarios específicos para que cumplan el criterio de frecuencia
INSERT INTO Prestamos (id_usuario, id_libro, fecha_prestamo, fecha_devolucion) VALUES 
-- Hermione Granger (id_usuario = 2) - 8 préstamos en el último año
(2, 1, '2023-02-01', '2023-03-01'),
(2, 3, '2023-02-05', '2023-03-05'),
(2, 5, '2023-02-10', '2023-03-10'),
(2, 7, '2023-02-15', '2023-03-15'),
(2, 9, '2023-02-20', '2023-03-20'),
(2, 11, '2023-02-25', '2023-03-25'),
(2, 13, '2023-03-01', '2023-04-01'),
(2, 15, '2023-03-05', '2023-04-05'),

-- Harry Potter (id_usuario = 1) - 6 préstamos en el último año
(1, 2, '2023-02-02', '2023-03-02'),
(1, 4, '2023-02-07', '2023-03-07'),
(1, 6, '2023-02-12', '2023-03-12'),
(1, 8, '2023-02-17', '2023-03-17'),
(1, 10, '2023-02-22', '2023-03-22'),
(1, 12, '2023-02-27', '2023-03-27'),

-- Draco Malfoy (id_usuario = 4) - 7 préstamos en el último año
(4, 8, '2023-02-03', '2023-03-03'),
(4, 10, '2023-02-08', '2023-03-08'),
(4, 12, '2023-02-13', '2023-03-13'),
(4, 14, '2023-02-18', '2023-03-18'),
(4, 16, '2023-02-23', '2023-03-23'),
(4, 18, '2023-02-28', '2023-03-28'),
(4, 20, '2023-03-03', '2023-04-03'),

-- Albus Dumbledore (id_usuario = 10) - 9 préstamos en el último año
(10, 1, '2023-01-05', '2023-02-05'),
(10, 3, '2023-01-10', '2023-02-10'),
(10, 5, '2023-01-15', '2023-02-15'),
(10, 7, '2023-01-20', '2023-02-20'),
(10, 9, '2023-01-25', '2023-02-25'),
(10, 11, '2023-01-30', '2023-02-28'),
(10, 13, '2023-02-05', '2023-03-05'),
(10, 15, '2023-02-10', '2023-03-10'),
(10, 17, '2023-02-15', '2023-03-15');
CREATE OR REPLACE VIEW vista_usuarios_frecuentes AS
SELECT u.id_usuario, u.nombre, u.casa, COUNT(p.id_prestamo) AS total_prestamos
FROM Usuarios u
JOIN Prestamos p ON u.id_usuario = p.id_usuario
WHERE p.fecha_prestamo >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
GROUP BY u.id_usuario
HAVING COUNT(p.id_prestamo) > 5
ORDER BY total_prestamos DESC;
-- Eliminar préstamos antiguos si es necesario
DELETE FROM Prestamos WHERE fecha_prestamo >= '2023-01-01';

-- Insertar préstamos recientes que cumplan los criterios
INSERT INTO Prestamos (id_usuario, id_libro, fecha_prestamo, fecha_devolucion) VALUES 
-- Usuario 2 (Hermione) - 8 préstamos
(2, 1, '2023-02-01', '2023-03-01'),
(2, 2, '2023-02-05', '2023-03-05'),
(2, 3, '2023-02-10', '2023-03-10'),
(2, 4, '2023-02-15', '2023-03-15'),
(2, 5, '2023-02-20', '2023-03-20'),
(2, 6, '2023-02-25', '2023-03-25'),
(2, 7, '2023-03-01', '2023-04-01'),
(2, 8, '2023-03-05', '2023-04-05'),

-- Usuario 1 (Harry) - 6 préstamos
(1, 2, '2023-02-02', '2023-03-02'),
(1, 4, '2023-02-07', '2023-03-07'),
(1, 6, '2023-02-12', '2023-03-12'),
(1, 8, '2023-02-17', '2023-03-17'),
(1, 10, '2023-02-22', '2023-03-22'),
(1, 12, '2023-02-27', '2023-03-27'),

-- Usuario 10 (Dumbledore) - 9 préstamos
(10, 1, '2023-02-03', '2023-03-03'),
(10, 3, '2023-02-08', '2023-03-08'),
(10, 5, '2023-02-13', '2023-03-13'),
(10, 7, '2023-02-18', '2023-03-18'),
(10, 9, '2023-02-23', '2023-03-23'),
(10, 11, '2023-02-28', '2023-03-28'),
(10, 13, '2023-03-03', '2023-04-03'),
(10, 15, '2023-03-08', '2023-04-08'),
(10, 17, '2023-03-13', '2023-04-13');
CREATE OR REPLACE VIEW vista_usuarios_frecuentes AS
SELECT u.id_usuario, u.nombre, u.casa, COUNT(p.id_prestamo) AS total_prestamos
FROM Usuarios u
JOIN Prestamos p ON u.id_usuario = p.id_usuario
WHERE p.fecha_prestamo >= DATE_SUB('2023-03-15', INTERVAL 1 YEAR)  -- Usando una fecha fija para pruebas
GROUP BY u.id_usuario
HAVING COUNT(p.id_prestamo) > 5  
ORDER BY total_prestamos DESC;
CREATE OR REPLACE VIEW vista_usuarios_frecuentes AS
SELECT u.id_usuario, u.nombre, u.casa, COUNT(p.id_prestamo) AS total_prestamos
FROM Usuarios u
JOIN Prestamos p ON u.id_usuario = p.id_usuario
WHERE p.fecha_prestamo >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
GROUP BY u.id_usuario
HAVING COUNT(p.id_prestamo) > 5
ORDER BY total_prestamos DESC;

SELECT 
    CURRENT_DATE() AS fecha_actual,
    DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR) AS fecha_limite,
    MIN(fecha_prestamo) AS primer_prestamo,
    MAX(fecha_prestamo) AS ultimo_prestamo,
    COUNT(*) AS total_prestamos,
    COUNT(CASE WHEN fecha_prestamo >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR) THEN 1 END) AS prestamos_recientes
FROM Prestamos;
CREATE OR REPLACE VIEW vista_usuarios_frecuentes AS
SELECT u.id_usuario, u.nombre, u.casa, COUNT(p.id_prestamo) AS total_prestamos
FROM Usuarios u
JOIN Prestamos p ON u.id_usuario = p.id_usuario
WHERE p.fecha_prestamo BETWEEN '2023-03-26' AND '2024-03-25' -- Rango del último año completo
GROUP BY u.id_usuario
HAVING COUNT(p.id_prestamo) > 5
ORDER BY total_prestamos DESC;
-- Verificar los préstamos actuales
SELECT * FROM Prestamos ORDER BY fecha_prestamo DESC LIMIT 10;

-- Verificar la vista
SELECT * FROM vista_usuarios_frecuentes;
-- Opcional: Limpiar préstamos antiguos si no los necesitas
DELETE FROM Prestamos WHERE fecha_prestamo < '2023-03-26';
-- Insertar préstamos que CUMPLAN los requisitos exactos
INSERT INTO Prestamos (id_usuario, id_libro, fecha_prestamo, fecha_devolucion) VALUES
-- Usuario 2 (Hermione) - 6 préstamos en el último año
(2, 1, '2023-06-15', '2023-07-15'),
(2, 3, '2023-08-20', '2023-09-20'),
(2, 5, '2023-10-10', '2023-11-10'),
(2, 7, '2024-01-05', '2024-02-05'),
(2, 9, '2024-02-15', '2024-03-15'),
(2, 11, '2024-03-10', '2024-04-10'),

-- Usuario 1 (Harry) - 7 préstamos en el último año
(1, 2, '2023-04-01', '2023-05-01'),
(1, 4, '2023-07-12', '2023-08-12'),
(1, 6, '2023-09-18', '2023-10-18'),
(1, 8, '2023-11-22', '2023-12-22'),
(1, 10, '2024-01-15', '2024-02-15'),
(1, 12, '2024-02-20', '2024-03-20'),
(1, 14, '2024-03-18', '2024-04-18'),

-- Usuario 10 (Dumbledore) - 8 préstamos en el último año
(10, 1, '2023-05-10', '2023-06-10'),
(10, 3, '2023-07-25', '2023-08-25'),
(10, 5, '2023-10-05', '2023-11-05'),
(10, 7, '2023-12-15', '2024-01-15'),
(10, 9, '2024-01-20', '2024-02-20'),
(10, 11, '2024-02-25', '2024-03-25'),
(10, 13, '2024-03-05', '2024-04-05'),
(10, 15, '2024-03-20', '2024-04-20');
CREATE OR REPLACE VIEW vista_usuarios_frecuentes AS
SELECT u.id_usuario, u.nombre, u.casa, COUNT(p.id_prestamo) AS total_prestamos
FROM Usuarios u
JOIN Prestamos p ON u.id_usuario = p.id_usuario
WHERE p.fecha_prestamo BETWEEN '2023-03-26' AND '2024-03-25'
GROUP BY u.id_usuario
HAVING COUNT(p.id_prestamo) > 5
ORDER BY total_prestamos DESC;
-- Verificar los préstamos insertados
SELECT * FROM Prestamos WHERE fecha_prestamo BETWEEN '2023-03-26' AND '2024-03-25' ORDER BY fecha_prestamo DESC;

-- Verificar la vista
SELECT * FROM vista_usuarios_frecuentes;
-- 5. Promedio de reservas por casa
SELECT casa, AVG(reservas_count) AS promedio_reservas
FROM (
    SELECT u.casa, u.id_usuario, COUNT(r.id_reserva) AS reservas_count
    FROM Usuarios u
    LEFT JOIN Reservas r ON u.id_usuario = r.id_usuario
    GROUP BY u.id_usuario
) AS subquery
GROUP BY casa;
SELECT casa, AVG(reservas_count) AS promedio_reservas
FROM (
    SELECT u.casa, u.id_usuario, COUNT(r.id_reserva) AS reservas_count
    FROM Usuarios u
    LEFT JOIN Reservas r ON u.id_usuario = r.id_usuario
    GROUP BY u.id_usuario, u.casa  -- Se agregó u.casa al GROUP BY para mayor precisión
) AS subquery
GROUP BY casa;
-- Eliminar algunas reservas aleatoriamente para crear variación
DELETE FROM Reservas WHERE id_reserva % 5 = 0;

-- Agregar reservas adicionales a usuarios específicos
INSERT INTO Reservas (id_usuario, id_libro, fecha_reserva, estado)
VALUES 
(1, 3, '2023-06-15', 'Completada'),  -- Gryffindor
(1, 5, '2023-08-20', 'Completada'),
(2, 7, '2023-10-10', 'Completada'),  -- Gryffindor
(2, 9, '2024-01-05', 'Completada'),
(10, 11, '2024-02-15', 'Completada'), -- Profesor
(10, 13, '2024-03-10', 'Completada'),
(10, 15, '2024-01-20', 'Completada');
-- 6. Editorial más popular
SELECT nombre_editorial, total_prestamos
FROM (
    SELECT 
        e.nombre_editorial,
        COUNT(p.id_prestamo) AS total_prestamos,
        RANK() OVER (ORDER BY COUNT(p.id_prestamo) DESC) AS ranking
    FROM Editoriales e
    JOIN Libros l ON e.id_editorial = l.id_editorial
    JOIN Prestamos p ON l.id_libro = p.id_libro
    GROUP BY e.id_editorial, e.nombre_editorial
) AS ranked_editoriales
WHERE ranking = 1;
-- 7. Cantidad de libros por sección
SELECT s.nombre_seccion, COUNT(l.id_libro) AS cantidad_libros
FROM Secciones s
LEFT JOIN Libros l ON s.id_seccion = l.id_seccion
GROUP BY s.id_seccion
ORDER BY cantidad_libros DESC;
-- 8. Préstamo más largo
SELECT p.id_prestamo, u.nombre AS usuario, l.titulo AS libro, 
       DATEDIFF(p.fecha_devolucion, p.fecha_prestamo) AS dias_prestamo
FROM Prestamos p
JOIN Usuarios u ON p.id_usuario = u.id_usuario
JOIN Libros l ON p.id_libro = l.id_libro
ORDER BY dias_prestamo DESC
LIMIT 1;
-- 9. Usuarios con más de una reserva activa
SELECT u.id_usuario, u.nombre, u.casa, COUNT(r.id_reserva) AS reservas_pendientes
FROM Usuarios u
JOIN Reservas r ON u.id_usuario = r.id_usuario
WHERE r.estado = 'Pendiente'
GROUP BY u.id_usuario
HAVING COUNT(r.id_reserva) > 1
ORDER BY reservas_pendientes DESC;
-- 10. Editorial con más libros prestados
SELECT e.nombre_editorial, COUNT(p.id_prestamo) AS total_prestamos
FROM Editoriales e
JOIN Libros l ON e.id_editorial = l.id_editorial
JOIN Prestamos p ON l.id_libro = p.id_libro
GROUP BY e.id_editorial
ORDER BY total_prestamos DESC
LIMIT 1;
-- 11. Libros con más reservas que préstamos
SELECT l.id_libro, l.titulo, 
       COUNT(DISTINCT r.id_reserva) AS total_reservas,
       COUNT(DISTINCT p.id_prestamo) AS total_prestamos
FROM Libros l
LEFT JOIN Reservas r ON l.id_libro = r.id_libro
LEFT JOIN Prestamos p ON l.id_libro = p.id_libro
GROUP BY l.id_libro
HAVING total_reservas > total_prestamos
ORDER BY (total_reservas - total_prestamos) DESC;
-- 12. Usuarios con préstamos y reservas en el mismo día
SELECT DISTINCT u.id_usuario, u.nombre, u.casa, DATE(p.fecha_prestamo) AS fecha
FROM Usuarios u
JOIN Prestamos p ON u.id_usuario = p.id_usuario
JOIN Reservas r ON u.id_usuario = r.id_usuario AND DATE(p.fecha_prestamo) = DATE(r.fecha_reserva)
ORDER BY fecha;
-- 16. Libro con mayor diferencia entre reservas y préstamos
SELECT l.id_libro, l.titulo, 
       (SELECT COUNT(*) FROM Reservas r WHERE r.id_libro = l.id_libro) AS total_reservas,
       (SELECT COUNT(*) FROM Prestamos p WHERE p.id_libro = l.id_libro) AS total_prestamos,
       (SELECT COUNT(*) FROM Reservas r WHERE r.id_libro = l.id_libro) - 
       (SELECT COUNT(*) FROM Prestamos p WHERE p.id_libro = l.id_libro) AS diferencia
FROM Libros l
ORDER BY diferencia DESC
LIMIT 1;
-- 17. Usuarios con préstamos superiores al promedio
SELECT u.id_usuario, u.nombre, COUNT(p.id_prestamo) AS total_prestamos
FROM Usuarios u
JOIN Prestamos p ON u.id_usuario = p.id_usuario
GROUP BY u.id_usuario
HAVING COUNT(p.id_prestamo) > (
    SELECT AVG(prestamos_count)
    FROM (
        SELECT COUNT(id_prestamo) AS prestamos_count
        FROM Prestamos
        GROUP BY id_usuario
    ) AS subquery
)
ORDER BY total_prestamos DESC;
-- 18. Editorial con más libros en stock
SELECT e.id_editorial, e.nombre_editorial, SUM(l.stock) AS total_stock
FROM Editoriales e
JOIN Libros l ON e.id_editorial = l.id_editorial
GROUP BY e.id_editorial
ORDER BY total_stock DESC
LIMIT 1;
-- 19. Usuario con más reservas canceladas
SELECT u.id_usuario, u.nombre, COUNT(r.id_reserva) AS reservas_canceladas
FROM Usuarios u
JOIN Reservas r ON u.id_usuario = r.id_usuario
WHERE r.estado = 'Cancelada'
GROUP BY u.id_usuario
ORDER BY reservas_canceladas DESC
LIMIT 1;
-- 20. Fecha con más actividad (préstamos + reservas)
SELECT fecha, SUM(total) AS actividad_total
FROM (
    SELECT DATE(fecha_prestamo) AS fecha, COUNT(*) AS total
    FROM Prestamos
    GROUP BY DATE(fecha_prestamo)
    UNION ALL
    SELECT DATE(fecha_reserva) AS fecha, COUNT(*) AS total
    FROM Reservas
    GROUP BY DATE(fecha_reserva)
) AS actividad
GROUP BY fecha
ORDER BY actividad_total DESC
LIMIT 1;