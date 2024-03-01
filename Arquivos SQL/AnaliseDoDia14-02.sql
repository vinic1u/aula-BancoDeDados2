# 1) Quantidade de produtos vendidos ?


# 2) Quantidade de vendas por vendedor ?
select v.nome ,count(v2.codvenda) from vendedores v 
left join vendas v2 on v.codvendedor = v2.codvendedor
group by v.codvendedor ;

# 3) Melhor vendedor nos 3 primeiros meses do ano ?
select v.nome ,count(v2.codvenda) from vendedores v 
left join vendas v2 on v.codvendedor = v2.codvendedor
where month(v2.datavenda) <= 3
group by v.codvendedor
having count(v2.codvenda) = (
				select count(v2.codvenda) from vendedores v 
				left join vendas v2 on v.codvendedor = v2.codvendedor
				where month(v2.datavenda) <= 3
				group by v2.codvendedor
				order by 1 desc limit 1);
			
			
# 4) A melhor venda ( valor mais alto) ? 
select iv.codvenda,p.valor*p.quantidade  as "Valor Total da Venda"
from itens_venda iv 
inner join produto p ON iv.codproduto = p.CODIGO 
group by iv.codvenda 
order by 2 desc limit 1;

# 5) Qual é o valor da Média de vendas por mês ? 
select month(v.datavenda) as "mes da venda",
avg(p.QUANTIDADE*p.valor) as "media de Total de venda" 
from itens_venda iv 
inner join vendas v on iv.codvenda = v.codvenda 
inner join produto p on iv.codproduto = p.CODIGO
group by month(v.datavenda);

# 6) Qual cidade compra mais ?
select c2.descricao ,count(*) from itens_venda iv 
inner join vendas v on iv.codvenda = v.codvenda 
inner join produto p on iv.codproduto = p.CODIGO 
inner join cliente c on v.codcliente  = c.codcliente 
inner join cidades c2 on c.codcidade = c2.codcidade
group by c2.codcidade
order by 2 desc limit 1;

# 7) Qual é o melhor cliente ?
select c.nome 
,sum(p.quantidade*p.valor)  as "Valor total Comprado"
from itens_venda iv 
inner join vendas v on iv.codvenda = v.codvenda 
inner join produto p on iv.codproduto = p.CODIGO 
inner join cliente c on v.codcliente  = c.codcliente 
group by v.codcliente
order by 2 desc limit 1;


# 8) O pior vendedor ?
select v.nome ,count(v2.codvenda) from vendedores v 
left join vendas v2 on v.codvendedor = v2.codvendedor
group by v.codvendedor
having count(v2.codvenda) = (
				select count(v2.codvenda) from vendedores v 
				left join vendas v2 on v.codvendedor = v2.codvendedor
				group by v2.codvendedor
				order by 1 asc limit 1);
			

# 9) Comissão de 10% para o vendedor que seu total 
# de vendas que for acima da média do mês de 
# todos vendedores ?