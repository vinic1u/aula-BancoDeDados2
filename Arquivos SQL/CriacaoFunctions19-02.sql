#1) Criar uma Função que receba o ID da venda e retorne o nome do vendedor ; 
DELIMITER $$
create or replace 
function getVendedorNome(idVenda int)
returns varchar(60)
begin 
	
	declare nomeVendedor varchar(60);

	select v2.nome into nomeVendedor
	from vendas v 
	inner join vendedores v2 on v.codvendedor = v2.codvendedor
	where v.codvenda = idVenda;

	return nomeVendedor;
end $$
DELIMITER ;

select getVendedorNome(30);

#2) Criar uma Função que receba o ID da venda e retorne o nome do cliente;
DELIMITER $$
create or replace 
function  getClienteNome(idVenda int)
returns varchar(60)
begin 
	
	declare nomeCliente varchar(60);
	
	select c.nome into nomeCliente
	from vendas v 
	inner join cliente c on v.codcliente = c.codcliente 
	where v.codvenda = idVenda;
	
	return nomeCliente;	
end $$
DELIMITER ;

select getClienteNome(20);

#3) Criar uma Função que receba o ID da venda e retorne a Quantidade de produtos vendidos;
DELIMITER $$
create or replace 
function getQuantidadeProdutoVendido(idVenda int)
returns int
begin 
	
	declare quantidadeProdutoVendido int;
	
	select sum(p.quantidade) into quantidadeProdutoVendido
	from itens_venda iv 
	inner join produto p on iv.codproduto = p.codigo
	where iv.codvenda = idVenda
	group by iv.codvenda;
	
	return quantidadeProdutoVendido;
end $$
delimiter ;

select getQuantidadeProdutoVendido(2);


#4) Criar uma Função que receba o ID da venda e retorne o Total da venda;

#3) Criar uma Função que receba o ID da venda e retorne a Quantidade de produtos vendidos;
DELIMITER $$
create or replace 
function getTotalVenda(idVenda int)
returns int
begin 
	
	declare totalVenda int;
	
	select sum(p.quantidade * p.valor) into totalVenda
	from itens_venda iv 
	inner join produto p on iv.codproduto = p.codigo
	where iv.codvenda = idVenda
	group by iv.codvenda;
	
	return totalVenda;
end $$
delimiter ;

select getTotalVenda(1);