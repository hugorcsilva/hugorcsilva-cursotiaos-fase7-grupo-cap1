#!/usr/bin/env Rscript
# Estatísticas básicas sobre áreas

# Variavel com o caminho do arquivo
caminho_arquivo <- "data/dados_farmtech.csv"

#Verificar se o arquivo de dados existe
if (file.exists(caminho_arquivo)) {
    dados <- read.csv(caminho_arquivo)

    #Exibir os dados carregados
    print("---- Dados Carregados do CSV ----")
    print(dados)

    # Calcula e exibe a média da área
    media_area <- mean(dados$area_m2)
    print(paste("Média da área de plantio: ", round(media_area, 2), "m2"))

    # Calcula e exibe o desvio padrão da área
    desvio_padrao_area <- sd(dados$area_m2)
    print(paste("Desvio padrão da área de plantio: ", round(desvio_padrao_area, 2), "m2"))

} else {
    print("Arquivo 'dados_farmtech.csv' não encontrado. Por Favor, execute o script Python e salve os dados primeiro.")
}