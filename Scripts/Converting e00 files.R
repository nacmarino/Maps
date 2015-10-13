
# clear workspace ---------------------------------------------------------

rm(list=ls(all=TRUE))


# load libraries ----------------------------------------------------------

library(RArcInfo)
library(maptools)
library(rgdal)


# create data folder ------------------------------------------------------

e00toavc("Layers/rio_line.e00", "Layers/conversao")


# create arc data ---------------------------------------------------------

arco <- get.arcdata(".", "Layers/conversao/")


# create pal data ---------------------------------------------------------

pal <- get.paldata(".", "Layers/conversao")


# convert pal and arc data ------------------------------------------------

pal2SpatialPolygons()


teste <- ArcObj2SLDF(arco)
plot(teste)
