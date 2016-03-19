## Create a BWG field site map using the terrain maps from Google
## Developed from http://www.molecularecologist.com/2012/09/making-maps-with-r/

# load packages -----------------------------------------------------------

library(ggplot2)
library(RgoogleMaps)
library(dplyr)


# load file ---------------------------------------------------------------

sites <- readxl::read_excel("BWG Map/site coordinates.xlsx")


# functions ---------------------------------------------------------------

## function to make a RgoogleMaps friendly data frame of markers

getmarkers <- function(df){
  df %>%
    select(lat = latitude, lon = longitude) %>%
    mutate(size  = "small",
           color = "red",
           char  = "")
}

# set up markers ----------------------------------------------------------

main_markers <- getmarkers(sites)

# create map --------------------------------------------------------------

# lots of visual options, just like google maps: maptype = c("roadmap", "mobile",
# "satellite", "terrain", "hybrid", "mapmaker-roadmap", "mapmaker-hybrid")
terrmap <- GetMap(center = c(-20, -70), zoom = 3, maptype = "terrain",
                  size = c(480, 640),
                  markers = main_markers, destfile = "BWG Map/terrain.png")

# Brazil close up map -----------------------------------------------------

## create a close up of the Brazil sites for inset
brazil <- sites %>%
  filter(country == "Brazil") %>%
  getmarkers()

brazilmap <- GetMap(center = c(-23, -44), zoom = 5, maptype = "terrain",
                    size = c(240, 200), markers = brazil,
                    destfile = "BWG Map/brazil.png")

# Colombia close up map ---------------------------------------------------

## create a close up of the Colombia sites for inset
colombia <- sites %>%
  filter(country == "Colombia") %>%
  getmarkers()

colombiamap <- GetMap(center = c(4.767, -74.167), zoom = 7, maptype = "terrain",
                      size = c(240, 200), markers = colombia,
                      destfile = "BWG Map/colombia.png")
