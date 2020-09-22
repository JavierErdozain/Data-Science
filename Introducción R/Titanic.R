#install.packages("titanic")

test = titanic::titanic_test
train = titanic::titanic_train

# La bateria de datos de entrenamiento vienen con una columna de la
# clasificacion de los datos. Las dimensiones de los dataset son distintos.
dim(test)
dim(train)

# AÃ±adimos el campo clasificaciÃ³n del dataset de tet.
test$Survived = NA
dim(test)
dim(train)

# 2. Unir los dos datasets.
titaniccompleto = rbind(test, train)
dim(titaniccompleto)
head(titaniccompleto)

# 3. Campo Survived informado
Survived_informado = titaniccompleto[!is.na(titaniccompleto$Survived), ]
Survived_noinformado = titaniccompleto[is.na(titaniccompleto$Survived), ]
dim(Survived_informado)
dim(Survived_noinformado)

#4. Crea un dataframe con las columnas nombre y edad de los pasajeros.
df_nombre_edad = titaniccompleto[, c("Name","Age")]
head(df_nombre_edad)

#5. Filtra el dataframe de nombres para obtener todos los pasajeros que su
#   apellido comience por la letra G.
df_nombre_edad[substring(df_nombre_edad$Name,1,1)=="G",]

#6. Distribución por sexo.
nrow(titaniccompleto[titaniccompleto$Sex=="male",])
nrow(titaniccompleto[titaniccompleto$Sex=="female",])

#7. La edad con mayor frecuencia.
# ¡¡ Revisar !!
sort(table(titaniccompleto[,"Age"]),decreasing =T)[1]
  # de 24 años había 47 pasajeros.

#8. ¿Eran más joven los supervivientes o los fallecidos?
edad_sobrevivientes = sort(table(titaniccompleto[!is.na(titaniccompleto$Survived) & titaniccompleto$Survived ==T,"Age"]),decreasing =T)[1]
edad_sobrevivientes
edad_fallecidos = sort(table(titaniccompleto[!is.na(titaniccompleto$Survived) & titaniccompleto$Survived ==F,"Age"]),decreasing =T)[1]
edad_fallecidos

#9. Crea una nueva columna que nos diga si el pasajero era mayor o menor de edad.
titaniccompleto$mayor_edad <- !is.na(titaniccompleto$Age) & titaniccompleto$Age > 18

#10. ¿Quiénes fueron los 10 pasajeros que más pagaron por el billete?
head(titaniccompleto[order(titaniccompleto$Fare, decreasing = T),],10)

#11. Haz un gráfico para representar sexo y clase
# https://statisticsglobe.com/barplot-in-r#sixth
titaniccompleto$SexPlot= ifelse(titaniccompleto$Sex == "male", 1, 2)
plot_sexo_clase=titaniccompleto[,c("SexPlot","Pclass")]
barplot(table(plot_sexo_clase),col = c("#1b98e0", "#353436"), beside = T)
legend("top",
       legend = c("Fallecidos", "Supervivientes"),
       fill = c("#1b98e0", "#353436"))


#12. Haz un gráfico para representar supervivientes por clase
plot_supervivientes_clase=titaniccompleto[!is.na(titaniccompleto$Survived), c("Survived", "Pclass")]
barplot(table(plot_supervivientes_clase), col = c("#1b98e0", "#353436"), beside = T)
legend("top",
       legend = c("Fallecidos", "Supervivientes"),
       fill = c("#1b98e0", "#353436"))


#13. Haz un gráfico para representar supervivencia por precio del billete
#    https://www.datasciencemadesimple.com/groupby-mean-in-r-2/
plot_supervivientes_precio=titaniccompleto[!is.na(titaniccompleto$Survived), c("Survived","Fare")]
plot_supervivientes_precio_group=aggregate(plot_supervivientes_precio$Fare, by=list(plot_supervivientes_precio$Survived), FUN=mean)
barplot(table(plot_supervivientes_precio_group), col = c("#1b98e0", "#353436"), horiz = TRUE, )
?barplot

head(titaniccompleto)
