#commands needed to run pindel                                                                                                                                                                                                 

sample_prefix="B84                                                                                                                                                                                                             
PHB47"


#needed directories                                                                                                                                                                                                            
input_bam=/panfs/roc/scratch/oconnorc/filtered_bams
output=/home/hirschc1/oconnorc/practice_data/pindel_output
pindel_loc=/home/hirschc1/oconnorc/software/pindel
ref_dir=/home/hirschc1/oconnorc/practice_data/maize_refs

#have to load these modules for pindel to run                                                                                                                                                                                  
module load gcc/5.4.0
module load samtools/1.6
module load htslib/1.6
#samtools/1.6.0 is default at time script was written                                                                                                                                                                          

#loop through file and create config file necessary for pindel                                                                                                                                                                 
for i in $sample_prefix
do
    echo -e $input_bam/${i}_W22v12_map.q20.bam'\t'300'\t'${i}_W22v12 > $output/${i}_W22v12_config.txt
done

#run pindel                                                                                                                                                                                                                    
for f in $sample_prefix
do
    $pindel_loc/pindel -f $ref_dir/W22_chr1-10.fasta -i $output/${f}_W22v12_config.txt -A 30 -o $output/${f}_W22v12_pindel.genic -T 12 -j $ref_dir/bed_files/W22v12_genic.bed
done

#$pindel_loc/pindel -f $ref_dir/W22_chr1-10.fasta -i $output/PHN11_W22v12_config.txt -o $output/PHN11_W22v12_pindel.genic -T 12 -j $ref_dir/bed_files/W22v12_genic.bed                                                         

#convert pindel files to vcf files                                                                                                                                                                                             
#$pindel_loc/pindel2vcf -r $ref_dir/B73_chr1-10.fasta -R maizeB73v4 -d 2018.05 -P $output/PHB47_B73v4_pindel.genic -v $output/PHB47_B73v4_pindel.genic.vcf                                                                     
for g in $sample_prefix
do
    $pindel_loc/pindel2vcf -r $ref_dir/W22_chr1-10.fasta -R maizeW22 -d 2018.05 -is 3 -as 500 -P $output/${g}_W22v12_pindel.genic -v $output/${g}_W22v12_pindel.genic.vcf
    bgzip $output/${g}_W22v12_pindel.genic.vcf
    tabix $output/${g}_W22v12_pindel.genic.vcf.gz
done
#-d reference date = date of reference genome used, required, is made up by me 
