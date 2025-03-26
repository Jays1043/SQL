set serveroutput on;

declare
    ls$codigo_empleado integer := &codigo_empleado;
    ls$total_ventas integer := &total_ventas;
    bono_ventas integer := 0;
    total_bono integer := 0;
    lt$empleado hr.employees%rowtype;

begin
    dbms_output.put_line('id del empleado ingresado: ' || ls$codigo_empleado);
    dbms_output.put_line('total de ventas ingresado: ' || ls$total_ventas);
    
    if ls$total_ventas <= 10000 then
        bono_ventas := 1000;
    elsif ls$total_ventas <= 35000 then
        bono_ventas := 2000;
    elsif ls$total_ventas <= 50000 then
        bono_ventas := 3000;
    else
        bono_ventas := 5000;
    end if;
    
    select employee_id, first_name, last_name, salary 
    into lt$empleado.employee_id, lt$empleado.first_name, lt$empleado.last_name, lt$empleado.salary
    from hr.employees 
    where employee_id = ls$codigo_empleado;
    
    total_bono := lt$empleado.salary + bono_ventas;

    dbms_output.put_line(lt$empleado.employee_id || ' el empleado: ' || lt$empleado.first_name || ' ' || lt$empleado.last_name || 
                         ' tuvo ventas de ' || ls$total_ventas || ' con lo cual obtuvo un bono de ' || bono_ventas || 
                         ', su salario es de ' || lt$empleado.salary || ' y en total a recibir es de ' || total_bono);
end;
/
