## Create a BWG field site map using the terrain maps from Google
## Developed from http://www.molecularecologist.com/2012/09/making-maps-with-r/

# load packages -----------------------------------------------------------

library(ggplot2)
library(RgoogleMaps)
library(dplyr)


# load file ---------------------------------------------------------------

sites <- readxl::read_excel("BWG Map/site coordinates.xlsx")


# set up markers ----------------------------------------------------------

mymarkers <- sites %>%
  select(lat = latitude, lon = longitude) %>%
  mutate(size = "small",
         col  = "red",
         char = "")

# create map --------------------------------------------------------------

# lots of visual options, just like google maps: maptype = c("roadmap", "mobile",
# "satellite", "terrain", "hybrid", "mapmaker-roadmap", "mapmaker-hybrid")
terrmap <- GetMap(center = c(-20, -70), zoom = 3, maptype = "terrain",
                  size = c(480, 640),
                  markers = mymarkers, destfile = "BWG Map/terrain.png")
