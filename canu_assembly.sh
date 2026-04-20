#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=32G
#SBATCH -t 12:00:00
#SBATCH -J canu_assembly
#SBATCH -o canu.out
#SBATCH -e canu.err

module load canu
module load SAMtools/1.22.1-GCC-13.3.0

canu \
-p e_faecium \
-d assembly_output \
genomeSize=2.8m \
useGrid=false \
gridOptions="--account=uppmax2026-1-61" \
-pacbio-raw ~/Individual-Project-/raw_data/genomics_data/PacBio/*.fastq.gz
