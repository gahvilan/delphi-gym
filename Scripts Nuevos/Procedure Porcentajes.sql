SET TERM !!;

CREATE PROCEDURE GET_PORCENTAJES (
    MES INTEGER,
    ANIO INTEGER)
RETURNS (
    NOMBRE VARCHAR (101) CHARACTER SET NONE,
    PORCENTAJE DECIMAL (8, 3))
AS
  declare variable PROFE INTEGER;
BEGIN
  FOR SELECT DISTINCT(ID_PROFESOR) FROM CAJA WHERE FECHA LIKE '%'||CAST(:MES AS VARCHAR(2))||'/'||CAST(:ANIO AS VARCHAR(4))
      INTO :PROFE
  DO
    BEGIN
         SELECT NOMBRE||' '||APELLIDO, SUELDO FROM PERSONAL WHERE ID_PERSONAL=:PROFE
         INTO :NOMBRE,:PORCENTAJE;
         SUSPEND;
    END
END !!

SET TERM ;!!

