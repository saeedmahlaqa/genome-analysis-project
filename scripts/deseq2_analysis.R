library(DESeq2)

# Read featureCounts output
counts <- read.table(
  "../expression_analysis/counts/gene_counts.txt",
  header=TRUE,
  row.names=1,
  check.names=FALSE
)

# Keep only count columns (6 samples)
countData <- counts[,6:11]

# Define conditions
condition <- factor(c(
  "Serum",
  "Serum",
  "Serum",
  "BHI",
  "BHI",
  "BHI"
))

# Sample metadata
colData <- data.frame(
  row.names=colnames(countData),
  condition
)

# Create DESeq dataset
dds <- DESeqDataSetFromMatrix(
  countData=countData,
  colData=colData,
  design=~condition
)

# Run differential expression analysis
dds <- DESeq(dds)

# Extract results
res <- results(dds)

# Order by adjusted p-value
resOrdered <- res[order(res$padj),]

# Save results
write.csv(
  as.data.frame(resOrdered),
  file="../expression_analysis/deseq2/deseq2_results.csv"
)

# MA plot
pdf("../expression_analysis/deseq2/MAplot.pdf")
plotMA(res, main="DESeq2 MA Plot")
dev.off()

# Volcano plot

pdf("../expression_analysis/deseq2/VolcanoPlot.pdf")

with(res, plot(log2FoldChange,
               -log10(padj),
               pch=20,
               main="DESeq2 Volcano Plot",
               xlab="log2 Fold Change",
               ylab="-log10 adjusted p-value",
               col=ifelse(padj < 0.05, "red", "gray")))

abline(v=c(-1,1), col="blue", lty=2)
abline(h=-log10(0.05), col="blue", lty=2)

dev.off()
