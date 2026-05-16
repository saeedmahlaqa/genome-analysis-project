#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 4
#SBATCH -t 02:00:00
#SBATCH -J bwa_mem
#SBATCH --output=bwa_mem.%j.out
#SBATCH --error=bwa_mem.%j.err

module load BWA/0.7.19-GCCcore-13.3.0

# Genome (your assembly)
GENOME=~/Individual-Project-/analyses/01_genome_assembly/assembly_output/e_faecium.contigs.fasta

# Reads (RNA-seq)
READ1=/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/raw/ERR1797972_1.fastq.gz
READ2=/proj/uppmax2026-1-61/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/raw/ERR1797972_2.fastq.gz

# Output
OUT=~/Individual-Project-/genome-analysis-project/B5_mapping/aligned.sam

bwa mem -t 4 $GENOME $READ1 $READ2 > $OUT
