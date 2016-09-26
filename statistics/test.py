


import csv
import re
import os




#chromosome_li = range(1, 23) + ['X', 'Y']
chromosome_li = range(1, 23) + ['X']
chromosome_lis = set([str(x) for x in chromosome_li])
chromosome_list = ['chr' + s for s in chromosome_lis]

#file_name_list = ['/home/julyin/genome_gbm_variant_calling/strelka_VEP_annotated/G89controlDNA.vs.G89HFMTissue.commonfilt.passed.snvs.vep.vcf',
#                  '/home/julyin/genome_gbm_variant_calling/strelka_VEP_annotated/G89controlDNA.vs.G89PDX.commonfilt.passed.snvs.vep.vcf',
#                  '/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89HFMTissueDNA/myAnalysis/results/common_mutations_filtered_snvs/0000.vcf',
#                  '/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89PDX/myAnalysis/results/common_mutations_filtered_snvs/0000.vcf']


file_name_list = ['/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89HFMTissueDNA/myAnalysis/results/passed.somatic.snvs.vcf',
                  '/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89HFMTissueDNA/myAnalysis/results/passed.somatic.indels.vcf',
                  '/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89PDX/myAnalysis/results/passed.somatic.snvs.vcf',
                  '/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89PDX/myAnalysis/results/passed.somatic.indels.vcf']


print chromosome_list


chromosome_list.append("#")




    
with open('/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89HFMTissueDNA/myAnalysis/results/passed.somatic.snvs.vcf') as in_vcf, open('/home/julyin/test/parse.vcf', "w") as out_vcf:
    for line in in_vcf:
        if line.startswith('chr19/t'):
            out_vcf.write(line)




