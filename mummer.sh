#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:15:00
#SBATCH -J mummer
#SBATCH --reservation=uppmax2026-1-61_5
#SBATCH --output=mummer.%j.out
#SBATCH --error=mummer.%j.err

module load MUMmer

REF=/home/mahla/Individual-Project-/analyses/01_genome_assembly/reference.fasta
QUERY=/home/mahla/Individual-Project-/analyses/01_genome_assembly/assembly_output/e_faecium.contigs.fasta

nucmer --prefix=efaecium $REF $QUERY
delta-filter -1 efaecium.delta > efaecium.filter.delta

mummerplot -R $REF -Q $QUERY --filter --fat --png efaecium.filter.delta -p efaecium_plot
