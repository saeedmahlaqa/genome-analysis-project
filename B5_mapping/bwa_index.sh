#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:30:00
#SBATCH -J bwa_index
#SBATCH --output=bwa_index.%j.out
#SBATCH --error=bwa_index.%j.err

module load bwa

# Use your assembled genome (this path is correct from your earlier work)
GENOME=~/Individual-Project-/analyses/01_genome_assembly/assembly_output/*.fasta

bwa index $GENOME
