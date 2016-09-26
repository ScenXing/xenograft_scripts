#!/bin/bash

. /etc/profile.d/modules.sh
module load gi/bwa/0.7.12
module load gi/samtools/1.2

FASTA_FILE="/share/ClusterShare/biodata/contrib/julyin/mm10/ucsc.mm10.fasta"

echo "[][][] BWA index for $FASTA_FILE started at"
date

bwa index -a bwtsw $FASTA_FILE

echo "[][][] BWA index for $FASTA_FILE ended at"
date


echo "[][][] Samtools index started at"
date

samtools faidx $FASTA_FILE

echo "[][][] Samtools index ended at"
date

