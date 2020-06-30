# Indel_calling_WiDivPanel

This repository contains scripts used to call small insertions and deletions Scripts used in version 1.0 as well as the final version are included

Two indel callers, freebayes and platypus, were used in the final version. Options used for each software can be found in the example scripts in the Final_analysis folder. For both programs, indels were called jointly. Due to how resource intensive indel calling over 500 genotypes at one time is, the genome was chopped in parts (2-4/chromosome) and run seperately. GATK CatVariants (v 3.8) was used to combine individual chromosome fragment vcf files into one vcf. 

Indels were filtered for minimum lenght of 2 bp and for GATK indel quality parameters (described here: https://gatkforums.broadinstitute.org/gatk/discussion/2806/howto-apply-hard-filters-to-a-call-set). 
Variants called between platypus and freebayes were combined as described here: https://gatkforums.broadinstitute.org/gatk/discussion/53/combining-variants-from-different-files-into-one

Indel calling scripts can be found in the Final_analysis folder. 'run_freebayes_chr1_a_WiDiv512.sh' has an example of the freebayes command that was run on all samples and 'run_platypus_B73v4_chr1_a.sh' has an example of the platypus command that was run on all samples. Raw indel vcfs for each chromosome were processed using commands found in these files: 'filter_freebayesoutput.sh', 'process_platypus_vcf.sh' and 'filter_indels_fb.and.platypus.sh'. 

SNP calls were also generated from freebayes. 
SNP calls were filtered according to GATK recommendations, for a minimum allele count and for a maximum of 10% missing data at a site. 

```
gatk SelectVariants -V /home/hirschc1/oconnorc/maize_refs/B73_chr1-10.fasta -select-type SNP --sample-name /home/hirschc1/oconnorc/freebayes_output/WiDiv509_samplenames.args -V /home/hirschc1/oconnorc/freebayes_output/WiDiv512_B73_allchr_gene1kb.vcf -O /home/hirschc1/oconnorc/freebayes_output/WiDiv509_B73v4_allchr_SNPs.vcf                                                        
gatk VariantFiltration -V /home/hirschc1/oconnorc/maize_refs/B73_chr1-10.fasta -V /home/hirschc1/oconnorc/freebayes_output/WiDiv509_B73v4_allchr_SNPs.vcf --filter-expression "QD < 2.0 || FS > 60.0 || MQ < 40.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0" --filter-name "GATK_snp_filter" -O /home/hirschc1/oconnorc/freebayes_output/WiDiv509_B73v4_allchr_filtered_SNPs.vcf 
/home/hirschc1/oconnorc/software/vcftools_0.1.13/bin/vcftools --vcf /home/hirschc1/oconnorc/freebayes_output/WiDiv509_B73v4_allchr_filtered_SNPs.vcf  --Vemove-filtered-all --max-missing 0.10 --mac 50 --minQ 30 --Vecode --Vecode-INFO-all --out /home/hirschc1/oconnorc/freebayes_output/WiDiv509_B73v4_allchr_SNPS_maxmiss0.10                                                               
```

Software used: 
GATK v3.8
freebayes v1.3.1-17-gaa2ace8
platypus https://github.com/andyrimmer/Platypus
vcftools v0.1.13
