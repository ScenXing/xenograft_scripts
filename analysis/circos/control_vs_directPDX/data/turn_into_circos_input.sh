

python main.py somaticSV.vcf > manta_raw.txt

FILE="manta_raw.txt"

grep -v hsM $FILE > chrM_rm.tmp



FILE="chrM_rm.tmp"

grep -e INS $FILE | replace "INS" "fill_color=green"> ins.tmp
grep -e DEL $FILE | replace "DEL" "fill_color=red" > del.tmp
grep -e DUP $FILE | replace "DUP" "fill_color=purple"> dup.tmp
cat ins.tmp del.tmp dup.tmp > indel_dups.tmp
awk -F"\t" '{print $1 "\t" $2 "\t" $4 "\t" $5}' indel_dups.tmp > indel_dups.txt



grep -e CTX $FILE | replace "CTX" "color=blue" > ctx.tmp
grep -e INV $FILE | replace "INV" "color=yellow" > inv.tmp
cat ctx.tmp inv.tmp > ctx_inv.tmp
awk -F"\t" '{print $1 "\t" $2  "\t" $2  "\t" $3  "\t" $4  "\t" $4 "\t" $5}' ctx_inv.tmp > ctx_inv.txt

#replace "DEL" "color=red" -- manta_raw.txt
#replace "INS" "color=green" -- manta_raw.txt
#replace "INV" "color=yellow" -- manta_raw.txt
#replace "DUP" "color=purple" -- manta_raw.txt
#replace "CTX" "color=blue" -- manta_raw.txt


