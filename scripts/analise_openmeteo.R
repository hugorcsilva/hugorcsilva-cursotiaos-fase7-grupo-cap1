#!/usr/bin/env Rscript
# Coleta meteorológica via Open-Meteo (sem API key)
# Exemplo: Salvador/BA (-12.97, -38.50)

# 1. Definir a lista de pacotes que este script precisa para funcionar
# (Adicione ou remova pacotes conforme a necessidade do seu script específico)
pacotes_necessarios <- c("httr", "jsonlite") 

# 2. Verificar quais pacotes NÃO estão instalados
pacotes_em_falta <- pacotes_necessarios[!(pacotes_necessarios %in% installed.packages()[,"Package"])]

# 3. Se faltar algum pacote, instalar silenciosamente a partir do CRAN
if(length(pacotes_em_falta) > 0) {
    message("A instalar dependências do R em falta: ", paste(pacotes_em_falta, collapse = ", "))
    install.packages(pacotes_em_falta, repos = "http://cran.rstudio.com/", quiet = TRUE)
}

# 4. Carregar os pacotes
invisible(lapply(pacotes_necessarios, require, character.only = TRUE))

lat <- -12.97
lon <- -38.50

url <- sprintf("https://api.open-meteo.com/v1/forecast?latitude=%f&longitude=%f&current_weather=true&hourly=temperature_2m,precipitation&timezone=auto", lat, lon)
res <- httr::GET(url)
stop_for_status(res)
js <- fromJSON(content(res, as="text", encoding="UTF-8"))

cat("\n=== METEOROLOGIA (Open-Meteo) ===\n")
cat(sprintf("Local (lat,lon): %.2f, %.2f\n", lat, lon))

if (!is.null(js$current_weather)) {
cw <- js$current_weather
cat(sprintf("Agora: Temp %.1f°C | Vento %.1f km/h | Direção %d°\n", cw$temperature, cw$windspeed, cw$winddirection))
}

if (!is.null(js$hourly)) {
cat("\nPróximas horas (temperatura, precipitação):\n")
df <- data.frame(time = js$hourly$time,
temp = js$hourly$temperature_2m,
precip = js$hourly$precipitation)
head_n <- min(8, nrow(df))
print(head(df, head_n))
}