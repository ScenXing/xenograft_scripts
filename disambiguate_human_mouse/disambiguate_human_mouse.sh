#!/bin/bash

MAINDIR="/share/ClusterScratch/julyin/disambiguate_test"
HUMAN_BAM="/share/ClusterScratch/julyin/G89PDX_disambiguate/human.G89PDX.bam"
MOUSE_BAM="/share/ClusterScratch/julyin/G89PDX_disambiguate/mouse.G89PDX.bam"


echo "[][][] Disambiguate for $HUMAN_BAM and $MOUSE_BAM started at"
date

python /share/ClusterShare/software/contrib/julyin/disambiguate/disambiguate.py \
    -o $MAINDIR/results \
    -i $MAINDIR/intermediate \
    -s G89PDX \
    -a bwa \
    $HUMAN_BAM $MOUSE_BAM



echo "[][][] Disambiguate for $HUMAN_BAM and $MOUSE_BAM finished at"
date



