# Genome Analysis Project

## Overview

This project performs genome assembly of *Enterococcus faecium* using long-read sequencing data.

The goal is to assemble a genome from raw PacBio reads using the Canu assembler on the UPPMAX cluster.

---

## Data

* Type: PacBio long-read sequencing data
* Location: UPPMAX cluster (not included in repository)

---

## Tools Used

* Canu (genome assembly)
* SLURM (job scheduling on UPPMAX)

---

## Workflow

1. Input raw sequencing reads
2. Run Canu for:

   * Read correction
   * Trimming
   * Assembly
3. Generate assembled genome output

---

## Script

Main script used for assembly:

* `canu_assembly.sh`

---

## How to Run

Submit the job on UPPMAX using:

```
sbatch canu_assembly.sh
```

---

## Notes

* Raw data and output files are not included due to large size
* This repository contains only scripts and documentation
