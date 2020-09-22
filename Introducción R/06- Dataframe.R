## Ejercicio VI Dataframe
Nombre = c("Lucia","Antonio","Juan","Maria","Pedro")
Edad = c(23,34,56,65,22)
Suscrito = c(T,F,F,T,F)

df = data.frame(Nombre,Edad,Suscrito)

df$id <- 1:5

df
df[df$Edad>25,]
df[df$Edad>25 & df$Suscrito,]

table(df)
df
