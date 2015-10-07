# clean everything --------------------------------------------------------

rm(list=ls(all=TRUE))


# load maps ---------------------------------------------------------------

library(ggmap)
library(dplyr)
library(raster)
library(maptools)
library(rgdal)
library(maps)
library(RgoogleMaps)

# first map of Brazil -----------------------------------------------------

mapa <- borders("world", regions = "Brazil", fill = "grey70", colour = "black")

ggplot() + mapa + theme_bw() + xlab("Longitude (decimals)") + ylab("Latitude (decimals)") + 
  theme(panel.border = element_blank(), panel.grid.major = element_line(colour = "grey80"), panel.grid.minor = element_blank())
