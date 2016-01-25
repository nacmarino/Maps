# clean everything --------------------------------------------------------

rm(list=ls(all=TRUE))


# load maps ---------------------------------------------------------------

library(ggmap)
library(ggplot2)
library(raster)
library(maptools)


# trying geocode ----------------------------------------------------------

geocode("Parque Jurubatiba", source = "google")

macae <- get_map(location = c(lon = -41.44299, lat = -22.17327), source = "stamen", maptype = "toner", zoom = 11)
plot(macae)

expt <- get_map(location = c(lon = -41.44299, lat = -22.17327), source = "osm", zoom = 10)
plot(expt)

expt2 <- get_map(location = c(lon = -41.44299, lat = -22.17327), source = "stamen", maptype = "watercolor", zoom = 10)
plot(expt2)
