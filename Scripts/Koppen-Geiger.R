# clean everything --------------------------------------------------------

rm(list=ls(all=TRUE))


# load maps ---------------------------------------------------------------

library(ggmap)
library(readxl)


# load file ---------------------------------------------------------------

koppen <- read_excel("/Users/Nicholas/Documents/R/Koppen-Geiger.xlsx")
head(koppen)

# create upper layer ------------------------------------------------------

mapa <- borders("world", fill = NA, colour = "black")

ggplot() + mapa

# do map ------------------------------------------------------------------

ggplot(koppen, aes(x = Lon, y = Lat, colour = Cls)) + 
  geom_point(aes(colour = Cls), show.guide = FALSE) + 
  coord_cartesian(xlim = c(-180, 180), ylim = c(-90, 90)) +
  mapa