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
drawExtent()

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


# Brazil cover ------------------------------------------------------------

mapa5 <- raster("Layers/BRA_cov/BRA_cov.grd")
plot(mapa5)

# Brazil water ------------------------------------------------------------

mapa6 <- readShapeSpatial("Layers/BRA_wat/BRA_water_areas_dcw.shp")
plot(mapa6)

mapa7 <- readShapeLines("Layers/BRA_wat/BRA_water_lines_dcw.shp") 
plot(mapa7, add = TRUE)


# altitude ----------------------------------------------------------------

mapa8 <- raster("Layers/BRA_msk_alt.gri")
plot(mapa8)


# other map ---------------------------------------------------------------

rio4 <- get_map(location = c(lon = -56.37, lat = -1.46), source = "google", maptype = "satellite", zoom = 13)
ggmap(rio4)

# general map -------------------------------------------------------------

mapa2 <- readShapeSpatial("Layers/ne_110m_coastline/ne_110m_coastline.shp")
plot(mapa2)

mapa3 <- readShapeLines("Layers/ne_110m_rivers_lake_centerlines/ne_110m_rivers_lake_centerlines.shp")
lines(mapa3)

mapa4 <- readShapeSpatial("Layers/ne_10m_coastline/ne_10m_coastline.shp")
plot(mapa4)

mapa5 <- readShapeLines("Layers/ne_10m_rivers_lake_centerlines/ne_10m_rivers_lake_centerlines.shp")
plot(mapa5, add = TRUE)

mapa6 <- brick("Layers/NE1_50M_SR_W/NE1_50M_SR_W.tif")
plotRGB(mapa6)

mapa7 <- readShapeSpatial("Layers/ne_10m_admin_0_countries/ne_10m_admin_0_countries.shp")
plot(mapa7, add = TRUE)


# get data from places ----------------------------------------------------

mapa8 <- getData("alt", country = "Brazil", mask = TRUE)
plot(mapa8)

mapa9 <- getData("worldclim", var = "bio", res = 10)
plot(mapa9)