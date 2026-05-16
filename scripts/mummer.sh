#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -n 1
#SBATCH -c 2
#SBATCH --mem=8G
#SBATCH -t 01:00:00
#SBATCH -J mummer
#SBATCH --output=../logs/mummer_%j.out
#SBATCH --error=../logs/mummer_%j.err

module load MUMmer

nucmer \
--prefix=../assembly_evaluation/mummer/e_faecium \
../reference_genome/reference.fasta \
../assembly/canu/e_faecium.contigs.fasta

mummerplot \
--png \
--layout \
--filter \
../assembly_evaluation/mummer/e_faecium.delta
