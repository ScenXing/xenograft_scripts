

RAW_BAM="/share/ClusterScratch/julyin/combo_G89PDX/bam_files/combo.G89PDX.sorted.bam"
NEW_SAM="/share/ClusterScratch/julyin/combo_G89PDX/bam_files/human.combo.G89PDX.sam"

# ouput header only, once
samtools view -H $RAW_BAM > $NEW_SAM
while read line;do
    samtools view $RAW_BAM $line >> $NEW_SAM
done < human_regions.txt


