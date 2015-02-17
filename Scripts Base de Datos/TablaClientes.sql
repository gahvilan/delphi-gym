CREATE TABLE CLIENTES(
       ID_CLIENTE INTEGER NOT NULL,
       NOMBRE VARCHAR(50),
       APELLIDO VARCHAR(50),
       DIRECCION VARCHAR(100),
       TELEFONO INTEGER,
       EDAD INTEGER,
       FECHA_NACIMIENTO DATE,
       NOMYAP_FAMILIAR VARCHAR(100),
       RELACION_FAMILIAR VARCHAR(100),
       TELEFONO_FAMILIAR INTEGER,
       ID_ENFERMEDADES INTEGER,
       REGIMEN_ACTIVIDADES VARCHAR(250),
       ID_DISIPLINA INTEGER,
       ESTABLECIMIENTO INTEGER
);

ALTER TABLE CLIENTES ADD CONSTRAINT PK_CLIENTES PRIMARY KEY(ID_CLIENTE);
ALTER TABLE CLIENTES ADD CONSTRAINT FK_ENFERMEDADES_CLIENTES FOREIGN KEY (ID_ENFERMEDADES) REFERENCES ENFERMEDADES(ID_ENFERMEDAD);
ALTER TABLE CLIENTES ADD CONSTRAINT FK_DISIPLINAS_CLIENTES FOREIGN KEY (ID_DISIPLINA) REFERENCES DISIPLINAS(ID_DISIPLINA);
ALTER TABLE CLIENTES ADD CONSTRAINT FK_ESTABLECIMIENTO_CLIENTES FOREIGN KEY (ESTABLECIMIENTO) REFERENCES ESTABLECIMIENTO(ID_ESTABLECIMIENTO);