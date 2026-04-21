#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 1
#SBATCH -c 2
#SBATCH --mem=32G
#SBATCH -t 06:00:00
#SBATCH -J busco
#SBATCH -o busco.out
#SBATCH -e busco.err

# Load singularity (NOT busco module)
module load singularity

# Run BUSCO using container
singularity exec /proj/uppmax2026-1-61/Genome_Analysis/busco.sif busco \
-i assembly_output/e_faecium.contigs.fasta \
-o busco_output \
-l bacteria_odb10 \
-m genome \
-c 2
