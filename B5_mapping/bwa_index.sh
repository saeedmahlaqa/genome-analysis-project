#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:30:00
#SBATCH -J bwa_index
#SBATCH --output=bwa_index.%j.out
#SBATCH --error=bwa_index.%j.err

module load BWA/0.7.19-GCCcore-13.3.0

GENOME=~/Individual-Project-/analyses/01_genome_assembly/assembly_output/*.fasta

bwa index $GENOME
