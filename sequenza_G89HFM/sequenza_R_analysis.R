

#setwd("/share/ClusterScratch/julyin/sequenza_G89/bigger_binned_seqz/")
setwd("/share/ScratchGeneral/julyin/G89/sequenza_normal_vs_mousefilt/results")

library(sequenza)

#data.file <- "all.G89controlDNA.vs.G89HFMTissueDNA.seqz.gz"
data.file <- "all.G89controlDNA.vs.G89PDX_mousefilt.seqz.gz"

extracted = sequenza.extract(data.file, kmin = 500)
fitted = sequenza.fit(extracted, female = TRUE)
results = sequenza.results(extracted, fitted, out.dir = "sequenza_G89PDX_mousefilt_result", sample.id = "G89PDX_mousefilt")

save.image("sequenza_analysis.RData")



