#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=16G
#SBATCH -t 02:00:00
#SBATCH -J deseq2
#SBATCH --mail-type=ALL
#SBATCH --output=../logs/deseq2_%j.out
#SBATCH --error=../logs/deseq2_%j.err

module load R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2

Rscript deseq2_analysis.R
