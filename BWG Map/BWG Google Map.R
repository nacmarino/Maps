# Create a BWG field site map using the terrain maps from Google


# load packages -----------------------------------------------------------

library(ggplot2)
library(RgoogleMaps)


# load file ---------------------------------------------------------------

sites <- readxl::read_excel("BWG Map/site coordinates.xlsx")


## Developed from http://www.molecularecologist.com/2012/09/making-maps-with-r/

# lots of visual options, just like google maps: maptype = c("roadmap", "mobile",
# "satellite", "terrain", "hybrid", "mapmaker-roadmap", "mapmaker-hybrid")
terrmap <- GetMap(center = c(lat = -20, lon = -80), zoom = 3, maptype= "terrain",
                  destfile = "BWG Map/terrain.png")

