


#To get list of unique mutations for venn diagram
#http://bioinformatics.psb.ugent.be/webtools/Venn/

DIR="/share/ClusterScratch/julyin/strelka_filtered_mouse/myAnalysis/results"
NAME="filtered_mouse"

grep -v "#" $DIR/passed.somatic.snvs.vcf | awk '{print $1$2$4$5}' > $DIR/$NAME.venn.passed.somatic.snvs.txt
grep -v "#" $DIR/passed.somatic.indels.vcf | awk '{print $1$2$4$5}' > $DIR/$NAME.venn.passed.somatic.indels.txt



DIR="/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA.dedup.realn.bam-vs-G89PDX.dedup.realn.bam/myAnalysis/results"
NAME="direct_map"

grep -v "#" $DIR/passed.somatic.snvs.vcf | awk '{print $1$2$4$5}' > $DIR/$NAME.venn.passed.somatic.snvs.txt
grep -v "#" $DIR/passed.somatic.indels.vcf | awk '{print $1$2$4$5}' > $DIR/$NAME.venn.passed.somatic.indels.txt



DIR="/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89HFMTissueDNA/myAnalysis/results"
NAME="patient"

grep -v "#" $DIR/passed.somatic.snvs.vcf | awk '{print $1$2$4$5}' > $DIR/$NAME.venn.passed.somatic.snvs.txt
grep -v "#" $DIR/passed.somatic.indels.vcf | awk '{print $1$2$4$5}' > $DIR/$NAME.venn.passed.somatic.indels.txt


