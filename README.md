# Genome Analysis Project – *Enterococcus faecium*

## 🧬 Overview

This project performs **de novo genome assembly and analysis** of *Enterococcus faecium* using long-read sequencing data.

The main objectives are:

* Assemble a genome from raw PacBio reads
* Evaluate assembly quality
* Assess completeness
* Compare the assembled genome to a reference (synteny analysis)

All analyses were performed on the **UPPMAX (Pelle cluster)** using SLURM job scheduling.

---

## 📁 Data

* **Type:** PacBio long-read sequencing data
* **Organism:** *Enterococcus faecium*
* **Location:** UPPMAX cluster (not included in repository)

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

1. **Quality Control**

   * Raw PacBio reads were analyzed using FastQC

2. **Genome Assembly**

   * Reads were assembled using Canu
   * Output: assembled contigs (`.fasta`)

3. **Assembly Evaluation**

   * QUAST was used to compute statistics
   * Key metrics:

     * N50 ≈ 2.7 Mb
     * Total length ≈ 3.1 Mb

4. **Genome Completeness**

   * BUSCO (bacteria_odb10 lineage) was used
   * Results:

     * Complete: ~98.4%
     * Single-copy: ~96.8%
     * Duplicated: ~1.6%
     * Fragmented: ~1.6%
     * Missing: 0%

5. **Synteny Analysis**

   * The assembled genome was compared to a reference genome using MUMmer
   * A dot plot was generated to visualize structural similarity

6. **Genome Annotation (Prokka)**

Genome annotation was performed using Prokka on the assembled *Enterococcus faecium* genome.

**Results:**
- Contigs: 10 
- Genome size: ~3.11 Mb 
- Coding sequences (CDS): 3093 
- tRNA: 70 
- tmRNA: 1 

The number of predicted genes is consistent with typical bacterial genomes, indicating a biologically realistic annotation. The presence of tRNA and tmRNA genes further supports the completeness of the genome.

Although the genome remains fragmented into multiple contigs, the annotation results are consistent with the high completeness observed in BUSCO analysis (~98%).
---

## 📊 Results

### Assembly Quality

* High-quality assembly with large contigs (high N50)
* Genome size consistent with expected *E. faecium* genome

### Completeness (BUSCO)

* High completeness (~98%) indicates near-complete genome assembly

### Synteny Analysis (MUMmer)

* The dot plot shows multiple diagonal alignment blocks, indicating strong similarity with the reference genome
* Both forward (purple) and reverse (blue) alignments are observed:

  * Purple: same orientation
  * Blue: reverse orientation
* Fragmented diagonals suggest the assembly consists of multiple contigs
* Overall, the assembly is structurally consistent with the reference genome

---

## 📜 Scripts

* `canu_assembly.sh` → genome assembly
* `busco.sh` → completeness analysis
* `mummer.sh` → genome comparison (synteny)

---

## ▶️ How to Run

Submit jobs on UPPMAX using SLURM:

```bash
sbatch canu_assembly.sh
sbatch busco.sh
sbatch mummer.sh
```

---

## ⚠️ Notes

* Raw data and large output files are not included in this repository
* Only scripts and documentation are provided
* All analyses were performed on the UPPMAX cluster

---

## ✅ Conclusion

The genome of *Enterococcus faecium* was successfully assembled using long-read sequencing data.
Quality assessment (QUAST and BUSCO) indicates a high-quality and near-complete assembly.
Synteny analysis confirms strong structural similarity to a reference genome, although the assembly remains fragmented into multiple contigs.

---
