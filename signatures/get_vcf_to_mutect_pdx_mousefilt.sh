#!/bin/bash
source /share/ClusterShare/software/contrib/julyin/python-2.7.2/bin/activate


QUEK_DIR=/share/ClusterShare/software/contrib/julyin/VCFtoMutect/vcfTOMutec/


IN_VCF=/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89HFMTissueDNA/myAnalysis/results/common_mutations_filtered_snvs/0000.vcf
PATIENT=G89control-vs-G89HFMTissue

python $QUEK_DIR/VariantFileObject.py \
    -i $IN_VCF \
    -o $PATIENT.out \
    -b $PATIENT.bed \
    -g /share/ClusterShare/biodata/contrib/gi/gatk-resource-bundle/2.8/hg19/ucsc.hg19.fasta

python /share/ClusterShare/software/contrib/julyin/VCFtoMutect/vcfTOMutec/Mutect_Context_Test.py \
    -i $PATIENT.out \
    -o $PATIENT.sequence_context.txt \



IN_VCF=/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka_filtered_mouse/myAnalysis/results/common_mutations_filtered_snvs/0000.vcf
PDX=G89control-vs-G89_mouse_filt_pdx


python $QUEK_DIR/VariantFileObject.py \
    -i $IN_VCF \
    -o $PDX.out \
    -b $PDX.bed \
    -g /share/ClusterShare/biodata/contrib/gi/gatk-resource-bundle/2.8/hg19/ucsc.hg19.fasta

python /share/ClusterShare/software/contrib/julyin/VCFtoMutect/vcfTOMutec/Mutect_Context_Test.py \
    -i $PDX.out \
    -o $PDX.sequence_context.txt \


