--Josue Alejandro Yaquian Sarceño   3190-22-7332
--Primera parte
DECLARE
    v_employee_id    hr.employees.employee_id%type := &employee_id;
    v_first_name     hr.employees.first_name%type;
    v_last_name      hr.employees.last_name%type;
    v_salary         hr.employees.salary%type;
    v_bonus          number := 0;
    v_total_salary   number;

BEGIN
    select first_name, last_name, salary
    into v_first_name, v_last_name, v_salary
    from hr.employees
    where employee_id = v_employee_id;
    
    if v_salary between 0 and 2500 then
    v_bonus := 1800;
    elsif v_salary between 2501 and 5000 then
    v_bonus := 3300;
    elsif v_salary between 5001 and 7000 then
    v_bonus := 4800;
    else
    v_bonus := 5300;
    end if;
    
    v_total_salary := v_salary + v_bonus;
    
    dbms_output.put_line(v_employee_id || ' el empleado ' || v_first_name || ' ' || v_last_name || 
                           ' tiene un salario de ' || v_salary || 
                           ' y un bono de ' || v_bonus || 
                           ' para tener un salario final de ' || v_total_salary);
END;

--Segunda parte
DECLARE
    v_employee_id    hr.employees.employee_id%type := &employee_id;
    v_first_name     hr.employees.first_name%type;
    v_last_name      hr.employees.last_name%type;
    v_salary         hr.employees.salary%type;
    v_bonus          number := 0;
    v_total_salary   number;

BEGIN
    select first_name, last_name, salary
    into v_first_name, v_last_name, v_salary
    from hr.employees
    where employee_id = v_employee_id;
    
    CASE 
        WHEN v_salary BETWEEN 0 AND 2500 THEN
            v_bonus := 1800;
        WHEN v_salary BETWEEN 2501 AND 5000 THEN
            v_bonus := 3300;
        WHEN v_salary BETWEEN 5001 AND 7000 THEN
            v_bonus := 4800;
        ELSE 
            v_bonus := 5300;
    END CASE;

    v_total_salary := v_salary + v_bonus;
    
    dbms_output.put_line(v_employee_id || ' el empleado ' || v_first_name || ' ' || v_last_name || 
                           ' tiene un salario de ' || v_salary || 
                           ' y un bono de ' || v_bonus || 
                           ' para tener un salario final de ' || v_total_salary);
END;



