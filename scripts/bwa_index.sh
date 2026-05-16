#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -n 1
#SBATCH -c 2
#SBATCH --mem=8G
#SBATCH -t 00:30:00
#SBATCH -J bwa_index
#SBATCH --mail-type=ALL
#SBATCH --output=../logs/bwa_index_%j.out
#SBATCH --error=../logs/bwa_index_%j.err

module load BWA/0.7.19-GCCcore-13.3.0

bwa index \
-p ../mapping/bwa_index/e_faecium \
../annotation/prokka/e_faecium.fna
