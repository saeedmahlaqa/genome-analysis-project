#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=32G
#SBATCH -t 12:00:00
#SBATCH -J eggnog
#SBATCH --mail-type=ALL
#SBATCH --output=../logs/eggnog_%j.out
#SBATCH --error=../logs/eggnog_%j.err

module load eggnog-mapper/2.1.13-gfbf-2024a

emapper.py \
-i ../annotation/prokka/e_faecium.faa \
--output e_faecium_eggnog \
--output_dir ../annotation/eggnog \
--data_dir /proj/uppmax2026-1-61/nobackup/$USER/eggnog_db \
--cpu 4
