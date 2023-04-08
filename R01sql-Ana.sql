<<<<<<< HEAD
/* EJERCICIO 1*/
/*
DECLARE
    d varchar2(50);
    a number;
    "b" varchar2(50);
BEGIN
    a := 1;
    "b" := '2';
    d := round(DBMS_RANDOM.VALUE(a,"b"));
    DBMS_OUTPUT.PUT_LINE(to_char(d));
end;
*/

CREATE TABLE saludos (
                         id_saludo int,
                         saludo varchar2(50)
);

INSERT INTO saludos values (1,'hola');
INSERT INTO saludos values (2,'¿Cómo estás');
INSERT INTO saludos values (3,'buenos días');

SELECT * from saludos;








/* EJERCICIO 2 */

DECLARE
"a" date;
    "b" date;
    c date;
Begin
    "a" := '01-01-2023';
    "b" := '31-12-2023';
    c := to_date(DBMS_RANDOM.VALUE("a","b"));
    DBMS_OUTPUT.PUT_LINE(c);
end;




DECLARE
a varchar2(50);

Begin
    a := to_char(sysdate,'fm dd-mm-yyyy');
    DBMS_OUTPUT.PUT_LINE(a);
end;






/* EJERCICIO 3*/

CREATE TABLE usuarios (
                          id_usuario CHAR(4) CONSTRAINT idusupk PRIMARY KEY,
                          nombre VARCHAR2(30) CONSTRAINT nombreuk UNIQUE,
                          email VARCHAR2(80) CONSTRAINT emailuk UNIQUE
);

SELECT * from  USUARIOS;




/* EJERCICIO 4 */

INSERT INTO usuarios VALUES ('int', 'usuarioprueba', 'emailprueba');

begin
INSERT INTO usuarios VALUES (1, 'usuarioprueba', 'emailprueba');
end;

SELECT * from  USUARIOS;

=======
/* EJERCICIO 1*/
/*
DECLARE
    d varchar2(50);
    a number;
    "b" varchar2(50);
BEGIN
    a := 1;
    "b" := '2';
    d := round(DBMS_RANDOM.VALUE(a,"b"));
    DBMS_OUTPUT.PUT_LINE(to_char(d));
end;
*/

CREATE TABLE saludos (
                         id_saludo int,
                         saludo varchar2(50)
);

INSERT INTO saludos values (1,'hola');
INSERT INTO saludos values (2,'¿Cómo estás');
INSERT INTO saludos values (3,'buenos días');

SELECT * from saludos;








/* EJERCICIO 2 */

DECLARE
"a" date;
    "b" date;
    c date;
Begin
    "a" := '01-01-2023';
    "b" := '31-12-2023';
    c := to_date(DBMS_RANDOM.VALUE("a","b"));
    DBMS_OUTPUT.PUT_LINE(c);
end;




DECLARE
a varchar2(50);

Begin
    a := to_char(sysdate,'fm dd-mm-yyyy');
    DBMS_OUTPUT.PUT_LINE(a);
end;






/* EJERCICIO 3*/

CREATE TABLE usuarios (
                          id_usuario CHAR(4) CONSTRAINT idusupk PRIMARY KEY,
                          nombre VARCHAR2(30) CONSTRAINT nombreuk UNIQUE,
                          email VARCHAR2(80) CONSTRAINT emailuk UNIQUE
);

SELECT * from  USUARIOS;




/* EJERCICIO 4 */

INSERT INTO usuarios VALUES ('int', 'usuarioprueba', 'emailprueba');

begin
INSERT INTO usuarios VALUES (1, 'usuarioprueba', 'emailprueba');
end;

SELECT * from  USUARIOS;

>>>>>>> dcda40bb5d2f5bb17fe08794fec70f0f7007d38b
DELETE USUARIOS WHERE id_usuario=1;