CREATE TABLE Alumno(
    carne NUMBER(15) PRIMARY KEY,
    nombre VARCHAR2(50),
    apellido VARCHAR2(50)
);

CREATE TABLE Curso (
    codigo NUMBER(15) PRIMARY KEY,
    nombre VARCHAR2(20)
);

CREATE TABLE Asignacion_curso (
    id NUMBER(10) PRIMARY KEY,
    carne NUMBER(15),
    codigo_curso NUMBER(15),
    nota NUMBER(10),
    semestre NUMBER(5),
    anio NUMBER(10),
    FOREIGN KEY (carne) REFERENCES Alumno(carne),
    FOREIGN KEY (codigo_curso) REFERENCES Curso(codigo)
);

INSERT INTO Alumno (carne, nombre, apellido) VALUES (1001, 'Juan', 'P�rez');
INSERT INTO Alumno (carne, nombre, apellido) VALUES (1002, 'Ana', 'Gonz�lez');
INSERT INTO Alumno (carne, nombre, apellido) VALUES (1003, 'Luis', 'Mart�nez');
INSERT INTO Alumno (carne, nombre, apellido) VALUES (1004, 'Marta', 'Rodr�guez');
INSERT INTO Alumno (carne, nombre, apellido) VALUES (1005, 'Carlos', 'L�pez');

INSERT INTO Curso (codigo, nombre) VALUES (2001, 'Matem�ticas');
INSERT INTO Curso (codigo, nombre) VALUES (2002, 'Historia');
INSERT INTO Curso (codigo, nombre) VALUES (2003, 'Qu�mica');
INSERT INTO Curso (codigo, nombre) VALUES (2004, 'F�sica');
INSERT INTO Curso (codigo, nombre) VALUES (2005, 'Literatura');

INSERT INTO Asignacion_curso (id, carne, codigo_curso, nota, semestre, anio) VALUES (1, 1001, 2001, 85, 1, 2023);
INSERT INTO Asignacion_curso (id, carne, codigo_curso, nota, semestre, anio) VALUES (2, 1002, 2002, 90, 1, 2023);
INSERT INTO Asignacion_curso (id, carne, codigo_curso, nota, semestre, anio) VALUES (3, 1003, 2003, 78, 2, 2023);
INSERT INTO Asignacion_curso (id, carne, codigo_curso, nota, semestre, anio) VALUES (4, 1004, 2004, 88, 2, 2023);
INSERT INTO Asignacion_curso (id, carne, codigo_curso, nota, semestre, anio) VALUES (5, 1005, 2005, 92, 1, 2023);

SELECT*FROM Alumno;
SELECT*FROM Curso;
SELECT*FROM Asignacion_curso;