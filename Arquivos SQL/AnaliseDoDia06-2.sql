#1) retornar os produtos da Classificação 003 e que a unidade de medida não
#seja 'UN'
select * from produto p
where p.codigo_classificacao = '003' and p.unidade != 'UN';

#2) Retornar os produtos da Classificação 003, com a unidade de medida 'UN'
#em que a quantidade seja entre 5 e 7 com o valor menor que 10;
select * from produto p
where p.codigo_classificacao = '003' and 
p.unidade = 'UN' and  
p.quantidade between  5 and 7 and 
p.valor < 10;


#3) Valor total dos 'biscoito' da base de dados;
select sum(p.quantidade*p.valor) as valor_total from produto p
where p.descricao  like "%biscoito%";

#4) Validar se existe algum 'martelo' que não pertença a classificação material de Construção;
select * from produto p
where p.descricao like "%martelo%" and p.codigo_classificacao != '001';

#5) Retornar os produtos da classificação EPI que estejam em menos
#de 5 caixas;
select * from produto p
where p.codigo_classificacao = '002' and p.unidade = 'cx' and p.quantidade < 5;

#6) Retornar os produtos da Classificação EPI que NÃO ESTEJA em
#caixas e sua quantidade esteja em 10 e 50;
select * from  produto p
where p.codigo_classificacao = '002' and p.unidade != 'cx' and p.quantidade between 10 and 50;



#7) Retornar todos registros da classificação UNIFORMES com o nome
# camiseta e todos os produtos da classificação MATERIAL ESPORTIVO
#e com nome 'bola'

select * from produto p
where (p.codigo_classificacao = '021' and 
p.descricao like "%camiseta%") or
(p.descricao like "%bola%" and p.CODIGO_CLASSIFICACAO = '008')

#8) Retornar a média do valor dos produtos que a quantidade esteja entre
#2 e 4, com valor inferior a 50, que não seja material de construção e que
#não seja um 'copo';
select avg(p.valor) as "media_dos_valores" from produto p
where p.quantidade between 2 and 4 and
p.VALOR  < 50 and 
p.TIPO  = 'p' and
p.CODIGO_CLASSIFICACAO != '001' and
p.DESCRICAO  not like "%copo%";

#9) Retornar o quantidade total de pacotes ( PCT) dos produtos
#alimenticios
select sum(p.quantidade) from produto p
where p.unidade = 'PCT' and 
p.CODIGO_CLASSIFICACAO = '003';


#10) Retornar apenas o numero total de produtos cadastrados com
#unidade pacote e que seja da classificação de alimentos
select count(*) as "Quantidade de Produtos" from produto p
where p.UNIDADE = 'PCT' and p.CODIGO_CLASSIFICACAO  = '003';


#11) Retornar qual é o maior valor de um produto do estoque, este deve
#ser o produto que sua quantidade * valor seja o maior
select p.quantidade*p.valor as "total"
from produto p
where P.TIPO = 'p'
order by 1 desc limit 1; 


#12) Retornar o menor valor de um produto que a quantidade seja maior
#que 0 e que a unidade seja ‘UN’ e classificação alimentos
select p.valor
from produto p
where p.quantidade > 0 and 
p.UNIDADE = 'UN' and p.CODIGO_CLASSIFICACAO = '003'
and p.valor = (select p.valor from produto p
			   where p.quantidade > 0 and 
			   p.UNIDADE = 'UN' and p.CODIGO_CLASSIFICACAO = '003'
			   order by p.valor limit 1);
	

#13) Retornar é o valor total dos produtos da categoria ‘Material
#Hospitalares’
select sum(p.quantidade * p.valor) from produto p
where p.CODIGO_CLASSIFICACAO = '017';

#14) Retornar TODOS os valores totais por categoria e ordenar por
#categoria
select c.descricao,sum(p.quantidade*p.valor) as "Valor total de Produtos" from produto p
inner join classificacao c on p.CODIGO_CLASSIFICACAO = c.CODIGO
group by p.CODIGO_CLASSIFICACAO 
order by c.DESCRICAO;

#15) Retornar todos os tipos de ‘UNIDADE’ da classificação Veterinária
select DISTINCT p.unidade from produto p 
where p.CODIGO_CLASSIFICACAO = '006';


#16) Contar Quantos produtos são da categoria de Aviamentos por
#unidade. EX: (20 produtos - UN; 2 PRODUTOS - PCT) 
select p.unidade,count(*) as "Quantidade de Produtos" from produto p
where p.CODIGO_CLASSIFICACAO = '005' and
p.TIPO = 'p'
group by p.UNIDADE ;
