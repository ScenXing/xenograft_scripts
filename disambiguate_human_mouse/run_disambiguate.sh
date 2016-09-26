#!/bin/bash





human_namesort_bam="/share/ClusterScratch/julyin/G89PDX_namesort/human.G89PDX.namesorted.bam"
mouse_namesort_bam="/share/ClusterScratch/julyin/G89PDX_namesort/mouse.G89PDX.namesorted.bam"

python /share/ClusterShare/software/contrib/julyin/disambiguate/disambiguate.py \
    -o /share/ClusterScratch/julyin/G89PDX_disambiguate_snakemake_2/results \
    -i /share/ClusterScratch/julyin/G89PDX_disambiguate_snakemake_2/intermediate \
    -s G89PDX \
    -a bwa \
    -d \
    $human_namesort_bam $mouse_namesort_bam


