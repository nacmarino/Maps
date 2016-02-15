
# clear environment -------------------------------------------------------

rm(list=ls(all=TRUE))


# load package ------------------------------------------------------------

library(raster)
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggmap)


# get climate data --------------------------------------------------------

bio1 <- raster("/Users/Nicholas/Documents/Publicacoes/Artigos/Em andamento/TrophicDynCC/downloaded data/wc2-5/bio1.bil")
bio12 <- raster("/Users/Nicholas/Documents/Publicacoes/Artigos/Em andamento/TrophicDynCC/downloaded data/wc2-5/bio12.bil")


# get coordinates for jurubatiba and parnaso ------------------------------

juruba <- geocode("Restinga de Jurubatiba") %>% 
  data.frame %>% 
  mutate(x = ceiling(lon*2)/2, y = ceiling(lat*2)/2)
tere <- geocode("Teresópolis") %>% 
  data.frame %>% 
  mutate(x = ceiling(lon*2)/2, y = ceiling(lat*2)/2)


# find temperatura --------------------------------------------------------

temp <- rasterToPoints(bio1) %>% 
  data.frame() %>% 
  mutate(x = ceiling(x*2)/2, y = ceiling(y*2)/2, bio1 = bio1/10)

inner_join(x = juruba, y = temp, by = c("x", "y")) %>% #joining by lat and long
  summarise(temp_wc = mean(bio1), desv = sd(bio1), sample_size = n())

inner_join(x = tere, y = temp, by = c("x", "y")) %>% #joining by lat and long
  summarise(temp_wc = mean(bio1), desv = sd(bio1), sample_size = n())
