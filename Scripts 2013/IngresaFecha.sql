SET TERM !!;

CREATE PROCEDURE INGRESO_FECHA(
  FECHA VARCHAR(10) CHARACTER SET NONE,
  FECHA_D DATE)
RETURNS(
  NOMBRE VARCHAR(100) CHARACTER SET NONE,
  FECHA_A VARCHAR(10) CHARACTER SET NONE,
  HORA VARCHAR(5) CHARACTER SET NONE,
  DISIPLINA VARCHAR(100) CHARACTER SET NONE,
  PAGO VARCHAR(1) CHARACTER SET NONE)
AS
DECLARE VARIABLE FECHA_D_R DATE;
DECLARE VARIABLE HORA_R TIME;
BEGIN
  --FECHA_D = CAST(FECHA AS DATE);
  FOR select (C.Nombre||' '||C.Apellido) as Nombre, A.fecha_ingreso as Fecha, A.hora_ingreso as Hora,
      (select nombre from disiplinas D where D.id_disiplina=A.disiplina) as Disiplina, A.Paga as Pago
      from Clientes C, Aparatos A where A.fecha_ingreso=:fecha and C.id_cliente=A.cliente
      INTO :NOMBRE, :FECHA_A, :HORA, :DISIPLINA, :PAGO
  DO
    SUSPEND;
  FOR select (cast (N.Numero as Varchar(50)))||' '||(cast (' ' as Varchar(50))) as Nombre,
      N.fecha as Fecha, N.Hora as Hora, (select nombre from disiplinas D
      where D.id_disiplina=N.disiplina) as Disiplina, N.Pago as Pago from Numeros N
      where N.fecha=:fecha INTO :NOMBRE, :FECHA_A, :HORA, :DISIPLINA, :PAGO
  DO
    SUSPEND;
  HORA = '';
  FOR select (C.Nombre||' '||C.Apellido) as Nombre, A.fecha as Fecha, A.hora as Hora,
      (select nombre from disiplinas D where D.id_disiplina=A.disCiplina) as Disiplina, A.Paga as Pago
      from Clientes C, CROSSFIT A where A.fecha=:fecha_D and C.id_cliente=A.ID_Cliente
      INTO :NOMBRE, :FECHA_D_R, :HORA_R, :DISIPLINA, :PAGO
  DO
  BEGIN
       FECHA_A = CAST(FECHA_D_R AS VARCHAR(10));--EXTRACT(YEAR FROM FECHA_D_R);
       --HORA = CAST(HORA_R AS VARCHAR(5));
       SUSPEND;
  END
END !!

SET TERM ;!!





