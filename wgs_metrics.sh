

INPUT_FILE_LIST="collect_wgs_metrics_samples.list"
SAMPLE=`awk "NR==${SGE_TASK_ID}" $INPUT_FILE_LIST`


mkdir -p /home/julyin/genome_gbm_variant_calling/statistics/$SAMPLE

java -Xmx4g -jar /share/ClusterShare/software/contrib/gi/picard-tools/1.138/picard.jar CollectWgsMetrics \
    INPUT= /share/ScratchGeneral/julyin/G89/$SAMPLE.bam \
    OUTPUT= /home/julyin/genome_gbm_variant_calling/statistics/$SAMPLE/$SAMPLE.CollectWgsMetrics.csv \
    REFERENCE_SEQUENCE=/share/ClusterShare/biodata/contrib/gi/gatk-resource-bundle/2.8/hg19/ucsc.hg19.fasta



