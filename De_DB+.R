# Instalando e carregando o pacote basededados para consulta dos dados e o pacote
# Tidyverse para visualição grafica.

install.packages("basedosdados")
install.packages("tidyverse")
library("basedosdados")
library(tidyverse)

###############################################

# Configurando ID do projeto

basedosdados::set_billing_id("")

###############################################

# Conectando nas bases (TSE e INPC) e filtrando os resultados

elei_presi <- bdplyr("br_tse_eleicoes.resultados_candidato") %>%
  dplyr::filter(cargo == "presidente" , resultado == "eleito" , ano < 2015)  %>%
    dplyr::select(ano, sigla_partido) %>% arrange(ano)
      

infla_redemo <- bdplyr("br_ibge_inpc.mes_brasil")  %>%
  dplyr::filter(between(ano,1994,2014) , mes == 12) %>%
    dplyr::select(ano, variacao_anual)


jun_tab <- dplyr::left_join(elei_presi, infla_redemo, by = "ano") %>% arrange(ano)

###############################################

# Visualisão dos Dados


# Definição de cores
cores <- c("PT" = "red",
           "PSDB" = "blue")

# Montagem do grafico 

  ggplot(jun_tab, aes(y = variacao_anual, x = ano, color = sigla_partido)) + 
  geom_point(na.rm = TRUE) +  
  scale_x_continuous(name = "Ano", breaks = seq(1994,2014, by = 4)) +
  scale_y_continuous(name="Variação da Inflação", breaks = seq(0,1000, by = 100)) +
  scale_color_manual("Legendas", values = cores) +
  ggtitle("Variação da inflação pós redemocratização") +
  theme_gray()

  
  ###############################################
