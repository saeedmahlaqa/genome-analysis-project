# Genome Analysis Project – *Enterococcus faecium*

## Project Overview

This project was completed as part of the Genome Analysis course
at Uppsala University.

## Objectives

The Objective of the project was to perform a complete de 
novo bacterial genome assemble and ananlysis workflow using 
long-read genome sequencing data together with RNA-seq 
transcriptomic data.
 
## Reference Paper

This project follows the workflow presented in the 
course student manual and is based on the following study:

Zhang X, de Maat V, Guzmán Prieto AM, Prajsnar TK, Bayjanov JR, de Been M, et al.  
*RNA-seq and Tn-seq reveal fitness determinants of vancomycin-resistant Enterococcus faecium during growth in human serum.*  
BMC Genomics. 2017;18:893. https://doi.org/10.1186/s12864-017-4299-9

The organism analyzed in this project is: 
 ** Enterococcus faecium**
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

*Organism: Enterococcus faecium (vancomycin-resistant strain)

*Data types:

** RNA-seq (gene expression analysis)
** Tn-seq (fitness/essential gene analysis)
** Genome sequencing data

* Sequencing technologies:
** Short reads (Illumina)
** Long reads (PacBio / Nanopore)

*Experimental conditions:

** Human serum vs rich medium
* Replicates:

** Multiple biological replicates per condition
* Reference genome:

** E. faecium strain E745 (used for mapping and comparison)

# Biological Background
## What is Enterococcus faecium?
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

# Data used in the Project

### 1. Genome Sequencing Reads
Technology: PacBio long-read sequencing.
Purpose: Used for de novo genome assembly.
Location: raw_data/genome_reads/pacbio/
Input Files
m131023_*.fastq.gz
m131024_*.fastq.gz

These files contain raw PacBio sequencing reads.

### 2. RNA-seq Transcriptomic Reads
Technology: Illumina paired-end RNA sequencing
Purpose: Used for transcriptome analysis and differential gene expression.
Conditions: Two biological conditions were analyzed:
* Serum
* BH medium
Location: raw_data/rnaseq_reads/
Input Files: 
ERR1797969_1.fastq.gz
ERR1797969_2.fastq.gz
...
ERR1797974_1.fastq.gz
ERR1797974_2.fastq.gz
The _1 and _2 files represent paired-end reads.




---

## 🛠️ Tools Used

| Step                | Tool                         | Purpose                         |
| ------------------- | ---------------------------- | ------------------------------- |
| Quality Control     | FastQC                       | Assess raw read quality         |
| Genome Assembly     | Canu                         | Assemble genome from long reads |
| Assembly Evaluation | QUAST                        | Evaluate assembly statistics    |
| Completeness        | BUSCO                        | Assess genome completeness      |
| Genome Comparison   | MUMmer (nucmer + mummerplot) | Synteny analysis                |
| Job Scheduling      | SLURM                        | Run jobs on UPPMAX              |

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
