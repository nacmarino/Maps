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

final_map <- ggmap(bwg_map) +
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
