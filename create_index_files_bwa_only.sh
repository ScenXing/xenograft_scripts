#!/bin/bash

. /etc/profile.d/modules.sh
module load gi/bwa/0.7.12
module load gi/samtools/1.2

FASTA_FILE="/share/ClusterShare/biodata/contrib/julyin/hg19/ucsc.hg19.fasta"

echo "[][][] BWA index for $FASTA_FILE started at"
date

bwa index -a bwtsw $FASTA_FILE

echo "[][][] BWA index for $FASTA_FILE ended at"
date

