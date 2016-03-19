
# clear the environment ---------------------------------------------------

rm(list=ls(all=TRUE))


# load packages -----------------------------------------------------------

# to draw maps
library(ggplot2)

# load file ---------------------------------------------------------------

sites <- readxl::read_excel("BWG Map/site coordinates.xlsx")


# draw map ----------------------------------------------------------------

# draw map borders
map_borders <- borders("world", regions = c("Brazil", "Uruguay", "Argentina", "French Guiana", "Suriname", "Colombia", "Venezuela",
                                     "Bolivia", "Ecuador", "Chile", "Paraguay", "Peru", "Guyana", "Panama", "Costa Rica", 
                                     "Nicaragua", "Honduras", "El Salvador", "Belize", "Guatemala", "Mexico", "Trinidad and Tobago",
                                     "Caribe", "Puerto Rico", "Dominican Republic", "Haiti", "Jamaica", "Cuba", "Bahamas", "Antiles",
                                     "Dominica", "Saba", "Trinidad", "Guadeloupe", "Martinique", "Saint Martin", "Saint Barthélemy",
                                     "USA"), 
                fill = "#9FF781", colour = "black", size = 0.3)

# but it into ggplot
bwg_map <- ggplot() + 
  map_borders + 
  theme_bw() + 
  xlab("Longitude") + 
  ylab("Latitude") + 
  ylim(c(-60, 35)) +
  xlim(c(-120, -30)) +
  theme(panel.border = element_blank(), 
        panel.background = element_rect(colour = "NA", fill = "#A9D0F5"),
        panel.grid.major = element_line(colour = "white"), 
        panel.grid.minor = element_blank(),
        axis.title = element_blank(),
        axis.text  = element_blank(),
        axis.ticks = element_blank(),
        plot.margin = unit(c(0,0,0,0), "cm")) +
  coord_quickmap()

# add site coordinates

bwg_map <- bwg_map + 
  geom_point(mapping = aes(x = longitude, y = latitude), data = sites, shape = 20, colour = "black", size = 3) + 
  geom_point(mapping = aes(x = longitude, y = latitude), data = sites, colour = "red", shape = 20, size = 2)

# save map ----------------------------------------------------------------

ggsave(filename = "BWG Map/bwg_map.jpeg", plot = bwg_map, dpi = 300)
