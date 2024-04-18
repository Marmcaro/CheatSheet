# Cargar la librería necesaria
library(lubridate)

# Generar secuencia de tiempo
tiempo <- seq(from = as.POSIXct("2024-01-01 00:00:00", tz = "UTC"),
              by = "58 sec", length.out = 40000)

# Generar valores de consumo
set.seed(123)  # Establecer semilla para reproducibilidad
consumo <- sort(runif(40000, min = 24, max = 624))

# Crear el data frame
df <- data.frame(Tiempo = tiempo, Consumo = consumo)

# Mostrar las primeras filas del data frame
head(df)

plot(df$Tiempo, df$Consumo)

#################FUNCIÓN
# Usando as.Date()
# Convertir la columna Tiempo a clase Date para detectar cambios de día
df$Fecha <- as.Date(df$Tiempo)

# Bucle para recorrer las filas del dataframe
for (i in 1:nrow(df)) {
  # Comprobar si hay cambio de día
  if (i == 1 || df$Fecha[i] != df$Fecha[i - 1]) {
    # Restar el valor de Consumo de la primera fila del día al consumo de todas las filas del día
    df$Consumo[df$Fecha == df$Fecha[i]] <- df$Consumo[df$Fecha == df$Fecha[i]] - df$Consumo[i]
  }
}

plot(df$Tiempo, df$Consumo)


##############################
# Sin usar as.Date (teniendo en cuenta solo fecha)
# Bucle para recorrer las filas del dataframe
for (i in 1:nrow(df)) {
  # Comprobar si hay cambio de día
  if (i == 1 || format(df$Tiempo[i], "%Y-%m-%d") != format(df$Tiempo[i - 1], "%Y-%m-%d")) {
    # Restar el valor de Consumo de la primera fila del día al consumo de todas las filas del día
    df$Consumo[format(df$Tiempo, "%Y-%m-%d") == format(df$Tiempo[i], "%Y-%m-%d")] <- df$Consumo[format(df$Tiempo, "%Y-%m-%d") == format(df$Tiempo[i], "%Y-%m-%d")] - df$Consumo[i]
  }
}

plot(df$Tiempo, df$Consumo)
