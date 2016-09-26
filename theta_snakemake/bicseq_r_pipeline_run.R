





bicseq <- BICseq(sample = sample.bam, reference = reference.bam, seqNames = c(1:22, "X", "Y"))


segs <- getBICseg(object = bicseq, bin = 100, lambda = 2, winSize = 200, quant = 0.95, mult = 1)


plot(segs, sampleName = "Demo", save = TRUE, plotBin=TRUE, chromOrder=c(1:22, "X", "Y"))

bins <- BICseq:::getRatios(bin(segs), what = "bin")

seg.summary <- BICseq:::getSummary(segs,correction=TRUE)

