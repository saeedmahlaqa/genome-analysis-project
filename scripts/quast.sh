#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -n 1
#SBATCH -c 2
#SBATCH --mem=8G
#SBATCH -t 01:00:00
#SBATCH -J quast
#SBATCH --output=../logs/quast_%j.out
#SBATCH --error=../logs/quast_%j.err

module load QUAST

quast.py \
-o ../assembly_evaluation/quast \
../assembly/canu/e_faecium.contigs.fasta
