#!/bin/bash



DIR=/home/julyin/genome_gbm_variant_calling/mutect/mouse_filtered_pdx/chromosome_results_filtered_reject
OUT_DIR=/home/julyin/genome_gbm_variant_calling/mutect/mouse_filtered_pdx/
FILE=G89controlDNA.vs.G89PDX_mousefilt.mutect.filtered.vcf

grep -e "#" /home/julyin/genome_gbm_variant_calling/mutect/mouse_filtered_pdx/chromosome_results_raw/chr1.G89controlDNA.vs.G89PDX_mousefilt.mutect.vcf > ${DIR}/header.vcf

cat ${DIR}/header.vcf ${DIR}/chr[1-9].$FILE ${DIR}/chr1[0-9].$FILE ${DIR}/chr2[0-2].$FILE ${DIR}/chrX.$FILE ${DIR}/chrY.$FILE > ${OUT_DIR}/all.$FILE


DIR=/home/julyin/genome_gbm_variant_calling/mutect/patient_tumour/chromosome_results_filtered_reject
OUT_DIR=/home/julyin/genome_gbm_variant_calling/mutect/patient_tumour/
FILE=G89controlDNA.vs.G89HFMTissueDNA.mutect.filtered.vcf

grep -e "#" /home/julyin/genome_gbm_variant_calling/mutect/patient_tumour/chromosome_results_raw/chr1.G89controlDNA.vs.G89HFMTissueDNA.mutect.vcf > ${DIR}/header.vcf

cat ${DIR}/header.vcf ${DIR}/chr[1-9].$FILE ${DIR}/chr1[0-9].$FILE ${DIR}/chr2[0-2].$FILE ${DIR}/chrX.$FILE ${DIR}/chrY.$FILE > ${OUT_DIR}/all.$FILE



