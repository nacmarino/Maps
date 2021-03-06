# clean everything --------------------------------------------------------

rm(list=ls(all=TRUE))


# load maps ---------------------------------------------------------------

library(ggmap)
library(ggplot2)
library(raster)
library(maptools)
library(dplyr)

# map of Rio, no boundaries -----------------------------------------------

brazil_1 <- readShapeSpatial("Layers/BRA_adm/BRA_adm1.shp")
rio_state_1 <- subset(brazil_1, brazil_1@data$NAME_1 == "Rio de Janeiro")

rio1 <- fortify(rio_state_1)

rio <- ggplot() + geom_polygon(data = rio1, aes(x = long, y = lat, group = group), colour = "black", fill = "white")
rio

map_rio <- rio +
  geom_polygon(data = macae_region, aes(x = long, y = lat, group = group), colour = "black", fill = "orange") +
  geom_point(aes(x = -41.486244, y = -22.207576), fill = "black", colour = "black", size = 4) +
  geom_point(aes(x = -41.78275, y = -22.38367), fill = "blue", colour = "blue", size = 4) +
  geom_point(aes(x = -43.2259, y = -22.86269), fill = "red", colour = "red", size = 4) +
  theme(panel.background = element_blank(),
        panel.grid.major = element_line(colour = "grey85")) +
  xlab("Longitude") + 
  ylab("Latitude") + 
  annotate("segment", x = -41.7, xend = -41.2, y = -23.4, yend = -23.4, size = 3) +
  annotate("text", x = -41.4, y = -23.3, label = "1 cm = 52 km")
map_rio
ggsave(filename = "/Users/Nicholas/Documents/Pos-Graduacao/Doutorado/Tese/Apresentação/Figuras/map_rio.jpeg", plot = map_rio, dpi = 200)

# map of Rio, boundaries --------------------------------------------------

brazil_2 <- readShapeSpatial("Layers/BRA_adm/BRA_adm2.shp")
rio_state_2 <- subset(brazil_2, brazil_2@data$NAME_1 == "Rio de Janeiro")

rio2 <- fortify(rio_state_2)

rio_bound <- ggplot() + geom_polygon(data = rio2, aes(x = long, y = lat, group = group), colour = "black", fill = "white")
rio_bound

# map of Rio, more boundaries ---------------------------------------------

brazil_3 <- readShapeSpatial("Layers/BRA_adm/BRA_adm3.shp")
rio_state_3 <- subset(brazil_3, brazil_3@data$NAME_1 == "Rio de Janeiro")

rio3 <- fortify(rio_state_3)

rio_full <- ggplot() + geom_polygon(data = rio3, aes(x = long, y = lat, group = group), colour = "black", fill = "white")
rio_full

# new stuff in Rio map ----------------------------------------------------

rio_city <- subset(rio_state_2, rio_state_2@data$NAME_2 == "Rio de Janeiro") #based on rio_bound
rio4 <- fortify(rio_city)

rio_bound + geom_polygon(data = rio4, aes(x = long, y = lat, group = group), colour = "black", fill = "yellow")


# let’s play with Macae ---------------------------------------------------

macae_full <- subset(rio_state_3, rio_state_3@data$NAME_2 == c("Quissamã"))

macae_region <- fortify(macae_full)

ggplot() + geom_polygon(data = macae_region, aes(x = long, y = lat, group = group), colour = "black", fill = "white")

rivers <- readShapeSpatial("Layers/BRA_wat/BRA_water_lines_dcw.shp")

rivers1 <- fortify(rivers)
macae_water <- rivers1 %>% filter(long >= -42.27 & long <= -41.68) %>% filter(lat >= -22.44 & lat <= -22.13)

ggplot() + geom_polygon(data = macae_region, aes(x = long, y = lat, group = group), colour = "black", fill = "white") +
  geom_path(data = macae_water, aes(x = long, y = lat, group = group), colour = "blue3", size = 2)


# Para --------------------------------------------------------------------

para_state <- subset(brazil_1, brazil_1@data$NAME_1 == "Pará")
para2 <- fortify(para_state)

ggplot() + geom_polygon(data = para2, aes(x = long, y = lat, group = group), colour = "black", fill = "white")
