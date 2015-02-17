create table salidas(
       id_salida integer not null,
       cantidad float,
       descripcion varchar(100),
	 fecha varchar(10)
);

CREATE GENERATOR "GEN_ID_SALIDA";
SET GENERATOR "GEN_ID_SALIDA" TO 1;

set term !!;

CREATE TRIGGER INSERT_SALIDA FOR SALIDAS ACTIVE
BEFORE INSERT POSITION 0
AS BEGIN
	NEW.ID_SALIDA = GEN_ID (GEN_ID_SALIDA, 1);
END!!

set term ;!!


