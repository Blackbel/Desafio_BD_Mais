# Desafio_BD+

## Comparação da taxa de infalção entre os períodos de 1980-2018.
 
 Script em R que compara a inflação nos periodos antes e depois da redemocratização.
 Esse script  mostra o quão alta era taxa de inflação nos governos militares. A grave questão econômica da alta inflação
 seria sanada apenas em 1995, seis anos após redemocratização e um ano após o desenvolvimento do novo plano Real.
 
 Para o projeto foram usados os pacotes:
 - [basedosdados](https://cran.r-project.org/web/packages/basedosdados/index.html) para fazer as consultas nas bases do [TSE](https://basedosdados.org/dataset/br-tse-eleicoes) e do [INPC](https://basedosdados.org/dataset/br-ibge-inpc) para fazer a correlação entre redemocratização e a taxa de inflação. As bases foram foram tratadas pelo projeto.
 - [tidyverse](https://cran.r-project.org/web/packages/tidyverse/index.html) dentro do pacotes usamos as ferramentas [dplyr](https://cran.r-project.org/web/packages/dplyr/index.html) para executar as consultas e o [ggplot](https://cran.r-project.org/web/packages/ggplot2/index.html) para construção dos gráficos.
 - [patchwork](https://cran.r-project.org/web/packages/patchwork/index.html) para fazer a comparação grafica.
 
 
 ## Levantamento das despesas orçamentarias frente ao plano Real.
 
 Sript em Python que faz o levantamento de 20 anos (1995-2015) das despesas orçamentarias do estado de São Paulo.
 Nessa análize podemos verificar que as contas orçamentária subirão de Bilhões para Trilhões de Reais após 2012.
 
 Para o projeto foram usados os pacotes:
 - [basedosdados](https://pypi.org/project/basedosdados/) para fazer as consultas na base do [Siconfi](https://basedosdados.org/dataset/br-me-siconfi) 
 - [plotly](https://pypi.org/project/plotly/) para construção gráfica.
