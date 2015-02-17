SET TERM !!;

CREATE PROCEDURE CUMPLEANIOS (
    DIA INTEGER,
    MES INTEGER)
RETURNS (
    NOMBRE VARCHAR (50) CHARACTER SET NONE,
    APELLIDO VARCHAR (50) CHARACTER SET NONE,
    DIRECCION VARCHAR (100) CHARACTER SET NONE,
    TELEFONO INTEGER)
AS
declare variable diavar varchar(2);
declare variable mesvar varchar(2);
BEGIN
     if (dia<10) then
        diavar = '0'||cast(dia as varchar(1));
     else
         diavar = cast(dia as varchar(2));

     if (mes<10) then
        mesvar = '0'||cast(mes as varchar(1));
     else
         mesvar = cast(mes as varchar(2));

     for select nombre, apellido, direccion, telefono from clientes
         where (fecha_nacimiento LIKE :diavar||'/'||:mesvar||'/%')
         into :nombre,:apellido,:direccion,:telefono
     do
          suspend;
END!!

SET TERM ;!!

