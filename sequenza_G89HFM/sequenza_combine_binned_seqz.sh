#!/bin/bash


BINNED_SEQZ_DIR="/share/ScratchGeneral/julyin/G89/sequenza_normal_vs_mousefilt/bigger_binned_seqz"
#OUT_DIR="/share/ClusterScratch/julyin/sequenza_mouse/bigger_binned_seqz"
OUT_DIR="/share/ScratchGeneral/julyin/G89/sequenza_normal_vs_mousefilt/results"

NORM="G89controlDNA"
TUM="G89PDX_mousefilt"
#TUM="G89PDX"





#===================================
                                  


echo "[][][] Combination of all chromosome seqz files started at"
date


cp /share/ClusterShare/biodata/contrib/julyin/sequenza/header.gz ${BINNED_SEQZ_DIR}

#zcat ${BINNED_SEQZ_DIR}/header.gz ${BINNED_SEQZ_DIR}/$NORM.vs.$TUM.chr.[1-9].seqz.gz ${BINNED_SEQZ_DIR}/$NORM.vs.$TUM.chr.1[0-9].seqz.gz ${BINNED_SEQZ_DIR}/$NORM.vs.$TUM.chr.2[0-2].seqz.gz ${BINNED_SEQZ_DIR}/$NORM.vs.$TUM.chr.[XY].seqz.gz | gzip > ${OUT_DIR}/all.$NORM.vs.$TUM.seqz.gz



zcat ${BINNED_SEQZ_DIR}/header.gz ${BINNED_SEQZ_DIR}/$NORM.vs.$TUM.[1-9].seqz.gz ${BINNED_SEQZ_DIR}/$NORM.vs.$TUM.1[0-9].seqz.gz ${BINNED_SEQZ_DIR}/$NORM.vs.$TUM.2[0-2].seqz.gz ${BINNED_SEQZ_DIR}/$NORM.vs.$TUM.X.seqz.gz | gzip > ${OUT_DIR}/all.$NORM.vs.$TUM.seqz.gz



#zcat ${BINNED_SEQZ_DIR}/header.gz ${BINNED_SEQZ_DIR}/$NORM.vs.$TUM.[1-7].seqz.gz ${BINNED_SEQZ_DIR}/$NORM.vs.$TUM.chr.8.seqz.gz ${BINNED_SEQZ_DIR}/$NORM.vs.$TUM.[9].seqz.gz ${BINNED_SEQZ_DIR}/$NORM.vs.$TUM.1[0-9].seqz.gz ${BINNED_SEQZ_DIR}/$NORM.vs.$TUM.2[0-2].seqz.gz ${BINNED_SEQZ_DIR}/$NORM.vs.$TUM.[XY].seqz.gz | gzip > ${OUT_DIR}/all.$NORM.vs.$TUM.seqz.gz


echo "[][][] Combination of all chromosome seqz files finished at "
date



