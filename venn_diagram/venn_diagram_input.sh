


#To get list of unique mutations for venn diagram
#http://bioinformatics.psb.ugent.be/webtools/Venn/


<<-COM
OUT="/home/julyin/analysis/xenograft_scripts/venn_diagram"

DIR="/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89PDX/myAnalysis/results"
NAME="pdx_direct"

grep -v "#" $DIR/common_mutations_filtered_snvs/0000.vcf | awk '{print $1$2$4$5}' > $OUT/$NAME.venn.passed.somatic.common_filt.snvs.txt
grep -v "#" $DIR/common_mutations_filtered_indels/0000.vcf | awk '{print $1$2$4$5}' > $OUT/$NAME.venn.passed.somatic.common_filt.indels.txt




DIR="/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89HFMTissueDNA/myAnalysis/results"
NAME="patient"

grep -v "#" $DIR/common_mutations_filtered_snvs/0000.vcf | awk '{print $1$2$4$5}' > $OUT/$NAME.venn.passed.somatic.common_filt.snvs.txt
grep -v "#" $DIR/common_mutations_filtered_indels/0000.vcf | awk '{print $1$2$4$5}' > $OUT/$NAME.venn.passed.somatic.common_filt.indels.txt

COM



OUT="/home/julyin/analysis/xenograft_scripts/venn_diagram"

DIR="/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89PDX/myAnalysis/results"
NAME="pdx_direct"




grep -v "#" $DIR/passed.somatic.snvs.vcf.chr_filt.vcf | awk '{print $1$2$4$5}' > $OUT/$NAME.venn.passed.somatic.chrfilt.snvs.txt
grep -v "#" $DIR/passed.somatic.indels.vcf.chr_filt.vcf | awk '{print $1$2$4$5}' > $OUT/$NAME.venn.passed.somatic.chrfilt.indels.txt




DIR="/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89HFMTissueDNA/myAnalysis/results"
NAME="patient"

grep -v "#" $DIR/passed.somatic.snvs.vcf.chr_filt.vcf | awk '{print $1$2$4$5}' > $OUT/$NAME.venn.passed.somatic.chrfilt.snvs.txt
grep -v "#" $DIR/passed.somatic.indels.vcf.chr_filt.vcf | awk '{print $1$2$4$5}' > $OUT/$NAME.venn.passed.somatic.chrfilt.indels.txt





