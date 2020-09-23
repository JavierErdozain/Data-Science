# Ejercicio de rutas de aviones

flights <- read.csv("flights.csv", stringsAsFactors = FALSE)
coords <- read.csv("coords.csv")

head(flights)
head(coords)

# Unificamos aeropuertos con coordendas.
# ¡Duda! Dependemos del orden de los datos para cruzar aeropuerto con destino.
aeropuertos <- unique(c(flights$From, flights$To))
airports <- data.frame(airport=aeropuertos, coords)
airports


head(flights)
head(airports)

# Cruzamos tablas para conseguir por cada origen/destino, las geolocalizaciones
# de origen y destino.
flights <- merge(flights, airports, by.x="To", by.y="airport")
flights <- merge(flights, airports, by.x="From", by.y="airport")

head(flights)


# A dibujar!
install.packages("ggplo2")
install.packages("ggmap")
install.packages("ggrepel")
install.packages("maps")

library(ggplot2)
library(ggmap)
library(ggrepel)
library(maps)

worldmap <- borders("world", colour="grey60", fill="#efede1") 
ggplot() + 
  worldmap + 
  geom_curve(data=flights, 
             aes(x = lon.x, y = lat.x, xend = lon.y, yend = lat.y), 
             col = "#b29e7d", 
             size = 1, 
             curvature = .2) +
  geom_point(data=airports, 
             aes(x = lon, y = lat), 
             col = "#970027") +
  geom_text_repel(data=airports, 
                  aes(x = lon, y = lat, label = airport), 
                  col = "black", size = 2, segment.color = NA)

# Grafos!
install.packages("igraph")
library(igraph)

edgelist <- as.matrix(flights[c("From", "To")])
g <- graph_from_edgelist(edgelist, directed = TRUE)
g <- simplify(g)

plot.igraph(g, 
            edge.arrow.size=0, 
            edge.color="orange",
            edge.curved=TRUE, 
            edge.width=2, 
            vertex.size=1, 
            vertex.color="blue",
            vertex.frame.color=NA, 
            vertex.label=V(g)$name, 
            vertex.label.cex=0.8,
            layout=layout.fruchterman.reingold)
