#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=32G
#SBATCH -t 12:00:00
#SBATCH -J canu_assembly
#SBATCH --output=../logs/canu_assembly_%j.out
#SBATCH --error=../logs/canu_assembly_%j.err

module load canu
module load SAMtools/1.22.1-GCC-13.3.0

canu \
-p e_faecium \
-d ../assembly/canu \
genomeSize=2.8m \
useGrid=false \
maxThreads=4 \
-pacbio-raw ../raw_data/genome_reads/pacbio/*.fastq.gz
