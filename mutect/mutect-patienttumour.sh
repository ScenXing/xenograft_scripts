#!/bin/bash

#====MuTect
# Note: Must use older version of java
# Have updated to use v68 of COSMIC.

#=== User defined variables

#INPUT_FILE_LIST="list_of_samples_normal_control_order.list"
VARIANT_OUT_DIR=/home/julyin/genome_gbm_variant_calling/mutect/patient_tumour/chromosome_results_raw
FILTERED_VCF_OUT_DIR=/home/julyin/genome_gbm_variant_calling/mutect/patient_tumour/chromosome_results_filtered_reject
BIODATA_DIR=/share/ClusterShare/biodata/contrib/julyin
BAM_DIR=/share/ScratchGeneral/julyin/G89

mkdir -p $VARIANT_OUT_DIR
mkdir -p $FILTERED_VCF_OUT_DIR

#=== Variables

INPUT_FILE_LIST="chromosome.list"
CHROMOSOME=`awk "NR==${SGE_TASK_ID}" $INPUT_FILE_LIST`

PRE="G89controlDNA"
POST="G89HFMTissueDNA"

MUTECT_SOFTWARE_DIR=/share/ClusterShare/software/contrib/julyin/muTect
#GATK_DIR=/share/ClusterShare/software/contrib/gi/gatk/2.5-2-gf57256b/GenomeAnalysisTK-2.5-2-gf57256b
# cosmic file created by user from instructions on GATK forum
COSMIC_FILE="/share/ClusterShare/biodata/contrib/julyin/cosmicfiles/Cosmic.v68.hg19.vcf"
#COSMIC_FILE="/share/ClusterShare/biodata/contrib/julyin/b37_cosmic_v54_120711.vcf"
#REF_FILE="/share/ClusterScratch/julyin/isaac_gbm_wgs/paddy/pipeline/tools/biodata_gi/gatk-resource-bundle/2.8/b37/human_g1k_v37.fasta"

REF_FILE=/share/ClusterShare/biodata/contrib/gi/gatk-resource-bundle/2.5/hg19/ucsc.hg19.fasta
DBSNP_FILE="/share/ClusterShare/biodata/contrib/gi/gatk-resource-bundle/2.8/hg19/dbsnp_138.hg19.vcf"


#=== Main

echo "[][][] MuTect for $PRE vs $POST using hg19 started at"
date
start_time=$(date +%s)

/share/ClusterShare/software/contrib/julyin/java_1_6/jdk1.6.0_45/bin/java -Xmx2g -jar ${MUTECT_SOFTWARE_DIR}/muTect-1.1.4.jar \
    --analysis_type MuTect \
    --reference_sequence $REF_FILE \
    --intervals $CHROMOSOME \
    --cosmic $COSMIC_FILE \
    --dbsnp $DBSNP_FILE \
    --input_file:normal ${BAM_DIR}/$PRE.bam \
    --input_file:tumor ${BAM_DIR}/$POST.bam \
    --out ${VARIANT_OUT_DIR}/$CHROMOSOME.$PRE.vs.$POST.mutect.out \
    --coverage_file ${VARIANT_OUT_DIR}/$CHROMOSOME.$PRE.vs.$POST.mutect.coverage.wig.txt \
	--vcf ${VARIANT_OUT_DIR}/$CHROMOSOME.$PRE.vs.$POST.mutect.vcf



echo " Remove vcf header and rejected snvs"
sed '/^#/ d' ${VARIANT_OUT_DIR}/$CHROMOSOME.$PRE.vs.$POST.mutect.vcf | grep -v REJECT > ${FILTERED_VCF_OUT_DIR}/$CHROMOSOME.$PRE.vs.$POST.mutect.filtered.vcf


sed '/^#/ d' ${VARIANT_OUT_DIR}/$CHROMOSOME.$PRE.vs.$POST.mutect.out | grep -v REJECT > ${FILTERED_VCF_OUT_DIR}/$CHROMOSOME.$PRE.vs.$POST.mutect.filtered.out




end_time=$(date +%s)
run_time=$(($end_time-$start_time))
((sec=run_time%60, run_time/=60, min=run_time%60, hrs=run_time/60))
timestamp=$(printf "[][][] Total time elapsed for script execution was: %d hours, %02d minutes, %02d seconds" $hrs $min $sec)
echo $timestamp






