select * from ALUMNO;
select * from CURSO;
select * from ASIGNACION_CURSO;

INSERT INTO CURSO VALUES(3490, 'Electronica');

SELECT AC.CODIGO_CURSO, C.NOMBRE
FROM ASIGNACION_CURSO ac
JOIN CURSO c ON ac.codigo_curso = c.codigo
WHERE ac.carne = '31902011016';

SELECT a.nombre, ac.codigo_curso
FROM ALUMNO a
LEFT JOIN ASIGNACION_CURSO ac ON a.CARNE = ac.CARNE
WHERE ac.CARNE IS NULL;

SELECT c.codigo, c.nombre
FROM CURSO c
LEFT JOIN ASIGNACION_CURSO ac ON c.codigo = ac.codigo_curso
WHERE ac.codigo_curso IS NULL;


SELECT a.CARNE, a.Nombre, a.Apellido, c.CODIGO, c.Nombre
FROM alumno a
LEFT JOIN ASIGNACION_CURSO ac ON a.CARNE = ac.CARNE
LEFT JOIN CURSO c ON ac.codigo_curso = c.CODIGO

UNION

SELECT a.CARNE, a.Nombre, a.Apellido, c.CODIGO, c.Nombre
FROM alumno a
RIGHT JOIN ASIGNACION_CURSO ac ON a.CARNE = ac.CARNE
RIGHT JOIN CURSO c ON ac.codigo_curso = c.CODIGO
