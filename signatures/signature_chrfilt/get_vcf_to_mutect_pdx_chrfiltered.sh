#!/bin/bash
source /share/ClusterShare/software/contrib/julyin/python-2.7.2/bin/activate


QUEK_DIR=/share/ClusterShare/software/contrib/julyin/VCFtoMutect/vcfTOMutec/


IN_VCF=/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89HFMTissueDNA/myAnalysis/results/passed.somatic.snvs.vcf.chr_filt.vcf
PATIENT=G89control-vs-G89HFMTissue

<<-COM
python $QUEK_DIR/VariantFileObject.py \
    -i $IN_VCF \
    -o $PATIENT.out \
    -b $PATIENT.bed \
    -g /share/ClusterShare/biodata/contrib/gi/gatk-resource-bundle/2.8/hg19/ucsc.hg19.fasta
COM

python /share/ClusterShare/software/contrib/julyin/VCFtoMutect/vcfTOMutec/Mutect_Context_Test.py \
    -i $PATIENT.out \
    -o $PATIENT.sequence_context.txt \



IN_VCF=/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89PDX/myAnalysis/results/passed.somatic.snvs.vcf.chr_filt.vcf
PDX=G89control-vs-G89PDX

<<-COM
python $QUEK_DIR/VariantFileObject.py \
    -i $IN_VCF \
    -o $PDX.out \
    -b $PDX.bed \
    -g /share/ClusterShare/biodata/contrib/gi/gatk-resource-bundle/2.8/hg19/ucsc.hg19.fasta
COM

python /share/ClusterShare/software/contrib/julyin/VCFtoMutect/vcfTOMutec/Mutect_Context_Test.py \
    -i $PDX.out \
    -o $PDX.sequence_context.txt \


