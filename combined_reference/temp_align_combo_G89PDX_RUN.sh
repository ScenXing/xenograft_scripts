#!/bin/bash
# =============================================
# Run xenograft pipeline made with snakemake
#
# Julia X.M. Yin
# August 2015
#==============================================

source /share/ClusterShare/software/contrib/julyin/Python-3.4.3/python-3.4.3-julyin/bin/activate

SNAKEMAKE_FILE="temp_align_combo_G89PDX.snakemake"


snakemake -s $SNAKEMAKE_FILE --rulegraph | dot -Tpdf > graph_short.pdf

snakemake -s $SNAKEMAKE_FILE --dag | dot -Tpdf > graph_detailed.pdf

snakemake -s $SNAKEMAKE_FILE --drmaa " -q all.q -cwd -V -b y -j y -pe smp {params.cores} -l {params.hvmem} -l {params.memrequested} -N {params.jobname}" -j 45

snakemake -s $SNAKEMAKE_FILE --detailed-summary > summary_detailed.txt

snakemake -s $SNAKEMAKE_FILE --summary > summary_short.txt

