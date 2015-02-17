CREATE TABLE ACARGO(
       ID_PERSONAL INTEGER NOT NULL,
       ID_DISIPLINA INTEGER NOT NULL,
       FECHA DATE,
       HORA TIME
);

ALTER TABLE ACARGO ADD CONSTRAINT PK_ACARGO PRIMARY KEY(ID_PERSONAL,ID_DISIPLINA);
ALTER TABLE ACARGO ADD CONSTRAINT FK_ACARGO_PERSONAL FOREIGN KEY(ID_PERSONAL) REFERENCES PERSONAL(ID_PERSONAL);
ALTER TABLE ACARGO ADD CONSTRAINT FK_ACARGO_DISIPLINA FOREIGN KEY(ID_DISIPLINA) REFERENCES DISIPLINAS(ID_DISIPLINA);