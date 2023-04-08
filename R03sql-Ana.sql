SELECT * FROM USER_TABLES;

SELECT * FROM EMPLEADOS;

/* EJERCICIO 1*/

select COD_EMP, NOMBRE, COD_JEFE
from EMPLEADOS;

CREATE OR REPLACE FUNCTION es_jefe(
    v_codemp number
) RETURN NUMBER
IS
    CURSOR c_empleados IS
        select  COD_EMP, NOMBRE, COD_JEFE
        from EMPLEADOS
        WHERE COD_JEFE = v_codemp;

    v_solucion number;
BEGIN
    FOR r_empleados IN c_empleados LOOP
            v_solucion :=r_empleados.COD_JEFE;
    end loop;
    return v_solucion;

end;

    select es_jefe(24) from dual;


drop function es_jefe;





/* EJERCICIO 2 */

SELECT NOMBRE, APELLIDO1, APELLIDO2, COD_JEFE
FROM EMPLEADOS;





/* EJERCICIO 3*/

SELECT * FROM CONTRATOS;

SELECT NOMBRE, APELLIDO1, APELLIDO2, FECHA_INICIO, NOMBRE_DEP, SALARIO, TITULO_PUESTO
FROM EMPLEADOS
JOIN CONTRATOS USING (COD_EMP)
JOIN PUESTOS USING (COD_PUESTO)
JOIN DEPARTAMENTOS USING (COD_DEP);



/*CREATE OR REPLACE PROCEDURE informe_empleados
IS

DECLARE
CURSOR c_info IS
    SELECT NOMBRE, APELLIDO1, APELLIDO2, FECHA_INICIO, NOMBRE_DEP, SALARIO, TITULO_PUESTO
    FROM EMPLEADOS
    JOIN CONTRATOS USING (COD_EMP)
    JOIN PUESTOS USING (COD_PUESTO)
    JOIN DEPARTAMENTOS USING (COD_DEP);
BEGIN
    FOR r_info IN c_info LOOP
        DBMS_OUTPUT.PUT_LINE('Empleado: '||r_info.NOMBRE ||' '|| r_info.APELLIDO1 || ' '|| r_info.APELLIDO2|| '. '|| 'Contratos: ');
        DBMS_OUTPUT.PUT_LINE('   ' || r_info.FECHA_INICIO || ' '|| r_info.NOMBRE_DEP ||' '|| r_info.SALARIO || ' '|| r_info.TITULO_PUESTO );
        DBMS_OUTPUT.PUT_LINE(' ');
    end loop;
end;
*/



SELECT NOMBRE, APELLIDO1, APELLIDO2
FROM EMPLEADOS;

SELECT FECHA_INICIO, NOMBRE_DEP, SALARIO, TITULO_PUESTO
FROM CONTRATOS c
JOIN PUESTOS USING (COD_PUESTO)
JOIN DEPARTAMENTOS USING (COD_DEP)
JOIN EMPLEADOS USING (cod_emp);

CREATE OR REPLACE PROCEDURE informe_empleados IS
    CURSOR c_empleado IS
    SELECT NOMBRE, APELLIDO1, APELLIDO2
    FROM EMPLEADOS;

    CURSOR c_contratos (v_nombre EMPLEADOS.nombre%type) IS
    SELECT FECHA_INICIO, NOMBRE_DEP, SALARIO, TITULO_PUESTO
    FROM CONTRATOS c
    JOIN PUESTOS p USING (COD_PUESTO)
    JOIN DEPARTAMENTOS d USING (COD_DEP)
    JOIN EMPLEADOS USING (cod_emp)
    WHERE NOMBRE=v_nombre;

BEGIN
    FOR r_empleado IN c_empleado LOOP
        DBMS_OUTPUT.PUT_LINE('Empleado:' || r_empleado.NOMBRE ||' '|| r_empleado.APELLIDO1 || ' ' || r_empleado.APELLIDO2|| '. Contratos:');
        FOR r_contratos IN c_contratos (r_empleado.NOMBRE) LOOP
            DBMS_OUTPUT.PUT_LINE('   ' || r_contratos.FECHA_INICIO || ' '|| r_contratos.NOMBRE_DEP ||' '|| r_contratos.SALARIO || ' '|| r_contratos.TITULO_PUESTO );
        end loop;
        DBMS_OUTPUT.PUT_LINE(' ');
    end loop;
end;

    BEGIN
        informe_empleados();
    end;



/* EJERCICIO 4 */

SELECT NOMBRE, APELLIDO1, APELLIDO2
FROM EMPLEADOS;

CREATE OR REPLACE FUNCTION informe_empleados2 (
    v_texto varchar2
)
RETURN VARCHAR2
IS
    CURSOR c_empleado IS
    SELECT NOMBRE, APELLIDO1, APELLIDO2
    FROM EMPLEADOS
    WHERE upper(NOMBRE)=upper(v_texto) OR upper(APELLIDO1)=upper(v_texto) OR upper(APELLIDO2)=upper(v_texto);


    CURSOR c_contratos (v_nombre EMPLEADOS.nombre%type) IS
    SELECT FECHA_INICIO, NOMBRE_DEP, SALARIO, TITULO_PUESTO
    FROM CONTRATOS c
    JOIN PUESTOS p USING (COD_PUESTO)
    JOIN DEPARTAMENTOS d USING (COD_DEP)
    JOIN EMPLEADOS USING (cod_emp)
    WHERE NOMBRE=v_nombre;

BEGIN
    FOR r_empleado IN c_empleado LOOP
        DBMS_OUTPUT.PUT_LINE('Empleado:' || r_empleado.NOMBRE ||' '|| r_empleado.APELLIDO1 || ' ' || r_empleado.APELLIDO2|| '. Contratos:');
        FOR r_contratos IN c_contratos (r_empleado.NOMBRE) LOOP
            DBMS_OUTPUT.PUT_LINE('   ' || r_contratos.FECHA_INICIO || ' '|| r_contratos.NOMBRE_DEP ||' '|| r_contratos.SALARIO || ' '|| r_contratos.TITULO_PUESTO );
        end loop;
        DBMS_OUTPUT.PUT_LINE(' ');
    end loop;
end;

select INFORME_EMPLEADOS2('sotorriba') from DUAL;

drop function informe_empleados2;




/* EJERCICIO 5 */

/*
CREATE OR REPLACE PROCEDURE trabajadores_a_cargo IS
 */
/*
SELECT NOMBRE, APELLIDO1, APELLIDO2 FROM EMPLEADOS WHERE COD_JEFE=3;

DECLARE
    CURSOR c_empleador IS
        SELECT COD_EMP FROM EMPLEADOS;

    CURSOR c_empleados (v_jefe EMPLEADOS.cod_jefe%type) IS
        SELECT NOMBRE, APELLIDO1, APELLIDO2
        FROM EMPLEADOS
        ;

BEGIN
    FOR r_empleados IN c_empleados LOOP
        DBMS_OUTPUT.PUT_LINE(r_empleados.NOMBRE);
    end loop;

end;

 */






/* EJERCICIO 6 */


select * FROM EMPLEADOS;

select COD_JEFE,count(*) cantidad
from EMPLEADOS
group by COD_JEFE;






CREATE OR REPLACE FUNCTION n_trabajadores_a_cargo(
    v_codemp number
)
RETURN NUMBER
    IS
    CURSOR c_jefe IS
        select  COD_JEFE,COUNT(*) cantidad
        from EMPLEADOS
        where COD_JEFE=v_codemp
        GROUP BY COD_JEFE
        order by COD_JEFE;
    v_cant number;
BEGIN
    FOR r_jefe IN c_jefe LOOP
        v_cant := r_jefe.cantidad;
    end loop;
    return v_cant;
end;



select n_trabajadores_a_cargo(5) from DUAL;





DROP function n_trabajadores_a_cargo;










/* EJERCICIO 7 */

SELECT NOMBRE_DEP, DIRECCION, LOCALIDAD, PROVINCIA
FROM DEPARTAMENTOS d
JOIN LOCALIZACIONES l on d.COD_LOC = l.COD_LOC;

SELECT NOMBRE, APELLIDO1, APELLIDO2, COD_JEFE
from EMPLEADOS;

select COD_JEFE, count(*) cantidad
from EMPLEADOS
group by COD_JEFE;





DECLARE
    CURSOR c_departamentos IS
        SELECT NOMBRE_DEP, DIRECCION, LOCALIDAD, PROVINCIA
        FROM DEPARTAMENTOS d
        JOIN LOCALIZACIONES l on d.COD_LOC = l.COD_LOC;

    CURSOR c_empleados (v_nombredep DEPARTAMENTOS.nombre_dep%type) IS
        SELECT NOMBRE, APELLIDO1, APELLIDO2, COD_JEFE
        from EMPLEADOS e
        join DEPARTAMENTOS d on e.COD_EMP = d.COD_RESP
        WHERE NOMBRE_DEP=v_nombredep;

    CURSOR c_empleados_cantidad (v_nombre EMPLEADOS.nombre%type) IS
        SELECT COD_JEFE, count(COD_JEFE) cantidad
        from EMPLEADOS e
        JOIN DEPARTAMENTOS d on e.COD_EMP = d.COD_RESP
        WHERE NOMBRE=v_nombre
        group by COD_JEFE;


BEGIN
    FOR r_departamentos IN c_departamentos LOOP
        DBMS_OUTPUT.PUT_LINE('Departamento: '|| r_departamentos.NOMBRE_DEP ||'  '|| r_departamentos.DIRECCION || ' '|| r_departamentos.LOCALIDAD ||' ('||r_departamentos.PROVINCIA||'). Empleados: ' );

        FOR r_empleados IN c_empleados (r_departamentos.NOMBRE_DEP) LOOP
            FOR r_empleados_cantidad IN c_empleados_cantidad (r_empleados.NOMBRE) LOOP
                DBMS_OUTPUT.PUT_LINE('         '||r_empleados.nombre ||' '|| r_empleados.APELLIDO1 ||' '|| r_empleados.APELLIDO2||'  '|| r_empleados_cantidad.cantidad);

            end loop;


        end loop;
    end loop;
end;

