CREATE TABLE DISIPLINAS(
       ID_DISIPLINA INTEGER NOT NULL,
       NOMBRE VARCHAR(50),
       PRECIO_CLASE DECIMAL(8, 3),
       ESTABLECIMIENTO INTEGER
);

ALTER TABLE DISIPLINAS ADD CONSTRAINT PK_DISIPLINA PRIMARY KEY (ID_DISIPLINA);
ALTER TABLE DISIPLINAS ADD CONSTRAINT FK_DISIPLINA_ESTABLECIMIENTO FOREIGN KEY (ESTABLECIMIENTO) REFERENCES ESTABLECIMIENTO (ID_ESTABLECIMIENTO);
