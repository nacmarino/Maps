# clean everything --------------------------------------------------------

rm(list=ls(all=TRUE))


# load maps ---------------------------------------------------------------

library(ggmap)
library(ggplot2)
library(raster)
library(maptools)

# first map of Brazil -----------------------------------------------------

mapa <- borders("world", regions = c("Brazil", "Uruguay", "Argentina", "French Guiana", "Suriname", "Colombia", "Venezuela",
                                     "Bolivia", "Ecuador", "Chile", "Paraguay", "Peru", "Guyana", "Panama", "Costa Rica", 
                                     "Nicaragua", "Honduras", "El Salvador", "Belize", "Guatemala", "Mexico", "Trinidad and Tobago",
                                     "Caribe", "Puerto Rico", "Dominican Republic", "Haiti", "Jamaica", "Cuba", "Bahamas", "Antiles",
                                     "Dominica", "Saba"), 
                fill = "grey70", colour = "black")

ggplot() + mapa + theme_bw() + xlab("Longitude (decimals)") + ylab("Latitude (decimals)") + 
  theme(panel.border = element_blank(), panel.grid.major = element_line(colour = "grey80"), panel.grid.minor = element_blank())