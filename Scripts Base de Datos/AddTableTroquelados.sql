create table troquelados(
    id_disiplina integer,
    fecha varchar(10),
    cantidad integer
);

alter table troquelados add constraint fk_troquelados_disiplina foreign key(id_disiplina) references disiplinas(id_disiplina);
