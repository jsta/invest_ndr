library(reticulate)
use_condaenv(condaenv = "envs/invest")

ndr <- import("natcap.invest.ndr.ndr")
