# clean everything --------------------------------------------------------

rm(list=ls(all=TRUE))


# load maps ---------------------------------------------------------------

library(ggmap)
library(ggplot2)
library(raster)
library(maptools)

# first map of Brazil -----------------------------------------------------

brazil_file <- readShapePoly("Layers/BRA_adm/BRA_adm1.shp")
br1 <- subset(brazil_file, brazil_file@data$ADMIN == "Brazil")
br2 <- fortify(br1)
head(br2)

ggplot() + geom_path(data = br2, aes(x = long, y = lat, group = group), colour = "black", fill = NA)
