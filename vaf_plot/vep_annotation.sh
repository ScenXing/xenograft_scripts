#!/bin/bash
# Thsi is Vel's version of VEP annotation



#INPUT="/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA.dedup.realn.bam-vs-G89PDX.dedup.realn.bam/myAnalysis/results/passed.somatic.snvs.vcf"
INPUT="/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89PDX/myAnalysis/results/common_mutations_filtered_snvs/0000.vcf"
OUT="/home/julyin/genome_gbm_variant_calling/strelka_VEP_annotated/G89controlDNA.vs.G89PDX.commonfilt.passed.snvs.vep.vcf"
STATS="/home/julyin/genome_gbm_variant_calling/strelka_VEP_annotated/G89controlDNA.vs.G89PDX.commonfilt.passed.snvs.vep.html"

module load marcow/perl/5.14.2
module load vep/76
module load samtools/0.1.19

perl /share/ClusterShare/software/contrib/gi/vep/76/variant_effect_predictor.pl \
     --cache \
     --dir /share/ClusterShare/biodata/contrib/gi/vep \
     --port 3337 \
     --offline \
     --input_file $INPUT \
     --format vcf \
     --output_file $OUT \
     --vcf \
     --stats_file $STATS \
     --stats_text \
     --force_overwrite \
     --canonical \
     --fork 32 \
     --sift b \
     --polyphen b \
     --symbol \
     --numbers \
     --terms so \
     --biotype \
     --total_length \
     --plugin LoF,human_ancestor_fa:/share/ClusterShare/biodata/contrib/gi/LOFTEE/1.0/human_ancestor.fa.rz --fields Consequence,Codons,Amino_acids,Gene,SYMBOL,Feature,EXON,PolyPhen,SIFT,Protein_position,BIOTYPE,CANONICAL,Feature_type,cDNA_position,CDS_position,Existing_variation,DISTANCE,STRAND,CLIN_SIG,LoF_flags,LoF_filter,LoF,RadialSVM_score,RadialSVM_pred,LR_score,LR_pred,CADD_raw,CADD_phred,Reliability_index



INPUT="/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89HFMTissueDNA/myAnalysis/results/common_mutations_filtered_snvs/0000.vcf"
OUT="/home/julyin/genome_gbm_variant_calling/strelka_VEP_annotated/G89controlDNA.vs.G89HFMTissue.commonfilt.passed.snvs.vep.vcf"
STATS="/home/julyin/genome_gbm_variant_calling/strelka_VEP_annotated/G89controlDNA.vs.G89HFMTissue.commonfilt.passed.snvs.vep.html"

module load marcow/perl/5.14.2
module load vep/76
module load samtools/0.1.19

perl /share/ClusterShare/software/contrib/gi/vep/76/variant_effect_predictor.pl \
     --cache \
     --dir /share/ClusterShare/biodata/contrib/gi/vep \
     --port 3337 \
     --offline \
     --input_file $INPUT \
     --format vcf \
     --output_file $OUT \
     --vcf \
     --stats_file $STATS \
     --stats_text \
     --force_overwrite \
     --canonical \
     --fork 32 \
     --sift b \
     --polyphen b \
     --symbol \
     --numbers \
     --terms so \
     --biotype \
     --total_length \
     --plugin LoF,human_ancestor_fa:/share/ClusterShare/biodata/contrib/gi/LOFTEE/1.0/human_ancestor.fa.rz --fields Consequence,Codons,Amino_acids,Gene,SYMBOL,Feature,EXON,PolyPhen,SIFT,Protein_position,BIOTYPE,CANONICAL,Feature_type,cDNA_position,CDS_position,Existing_variation,DISTANCE,STRAND,CLIN_SIG,LoF_flags,LoF_filter,LoF,RadialSVM_score,RadialSVM_pred,LR_score,LR_pred,CADD_raw,CADD_phred,Reliability_index

<<-COM

#INPUT_FILE_LIST="/home/julyin/analysis/genome_scripts/list_of_wgs_samples.list"

#NORMAL=`awk "NR==${SGE_TASK_ID}" $INPUT_FILE_LIST`
#TUMOUR=`awk "NR==(${SGE_TASK_ID}+1)" $INPUT_FILE_LIST`

BAM_DIR=/directflow/ClinicalGenomicsPipeline/work_dirs/work_analysis/R_150522_KERMCD_FGS_M001/run/phase2/

NORMAL_BAM=${BAM_DIR}/LMblood.dedup.realn.bam
TUMOUR_BAM=${BAM_DIR}/LMFFPE.dedup.realn.bam


RAW_VCF=/home/julyin/genome_gbm_variant_calling/strelka/strelka-$NORMAL-vs-$TUMOUR/myAnalysis/results


OUT_DIR=/home/julyin/genome_gbm_variant_calling/strelka/strelka-$NORMAL-vs-$TUMOUR/myAnalysis/results/vep_annotated_results





    perl /share/ClusterShare/software/contrib/gi/vep/76/variant_effect_predictor.pl \
        --cache \
        --dir /share/ClusterShare/biodata/contrib/gi/vep \
        --port 3337 \
        --offline \
        --input_file $vcf_file \
        --format vcf \
        --output_file ${OUT_DIR}/$NORMAL-vs-$TUMOUR-$(basename "$vcf_file" .vcf)-vep.vcf \
        --vcf \
        --stats_text \
        --force_overwrite \
        --canonical \
        --fork 32 \
        --sift b \
        --polyphen b \
        --symbol \
        --numbers \
        --terms so \
        --biotype \
        --total_length \
        --plugin LoF,human_ancestor_fa:/share/ClusterShare/biodata/contrib/gi/LOFTEE/1.0/human_ancestor.fa.rz \
        --fields Consequence,Codons,Amino_acids,Gene,SYMBOL,Feature,EXON,PolyPhen,SIFT,Protein_position,BIOTYPE,CANONICAL,Feature_type,cDNA_position,CDS_position,Existing_variation,DISTANCE,STRAND,CLIN_SIG,LoF_flags,LoF_filter,LoF,RadialSVM_score,RadialSVM_pred,LR_score,LR_pred,CADD_raw,CADD_phred,Reliability_index

COM





