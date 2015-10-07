# clean everything --------------------------------------------------------

rm(list=ls(all=TRUE))


# load maps ---------------------------------------------------------------

library(ggmap)
library(ggplot2)
library(raster)
library(maptools)

# first map of Brazil -----------------------------------------------------

brazil_file <- readShapePoly("Layers/ne_10m_admin_0_countries/ne_10m_admin_0_countries.shp")
