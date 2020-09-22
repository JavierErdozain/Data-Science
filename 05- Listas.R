## Ejercicio V Listas.
l1 = list(
          1:5,
          c("a","b"),
          c(T,F,F,T))
l1

class(l1)

names(l1) = c("numeros", "caracteres", "booleanos")
l1

l1$numeros

l1 <- unname(l1)
l1

v = unlist(l1)
v
