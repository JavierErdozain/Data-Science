# Ejercicio de la documentación: Vectores
v<-c(1:10)
v

v<-v+2
v

vpar = c(seq(from=2, to=30, by=2))
vpar
length(vpar)

vpar[c(1,length(vpar))]

vpar[1]<-99

vcoincidentes = intersect(v,vpar)
vcoincidentes
