#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 4
#SBATCH -t 01:00:00
#SBATCH -J samtools_pipeline
#SBATCH --output=samtools.%j.out
#SBATCH --error=samtools.%j.err

module load SAMtools/1.22.1-GCC-13.3.0

# Input
SAM=aligned.sam

# Outputs
BAM=aligned.bam
SORTED=aligned.sorted.bam

# Convert SAM → BAM
samtools view -bS $SAM > $BAM

# Sort BAM
samtools sort -@ 4 $BAM -o $SORTED

# Index BAM
samtools index $SORTED
