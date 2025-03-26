--VISTA
CREATE OR REPLACE VIEW VW_EMPLEADO_MANAGER AS
SELECT e.first_name, e.last_name, e.salary,
    (SELECT m.first_name || ' ' || m.last_name
    FROM employees m
    WHERE m.employee_id = e.manager_id) AS manager_name
FROM employees e;


SELECT * FROM VW_EMPLEADO_MANAGER;

--PROCEDIMIENTO
CREATE OR REPLACE PROCEDURE PA_AUMENTAR_SALARIO_DEPARTAMENTO(
    p_department_id IN employees.department_id%TYPE,
    p_porcentaje IN NUMBER
) AS
BEGIN
    UPDATE employees_bk
    SET salary = salary + (salary * p_porcentaje / 100)
    WHERE department_id = p_department_id;

    COMMIT;
END PA_AUMENTAR_SALARIO_DEPARTAMENTO;

BEGIN
    PA_AUMENTAR_SALARIO_DEPARTAMENTO(10, 5);
END;

SELECT * FROM EMPLOYEES_BK;
