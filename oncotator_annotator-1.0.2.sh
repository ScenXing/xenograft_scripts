#!/bin/bash

#Run:
#qsub -q all.q -cwd -V -b y -j y -t 1-3 -l h_vmem=8G -l mem_requested=8G -N oncotator_unmeth bash ./oncotator_annotator-1.0.0.sh


DB_DIR=/share/ClusterShare/software/contrib/julyin/oncotator/oncotator_v1_ds_June112014

INPUT_FILE_LIST="/home/julyin/analysis/genome_scripts/list_of_samples_normal_tumour.list"

NORMAL=`awk "NR==${SGE_TASK_ID}" $INPUT_FILE_LIST`
TUMOUR=`awk "NR==(${SGE_TASK_ID}+1)" $INPUT_FILE_LIST`

VCF_DIR=/home/julyin/genome_gbm_variant_calling/strelka/strelka-$NORMAL-vs-$TUMOUR/myAnalysis/results
OUT_DIR=/home/julyin/genome_gbm_variant_calling/strelka_oncotator

#mkdir -p ${OUT_DIR}

    
oncotator -i VCF --db-dir=${DB_DIR} ${VCF_DIR}/passed.somatic.snvs.vcf ${OUT_DIR}/$NORMAL-vs-$TUMOUR-passed.snvs-oncotator.vcf hg19






