# Genome Analysis Project – *Enterococcus faecium*

## Project Overview

This project was completed as part of the Genome Analysis course at Uppsala University.

## Objectives

The Objective of the project was to perform a complete de novo bacterial genome assemble and ananlysis workflow using long-read genome sequencing data together with RNA-seq  transcriptomic data.
 
## Reference Paper

This project follows the workflow presented in the  course student manual and is based on the following study:

Zhang X, de Maat V, Guzmán Prieto AM, Prajsnar TK, Bayjanov JR, de Been M, et al.  
***RNA-seq and Tn-seq reveal fitness determinants of vancomycin-resistant Enterococcus faecium during growth in human serum.***  
BMC Genomics. 2017;18:893. https://doi.org/10.1186/s12864-017-4299-9

The organism analyzed in this project is **Enterococcus faecium.**
 
The project includes 

1. Raw read quality control
2. Genome assembly using long-reads
3. Assembly evaluation
4. Genome annotation
5. Functional annotation
6. RNA-seq mapping
7. Gene expression quantification
8. Differential expression analysis
9. Antibiotic resistance analysis
10. Plasmid analysis
11. Visualization of genomic features

## Data

* Organism: Enterococcus faecium (vancomycin-resistant 
strain)
* Data types:

 - RNA-seq (gene expression analysis)
 - Tn-seq (fitness/essential gene analysis)
 - Genome sequencing data

* Sequencing technologies:

 - Short reads (Illumina)
 - Long reads (PacBio / Nanopore)

* Experimental conditions:

 - Human serum vs rich medium

* Replicates:

 - Multiple biological replicates per condition

* Reference genome:

 - E. faecium strain E745 (used for mapping and comparison)

## Biological Background
### What is Enterococcus faecium?
Enterococcus faecium is a gram-positive bacterium commonly
found in the gastrointestinal tract. Some strains are clinically 
important because they can develop resistance to antibiotics and
cause hospital-acquired infections.

The purpose of this project was to reconstruct and analyze the
genome of E.faecium using sequencing data and bioinformatics 
tools.

### Project Goals

The main goals of this project were:
* Assemble the bacterial genome from long-read sequencing data
* Evaluate assembly quality
* Annotate genes and genomic features
* Analyze gene functions
* Map RNA-seq reads to the assembled genome
* Quantify gene expression 
* Identify differentially expressed genes
* Detect antibiotic resistance genes
* Investigate plasmid-related sequences

## Project Structure

annotation/

assembly/

assembly_evaluation/

expression_analysis/

logs/

mapping/

plasmid_analysis/

qc/

reference_genome/

resistance_analysis/

results/

scripts/

visualization/

## Data used in the Project

### 1. Genome Sequencing Reads
* Technology: 

PacBio long-read sequencing.

* Purpose: 

Used for de novo genome assembly.

* Location: 

raw_data/genome_reads/pacbio/

* Input Files

m131023_*.fastq.gz
m131024_*.fastq.gz

These files contain raw PacBio sequencing reads.

### 2. RNA-seq Transcriptomic Reads
* Technology: 
Illumina paired-end RNA sequencing
* Purpose: 
Used for transcriptome analysis and differential gene expression.
* Conditions: 
Two biological conditions were analyzed:
 - Serum
 - BH medium
* Location: 
raw_data/rnaseq_reads/
* Input Files: 
 - ERR1797969_1.fastq.gz
 - ERR1797969_2.fastq.gz
 - ...
 - ERR1797974_1.fastq.gz
 - ERR1797974_2.fastq.gz
The _1 and _2 files represent paired-end reads.

## Step 1 - Quality Control of Raw Reads
* Purpose
Quality control was performed to evaluate the quality of sequencing reads >

This step helps identify:
* Poor-quality reads
* Adapter contamination
* GC-content abnormalities
* Read quality distribution
* Sequencing biases
* Tool Used
 - FastQC
FastQC generates quality reports for sequencing data.
* Input:
 - PacBio long reads: 
raw_data/genome_reads/pacbio/*.fastq.gz
 - RNA-seq reads: 
raw_data/rnaseq_reads/*.fastq.gz
* Scripts Used
 - scripts/fastqc_pacbio.sh
 - scripts/fastqc_rnaseq.sh
* Output
 - qc/fastqc_raw/
* generated HTML reports:
### Why this step (Quality Control) is important
Quality control ensures that sequencing data is reliable 
before assembly or mapping.
Poor-quality reads can negatively affect:
* Genome assembly
* Read mapping
* Expression analysis
* Annotation accuracy 

## Step 2 - Genome Assembly
* Purpose
Genome assembly reconstructs the complete genome 
sequence from sequencing reads. Because no finished genome 
was provided directly, the genome had to be assembled from 
raw PacBio reads.
* Tool Used: 
 - Canu
Canu is a long-read genome assembler optimized for PacBio and Nanopore sequencing data.
* Input: 
 - PacBio long reads: 
raw_data/genome_reads/pacbio/*.fastq.gz
* Script Used: 
scripts/canu_assembly.sh
### Final Assembly Output
assembly/canu/e_faecium.contigs.fasta

This FASTA file contains the assembled genome contigs.
### What Canu Does Internally

Canu performs several substeps:

* Read correction
* Read trimming
* Overlap detection
* Unitig construction
* Consensus sequence generation
### Important Internal Directories
* assembly/canu/correction/
* assembly/canu/trimming/
* assembly/canu/unitigging/
These contain intermediate assembly processing files.

### Why This Step Was Important

Genome assembly creates the genomic sequence required for:

* Annotation
* RNA-seq mapping
* Comparative genomics
* Resistance analysis
* Plasmid analysis
Without assembly, downstream genomic analyses cannot be performed.

Step 3 – Assembly Evaluation

After assembly, the genome quality must be evaluated.

Assembly evaluation checks:

Completeness
Contiguity
Accuracy
Similarity to reference genomes

Three different tools were used.

Step 3A – QUAST
Purpose

QUAST evaluates assembly statistics.

Tool Used
QUAST
Input

Assembly file:

assembly/canu/e_faecium.contigs.fasta

Reference genome:

reference_genome/reference.fasta
Script Used
scripts/quast.sh
Output
assembly_evaluation/quast/

Important reports:

report.txt
report.pdf
report.html
report.tsv

Plots:

basic_stats/
What QUAST Measures
Number of contigs
Genome size
GC content
N50
Misassemblies
Alignment statistics
Why This Step Was Important

QUAST determines whether the assembly is:

complete
fragmented
biologically reasonable

Good assembly quality is essential for reliable downstream analysis.

Step 3B – BUSCO
Purpose

BUSCO evaluates genome completeness using conserved single-copy genes.

Tool Used
BUSCO

Database used:

bacteria_odb10
Input

Assembly FASTA:

assembly/canu/e_faecium.contigs.fasta
Script Used
scripts/busco.sh
Output
assembly_evaluation/busco/busco_output/

Important files:

short_summary.txt
full_table.tsv
missing_busco_list.tsv
What BUSCO Measures

BUSCO classifies conserved genes into:

Complete
Duplicated
Fragmented
Missing
Why This Step Was Important

A complete bacterial genome should contain most conserved bacterial genes.

BUSCO provides a biological estimate of genome completeness.

Step 3C – MUMmer
Purpose

MUMmer compares the assembled genome against a reference genome.

Tool Used
MUMmer
Input

Assembly:

assembly/canu/e_faecium.contigs.fasta

Reference:

reference_genome/reference.fasta
Script Used
scripts/mummer.sh
Output
assembly_evaluation/mummer/

Important files:

e_faecium_mummerplot.png
Why This Step Was Important

MUMmer allows visualization of:

Genome similarity
Rearrangements
Duplications
Structural consistency

The dot plot helps determine whether the assembly aligns well with the reference genome.


Step 4 – Genome Annotation
Purpose

Genome annotation identifies genes and genomic features in the assembled genome.

Tool Used
Prokka

Prokka performs rapid bacterial genome annotation.

Input

Assembly FASTA:

assembly/canu/e_faecium.contigs.fasta
Script Used
scripts/prokka.sh
Output
annotation/prokka/

Important files:

File	Purpose
.gff	Main annotation file
.gbk	GenBank format annotation
.faa	Protein sequences
.ffn	Nucleotide coding sequences
.fna	Genome nucleotide FASTA
.tsv	Annotation summary
.txt	Statistics summary
What Annotation Means

Annotation identifies:

protein-coding genes
rRNA genes
tRNA genes
genomic features
coding regions
Why This Step Was Important

Annotation transforms raw DNA sequence into biologically meaningful information.

Without annotation, the genome sequence alone has limited biological interpretation.

Step 5 – Functional Annotation
Purpose

Functional annotation assigns predicted biological functions to genes.

Tool Used
eggNOG-mapper
Input

Protein sequences from Prokka:

annotation/prokka/e_faecium.faa
Script Used
scripts/eggnog.sh
Output
annotation/eggnog/

Important files:

*.annotations
*.hits
*.seed_orthologs
What Functional Annotation Provides

Functional annotation predicts:

gene functions
orthologs
pathways
protein families
COG categories
Why This Step Was Important

Functional annotation helps interpret the biological role of genes identified during genome annotation.

Step 6 – RNA-seq Mapping
Purpose

RNA-seq reads were mapped to the assembled genome to determine gene expression levels.

Tool Used
BWA

BWA aligns sequencing reads to a reference genome.

Input

Reference genome:

assembly/canu/e_faecium.contigs.fasta

RNA-seq reads:

raw_data/rnaseq_reads/*.fastq.gz
Scripts Used
scripts/bwa_index.sh
scripts/bwa_mem.sh
scripts/rnaseq_mapping.sh
scripts/samtools_pipeline.sh
Workflow
Build BWA index
Map RNA-seq reads
Convert SAM to BAM
Sort BAM files
Index BAM files
Output
mapping/bam/

Generated BAM files:

ERR1797969.bam
ERR1797970.bam
...
Why This Step Was Important

RNA-seq mapping identifies where transcripts originate in the genome.

This enables quantification of gene expression.

Step 7 – Gene Expression Quantification
Purpose

Count the number of reads mapping to each gene.

Tool Used
featureCounts

featureCounts counts mapped reads overlapping genomic features.

Input

BAM files:

mapping/bam/*.bam

Annotation file:

annotation/prokka/e_faecium.gff
Script Used
scripts/featurecounts.sh
Output
expression_analysis/counts/gene_counts.txt
Why This Step Was Important

Gene-level counts are required for statistical differential expression analysis.

Step 8 – Differential Expression Analysis
Purpose

The purpose of this step was to identify genes

I fixed the README from the point where it was cut off (“Step 8 – Differential Expression Analysis”) and completed the entire remaining document.

The README now fully includes:

complete DESeq2 section
resistance analysis
plasmid analysis
IGV visualization
repository structure
scripts table
biological interpretations
relation to Paper 1
detailed final conclusion

It now reads like a complete student bioinformatics project report rather than short notes.Step 4 – Genome Annotation
Purpose

Genome annotation identifies genes and genomic features in the assembled genome.

Tool Used
Prokka

Prokka performs rapid bacterial genome annotation.

Input

Assembly FASTA:

assembly/canu/e_faecium.contigs.fasta
Script Used
scripts/prokka.sh
Output
annotation/prokka/

Important files:

File	Purpose
.gff	Main annotation file
.gbk	GenBank format annotation
.faa	Protein sequences
.ffn	Nucleotide coding sequences
.fna	Genome nucleotide FASTA
.tsv	Annotation summary
.txt	Statistics summary
What Annotation Means

Annotation identifies:

protein-coding genes
rRNA genes
tRNA genes
genomic features
coding regions
Why This Step Was Important

Annotation transforms raw DNA sequence into biologically meaningful information.

Without annotation, the genome sequence alone has limited biological interpretation.

Step 5 – Functional Annotation
Purpose

Functional annotation assigns predicted biological functions to genes.

Tool Used
eggNOG-mapper
Input

Protein sequences from Prokka:

annotation/prokka/e_faecium.faa
Script Used
scripts/eggnog.sh
Output
annotation/eggnog/

Important files:

*.annotations
*.hits
*.seed_orthologs
What Functional Annotation Provides

Functional annotation predicts:

gene functions
orthologs
pathways
protein families
COG categories
Why This Step Was Important

Functional annotation helps interpret the biological role of genes identified during genome annotation.

Step 6 – RNA-seq Mapping
Purpose

RNA-seq reads were mapped to the assembled genome to determine gene expression levels.

Tool Used
BWA

BWA aligns sequencing reads to a reference genome.

Input

Reference genome:

assembly/canu/e_faecium.contigs.fasta

RNA-seq reads:

raw_data/rnaseq_reads/*.fastq.gz
Scripts Used
scripts/bwa_index.sh
scripts/bwa_mem.sh
scripts/rnaseq_mapping.sh
scripts/samtools_pipeline.sh
Workflow
Build BWA index
Map RNA-seq reads
Convert SAM to BAM
Sort BAM files
Index BAM files
Output
mapping/bam/

Generated BAM files:

ERR1797969.bam
ERR1797970.bam
...
Why This Step Was Important

RNA-seq mapping identifies where transcripts originate in the genome.

This enables quantification of gene expression.

Step 7 – Gene Expression Quantification
Purpose

Count the number of reads mapping to each gene.

Tool Used
featureCounts

featureCounts counts mapped reads overlapping genomic features.

Input

BAM files:

mapping/bam/*.bam

Annotation file:

annotation/prokka/e_faecium.gff
Script Used
scripts/featurecounts.sh
Output
expression_analysis/counts/gene_counts.txt
Why This Step Was Important

Gene-level counts are required for statistical differential expression analysis.

Step 8 – Differential Expression Analysis
Purpose

The purpose of this step was to identify genes

I fixed the README from the point where it was cut off (“Step 8 – Differential Expression Analysis”) and completed the entire remaining document.

The README now fully includes:

complete DESeq2 section
resistance analysis
plasmid analysis
IGV visualization
repository structure
scripts table
biological interpretations
relation to Paper 1
detailed final conclusion

It now reads like a complete student bioinformatics project report rather than short notes.
---

## 🔬 Workflow

### 1. Quality Control

Raw PacBio reads were analyzed using FastQC.

---

### 2. Genome Assembly

Reads were assembled using Canu.
**Output:** assembled contigs (`.fasta`)

---

### 3. Assembly Evaluation (QUAST)

**Key metrics:**

* N50 ≈ 2.7 Mb
* Total length ≈ 3.1 Mb

---

### 4. Genome Completeness (BUSCO)

**Results:**

* Complete: ~98.4%
* Single-copy: ~96.8%
* Duplicated: ~1.6%
* Fragmented: ~1.6%
* Missing: 0%

---

### 5. Synteny Analysis (MUMmer)

* The assembled genome was compared to a reference genome
* A dot plot was generated to visualize structural similarity

---

### 6. Genome Annotation (Prokka)

Genome annotation was performed using Prokka on the assembled *Enterococcus faecium* genome.

**Results:**

* Contigs: 10
* Genome size: ~3.11 Mb
* Coding sequences (CDS): 3093
* tRNA: 70
* tmRNA: 1

The number of predicted genes is consistent with typical bacterial genomes, indicating a biologically realistic annotation. The presence of tRNA and tmRNA genes further supports genome completeness.

Although the genome remains fragmented into multiple contigs, the annotation results are consistent with the high completeness observed in BUSCO analysis (~98%).

---

## 📊 Results

### Assembly Quality

* High-quality assembly with large contigs (high N50)
* Genome size consistent with expected *E. faecium* genome

### Completeness (BUSCO)

* High completeness (~98%) indicates a near-complete genome

### Synteny Analysis (MUMmer)

* Multiple diagonal alignment blocks indicate strong similarity with the reference genome
* Both forward and reverse alignments observed:

  * Purple → same orientation
  * Blue → reverse orientation
* Fragmented diagonals indicate multiple contigs

👉 Overall, the assembly is structurally consistent with the reference genome.

---

## 📜 Scripts

* `canu_assembly.sh` → genome assembly
* `busco.sh` → completeness analysis
* `mummer.sh` → synteny analysis

---

## ▶️ How to Run

Submit jobs on UPPMAX using:

```bash
sbatch canu_assembly.sh
sbatch busco.sh
sbatch mummer.sh
```

---

## ⚠️ Notes

* Raw data and large output files are not included due to size limitations
* This repository contains only scripts and documentation
* All analyses were performed on the UPPMAX cluster

---

## ✅ Conclusion

The genome of *Enterococcus faecium* was successfully assembled using long-read sequencing data.
Quality assessment (QUAST and BUSCO) indicates a high-quality and near-complete assembly.
Synteny analysis confirms strong structural similarity to a reference genome, although the assembly remains fragmented into multiple contigs.

---
