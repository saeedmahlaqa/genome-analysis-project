# Genome Analysis Project – *Enterococcus faecium*

## Project Overview

This project was completed as part of the Genome Analysis course at Uppsala University.

## Reference Paper
The project follows the workflow presented in the course student manual and is based on the following study:

Zhang X, de Maat V, Guzmán Prieto AM, Prajsnar TK, Bayjanov JR, de Been M, et al.   ***RNA-seq and Tn-seq reveal fitness determinants of vancomycin-resistant Enterococcus faecium during growth in human serum.***  BMC Genomics. 2017;18:893.  https://doi.org/10.1186/s12864-017-4299-9

---
## Objectives
The objective of this project was to perform a complete de novo bacterial genome assembly and analysis workflow using long-read genome sequencing data together with RNA-seq transcriptomic data. The project included:

1. Raw read quality control
2. Genome assembly using long reads
3. Assembly evaluation
4. Genome annotation
5. Functional annotation
6. RNA-seq mapping
7. Gene expression quantification
8. Differential expression analysis
9. Antibiotic resistance analysis
10. Plasmid analysis
11. Visualization of genomic features

---

## Biological Background

## What is *Enterococcus faecium*?

*Enterococcus faecium* is a gram-positive bacterium commonly found in the gastrointestinal tract. Some strains are clinically important because they can develop resistance to antibiotics and cause hospital-acquired infections.

Vancomycin-resistant *Enterococcus faecium* (VRE) strains are especially important in clinical microbiology because they are associated with multidrug resistance and bloodstream infections.

The purpose of this project was to reconstruct and analyze the genome of *E. faecium* using sequencing data and bioinformatics tools.

## Data Used in the Project

## 1. Genome Sequencing Reads

### Technology
PacBio long-read sequencing

### Purpose
Used for de novo genome assembly.

### Location

```bash
raw_data/genome_reads/pacbio/
````

### Input Files

```bash
m131023_*.fastq.gz
m131024_*.fastq.gz
```

These files contain raw PacBio sequencing reads.

## 2. RNA-seq Transcriptomic Reads

### Technology

Illumina paired-end RNA sequencing

### Purpose

Used for transcriptome analysis and differential gene expression analysis.

### Experimental Conditions

Two biological conditions were analyzed:

1. Human serum
2. BH medium

### Location

```bash
raw_data/rnaseq_reads/
```

### Input Files

```bash
ERR1797969_1.fastq.gz
ERR1797969_2.fastq.gz
...
ERR1797974_1.fastq.gz
ERR1797974_2.fastq.gz
```

The `_1` and `_2` files represent paired-end reads.

---

## Project Repository Structure

```bash
genome-analysis-project/
├── annotation
│   ├── eggnog
│   │   ├── e_faecium_eggnog.emapper.annotations
│   │   ├── e_faecium_eggnog.emapper.hits
│   │   ├── eggnog.taxa.db
│   │   ├── eggnog.taxa.db.traverse.pkl
│   │   └── e_faecium_eggnog.emapper.seed_orthologs
│   └── prokka
│       ├── e_faecium.faa
│       ├── e_faecium.ffn
│       ├── e_faecium.fna
│       ├── e_faecium.fsa
│       ├── e_faecium.gbk
│       ├── e_faecium.err
│       ├── e_faecium.log
│       ├── e_faecium.gff
│       ├── e_faecium.tbl
│       ├── e_faecium.tsv
│       ├── e_faecium.txt
│       └── e_faecium_clean.gff
│
├── assembly
│   ├── canu
│   │   ├── correction/
│   │   ├── trimming/
│   │   ├── unitigging/
│   │   ├── e_faecium.contigs.fasta
│   │   ├── e_faecium.report
│   │   └── tig00000005.fasta
│   └── final_assembly
│
├── assembly_evaluation
│   ├── busco
│   │   └── busco_output
│   │       ├── full_table.tsv
│   │       ├── short_summary.txt
│   │       └── missing_busco_list.tsv
│   ├── mummer
│   │   ├── e_faecium.delta
│   │   └── e_faecium_mummerplot.png
│   └── quast
│       ├── basic_stats/
│       ├── report.pdf
│       ├── report.html
│       ├── report.tsv
│       └── report.txt
│
├── expression_analysis
│   ├── counts
│   │   ├── gene_counts.txt
│   │   └── gene_counts.txt.summary
│   └── deseq2
│       ├── deseq2_results.csv
│       ├── MAplot.pdf
│       └── VolcanoPlot.pdf
│
├── logs
│   ├── busco_5302643.out
│   ├── canu_assembly_5302578.out
│   ├── deseq2_5409137.out
│   ├── featurecounts_5324024.out
│   ├── mummer_5302654.out
│   ├── prokka_5302674.out
│   └── rnaseq_mapping_5304746.out
│
├── mapping
│   ├── bam
│   │   ├── ERR1797969.bam
│   │   ├── ERR1797970.bam
│   │   ├── ERR1797971.bam
│   │   ├── ERR1797972.bam
│   │   ├── ERR1797973.bam
│   │   └── ERR1797974.bam
│   ├── bwa_index
│   ├── rnaseq_mapping
│   └── tnseq_mapping
│
├── plasmid_analysis
│   └── blast
│       └── results
│           └── blast_tig00000005.csv
│
├── qc
│   ├── fastqc_raw
│   │   ├── pacbio/
│   │   └── rnaseq/
│   ├── fastqc_trimmed
│   └── multiqc
│
├── raw_data
│   ├── genome_reads
│   │   ├── illumina
│   │   ├── nanopore
│   │   └── pacbio
│   ├── rnaseq_reads
│   └── tnseq_reads
│
├── reference_genome
│   └── reference.fasta
│
├── resistance_analysis
│   └── resfinder
│       └── results_files
│           ├── ResFinder_results.txt
│           ├── PointFinder_results.txt
│           ├── pheno_table.txt
│           └── output.json
│
├── results
│   ├── figures
│   ├── final_results
│   └── tables
│
├── scripts
│   ├── busco.sh
│   ├── bwa_index.sh
│   ├── canu_assembly.sh
│   ├── deseq2_analysis.R
│   ├── eggnog.sh
│   ├── fastqc_pacbio.sh
│   ├── fastqc_rnaseq.sh
│   ├── featurecounts.sh
│   ├── mummer.sh
│   ├── prokka.sh
│   ├── quast.sh
│   ├── rnaseq_mapping.sh
│   └── samtools_pipeline.sh
│
├── trimmed_data
│   ├── genome_reads
│   └── rnaseq_reads
│
└── visualization
    └── igv
        └── igv_snapshot.png

```
---

# Step 1 – Quality Control of Raw Reads

## Purpose

Quality control was performed to evaluate sequencing read quality before downstream analysis.

This step helps identify:

* poor-quality reads
* GC-content abnormalities
* sequencing biases
* read quality distribution
* possible contamination

## Tool Used

### FastQC

FastQC generates quality reports for sequencing data.

## Input

### PacBio reads

```bash
raw_data/genome_reads/pacbio/*.fastq.gz
```

### RNA-seq reads

```bash
raw_data/rnaseq_reads/*.fastq.gz
```

## Scripts Used

```bash
scripts/fastqc_pacbio.sh
scripts/fastqc_rnaseq.sh
```

## Output

```bash
qc/fastqc_raw/
```

Generated output:

* HTML quality reports

---

### Why This Step Was Important

Quality control ensures sequencing data is reliable before assembly or mapping.

Poor-quality reads can negatively affect:

* genome assembly
* read mapping
* annotation accuracy
* differential expression analysis

---

# Step 2 – Genome Assembly

## Purpose

Genome assembly reconstructs the genome sequence from raw sequencing reads.

Because no finished genome was directly provided, the genome had to be assembled from PacBio long reads.

## Tool Used

### Canu

Canu is a long-read genome assembler optimized for PacBio and Nanopore sequencing technologies.

## Input

```bash
raw_data/genome_reads/pacbio/*.fastq.gz
```

## Script Used

```bash
scripts/canu_assembly.sh
```

## Final Assembly Output

```bash
assembly/canu/e_faecium.contigs.fasta
```

This FASTA file contains assembled genome contigs.

## Internal Canu Steps

Canu performs several internal processes:

* read correction
* read trimming
* overlap detection
* unitig construction
* consensus generation

## Important Internal Directories

```bash
assembly/canu/correction/
assembly/canu/trimming/
assembly/canu/unitigging/
```

These contain intermediate assembly files.

## Why This Step Was Important

Genome assembly creates the genomic sequence required for:

* annotation
* RNA-seq mapping
* resistance analysis
* comparative genomics
* plasmid analysis

Without assembly, downstream genomic analyses cannot be performed.

---

# Step 3 – Assembly Evaluation

After assembly, genome quality must be evaluated.

Assembly evaluation checks:

* completeness
* contiguity
* structural consistency
* similarity to reference genomes

Three tools were used:

1. QUAST
2. BUSCO
3. MUMmerPlot

## Step 3A – QUAST

## Purpose

QUAST evaluates assembly statistics and assembly quality.

## Tool Used

QUAST

## Input

### Assembly

```bash
assembly/canu/e_faecium.contigs.fasta
```

### Reference Genome

```bash
reference_genome/reference.fasta
```

## Script Used

```bash
scripts/quast.sh
```

## Output

```bash
assembly_evaluation/quast/
```

Important reports:

* report.txt
* report.pdf
* report.html
* report.tsv

Plots:

```bash
basic_stats/
```

## What QUAST Measures

QUAST reports:

* number of contigs
* genome size
* GC content
* N50
* alignment statistics
* assembly fragmentation

## Why This Step Was Important

QUAST determines whether the assembly is:

* complete
* fragmented
* biologically realistic

Good assembly quality is essential for reliable downstream analysis.

---

# Step 3B – BUSCO

## Purpose

BUSCO evaluates genome completeness using conserved single-copy genes.

## Tool Used

BUSCO

Database used:

```bash
bacteria_odb10
```

## Input

```bash
assembly/canu/e_faecium.contigs.fasta
```

## Script Used

```bash
scripts/busco.sh
```

## Output

```bash
assembly_evaluation/busco/busco_output/
```

Important files:

* short_summary.txt
* full_table.tsv
* missing_busco_list.tsv

## What BUSCO Measures

BUSCO classifies conserved genes into:

* Complete
* Duplicated
* Fragmented
* Missing

## Important Results

* Complete BUSCOs: ~98%
* Missing BUSCOs: very low

These results indicate a highly complete bacterial genome assembly.

## Why This Step Was Important

A complete bacterial genome should contain most conserved bacterial genes.

BUSCO provides a biological estimate of genome completeness.

---

# Step 3C – MUMmer

## Purpose

MUMmer compares the assembled genome against a reference genome.

## Tool Used

MUMmer

## Input

### Assembly

```bash
assembly/canu/e_faecium.contigs.fasta
```

### Reference

```bash
reference_genome/reference.fasta
```

## Script Used

```bash
scripts/mummer.sh
```

## Output

```bash
assembly_evaluation/mummer/
```

Important file:

```bash
e_faecium_mummerplot.png
```

## Why This Step Was Important

MUMmer allows visualization of:

* genome similarity
* rearrangements
* structural consistency
* inversions
* duplications

The dot plot helps determine whether the assembly aligns well with the reference genome.

---

# Step 4 – Genome Annotation

## Purpose

Genome annotation identifies genes and genomic features in the assembled genome.

## Tool Used

Prokka

Prokka performs rapid bacterial genome annotation.

## Input

```bash
assembly/canu/e_faecium.contigs.fasta
```
## Script Used

```bash
scripts/prokka.sh
```

## Output

```bash
annotation/prokka/
```

Important files:

| File   | Purpose                     |
| ------ | --------------------------- |
| `.gff` | Main annotation file        |
| `.gbk` | GenBank annotation          |
| `.faa` | Protein sequences           |
| `.ffn` | Coding nucleotide sequences |
| `.fna` | Genome FASTA                |
| `.tsv` | Annotation summary          |
| `.txt` | Statistics summary          |

## What Annotation Means

Annotation identifies:

* protein-coding genes
* rRNA genes
* tRNA genes
* genomic features
* coding regions

## Important Results

* ~3093 coding sequences
* ~70 tRNA genes
* 1 tmRNA detected

These values are consistent with typical *Enterococcus faecium* genomes.

## Why This Step Was Important

Annotation transforms raw DNA sequence into biologically meaningful information.

Without annotation, genome sequences alone have limited biological interpretation.

---

# Step 5 – Functional Annotation

## Purpose

Functional annotation assigns predicted biological functions to genes.

---

## Tool Used

eggNOG-mapper

## Input

Protein sequences from Prokka:

```bash
annotation/prokka/e_faecium.faa
```

## Script Used

```bash
scripts/eggnog.sh
```

## Output

```bash
annotation/eggnog/
```

Important files:

* `*.annotations`
* `*.hits`
* `*.seed_orthologs`

## What Functional Annotation Provides

Functional annotation predicts:

* gene functions
* orthologs
* pathways
* protein families
* COG categories

## Why This Step Was Important

Functional annotation helps interpret the biological roles of predicted genes.

# Step 6 – RNA-seq Mapping

## Purpose

RNA-seq reads were mapped to the assembled genome to determine gene expression levels.

## Tool Used

BWA

BWA aligns sequencing reads to a reference genome.

## Input

### Reference Genome

```bash
assembly/canu/e_faecium.contigs.fasta
```

### RNA-seq Reads

```bash
raw_data/rnaseq_reads/*.fastq.gz
```

## Scripts Used

```bash
scripts/bwa_index.sh
scripts/rnaseq_mapping.sh
scripts/samtools_pipeline.sh
```

## Workflow

1. Build BWA index
2. Map RNA-seq reads
3. Convert SAM to BAM
4. Sort BAM files
5. Index BAM files

## Output

```bash
mapping/bam/
```

Generated BAM files:

```bash
ERR1797969.bam
ERR1797970.bam
...
```

## Why This Step Was Important

RNA-seq mapping identifies where transcripts originate in the genome.

This enables quantification of gene expression.

---

# Step 7 – Gene Expression Quantification

## Purpose

Count the number of reads mapping to each gene.

## Tool Used

featureCounts

featureCounts counts mapped reads overlapping genomic features.

## Input

### BAM Files

```bash
mapping/bam/*.bam
```

### Annotation File

```bash
annotation/prokka/e_faecium.gff
```

## Script Used

```bash
scripts/featurecounts.sh
```

## Output

```bash
expression_analysis/counts/gene_counts.txt
```

## Why This Step Was Important

Gene-level counts are required for statistical differential expression analysis.

---

# Step 8 – Differential Expression Analysis

## Purpose

The purpose of this step was to identify genes that were significantly upregulated or downregulated between biological conditions.

## Tool Used

DESeq2

DESeq2 performs statistical analysis of RNA-seq count data.

## Input

```bash
expression_analysis/counts/gene_counts.txt
```

## Script Used

```bash
scripts/deseq2_analysis.R
```

## Output

```bash
expression_analysis/deseq2/
```

Important files:

* deseq2_results.csv
* MAplot.pdf
* VolcanoPlot.pdf

## Biological Interpretation

Genes with positive log2FoldChange values are upregulated, while negative values are downregulated.

Differentially expressed genes may be involved in:

* stress response
* metabolism
* serum adaptation
* virulence
* resistance mechanisms

---

# Step 9 – Resistance Gene Analysis

## Purpose

Resistance analysis was performed to identify antimicrobial resistance genes within the assembled genome.

## Tool Used

ResFinder

## Output

```bash
resistance_analysis/resfinder/
```

Important files:

* ResFinder_results.txt
* PointFinder_results.txt
* pheno_table.txt


## Biological Interpretation

Detected resistance genes suggest multidrug resistance mechanisms within the *Enterococcus faecium* isolate.

The presence of vancomycin-associated resistance genes is consistent with the VRE strain described in the reference paper.

---

# Step 10 – Plasmid Analysis

## Purpose

BLAST analysis was performed to investigate plasmid-associated sequences.

## Tool Used

BLAST

## Output

```bash
plasmid_analysis/blast/results/
```

Important file:

```bash
blast_tig00000005.csv
```

## Biological Interpretation

Plasmid-associated regions may contain:

* resistance genes
* mobile genetic elements
* virulence-associated genes

---

# Step 11 – Visualization

## Purpose

Visualization was performed to inspect genomic alignments and mapped reads.

## Tool Used

IGV (Integrative Genomics Viewer)

## Output

```bash
visualization/igv/igv_snapshot.png
```

# Main Results Summary

## Assembly Quality

* Genome size ≈ 3.1 Mb
* High N50 value
* Multiple large contigs assembled

---

## BUSCO Completeness

* ~98% complete BUSCO genes
* Indicates near-complete genome assembly

---

## Annotation

* ~3093 coding sequences identified
* Multiple tRNA genes detected

---

## Resistance Analysis

Multiple resistance-associated genes were identified, including genes linked to vancomycin resistance.

---

# Repository Contents

The repository contains:

* analysis scripts
* processed results
* plots
* annotation files
* assembly evaluation outputs
* differential expression outputs

Large intermediate files and raw sequencing data were excluded because of storage limitations.

---

# Conclusion

The genome of *Enterococcus faecium* was successfully assembled and analyzed using long-read sequencing and RNA-seq data.

Assembly evaluation using QUAST, BUSCO, and MUMmer indicated:

* high assembly quality
* strong genome completeness
* structural similarity to the reference genome

Genome annotation and functional annotation identified biologically meaningful genomic features and predicted gene functions.

RNA-seq analysis enabled investigation of gene expression changes, while resistance analysis identified clinically relevant antimicrobial resistance genes.

Overall, the project demonstrates a complete bacterial genome analysis workflow using modern bioinformatics tools and high-performance computing resources on UPPMAX.
