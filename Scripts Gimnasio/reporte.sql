SET TERM !!;

ALTER PROCEDURE ARMAR_REPORTE (
    FECHA VARCHAR (10) CHARACTER SET NONE,
    TIPO INTEGER)
RETURNS (
    INGRESO VARCHAR (101) CHARACTER SET NONE,
    DISIPLINA VARCHAR (50) CHARACTER SET NONE,
    SALDO DECIMAL (8, 3))
AS
  declare variable DIS INTEGER;
  declare variable CLI INTEGER;
  declare variable CANT INTEGER;
  declare variable PRECIO FLOAT;
  declare variable NOM_DIS VARCHAR(50);
BEGIN
  /* BUSCAR TODAS LAS DISIPLINAS AEROBICAS POR CANTIDAD */
  FOR select COUNT(NUMERO) as CANTIDAD, DISIPLINA
      From Numeros N where fecha=:fecha and pago='S' GROUP BY DISIPLINA, PAGO
      INTO :CANT, :DIS
  DO
    BEGIN
         SELECT NOMBRE FROM DISIPLINAS WHERE (ID_DISIPLINA=:DIS) INTO :DISIPLINA;
         SELECT PRECIO_CLASE FROM DISIPLINAS WHERE (ID_DISIPLINA=:DIS) INTO :PRECIO;
         SALDO = PRECIO*CANT;
         INGRESO = 'Cantidad de Clases '||CAST(CANT AS VARCHAR(10));
         SUSPEND;
    END
  /*BUSCAR TODOS LOS INGRESOS DE LA PARTE DE APARATOS*/
  FOR SELECT CLIENTE, DISIPLINA from Aparatos where fecha_ingreso=:fecha and paga='S'
      INTO :CLI, :DIS
  DO
  BEGIN
       SELECT NOMBRE||' '||APELLIDO FROM CLIENTES WHERE (ID_CLIENTE=:CLI) INTO :INGRESO;
       SELECT NOMBRE, PRECIO_CLASE FROM DISIPLINAS WHERE (ID_DISIPLINA=:DIS)
       INTO :DISIPLINA, :SALDO;
       SUSPEND;
  END
  /*BUSCAR TODOS LOS INGRESOS DE ARTICULOS*/
  FOR select CANTIDAD, ID_ARTICULO FROM STOCK WHERE (FECHA=:FECHA)
      INTO :CANT, :DIS
  DO
  BEGIN
       INGRESO = 'Cant. Articulos: '||CAST(CANT AS VARCHAR(10));
       SELECT NOMBRE, PRECIO FROM ARTICULOS WHERE (ID_ARTICULO=:DIS) INTO :DISIPLINA, :PRECIO;
       SALDO = PRECIO*CANT;
       SUSPEND;
  END
  /*BUSCAR TODOS LOS INGRESOS DE TROQUELADOS*/
  FOR SELECT COUNT(ID_DISIPLINA), ID_DISIPLINA, PRECIO FROM TROQUELADOS WHERE FECHA=:FECHA
      GROUP BY ID_DISIPLINA, PRECIO INTO :CANT, :DIS, :SALDO
  DO
  BEGIN
       INGRESO = 'Cant. Troquelados: '||CAST (CANT AS VARCHAR(10));
       SELECT NOMBRE FROM DISIPLINAS WHERE (ID_DISIPLINA=:DIS) INTO :DISIPLINA;
       SUSPEND;
  END
  /*BUSCAR ENTRADAS POR RESERVAS*/
  FOR SELECT COUNT(CLIENTE), CLIENTE, DISIPLINA FROM RESERVAS WHERE (FECHA_RESERVACION=:FECHA)
      GROUP BY CLIENTE,DISIPLINA
      INTO :CANT, :CLI, :DIS
  DO
  BEGIN
       IF (NOT EXISTS(SELECT P.ID_DISIPLINA FROM PRACTICA P, DISIPLINAS D WHERE (P.ID_CLIENTE=:CLI AND
          P.ID_DISIPLINA=D.ID_DISIPLINA AND D.NOMBRE = 'Pase libre'))) THEN
       BEGIN
            SELECT NOMBRE||' '||APELLIDO FROM CLIENTES WHERE (ID_CLIENTE=:CLI) INTO :INGRESO;
            SELECT NOMBRE, PRECIO_CLASE FROM DISIPLINAS WHERE (ID_DISIPLINA=:DIS) INTO :NOM_DIS, :PRECIO;
            DISIPLINA = 'Cant.: '||CAST (CANT AS VARCHAR(5))||' En '||NOM_DIS;
            SALDO = PRECIO*CANT;
            SUSPEND;
       END
  END
  /*BUSCAR LAS ENTRADAS DE CAJA VARIAS*/
  FOR SELECT CAST('Entradas Varias' as varchar(50)), DESCRIPCION, PRECIO FROM ENTRADAS
      WHERE (FECHA=:FECHA) INTO :INGRESO, :DISIPLINA, :SALDO
  DO
  BEGIN
       SUSPEND;
  END
  /*BUSCAR LAS SALIDAS DE CAJA SOLO DESDE EL FORMULARIO NO DEL PREVIEW*/
  IF (TIPO = 1) THEN
  BEGIN
       FOR SELECT DESCRIPCION, CAST('Salida' AS VARCHAR(50)), CANTIDAD FROM SALIDAS
           WHERE (FECHA=:FECHA) INTO :INGRESO, :DISIPLINA, :SALDO
       DO
       BEGIN
            SUSPEND;
       END
  END
END  !!


SET TERM ;!!

