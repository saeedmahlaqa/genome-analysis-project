#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=16G
#SBATCH -t 04:00:00
#SBATCH -J busco
#SBATCH --output=../logs/busco_%j.out
#SBATCH --error=../logs/busco_%j.err

module load BUSCO

busco \
-i ../assembly/canu/e_faecium.contigs.fasta \
-o busco_output \
-l bacteria_odb10 \
-m genome \
--cpu 4 \
--out_path ../assembly_evaluation/busco
