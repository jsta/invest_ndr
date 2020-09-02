source("scripts/99_utils.R")

# ---- load data -----
# user provided inputs
input_tifs <- list(
  raster(paste0(data_dir, "DEM_gura.tif")),
  raster(paste0(data_dir, "land_use_gura.tif")),
  raster(paste0(data_dir, "precipitation_gura.tif")))
names(input_tifs) <- c("dem", "lulc", "precip")
watersheds    <- st_read(paste0(data_dir,  "watershed_gura.shp"))
biophys_table <- read.csv(paste0(data_dir,  "biophysical_table_gura.csv"))

# derived inputs
derived_dir   <- "workspace/intermediate_outputs/"
derived_tifs  <- list.files(derived_dir, pattern = "*.tif",
                           include.dirs = TRUE, full.names = TRUE)
derived_names <- gsub(".tif", "", basename(derived_tifs))
dt            <- lapply(derived_tifs, function(x) raster(x))
names(dt)     <- derived_names
dt            <- append(dt, input_tifs)

# output
output_dir <- "workspace"
p_export   <- raster(paste0(output_dir, "/p_export.tif"))
dt         <- append(dt, p_export)
names(dt)[names(dt) == ""] <- "p_export"

# ---- check model operation ----
# generate test point
set.seed(22)
test_values <- dt$flow_accumulation[]
test_index  <- sample(
  which(!is.na(test_values) & test_values == 1), 1)
test_xy     <- raster::xyFromCell(dt$flow_accumulation, test_index)

sf_point <- st_as_sf(st_sfc(
  st_point(test_xy),
  crs = raster::projection(dt$flow_accumulation)
  ))

# mapview(dt$flow_accumulation == 1, maxpixels = 1169217) +
#   mapview(sf_point)

dt_values <- get_values_from_rasters(sf_point, dt)

# the P model has no subsurface loading
all(cellStats(dt$sub_load_p, "range") == 0)

# export is equal to load * delivery ratio
all.equal(dt_values$p_export,
          (dt_values$surface_load_p * dt_values$ndr_p))

# surface loading is solely a function of biophys_table$load_p and raster res
(biophys_values <- dplyr::filter(biophys_table, lucode == dt_values$lulc))
cell_area_ha <- (res(dt$lulc)[1] * res(dt$lulc)[2]) * 0.0001 # m to ha
all.equal(
  (biophys_values$load_p * cell_area_ha),
  as.numeric(dt_values$load_p),
  tolerance = sqrt(.Machine$double.eps) * 3
  )
