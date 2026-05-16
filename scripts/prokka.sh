#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=16G
#SBATCH -t 02:00:00
#SBATCH -J prokka
#SBATCH --output=../logs/prokka_%j.out
#SBATCH --error=../logs/prokka_%j.err

module load prokka

prokka \
--outdir ../annotation/prokka \
--prefix e_faecium \
--genus Enterococcus \
--species faecium \
--cpus 4 \
../assembly/canu/e_faecium.contigs.fasta
