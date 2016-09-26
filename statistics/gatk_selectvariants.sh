
INPUT_FILE_LIST="/home/julyin/analysis/xenograft_scripts/statistics/vcf_file.list"
SAMPLE=`awk "NR==${SGE_TASK_ID}" $INPUT_FILE_LIST`


GATK_DIR="/share/ClusterShare/software/contrib/gi/gatk/3.1/GenomeAnalysisTK-3.1-1"

REF_FILE="/share/ClusterShare/biodata/contrib/gi/gatk-resource-bundle/2.8/hg19/ucsc.hg19.fasta"


java -Xmx4g -jar $GATK_DIR/GenomeAnalysisTK.jar \
   -T SelectVariants \
   -R $REF_FILE \
   -V $SAMPLE \
   -o $SAMPLE.chr_filt.vcf \
   -L /home/julyin/analysis/xenograft_scripts/statistics/interval.list


