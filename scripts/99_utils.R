# load packages
library(sf)
library(raster)
suppressMessages(library(dplyr))
library(mapview)

# set paths
data_dir <- "data/NDR/"

# utility functions
raster_sum <- function(x) sum(x[], na.rm = TRUE)

get_values_from_rasters <- function(sf_point, raster_list){
  lapply(raster_list, function(x) raster::extract(x, sf_point))
}
