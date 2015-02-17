alter table salidas add tipo integer;
alter table salidas add constraint fk_tipo_salida foreign key(tipo) references tipo_salida(id_tipo);
update salidas set tipo=1;
