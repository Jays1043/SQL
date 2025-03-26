--- CREAR TABLA
CREATE TABLE PROFESOR
(CODIGO NUMBER(15,0),
NOMBRE VARCHAR2(50),
APELLIDO VARCHAR2(50),
CONSTRAINT PK_ALUMNO_CODIGO PRIMARY KEY (CODIGO))
--- dar permiso para ejecutar secuencias
GRANT CREATE sequence TO UNIVERSIDAD;
create sequence sec_codigo_profesor
maxvalue 100
increment by 1
nocycle;
INSERT INTO PROFESOR
VALUES (sec_codigo_profesor.nextval, 'JUAN','HERNANDEZ')
SELECT * FROM PROFESOR
DELETE PROFESOR
--- valor actual: currval
--- valor siguiente: nextval
SELECT sec_codigo_profesor.currval
FROM DUAL;
SELECT sec_codigo_profesor.nextval
FROM DUAL;
select *from all_sequences;
drop sequence sec_codigo_profesor;
