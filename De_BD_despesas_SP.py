# Instalando e carregando as biblioteca basededados para executar a query
# na tabela de dados e a bibliteca plotly para a criação do grafico.
###############################################

!pip install basedosdados
!pip install plotly
import basedosdados as bd
import plotly.express as px

###############################################

# Consulta sql que retorna ano, sigla UF e o valor total das despesas orçamentarias
# do estado de São Paulo em 20 anos de plano Real.

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

# Criando uma variavel para consulta SQL na base br_me_siconfi.municipio_despesas_orcamentarias 
# e configuração do ID do projeto.

conv_gra = bd.read_sql(consu_siconfi, billing_project_id='seu_id')

###############################################

# Criando o grafico para a visualização 

datavi = px.bar(conv_gra , x="ano", y="valor_despesa", title = "Despesas Orçamentarias do Estado de São Paulo em 20 anos do plano Real")
datavi.update_xaxes(title_text="Ano")
datavi.update_yaxes(title_text="Despesas Orçamentarias")  
datavi.show()

###############################################
