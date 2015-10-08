# clean everything --------------------------------------------------------

rm(list=ls(all=TRUE))


# load maps ---------------------------------------------------------------

library(ggmap)
library(ggplot2)
library(raster)
library(maptools)

# map of Rio, no boundaries -----------------------------------------------

mapa2 <- readShapeSpatial("Layers/BRA_adm/BRA_adm1.shp")
rio1 <- subset(mapa2, mapa2@data$NAME_1 == "Rio de Janeiro")
plot(rio1)

# map of Rio, boundaries --------------------------------------------------

mapa3 <- readShapeSpatial("Layers/BRA_adm/BRA_adm2.shp")
rio2 <- subset(mapa3, mapa3@data$NAME_1 == "Rio de Janeiro")
plot(rio2)


# map of Rio, more boundaries ---------------------------------------------

mapa4 <- readShapeSpatial("Layers/BRA_adm/BRA_adm3.shp")
rio3 <- subset(mapa4, mapa4@data$NAME_1 == "Rio de Janeiro")
plot(rio3)

