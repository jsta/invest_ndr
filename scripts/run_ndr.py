# https://invest.readthedocs.io/en/3.3.1/final_ecosystem_services/ndr.html

from natcap.invest.ndr import ndr

# help(ndr.execute)
data_dir = "data/NDR/"
args = {
    "workspace_dir": "workspace", 
    "dem_path": data_dir + "DEM_gura.tif", 
    "lulc_path": data_dir + "land_use_gura.tif", 
    "runoff_proxy_path": data_dir + "precipitation_gura.tif",
    "watersheds_path": data_dir + "watershed_gura.shp",
    "biophysical_table_path": data_dir + "biophysical_table_gura.csv",    
    "calc_p": True,
    "calc_n": False,
    "threshold_flow_accumulation": 1000,
    "k_param": 2,
    "subsurface_eff_p": 0.5, 
    "subsurface_critical_length_p": 25
     }
ndr.execute(args)
