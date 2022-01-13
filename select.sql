/*
 
 select
 from
 where
 group by
 having
 order by 
  
 * */

select 
	id,
	lower(name),
	id_tipo_cliente
from 
	cfb_curso.cliente;

=============================

select 
	id,
	upper(name),
	id_tipo_cliente
from 
	cfb_curso.cliente;


============================


/* Query para saber quando todas as vendas pros clientes */

select 
	cliente.id as id,
	name,
	data_venda,
	valor_venda
from 
	cliente 
join  tipo_cliente on id_tipo_cliente = tipo_cliente.id
join venda on venda.id_cliente = cliente.id
order by valor_venda
;


/* Query para saber todas as vendas em um determinado periodo de tempo */

select 
	cliente.id as id,
	name,
	data_venda,
	valor_venda
from 
	cliente 
join venda on venda.id_cliente = cliente.id
where data_venda between '2020-11-01' and '2020-12-30'
order by valor_venda
;


/* Query para saber quantos produtos cada cliente comprou */

select 
	cliente.id,
	name,
	(
		select count(*) from venda where id_cliente = cliente.id
	) as qtde_de_compra
from 
	cliente
join venda on venda.id_cliente = cliente.id
group by cliente.name 
;


/* Query para saber quantos produtos cada cliente comprou e dando apelido */

select 
	cliente.id,
	name,
	(
		select count(*) from venda where id_cliente = cliente.id
	) as qtde_de_compra,
	case 
		when (select count(*) from venda where id_cliente = cliente.id) = 1 then 'Comprador Recente'
		else 'Comprador Antigo'
	end as tipo_comprador
from 
	cliente
join venda on venda.id_cliente = cliente.id
group by cliente.name 
;

-- Saber dados de uma venda atraves do id dela 

select 
	venda.id  as id_venda,
	name,
	valor_venda,
	data_venda
from 
	venda
join cliente on cliente.id = venda.id_cliente
where venda.id = 10



-- DEPOIS DA TABELA PRODUTO



-- Busca o cliente, o produto que o cliente comprou e o preço
select 
	cliente.id as id_cliente,
	name,
	data_venda,
	produto.nome as nome_produto,
	produto.preco as preco_produto
from 
	venda
join cliente on cliente.id = venda.id_cliente
join produto on produto.id = venda.id_produto
order by produto.preco desc
;


-- Buscando produtos e informando o "estoque" dele
select 
	*,
	case 
		when produto.quantidade <= 10 then 'Em falta'
		when produto.quantidade > 10 and produto.quantidade <= 50 then 'Alerta para comprar'
		else 'Em estoque'
	end as estoque
from 
	produto;


-- Busca o produto que foi vendido e informações da venda
select 
	v.id as id_venda,
	v.data_venda,
	p.nome as nome_produto,
	p.quantidade as quantidade,
	p.id as id_produto
from
	venda v
join produto p on p.id = v.id_produto;


-- atualiza quantidade de um produto depois da "compra"
update 
	produto 
set quantidade = produto.quantidade - 1, preco = preco * 0.8
where id = 1;