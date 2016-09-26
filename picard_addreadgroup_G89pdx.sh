#!/bin/bash

. /etc/profile.d/modules.sh

module load gi/picard-tools/1.103


PICARD_DIR=/share/ClusterShare/software/contrib/gi/picard-tools/1.103


BAM_DIR="/share/ScratchGeneral/julyin/G89/G89PDX_mousefilt.bam"
OUT_DIR="/share/ScratchGeneral/julyin/G89/G89PDX_mousefilt_readgrouped.bam"

<<-COM
java -Xmx2g -jar ${PICARD_DIR}/AddOrReplaceReadGroups.jar \
    INPUT=$BAM_DIR \
    OUTPUT=$OUT_DIR \
    RGID=42 \
    RGLB=unknown-lib \
    RGPU=unknown-unit \
    RGPL=HiSeqXTen \
    RGSM=G89_PDX_mousefilt
COM


echo "Index file creation started at:"
date
echo "Using samtools version:"
which samtools


samtools index $OUT_DIR


echo "Index file creation finished at:"
date

