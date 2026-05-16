#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=16G
#SBATCH -t 06:00:00
#SBATCH -J rnaseq_map
#SBATCH --mail-type=ALL
#SBATCH --output=../logs/rnaseq_mapping_%j.out
#SBATCH --error=../logs/rnaseq_mapping_%j.err

module load BWA/0.7.19-GCCcore-13.3.0
module load SAMtools/1.21-GCC-13.3.0

cd ../raw_data/rnaseq_reads

for sample in ERR1797969 ERR1797970 ERR1797971 ERR1797972 ERR1797973 ERR1797974
do

    bwa mem -t 4 \
    ../../mapping/bwa_index/e_faecium \
    ${sample}_1.fastq.gz \
    ${sample}_2.fastq.gz | \
    samtools sort -@ 4 -m 2G -o ../../mapping/bam/${sample}.bam
    samtools index ../../mapping/bam/${sample}.bam

done
