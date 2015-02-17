create table tipo_salida(
       id_tipo integer not null,
       descripcion varchar(50)
);

alter table tipo_salida add constraint pk_tipo_salida primary key(id_tipo);
