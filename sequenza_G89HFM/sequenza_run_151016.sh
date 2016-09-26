#!/bin/bash



qsub -q all.q -cwd -V -b y -j y -t 1-23 -l h_vmem=8G -l mem_requested=8G -N seqz1_g89_mousefilt bash ./sequenza_create_seqz.sh



qsub -q all.q -cwd -V -b y -j y -hold_jid seqz_g89 -l h_vmem=8G -l mem_requested=8G -N seq2_combo_g89_mousefilt bash ./sequenza_combine_binned_seqz.sh



qsub -q all.q -cwd -V -b y -j y -hold_jid seq_combo_g89 -pe smp 4 -l h_vmem=16G -l mem_requested=16G -N seq3_mousefilt_seq Rscript sequenza_R_analysis.R



