#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=16G
#SBATCH -t 02:00:00
#SBATCH -J featureCounts
#SBATCH --mail-type=ALL
#SBATCH --output=../logs/featurecounts_%j.out
#SBATCH --error=../logs/featurecounts_%j.err

module load Subread/2.1.1-GCC-13.3.0

featureCounts \
-T 2 \
-p \
-a ../annotation/prokka/e_faecium_clean.gff \
-o ../expression_analysis/counts/gene_counts.txt \
-t CDS \
-g ID \
../mapping/bam/ERR1797969.bam \
../mapping/bam/ERR1797970.bam \
../mapping/bam/ERR1797971.bam \
../mapping/bam/ERR1797972.bam \
../mapping/bam/ERR1797973.bam \
../mapping/bam/ERR1797974.bam
