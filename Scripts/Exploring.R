# clean everything --------------------------------------------------------

rm(list=ls(all=TRUE))


# load maps ---------------------------------------------------------------

library(ggmap)
library(ggplot2)
library(raster)
library(maptools)

# map of Rio, no boundaries -----------------------------------------------

brazil_1 <- readShapeSpatial("Layers/BRA_adm/BRA_adm1.shp")
rio_state_1 <- subset(brazil_1, brazil_1@data$NAME_1 == "Rio de Janeiro")

rio1 <- fortify(rio_state_1)

ggplot() + geom_polygon(data = rio1, aes(x = long, y = lat, group = group), colour = "black", fill = "white")

# map of Rio, boundaries --------------------------------------------------

brazil_2 <- readShapeSpatial("Layers/BRA_adm/BRA_adm2.shp")
rio_state_2 <- subset(brazil_2, brazil_2@data$NAME_1 == "Rio de Janeiro")

rio2 <- fortify(rio_state_2)

rio_bound <- ggplot() + geom_polygon(data = rio2, aes(x = long, y = lat, group = group), colour = "black", fill = "white")
rio_bound

# map of Rio, more boundaries ---------------------------------------------

brazil_3 <- readShapeSpatial("Layers/BRA_adm/BRA_adm3.shp")
rio_state_3 <- subset(brazil_3, brazil_3@data$NAME_1 == "Rio de Janeiro")

rio3 <- fortify(rio_state_3)

rio_full <- ggplot() + geom_polygon(data = rio3, aes(x = long, y = lat, group = group), colour = "black", fill = "white")
rio_full

# new stuff in Rio map ----------------------------------------------------

rio_city <- subset(rio_state_2, rio_state_2@data$NAME_2 == "Rio de Janeiro") #based on rio_bound
rio4 <- fortify(rio_city)

rio_bound + geom_polygon(data = rio4, aes(x = long, y = lat, group = group), colour = "black", fill = "yellow")


# let’s play with Macae ---------------------------------------------------

macae_full <- subset(rio_state_3, rio_state_3@data$NAME_2 == "Macaé")

