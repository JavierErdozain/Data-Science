## Ejercicio IV Matrices

v1 = 1:5
v2 = rep(1,5)
v3 = c(11,12,13,14,15)

m = rbind(v1,v2,v3)
m

class(m)
dim(m)

m = m+1
m


m[1,2]

# Fuera de ejercico. Hablado en clase.
# Si cambio el tipo de uno de los elementos a texto, R me cambia el tipo a todos
# los elementos de la matriz.
m[1,2] = "pepe"
m

# Por curiosidad, en la documentacón habla de la función transpuesta.
t(m)


