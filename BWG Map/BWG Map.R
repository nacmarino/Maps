
# clear the environment ---------------------------------------------------

rm(list=ls(all=TRUE))


# load packages -----------------------------------------------------------

# to draw maps
library(ggplot2)

# load file ---------------------------------------------------------------

sites <- readxl::read_excel("BWG Map/site coordinates.xlsx")


# draw map ----------------------------------------------------------------

# draw map borders
map_borders <- borders("world", 
                       regions = c("Brazil", "Uruguay", "Argentina", 
                                   "French Guiana", "Suriname", "Colombia", 
                                   "Venezuela","Bolivia", "Ecuador", "Chile", 
                                   "Paraguay", "Peru", "Guyana", "Panama", 
                                   "Costa Rica", "Nicaragua", "Honduras", 
                                   "El Salvador", "Belize", "Guatemala", 
                                   "Mexico", "Trinidad and Tobago", "Caribe", 
                                   "Puerto Rico", "Dominican Republic", "Haiti",
                                   "Jamaica", "Cuba", "Bahamas", "Antiles",
                                   "Dominica", "Saba", "Trinidad", "Guadeloupe",
                                   "Martinique", "Saint Martin",
                                   "Saint Barthélemy"), 
                fill = "lightyellow", colour = "black", size = 0.3)

# but it into ggplot
bwg_map <- ggplot() + 
  map_borders + 
  theme_bw() + 
  xlab("Longitude") + 
  ylab("Latitude") + 
  theme(panel.border = element_blank(), 
        panel.background = element_rect(colour = "NA", fill = "NA"),
        panel.grid.major = element_line(colour = "grey80"), 
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 9, colour = "black"),
        axis.text = element_text(size = 8, colour = "black"))

# add site coordinates

bwg_map <- bwg_map + 
  geom_point(mapping = aes(x = longitude, y = latitude), data = sites, 
             shape = 20, colour = "black", size = 2) + 
  geom_point(mapping = aes(x = longitude, y = latitude), data = sites, 
             colour = "red", shape = 20, size = 1) +
  theme(axis.ticks = element_blank(),
        axis.text  = element_blank()) +
  scale_x_continuous(name = NULL, breaks = seq(-180, 0, 20)) +
  scale_y_continuous(name = NULL, breaks = seq(-90, 90, 20)) +
  coord_quickmap()

# save map ----------------------------------------------------------------

bwg_map

# ggsave(filename = "BWG Map/bwg_map.jpeg", plot = bwg_map,
       # width = 250, height = 300, units = "mm", dpi = 300)
