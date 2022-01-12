/* insert into cfb_curso.tipo_cliente ( `desc` ) values ( 'Arrombado' ); */
/*delete from cfb_curso.tipo_cliente where id = 6;*/

/*
insert into cfb_curso.cliente ( `name`, `id_tipo_cliente` ) values ( 'Guilherme', 1 );

insert into cfb_curso.cliente ( `name`, `id_tipo_cliente` ) values ( 'Neymar', 2 );

insert into cfb_curso.cliente ( `name`, `id_tipo_cliente` ) values ( 'Thais', 3 );


insert into cfb_curso.cliente ( `name`, `id_tipo_cliente` ) values ( 'Rodrigo', 3 );

insert into cfb_curso.cliente ( `name`, `id_tipo_cliente` ) values ( 'Mario', 3 );

insert into cfb_curso.cliente ( `name`, `id_tipo_cliente` ) values ( 'Neusa', 2 );

insert into cfb_curso.cliente ( `name`, `id_tipo_cliente` ) values ( 'Joca', 3 ); */


select * from cfb_curso.cliente;
select * from cfb_curso.tipo_cliente;

update cfb_curso.cliente set name = 'Agostinho' where id = 1;

delete from cfb_curso.cliente where id = 6;