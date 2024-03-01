#1) Qual Cliente foi a venda ?
select c.nome,v.codvenda  from cliente c 
inner join vendas v on c.codcliente = v.codcliente;


#2) Qual Cidade é o cliente ?
select DISTINCT c.nome,c2.descricao  from cliente c 
left join vendas v on c.codcliente = v.codcliente
inner join cidades c2 on c.codcidade = c2.codcidade ;

#3) Quais produtos ele comprou ?
select c.nome,
v.codvenda,
p.descricao
from itens_venda iv 
inner join vendas v on iv.codvenda = v.codvenda
inner join cliente c on v.codcliente = c.codcliente
inner join produto p on iv.codproduto = p.codigo;


#4) Qual quantidade de cada produto ele comprou ?
select c.nome,
p.descricao,
p.quantidade
from itens_venda iv 
inner join vendas v on iv.codvenda = v.codvenda
inner join cliente c on v.codcliente = c.codcliente
inner join produto p on iv.codproduto = p.codigo;

#5) Qual é Classificação do produto ?
select c.nome,
p.descricao,
c2.descricao
from itens_venda iv 
inner join vendas v on iv.codvenda = v.codvenda
inner join cliente c on v.codcliente = c.codcliente
inner join produto p on iv.codproduto = p.codigo
inner join classificacao c2 on p.CODIGO_CLASSIFICACAO = c2.CODIGO ;

#6) Qual nome vendedor ?
select v.codvenda ,v2.nome  from vendas v 
inner join vendedores v2 on v.codvendedor = v2.codvendedor ;

#7) Qual valor total de cada produto ?
select p.descricao,p.quantidade*p.valor as "valor_total" from produto p;