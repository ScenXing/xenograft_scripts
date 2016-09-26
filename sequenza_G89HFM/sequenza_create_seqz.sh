#!/bin/bash

# =============================================
# Sequenza pipeline with snakemake
#
# Julia X.M. Yin
# September 2015
#==============================================

INPUT_FILE_LIST="/home/julyin/analysis/xenograft_scripts/sequenza_G89HFM/chromosome_of_missing.list"
CHR=`awk "NR==${SGE_TASK_ID}" $INPUT_FILE_LIST`


PYPY="/share/ClusterShare/software/contrib/julyin/pypy/pypy-5.1.1-linux_x86_64-portable/bin/pypy"

#CHROMOSOMES = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', 'X', 'Y']

HUMAN_REF="/share/ClusterShare/biodata/contrib/julyin/hg19/ucsc.hg19.fasta"
MOUSE_REF="/share/ClusterShare/biodata/contrib/julyin/mm10/ucsc.mm10.fasta"

SEQ_UTILS="/home/julyin/software/R-3.0.2/library/sequenza/exec"
GC_FILE="/share/ClusterShare/biodata/contrib/julyin/hg19.gc5Base.txt.gz"


SEQZ_DIR="/share/ScratchGeneral/julyin/G89/sequenza_normal_vs_mousefilt/seqz_large_files"

BINNED_SEQZ_DIR="/share/ScratchGeneral/julyin/G89/sequenza_normal_vs_mousefilt/bigger_binned_seqz"


NORMAL_DIR="/share/ScratchGeneral/julyin/G89"
TUMOUR_DIR="/share/ScratchGeneral/julyin/G89"

NORM="G89controlDNA"
TUM="G89PDX_mousefilt"
#TUM="G89PDX"


mkdir -p $SEQZ_DIR
mkdir -p $BINNED_SEQZ_DIR


#===================================


echo "[][][] Perform the large seqz extraction for chromosome $CHR"
date


# Perform the large seqz extraction for the current chromosome
${SEQ_UTILS}/sequenza-utils.py bam2seqz -n ${NORMAL_DIR}/$NORM.dedup.realn.bam -t ${TUMOUR_DIR}/$TUM.bam -F $HUMAN_REF -gc $GC_FILE -C chr$CHR | \
    gzip > ${SEQZ_DIR}/$NORM.vs.$TUM.$CHR.large.seqz.gz
	


#mv ${SEQZ_DIR}/$NORM.vs.$TUM.chr$CHR.large.seqz.gz  ${SEQZ_DIR}/$NORM.vs.$TUM.$CHR.large.seqz.gz


# Save the number of lines in the output file - this is so we know if there is only a header, i.e. no variants were present in the current chromosome
    # gunzip -c: Write  output on standard output; keep original files unchanged.
    # head -n 5: print the first K lines instead of the first 10
    # wc -l: print the newline counts
nlines=$(gunzip -c ${SEQZ_DIR}/$NORM.vs.$TUM.$CHR.large.seqz.gz | head -n 5 | wc -l)


echo "[][][]  Run the binning and remove the header line, save as separate file for chr $CHR"
date


#If there were lines for the current chromosome (as opposed to just the header), perform a binning step
    # if -gt: is greater than ..........http://www.tldp.org/LDP/abs/html/comparison-ops.html
    
if [[ $nlines -gt 1 ]]; then
# Run the binning and remove the header line, save as separate file
# tail -n +2: output the last K lines, instead of the last 10

    ${SEQ_UTILS}/sequenza-utils.py seqz-binning -w 200 -s ${SEQZ_DIR}/$NORM.vs.$TUM.$CHR.large.seqz.gz | tail -n +2 | gzip > ${BINNED_SEQZ_DIR}/$NORM.vs.$TUM.$CHR.seqz.gz

else

    # If there were no lines for the current chromosome, create the empty file that should have been created by binning so zcat below doesn't error out
    touch ${BINNED_SEQZ_DIR}/$NORM.vs.$TUM.$CHR.seqz
    gzip ${BINNED_SEQZ_DIR}/$NORM.vs.$TUM.$CHR.seqz
fi

                                  

echo "[][][] Finished chr $CHR"
date



