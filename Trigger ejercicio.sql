--Josue Alejandro Yaquian Sarceño   3190-22-7332

CREATE OR REPLACE TRIGGER trigger_employees_copy
AFTER INSERT OR UPDATE OR DELETE ON employees_copy
FOR EACH ROW
BEGIN

    DBMS_OUTPUT.PUT_LINE('Usuario que realizo el empleado: ' || USER);
    DBMS_OUTPUT.PUT_LINE('Fecha y hora del evento: ' || TO_CHAR(SYSDATE, 'DD-MM-YYYY HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE('ID del empleado afectado: ' || 
        CASE 
            WHEN INSERTING THEN :NEW.employee_id
            WHEN UPDATING THEN :NEW.employee_id
            WHEN DELETING THEN :OLD.employee_id
        END);
    DBMS_OUTPUT.PUT_LINE('Accion realizada: ' || 
        CASE 
            WHEN INSERTING THEN 'INSERT'
            WHEN UPDATING THEN 'UPDATE'
            WHEN DELETING THEN 'DELETE'
        END);
END;
/

INSERT INTO employees_copy (employee_id, first_name, last_name, salary)
VALUES (1002, 'Luis', 'Martinez', 4800);

UPDATE employees_copy
SET salary = 5500
WHERE employee_id = 1002;

DELETE FROM employees_copy
WHERE employee_id = 1002;



