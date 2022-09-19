declare
 cursor cur_empdept is
        select last_name,salary,department_name
        from   employees e join departments d
        on     (d.department_id = e.department_id)
        where  d.department_id = 90
        order by 2 desc;
 
  reg_empdept cur_empdept%rowtype;
begin
   open cur_empdept;
   fetch cur_empdept into reg_empdept;
   WHILE cur_empdept%FOUND LOOP
       dbms_output.put_line (reg_empdept.last_name
                    || ' ' || reg_empdept.salary
                    || ' ' || reg_empdept.department_name);
        fetch cur_empdept into reg_empdept;
   END LOOP;
   close cur_empdept;
end;
/

declare
 cursor cur_empdept is
        select last_name,salary,department_name
        from   employees e join departments d
        on     (d.department_id = e.department_id)
        where  d.department_id = 90
        order by 2 desc;
 
  reg_empdept cur_empdept%rowtype;
begin
   open cur_empdept;
   LOOP
      fetch cur_empdept into reg_empdept;
      EXIT WHEN CUR_EMPDEPT%NOTFOUND;
       dbms_output.put_line (reg_empdept.last_name
                    || ' ' || reg_empdept.salary
                    || ' ' || reg_empdept.department_name);
        
        
   END LOOP;
   close cur_empdept;
end;
/

begin
   FOR reg_empdept IN (select last_name,salary,department_name
                        from   employees e join departments d
                        on     (d.department_id = e.department_id)
                        where  d.department_id = 90
                        order by 2 desc) LOOP
       dbms_output.put_line (reg_empdept.last_name
                    || ' ' || reg_empdept.salary
                    || ' ' || reg_empdept.department_name);
   END LOOP;
end;
/