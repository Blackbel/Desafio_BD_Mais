# Instalando e carregando as biblioteca basededados para executar a query
# na tabela de dados e a bibliteca plotly para a criação do graficao
###############################################

!pip install basedosdados
!pip install plotly
import basedosdados as bd
import plotly.express as px

###############################################

# Consulta sql que retorna ano, sigla UF e o valor total das despesas orçamentarias
# do estado de São Paulo em 15 anos de plano real

###############################################

consu_siconfi = """
SELECT sigla_uf, ano, sum(valor) as valor_despesa 
FROM `basedosdados.br_me_siconfi.municipio_despesas_orcamentarias`  
WHERE sigla_uf = "SP" 
AND ano BETWEEN 1995 
AND 2015 GROUP BY sigla_uf,ano
ORDER BY ano
"""
###############################################

# Criando uma variavel para consulta sql acima

###############################################

conv_gra = bd.read_sql(consu_siconfi, billing_project_id='seu-id')

# Criando o grafico para a visualização 

datavi = px.bar(conv_gra , x="ano", y="valor_despesa", title = "Despesas Orçamentarias do Estado de São Paulo
em 20 anos do plano Real")
datavi.show()
             
###############################################             
             
