# Instalando e carregando o pacote basededados para consulta dos dados e o pacote
# Tidyverse para visualização grafica e finalmente o biblioteca patchwork.
# Para comparação dos graficos.

install.packages("basedosdados")
install.packages("tidyverse")
install.packages("patchwork")
library(patchwork)
library(basedosdados)
library(tidyverse)

###############################################

# Configurando ID do projeto.

basedosdados::set_billing_id("seu_id_do_projeto")

###############################################

# Conectando nas bases (TSE e INPC) e filtrando os resultados.

elei_presi <- bdplyr("br_tse_eleicoes.resultados_candidato") %>%
  dplyr::filter(cargo == "presidente" , resultado == "eleito")  %>%
    dplyr::select(ano, sigla_partido) %>% arrange(ano)
      

infla_redemo <- bdplyr("br_ibge_inpc.mes_brasil")  %>%
  dplyr::filter(between(ano,1994,2018) , mes == 12) %>%
    dplyr::select(ano, variacao_anual)


jun_tab <- dplyr::left_join(elei_presi, infla_redemo, by = "ano") %>% arrange(ano)


# Conectando na INPC (Analise anos militares e primeiro governo pós redemocratização).

infla_mili <- bdplyr("br_ibge_inpc.mes_brasil")  %>%
  dplyr::filter(between(ano,1980,1993) , mes == 12) %>%
    dplyr::select(ano, variacao_anual)


###############################################

# Visualição dos Dados.

# Gráfico análise anos militares.


graf_pe_mili <- ggplot(infla_mili, aes(y = variacao_anual, x = ano)) + 
  geom_line(na.rm = TRUE) +  
  scale_x_continuous(name = "Ano", breaks = seq(1980,1993)) +
  scale_y_continuous(name="Variação da Inflação", breaks = seq(1,6000, by = 200)) +
  ggtitle("Variação da inflação em anos militares e o primeiro governo 
  após a redemocratização (primeiro governo 1990-1993)") +
  theme(aspect.ratio = 1)


# Gráfico análise anos pós remocratização.

# Definição de cores
cores <- c("PT" = "red",
           "PSDB" = "blue")

graf_pe_rede <- ggplot(jun_tab, aes(y = variacao_anual, x = ano, color = sigla_partido)) + 
  geom_point(na.rm = TRUE) +  
  scale_x_continuous(name = "Ano", breaks = seq(1994,2018, by = 4)) +
  scale_y_continuous(name="Variação da Inflação", breaks = seq(1,1000, by = 50)) +
  scale_color_manual("Legendas", values = cores) +
  ggtitle("Variação da inflação pós redemocratização (Do segundo governo a 2018)") +
  theme_gray()

# Comparação entre os dois gráficos.

  graf_pe_mili + graf_pe_rede
  
###############################################
