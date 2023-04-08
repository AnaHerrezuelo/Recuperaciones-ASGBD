SELECT * FROM USER_TABLES;
SELECT * FROM EQUIPOS;

/* EJERCICIO 1*/
CREATE TABLE partidos_empatados (
                                    id_equipo_casa NUMBER(38),
                                    id_equipo_fuera VARCHAR2(50),
                                    fecha TIMESTAMP,
                                    constraint empatadospk primary key (id_equipo_casa, id_equipo_fuera)
);

SELECT * from partidos_empatados;
DROP TABLE PARTIDOS_EMPATADOS cascade constraints;



/* EJERCICIO 2*/

SELECT * from PARTIDOS;

select GOLES_CASA, GOLES_FUERA
from PARTIDOS;

INSERT INTO PARTIDOS_EMPATADOS VALUES (1,1,'1/1/2003');
DELETE PARTIDOS_EMPATADOS WHERE ID_EQUIPO_CASA=1 AND ID_EQUIPO_FUERA=1;

SELECT * FROM PARTIDOS_EMPATADOS;


declare
cursor c_empatados is
select ID_EQUIPO_CASA, ID_EQUIPO_FUERA, GOLES_CASA, GOLES_FUERA, FECHA
from PARTIDOS
where GOLES_FUERA=GOLES_CASA;
begin
for r_empatados in c_empatados loop
        --DBMS_OUTPUT.PUT_LINE('equipo casa:' ||  r_empatados.ID_EQUIPO_CASA ||' - ' ||
          --                   'equipo fuera: ' || r_empatados.ID_EQUIPO_FUERA ||' - ' ||
            --                 'goles casa:' || r_empatados.GOLES_CASA ||' - ' ||
              --               'goles fuera: ' || r_empatados.GOLES_FUERA);
        INSERT INTO PARTIDOS_EMPATADOS VALUES (r_empatados.ID_EQUIPO_CASA, r_empatados.ID_EQUIPO_FUERA, r_empatados.FECHA);
end loop;
end;


/* EJERCICIO 3*/

SELECT * FROM USER_TABLES;


Declare
cursor c_usuarios is
SELECT * FROM USER_TABLES;
begin
FOR r_usuarios in c_usuarios loop
        DBMS_OUTPUT.PUT_LINE(r_usuarios.TABLE_NAME);
        --EXECUTE IMMEDIATE 'DROP TABLE EQUIPOS CASCADE CONSTRAINTS ';
        --DROP TABLE r_usuarios.TABLE_NAME CASCADE CONSTRAINS;
end loop;
end;


/**/