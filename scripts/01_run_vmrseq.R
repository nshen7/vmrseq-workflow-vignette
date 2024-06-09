library(vmrseq)
library(here)
library(SummarizedExperiment)
library(HDF5Array)
library(BiocParallel)

# ---- utils ----
## Enable multi-core parallel evaluation
register(MulticoreParam(workers = 14))

## Set up writing directory for output
write_dir <- here("data", "01_run_vmrseq")
if (!file.exists(write_dir)) dir.create(write_dir, recursive = T)

# ---- main ----
## Read in processed SE as input
SE <- loadHDF5SummarizedExperiment(here("data", "example", "chr1"))

## QC: remove sites with across-cell coverage < 3
total <- rowSums(assays(SE)[[1]] > 0)
SE <- subset(SE, total >= 3)

## Run vmrseq
gr <- vmrseq::vmrseq.smooth(SE)
fit <- vmrseq::vmrseq.fit(gr, alpha = 0.05)

## Save model output
saveRDS(fit, here(write_dir, "vmrseq_results.rds"))