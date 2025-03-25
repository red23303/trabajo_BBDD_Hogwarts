-- Crear la base de datos
CREATE DATABASE BibliotecaHogwarts;
USE BibliotecaHogwarts;

-- 1. Tabla Usuarios (Estudiantes y Profesores de Hogwarts)
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    casa ENUM('Gryffindor', 'Hufflepuff', 'Ravenclaw', 'Slytherin', 'Profesor') NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    fecha_registro DATE NOT NULL
);

-- 2. Tabla Autores (Escritores de libros mágicos)
CREATE TABLE Autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_autor VARCHAR(100) NOT NULL,
    sangre_pura BOOLEAN,
    nacionalidad VARCHAR(50) NOT NULL
);

-- 3. Tabla Editoriales (Editoriales del mundo mágico)
CREATE TABLE Editoriales (
    id_editorial INT AUTO_INCREMENT PRIMARY KEY,
    nombre_editorial VARCHAR(100) NOT NULL,
    pais_origen VARCHAR(50) NOT NULL
);

-- 4. Tabla Secciones (Zonas de la Biblioteca)
CREATE TABLE Secciones (
    id_seccion INT AUTO_INCREMENT PRIMARY KEY,
    nombre_seccion VARCHAR(100) NOT NULL
);

-- 5. Tabla Libros (Los tomos disponibles en la biblioteca)
CREATE TABLE Libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    id_autor INT,
    id_editorial INT,
    id_seccion INT,
    año_publicacion INT NOT NULL,
    stock INT NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES Autores(id_autor),
    FOREIGN KEY (id_editorial) REFERENCES Editoriales(id_editorial),
    FOREIGN KEY (id_seccion) REFERENCES Secciones(id_seccion)
);

-- 6. Tabla Préstamos (Registro de libros tomados en préstamo)
CREATE TABLE Prestamos (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_libro INT,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro)
);

-- 7. Tabla Reservas (Libros apartados para su consulta)
CREATE TABLE Reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_libro INT,
    fecha_reserva DATE NOT NULL,
    estado ENUM('Pendiente', 'Cancelada', 'Completada') NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro)
);
