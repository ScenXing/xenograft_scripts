#!/bin/bash

echo "bam2fastq started at"
date


OUTFILE="/share/Temp/julyin/xenograft_G89/filter_out_mouse_pipeline/fastq_files/unmapped.G89PDX_R#.fastq"

#/share/ClusterShare/software/contrib/julyin/bam2fastq/bam2fastq-1.1.0/bam2fastq -o /share/ClusterScratch/julyin/filter_PDX_pipeline/fastq_files/unmapped.G89PDX_R#.fastq --force --no-aligned /share/ClusterScratch/julyin/G89PDX_namesort/mouse.G89PDX.namesorted.bam


/share/ClusterShare/software/contrib/julyin/bam2fastq/bam2fastq-1.1.0/bam2fastq -o $OUTFILE --force --no-aligned /share/ClusterScratch/julyin/G89PDX_namesort/mouse.G89PDX.namesorted.bam



echo "bam2fastq finished at"
date


