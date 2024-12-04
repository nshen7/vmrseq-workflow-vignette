# An Example Workflow of Single-cell Bisulfite Sequencing Data Analysis

This is an auxillary repository that demonstrate a workflow that analyzes a real-world dataset using [the `vmrseq` package](https://github.com/nshen7/vmrseq). 

## Dataset

We took **chromosome 1** of a subset of the single-cell bisulfite sequencing data published in Luo et al [1] as the example dataset in this repository. Specifically, we took cells from 4 subtypes: the *excitatory* subtype *mDL-2* and *inhibitory* subtypes *mPv*, *mSst-1* and *mSst-2*. The CpG methylation levels of these files has been packed up into a `SummarizedExperiment` object (stored in `data/example/chr1`) using `data.pool` function in the `vmrseq` package.

[1] Luo, Chongyuan et al. “Single-cell methylomes identify neuronal subtypes and regulatory elements in mammalian cortex.” Science (New York, N.Y.) vol. 357,6351 (2017): 600-604. doi:10.1126/science.aan3351

## Workflow

We have organized the scripts into the order of the analysis pipeline in the `scripts/` folder：

- `01_run_vmrseq`: apply the vmrseq methodology to the example dataset.
- `02_run_region_summary`: summarize the regional methylation information per cell on detected VMRs.
- `03_downstream_analysis`: downstream analysis including gene/CpG context annotation and unsupervised cell clustering.

**Important notes:** 

- We strongly recommend the user to use **high-performance computing** to run this workflow on large-scale single-cell datasets (e.g., > 500 cells) due to the extensive demand on memory and parallelism. 
- We also recommend to process **one chromosome at a time or in parallel** to facilitate a manageable computation time.

## Required packages

These packages are required to run the scripts in this repo:

``` r
# # install.packages("devtools")
# # install.packages("BiocManager")
#
# devtools::install_github("nshen7/vmrseq")
# BiocManager::install("here")
# BiocManager::install("SummarizedExperiment")
# BiocManager::install("HDF5Array")
# BiocManager::install("BiocParallel")
# BiocManager::install("annotatr")
# BiocManager::install("TxDb.Mmusculus.UCSC.mm10.knownGene")
# BiocManager::install("org.Mm.eg.db")
#
# install.packages("uwot")
# install.packages("data.table")
# install.packages("tidyverse")
```

## Citation

If you applied the functions in `vmrseq` package, please cite our paper:

Ning Shen and Keegan Korthauer. 2023. “Vmrseq: Probabilistic Modeling of Single-Cell Methylation Heterogeneity.” bioRxiv. [https://doi.org/10.1101/2023.11.20.567911](https://doi.org/10.1101/2023.11.20.567911).

