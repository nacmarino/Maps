## Generate a BWG field site map using ggmap with Open Street Maps


# load packages -----------------------------------------------------------

library(ggmap)

# load sites file ---------------------------------------------------------

sites <- readxl::read_excel("BWG Map/site coordinates.xlsx")


# generate map borders ----------------------------------------------------

map_borders <- borders("world",
                       regions = c("Brazil", "Uruguay", "Argentina", "French Guiana",
                                   "Suriname", "Colombia", "Venezuela", "Bolivia",
                                   "Ecuador", "Chile", "Paraguay", "Peru", "Guyana",
                                   "Panama", "Costa Rica", "Nicaragua", "Honduras",
                                   "El Salvador", "Belize", "Guatemala", "Mexico",
                                   "Trinidad and Tobago", "Caribe", "Puerto Rico",
                                   "Dominican Republic", "Haiti", "Jamaica", "Cuba",
                                   "Bahamas", "Antiles", "Dominica", "Saba", "Trinidad",
                                   "Guadeloupe", "Martinique", "Saint Martin",
                                   "Saint Barthélemy", "Falkland Islands"), 
                       colour = "grey30", size = 0.3)

# generate map ------------------------------------------------------------

bwg_map <- get_map(location = c(-70, -20), source = "stamen",
                   maptype = "watercolor", zoom = 3)

final_map <- bwg_map +
  map_borders +
  geom_point(mapping = aes(x = longitude, y = latitude), data = sites, 
             shape = 20, colour = "black", size = 3) + 
  geom_point(mapping = aes(x = longitude, y = latitude), data = sites, 
             colour = "red", shape = 20, size = 2) +
  theme(panel.border = element_blank(),
        axis.title = element_blank(),
        axis.text  = element_blank(),
        axis.ticks = element_blank(),
        plot.margin = unit(c(0,0,0,0), "cm"))
  
ggsave(final_map, filename = "BWG Map/bwg_ggmap.png")


# Brazil submap -----------------------------------------------------------

brazil_map <- get_map(location = c(-44, -23), zoom = 5, source = "stamen",
                      maptype = "watercolor")

brazil_final <- ggmap(brazil_map) +
  geom_point(mapping = aes(x = longitude, y = latitude), data = sites, 
             shape = 20, colour = "black", size = 3) + 
  geom_point(mapping = aes(x = longitude, y = latitude), data = sites, 
             colour = "red", shape = 20, size = 2) +
  theme(panel.border = element_blank(),
        axis.title = element_blank(),
        axis.text  = element_blank(),
        axis.ticks = element_blank(),
        plot.margin = unit(c(0,0,0,0), "cm"))

ggsave(brazil_final, filename = "BWG Map/brazil_ggmap.png")

# Colombia submap ---------------------------------------------------------

colombia_map <- get_map(location = c(-74.167, 4.767), zoom = 6, source = "stamen",
                        maptype = "watercolor")

colombia_final <- ggmap(colombia_map) +
  geom_point(mapping = aes(x = longitude, y = latitude), data = sites, 
             shape = 20, colour = "black", size = 3) + 
  geom_point(mapping = aes(x = longitude, y = latitude), data = sites, 
             colour = "red", shape = 20, size = 2) +
  theme(panel.border = element_blank(),
        axis.title = element_blank(),
        axis.text  = element_blank(),
        axis.ticks = element_blank(),
        plot.margin = unit(c(0,0,0,0), "cm"))

ggsave(colombia_final, filename = "BWG Map/colombia_ggmap.png")
