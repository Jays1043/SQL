--Josue Alejandro Yaquian Sarceño  3190-22-7332

declare
    lc_id constant employees.employee_id%type := 116;
    lrt_empleado employees%rowtype;
    lt_puesto jobs.job_title%type;
begin
    select *
    into lrt_empleado
    from employees
    where employee_id = lc_id;

    select j.job_title
    into lt_puesto
    from jobs j
    where j.job_id = lrt_empleado.job_id;
    
    dbms_output.put_line('Nombre: ' || lrt_empleado.first_name || ' ' || lrt_empleado.last_name);
    dbms_output.put_line('Salario: ' || lrt_empleado.salary);
    dbms_output.put_line('Puesto: ' || lt_puesto);
end;
