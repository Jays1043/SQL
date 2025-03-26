DECLARE
  v_numero NUMBER;
  v_salario NUMBER := 3000;
  v_nombre VARCHAR2(50) DEFAULT 'John';
  v_fecha DATE := SYSDATE;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nombre);
  DBMS_OUTPUT.PUT_LINE('Salario: ' || v_salario);
  DBMS_OUTPUT.PUT_LINE('Fecha: ' || v_fecha);
END;
/


DECLARE
  c_impuesto CONSTANT NUMBER := 0.16;
  c_saludo CONSTANT VARCHAR2(20) := 'Hola Mundo';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Impuesto: ' || c_impuesto);
  DBMS_OUTPUT.PUT_LINE(c_saludo);
END;
/


DECLARE
  v_salario hr.employees.salary%TYPE;
BEGIN
  SELECT salary INTO v_salario
  FROM hr.employees
  WHERE employee_id = 100;
  
  DBMS_OUTPUT.PUT_LINE('Salario: ' || v_salario);
END;
/


DECLARE
  v_empleado hr.employees%ROWTYPE;
BEGIN
  SELECT * INTO v_empleado
  FROM hr.employees
  WHERE employee_id = 101;
  
  DBMS_OUTPUT.PUT_LINE('Empleado: ' || v_empleado.first_name || ' ' || v_empleado.last_name);
  DBMS_OUTPUT.PUT_LINE('Salario: ' || v_empleado.salary);
END;
/


DECLARE
ld_fec_nac DATE;
ld_fec_pago DATE;
ld_hoy DATE;
BEGIN
-- Bloque de código
ld_fec_nac := TO_DATE('01/01/2005','DD/MM/YYYY');
ld_fec_pago:= TO_DATE('15/06/2020','DD/MM/YYYY');
ld_hoy := SYSDATE;
END;


CREATE OR REPLACE TRIGGER I_EMPLEADOS
AFTER INSERT ON HR.EMPLOYEES_COPY
FOR EACH ROW
BEGIN
    IF  :NEW.SALARY < 1000 THEN
        :NEW.SALARY := 1000;
    END IF;
END;

CREATE OR REPLACE TRIGGER DEL_EMPLEADOS
AFTER DELETE ON HR.EMPLOYEES_COPY
FOR EACH ROW
BEGIN
    IF :OLD.DEPARTMENT_ID = 10 THEN
    RAISE_APPLICATION_ERROR(-20001, 'No se puede eliminar empleados del departamento 10');
    END IF;
END;
