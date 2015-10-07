# clean everything --------------------------------------------------------

rm(list=ls(all=TRUE))


# load maps ---------------------------------------------------------------

library(ggmap)
library(ggplot2)
library(raster)
library(maptools)

# first map of Brazil -----------------------------------------------------

mapa <- borders("world", regions = "Brazil", fill = "grey70", colour = "black")

brazil <- ggplot() + mapa + theme_bw() + xlab("Longitude (decimals)") + ylab("Latitude (decimals)") + 
  theme(panel.border = element_blank(), panel.grid.major = element_line(colour = "grey80"), panel.grid.minor = element_blank())


estados <- readShapePoly("Layers/BRA_adm/BRA_adm1.shp")
estados1 <- fortify(estados)
head(estados1)

br_est <- brazil + geom_path(data = estados1, aes(x = long, y = lat, group = group), colour = "black")
br_est

river_file <- readShapePoly("Layers/BRA_wat/BRA_water_areas_dcw.shp")
rios <- fortify(river_file)
head(rios)

br_est + geom_path(data = rios, aes(x = long, y = lat, group = group), color = "blue3")
