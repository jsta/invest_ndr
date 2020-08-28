source("scripts/99_utils.R")

library(reticulate)
use_condaenv(condaenv = "env", required = TRUE)
ndr <- import("natcap.invest.ndr.ndr")

args <- dict(
  "workspace_dir" = "workspace",
  "dem_path" = paste0(data_dir, "DEM_gura.tif"),
  "lulc_path" = paste0(data_dir, "land_use_gura.tif"),
  "runoff_proxy_path" = paste0(data_dir, "precipitation_gura.tif"),
  "watersheds_path" = paste0(data_dir,  "watershed_gura.shp"),
  "biophysical_table_path" = paste0(data_dir,  "biophysical_table_gura.csv"),
  "calc_p" = TRUE,
  "calc_n" = FALSE,
  "threshold_flow_accumulation" = 1000,
  "k_param" = 2,
  "subsurface_eff_p" = 0.5,
  "subsurface_critical_length_p" = 25
)

# system("make clean")
ndr$execute(args)
# dir("workspace")
