create table NUMEROS(
    numero integer not null,
    disiplina integer not null,
    cliente integer,
    pago varchar(1)
);

alter table NUMEROS add constraint PK_NUMEROS primary key(numero,disiplina);
alter table NUMEROS add constraint FK_NUMEROS_DISIPLINA foreign key(disiplina) references DISIPLINAS(id_disiplina);
alter table NUMEROS add constraint FK_NUMEROS_CLIENTE foreign key(cliente) references CLIENTES(id_cliente);
