CREATE TABLE PARTICIPA(
       ID_CLIENTE INTEGER NOT NULL,
       ID_DISIPLINA INTEGER NOT NULL,
       IMPORTE FLOAT,
       PAGO VARCHAR(1)
);

ALTER TABLE PARTICIPA ADD CONSTRAINT PK_PARTICIPA PRIMARY KEY(ID_CLIENTE,ID_DISIPLINA);
ALTER TABLE PARTICIPA ADD CONSTRAINT FK_PARTICIPA_CLIENTE FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTES(ID_CLIENTE);
ALTER TABLE PARTICIPA ADD CONSTRAINT FK_PARTICIPA_DISIPLINA FOREIGN KEY(ID_DISIPLINA) REFERENCES DISIPLINAS(ID_DISIPLINA);