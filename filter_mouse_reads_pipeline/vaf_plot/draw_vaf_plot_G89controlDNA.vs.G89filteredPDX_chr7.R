

#Create VAF scatter plot

##1=/home/julyin/genome_gbm_variant_calling/strelka_VEP_annotated/G89controlDNA.vs.G89HFMTissue.passed.somatic.snvs.VEP.vcf
##2=/home/julyin/genome_gbm_variant_calling/strelka_VEP_annotated/G89controlDNA.vs.G89PDX.passed.somatic.snvs.VEP.vcf
#Chromosome,Position,Effect,Gene(s),SGT1,QSS1,VAF1_T1,VAF1_T2,DP1_T1,DP1_T2,SGT2,QSS2,VAF2_T1,VAF2_T2,DP2_T1,DP2_T2


#setwd("Z:/julyin/xenograft_G89_project/strelka/")
library("ggplot2")

# Name of samples
name <- "G89"

# Read in raw VEP vaf file
vaf_raw <- read.csv("chr7_VAFs-control-G89HFMTissue-G89filteredPDX-passed.somatic.snvs.csv", sep=",", header = T, stringsAsFactors = FALSE, skip = 2)

#chr_names <- c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "22", "X", "Y")
chr_names <- "chr7"


# Only plot variants with chromosomes 1-22, X, Y. Take out the unknown chromosomes.
vaf <- vaf_raw[vaf_raw$Chromosome %in% chr_names, ]


# Change levels to be in the same order as the chromosomes. Without this step, the chromosomes are plotted inthe wrong order.
#vaf$Chromosome = factor(vaf$Chromosome,levels=chr_names)

# Create own colour palette
# https://en.wikipedia.org/wiki/Help:Distinguishable_colors#cite_note-2
#cbPalette <- c("#0075DC", "#993F00", "#4C005C", "#191919", "#005C31", "#2BCE48", "#808080", "#94FFB5", "#8F7C00", "#9DCC00", 
#               "#C20088", "#F0A3FF", "#FFA405", "#FFA8BB", "#426600", "#FF0010", "#5EF1F2", "#00998F", "#E0FF66", "#740AFF",
#               "#FFFF00", "#990000", "#FF5005", "#2CA25F")



# Plot VAF tumour 1 vs VAF tumour 2
png("VAF_patient_vs_PDXfiltered_chr7.png", width=15, height=15, units="in", res=400)
#ggplot(vaf, aes(x = VAF1_T1, y = VAF2_T1, color = Chromosome)) + geom_point(shape=19) +
#    scale_colour_manual(values=cbPalette) + 
#    xlab("G89HFMTissue") + ylab("G89PDX_filtered") + ggtitle("G89 vs G89PDX_filteredmouse")


ggplot(vaf, aes(x = VAF2_T1, y = VAF1_T1)) + geom_point(shape=19) + xlab("G89HFMTissue") + ylab("G89PDX_filtered") + ggtitle("G89 vs G89PDX_filteredmouse")


dev.off() 







