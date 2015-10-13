
# clear workspace ---------------------------------------------------------

rm(list=ls(all=TRUE))

# add the file you want to work into the main dir
# for the water file, don't mind if it returns a error message

# load libraries ----------------------------------------------------------

library(RArcInfo)
library(maptools)
library(rgdal)


# create data folder ------------------------------------------------------

e00toavc("rio_water.e00", "conversao")

# create arc data ---------------------------------------------------------

arco <- get.arcdata(".", "conversao")

# create pal data ---------------------------------------------------------

palo <- get.paldata(".", "conversao")

# convert pal and arc data ------------------------------------------------

conversao <- pal2SpatialPolygons(arco, palo,
                                 palo[[1]]$PolygonId[-1], dropPoly1 = TRUE, 
                                 proj4string = CRS("+init=epsg:2166"))

coord_trans <- spTransform(conversao, CRS("+proj=longlat +ellps=WGS84"))


# add the file into a figure ----------------------------------------------

GSG <- GE_SpatialGrid(coord_trans)

png("teste.png", width=GSG$width, height=GSG$height, bg="transparent")
par(mar=c(0,0,0,0), xaxs="i", yaxs="i")
plot(coord_trans, xlim=GSG$xlim, ylim=GSG$ylim, lwd = 5)
dev.off()

# convert only arc data ---------------------------------------------------

arc_only <- ArcObj2SLDF(arco)
plot(arc_only)