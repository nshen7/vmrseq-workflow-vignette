# library(vmrseq)
devtools::load_all("../vmrseq")
library(here)
library(SummarizedExperiment)
library(HDF5Array)
library(BiocParallel)

# ---- utils ----
## Enable multi-core parallel evaluation
register(MulticoreParam(workers = 14))

## Reading directory 
read_dir <- here("data", "01_run_vmrseq")

## Set up writing directory for output
write_dir <- here("data", "02_run_region_summary")
if (!file.exists(write_dir)) dir.create(write_dir, recursive = T)

# ---- main ----
## Read in processed SE as input
SE <- loadHDF5SummarizedExperiment(here("data", "example", "chr1"))

## Read in output from running vmrseq method
fit <- readRDS(here(read_dir, "vmrseq_results.rds"))

## Summary regional info
regions.se <- region.summary(SE = SE, region_ranges = fit$vmr.ranges)

## Save regional info
saveHDF5SummarizedExperiment(regions.se, here(write_dir, "vmrs_summary"), replace = T)
