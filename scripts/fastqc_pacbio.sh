#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J fastqc_pacbio
#SBATCH --output=../logs/fastqc_pacbio_%j.out
#SBATCH --error=../logs/fastqc_pacbio_%j.err

module load FastQC

fastqc \
--threads 2 \
-o ../qc/fastqc_raw/pacbio \
../raw_data/genome_reads/pacbio/*.fastq.gz
