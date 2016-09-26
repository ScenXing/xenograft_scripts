


import csv
import re



def n_comments(inFile, comment):
    with open(inFile, 'r') as f:
        n_lines = 0
        pattern = re.compile("^\s*{0}".format(comment))
        for l in f:
            if pattern.search(l) is None:
                break
            else:
                n_lines += 1
    return n_lines



#chromosome_li = range(1, 23) + ['X', 'Y']
chromosome_li = range(1, 23) + ['X']
chromosome_lis = set([str(x) for x in chromosome_li])
chromosome_list = ['chr' + s for s in chromosome_lis]

#file_name_list = ['/home/julyin/genome_gbm_variant_calling/strelka_VEP_annotated/G89controlDNA.vs.G89HFMTissue.commonfilt.passed.snvs.vep.vcf',
#                  '/home/julyin/genome_gbm_variant_calling/strelka_VEP_annotated/G89controlDNA.vs.G89PDX.commonfilt.passed.snvs.vep.vcf',
#                  '/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89HFMTissueDNA/myAnalysis/results/common_mutations_filtered_snvs/0000.vcf',
#                  '/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89PDX/myAnalysis/results/common_mutations_filtered_snvs/0000.vcf']


file_name_list = ['/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89HFMTissueDNA/myAnalysis/results/passed.somatic.snvs.vcf',
                  '/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89PDX/myAnalysis/results/passed.somatic.snvs.vcf']




print chromosome_list

for file_name in file_name_list:
    
    count = 0

    skiprows = n_comments(file_name, '##')

    with open(file_name, 'rU') as inFile:
     
        for _ in xrange(skiprows):
            next(inFile)


        for row in csv.DictReader(inFile, dialect='excel-tab'):
            test = row['POS']
            chr = row['#CHROM']
                
                    
            if chr in chromosome_list:          
            
                count +=1 
                


    print "Number of snvs: %s for file %s" % (count, file_name)
             

chromosome_list.append("#")
with open('/home/julyin/genome_gbm_variant_calling/strelka-snvs-indels/strelka-G89controlDNA-vs-G89HFMTissueDNA/myAnalysis/results/passed.somatic.snvs.vcf') as in_vcf, open('/home/julyin/analysis/xenograft_scripts/statistics/test.vcf', "w") as out_vcf:
    for line in in_vcf:
        if line.startswith(tuple(chromosome_list)):
            out_vcf.write(line)




