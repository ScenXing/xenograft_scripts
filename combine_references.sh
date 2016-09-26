#!/bin/bash

. /etc/profile.d/modules.sh
module load gi/bwa/0.7.9a
which bwa


MAINDIR="/share/ClusterScratch/julyin/biodata/combined_hg19_mm10"


echo "[][][] Start mm10 renaming"
date
# Change mm10 chromosome names

# Doesn't work as it just renames the random chrs into ints
#awk '/^>/{print ">mm10.chr" ++i; next}{print}' /share/ClusterShare/biodata/contrib/julyin/mm10/ucsc.mm10.fasta > /share/ClusterShare/biodata/contrib/julyin/mm10/renamed.ucsc.mm10.fasta

#perl -pe 'next unless /^>/; $i++; s/>(\S+)/>mm10.${i}_$1/' /share/ClusterShare/biodata/contrib/julyin/mm10/ucsc.mm10.fasta > $MAINDIR/renamed.ucsc.mm10.fasta
awk '{if (/^>/) print ">mm10." substr($0,2); else print $0;}' /share/ClusterShare/biodata/contrib/julyin/mm10/ucsc.mm10.fasta > $MAINDIR/renamed.ucsc.mm10.fasta

#awk '/^>/ {$0="mm."$0}1' /share/ClusterShare/biodata/contrib/julyin/mm10/ucsc.mm10.fasta > /share/ClusterShare/biodata/contrib/julyin/mm10/renamed.ucsc.mm10.fasta


echo "[][][] Start hg19 renaming"
date
#awk '/^>/{print ">hg19.chr" ++i; next}{print}' /share/ClusterShare/biodata/contrib/gi/gatk-resource-bundle/2.8/hg19/ucsc.hg19.fasta > /share/ClusterShare/biodata/contrib/julyin/hg19/renamed.ucsc.hg19.fasta
#perl -pe 'next unless /^>/; $i++; s/>(\S+)/>hg19.${i}_$1/' /share/ClusterShare/biodata/contrib/gi/gatk-resource-bundle/2.8/hg19/ucsc.hg19.fasta > $MAINDIR/renamed.ucsc.hg19.fasta
awk '{if (/^>/) print ">hg19." substr($0,2); else print $0;}' /share/ClusterShare/biodata/contrib/gi/gatk-resource-bundle/2.8/hg19/ucsc.hg19.fasta > $MAINDIR/renamed.ucsc.hg19.fasta


echo "[][][] Start concatenating hg19 and mm10"
date
cat $MAINDIR/renamed.ucsc.hg19.fasta $MAINDIR/renamed.ucsc.mm10.fasta > $MAINDIR/combined.hg19.mm10.fasta


REF_FILE="$MAINDIR/combined.hg19.mm10.fasta"


echo "[][][] Start fai file"
date
# This creates a file called reference.fa.fai
samtools faidx $REF_FILE



echo "[][][] Start creating bwa index"
date
# This creates a collection of files used by BWA to perform the alignment.
bwa index -a bwtsw $REF_FILE



echo "[][][] Combination completed at:"
date


