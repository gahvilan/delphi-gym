SET TERM !!;

ALTER PROCEDURE GET_APARATOS (
    MES INTEGER,
    ANIO INTEGER)
RETURNS (
    NOMBRE VARCHAR (101) CHARACTER SET NONE,
    DISIPLINA VARCHAR (50) CHARACTER SET NONE,
    TOTAL DECIMAL (8, 3))
AS
declare variable DIS INTEGER;
declare variable CLI INTEGER;
declare variable CLASE DECIMAL(8,3);
declare variable TOTAL_AUX DECIMAL(8,3);
declare variable DESCUENTO INTEGER;
declare variable PORCENTAJE INTEGER;
declare variable POR_DEC FLOAT;
BEGIN
  TOTAL = 0;
  SELECT VALOR FROM PARAMETROS WHERE (ID_PARAMETRO=1) INTO :DESCUENTO;
  SELECT VALOR FROM PARAMETROS WHERE (ID_PARAMETRO=2) INTO :PORCENTAJE;
  POR_DEC = cast(PORCENTAJE as float)/ 100 ;

/*  FOR SELECT DISIPLINA, CLIENTE FROM APARATOS WHERE PAGA='S' AND FECHA_INGRESO LIKE '%'||(CAST(:MES AS VARCHAR(2)))||'/'||(CAST (:ANIO AS VARCHAR(4)))
      INTO :DIS, :CLI
  DO*/
  FOR SELECT DISIPLINA, CLIENTE FROM PAGO_APARATOS WHERE (EXTRACT(MONTH FROM FECHA_EFECTIVO)=:MES AND EXTRACT(YEAR FROM FECHA_EFECTIVO)=:ANIO)
      INTO :DIS, :CLI
  DO
  BEGIN
       IF (NOT EXISTS(SELECT P.ID_DISIPLINA FROM PRACTICA P, DISIPLINAS D WHERE (P.ID_CLIENTE=:CLI AND
           P.ID_DISIPLINA=D.ID_DISIPLINA AND D.NOMBRE = 'Pase libre'))) THEN
       BEGIN
            SELECT APELLIDO||' '||NOMBRE FROM CLIENTES WHERE (ID_CLIENTE=:CLI) INTO :NOMBRE;
            SELECT NOMBRE, PRECIO_CLASE FROM DISIPLINAS WHERE ID_DISIPLINA=:DIS INTO :DISIPLINA,:CLASE;
            TOTAL = (CLASE-DESCUENTO);
            SUSPEND;
       END
       ELSE
       BEGIN
            SELECT APELLIDO||' '||NOMBRE FROM CLIENTES WHERE (ID_CLIENTE=:CLI) INTO :NOMBRE;
            SELECT NOMBRE, PRECIO_CLASE FROM DISIPLINAS WHERE ID_DISIPLINA=:DIS AND NOMBRE = 'Pase libre' INTO :DISIPLINA,:CLASE;
            TOTAL = (CLASE*POR_DEC);
            SUSPEND;
       END
  END
END !!

SET TERM ;!!


