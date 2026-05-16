#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J fastqc_raw
#SBATCH --mail-type=ALL
#SBATCH --output=../logs/fastqc_raw_%j.out
#SBATCH --error=../logs/fastqc_raw_%j.err

module load FastQC

fastqc \
--threads 2 \
-o ../qc/fastqc_raw \
../raw_data/rnaseq_reads/*.fastq.gz
