#!/bin/bash
# Run Strelka on all GBM samples paired.

#qsub -q all.q -cwd -V -b y -j y -l h_vmem=8G -l mem_requested=8G -l pwbc=true -pe smp 8 -N strelka bash ./strelka_pdx_11SEP15.sh


#NPUT_FILE_LIST="/home/julyin/analysis/genome_scripts/input_lists/151009-strelka_wgs2.list"
#NORMAL_PATH=`awk "NR==${SGE_TASK_ID}" $INPUT_FILE_LIST`
#TUMOUR_PATH=`awk "NR==(${SGE_TASK_ID}+1)" $INPUT_FILE_LIST`
#NORMAL=$(basename $NORMAL_PATH)
#TUMOUR=$(basename $TUMOUR_PATH)

NORMAL="/share/ClusterScratch/julyin/PDX_results/G89controlDNA.dedup.realn.bam"
TUMOUR="/share/Temp/julyin/xenograft_G89/filter_out_mouse_pipeline/bam_files/combo.G89PDX.sorted.bam"



REF_FILE="/share/ClusterShare/biodata/contrib/gi/gatk-resource-bundle/2.5/hg19/ucsc.hg19.fasta"


# example location where strelka was installed to:
#
STRELKA_INSTALL_DIR=/share/ClusterShare/software/contrib/julyin/strelka_workflow-1.0.14

echo "[][][] $NORMAL vs $TUMOUR strelka started at"
date

# example location where analysis will be run:
#
WORK_DIR="/share/ClusterScratch/julyin/strelka_filtered_mouse/"
mkdir $WORK_DIR

# Step 1. Move to working directory:
#
cd $WORK_DIR

# Step 2. Copy configuration ini file from default template set to a
#         local copy, possibly edit settings in local copy of file:

cp $STRELKA_INSTALL_DIR/etc/strelka_config_bwa_default.ini strelka_config_bwa_default.ini

# Step 3. Configure:
#
$STRELKA_INSTALL_DIR/bin/configureStrelkaWorkflow.pl \
    --normal=$NORMAL \
    --tumor=$TUMOUR \
    --ref=$REF_FILE \
    --config=strelka_config_bwa_default.ini \
    --output-dir=./myAnalysis

# Step 4. Run Analysis
#         This example is run using 8 cores on the local host:
#
cd ./myAnalysis
make -j 8


echo "[][][] $NORMAL vs $TUMOUR strelka finished at"
date

