#!/bin/bash
# =============================================
# Run xenograft pipeline made with snakemake
#
# Julia X.M. Yin
# August 2015
#==============================================

source source /share/ClusterShare/software/contrib/julyin/Python-3.4.3/python-3.4.3-julyin/bin/activate

SNAKEMAKE_FILE="filter_mouse_reads.snakemake"


snakemake -s $SNAKEMAKE_FILE --rulegraph | dot -Tpdf > graph_short.pdf

snakemake -s $SNAKEMAKE_FILE --dag | dot -Tpdf > graph_detailed.pdf

snakemake -s $SNAKEMAKE_FILE --drmaa " -q all.q -cwd -V -b y -j y -pe smp {params.cores} -l {params.hvmem} -l {params.memrequested} -N {params.jobname} -P {params.account}" -j 45

snakemake -s $SNAKEMAKE_FILE --detailed-summary > summary_detailed.txt

snakemake -s $SNAKEMAKE_FILE --summary > summary_short.txt

