#!/bin/bash
#PBS -l mem=60gb,nodes=1:ppn=1,walltime=10:00:00
#PBS -A hirschc1
#PBS -m abe
#PBS -o /home/hirschc1/oconnorc/OandE
#PBS -e /home/hirschc1/oconnorc/OandE
#PBS -M oconnorc@umn.edu
#PBS -q mangi
#PBS -N indel_process

newgrp - hirschc1

#job to run samtools filter and sort using gnu parallel

#go here: https://www.msi.umn.edu/support/faq/how-can-i-use-gnu-parallel-run-lot-commands-parallel

#load needed modules
module load parallel

module load java/jdk1.8.0_171

#cd /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef


#GATK indel filter
# Apply filter to Indel call set, PASS or fail (my_indel_filter)                                                                                                                                      

#java -Xmx60g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T VariantFiltration --filterExpression "QD < 2.0 || FS > 200.0 || ReadPosRankSum < -20.0" -V /home/hirschc1/oconnorc/platypus_output/WiDiv509_B73v4_allchr_platy_indels.vcf --filterName "fail_indel_filter" -o /home/hirschc1/oconnorc/platypus_output/WiDiv509_B73v4_allchr_platy_indels_hard.filter.vcf -R /home/hirschc1/oconnorc/maize_refs/B73_chr1-10.fasta

#java -Xmx60g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T VariantFiltration --filterExpression "QD < 2.0 || FS > 200.0 || ReadPosRankSum < -20.0" -V /home/hirschc1/oconnorc/platypus_output/WiDiv509_Mo17_allchr_platy_indels.vcf --filterName "fail_indel_filter" -o /home/hirschc1/oconnorc/platypus_output/WiDiv509_Mo17_allchr_platy_indels_hard.filter.vcf  -R /home/hirschc1/oconnorc/maize_refs/Mo17_chr1-10.fasta

#java -Xmx60g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T VariantFiltration --filterExpression "QD < 2.0 || FS > 200.0 || ReadPosRankSum < -20.0" -V /home/hirschc1/oconnorc/platypus_output/WiDiv509_PH207_allchr_platy_indels.vcf --filterName "fail_indel_filter" -o /home/hirschc1/oconnorc/platypus_output/WiDiv509_PH207_allchr_platy_indels_hard.filter.vcf  -R /home/hirschc1/oconnorc/maize_refs/PH207_chr1-10.fasta

#java -Xmx60g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T VariantFiltration --filterExpression "QD < 2.0 || FS > 200.0 || ReadPosRankSum < -20.0" -V /home/hirschc1/oconnorc/platypus_output/WiDiv509_PHB47_allchr_platy_indels.vcf --filterName "fail_indel_filter" -o /home/hirschc1/oconnorc/platypus_output/WiDiv509_PHB47_allchr_platy_indels_hard.filter.vcf  -R /home/hirschc1/oconnorc/maize_refs/PHB47_chr1-10.fasta

#java -Xmx60g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T VariantFiltration --filterExpression "QD < 2.0 || FS > 200.0 || ReadPosRankSum < -20.0" -V /home/hirschc1/oconnorc/platypus_output/WiDiv509_W22v12_allchr_platy_indels.vcf --filterName "fail_indel_filter" -o /home/hirschc1/oconnorc/platypus_output/WiDiv509_W22v12_allchr_platy_indels_hard.filter.vcf  -R /home/hirschc1/oconnorc/maize_refs/W22_chr1-10.fasta

#hard filter to fb output
#java -Xmx30g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T VariantFiltration --filterExpression "QD < 2.0 || FS > 200.0 || ReadPosRankSum < -20.0" -V /home/hirschc1/oconnorc/freebayes_output/WiDiv509_B73v4_fb_allchr_indels.vcf --filterName "fail_indel_filter" -o /home/hirschc1/oconnorc/freebayes_output/WiDiv509_B73v4_allchr_fb_indels_hard.filter.vcf  -R /home/hirschc1/oconnorc/maize_refs/B73_chr1-10.fasta

#java -Xmx60g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T VariantFiltration --filterExpression "QD < 2.0 || FS > 200.0 || ReadPosRankSum < -20.0" -V /home/hirschc1/oconnorc/freebayes_output/WiDiv509_Mo17_fb_allchr_indels.vcf --filterName "fail_indel_filter" -o /home/hirschc1/oconnorc/freebayes_output/WiDiv509_Mo17_allchr_fb_indels_hard.filter.vcf  -R /home/hirschc1/oconnorc/maize_refs/Mo17_chr1-10.fasta

#java -Xmx60g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T VariantFiltration --filterExpression "QD < 2.0 || FS > 200.0 || ReadPosRankSum < -20.0" -V /home/hirschc1/oconnorc/freebayes_output/WiDiv509_PH207_fb_allchr_indels.vcf --filterName "fail_indel_filter" -o /home/hirschc1/oconnorc/freebayes_output/WiDiv509_PH207_allchr_fb_indels_hard.filter.vcf  -R /home/hirschc1/oconnorc/maize_refs/PH207_chr1-10.fasta

#java -Xmx60g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T VariantFiltration --filterExpression "QD < 2.0 || FS > 200.0 || ReadPosRankSum < -20.0" -V /home/hirschc1/oconnorc/freebayes_output/WiDiv509_PHB47_fb_allchr_indels.vcf --filterName "fail_indel_filter" -o /home/hirschc1/oconnorc/freebayes_output/WiDiv509_PHB47_allchr_fb_indels_hard.filter.vcf  -R /home/hirschc1/oconnorc/maize_refs/PHB47_chr1-10.fasta

#java -Xmx60g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T VariantFiltration --filterExpression "QD < 2.0 || FS > 200.0 || ReadPosRankSum < -20.0" -V /home/hirschc1/oconnorc/freebayes_output/WiDiv509_W22v12_fb_allchr_indels.vcf --filterName "fail_indel_filter" -o /home/hirschc1/oconnorc/freebayes_output/WiDiv509_W22v12_allchr_fb_indels_hard.filter.vcf  -R /home/hirschc1/oconnorc/maize_refs/W22_chr1-10.fasta


#combine vcf files and select only sites that intersects 
java -Xmx50g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T CombineVariants -R /home/hirschc1/oconnorc/maize_refs/B73_chr1-10.fasta -V:fb /home/hirschc1/oconnorc/freebayes_output/WiDiv509_B73v4_allchr_fb_indels_hard.filter.vcf -V:platy /home/hirschc1/oconnorc/platypus_output/WiDiv509_B73v4_allchr_platy_indels_hard.filter.vcf --genotypemergeoption UNIQUIFY -o /home/hirschc1/oconnorc/combined_indel_vcfs/WiDiv509_ref.B73v4_fb.platy_ComVar.vcf

java -Xmx50g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T CombineVariants -R /home/hirschc1/oconnorc/maize_refs/Mo17_chr1-10.fasta -V:fb /home/hirschc1/oconnorc/freebayes_output/WiDiv509_Mo17_allchr_fb_indels_hard.filter.vcf -V:platy /home/hirschc1/oconnorc/platypus_output/WiDiv509_Mo17_allchr_platy_indels_hard.filter.vcf --genotypemergeoption UNIQUIFY -o /home/hirschc1/oconnorc/combined_indel_vcfs/WiDiv509_ref.Mo17_fb.platy_ComVar.vcf

java -Xmx50g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T CombineVariants -R /home/hirschc1/oconnorc/maize_refs/PH207_chr1-10.fasta -V:fb /home/hirschc1/oconnorc/freebayes_output/WiDiv509_PH207_allchr_fb_indels_hard.filter.vcf -V:platy /home/hirschc1/oconnorc/platypus_output/WiDiv509_PH207_allchr_platy_indels_hard.filter.vcf --genotypemergeoption UNIQUIFY -o /home/hirschc1/oconnorc/combined_indel_vcfs/WiDiv509_ref.PH207_fb.platy_ComVar.vcf

java -Xmx50g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T CombineVariants -R /home/hirschc1/oconnorc/maize_refs/PHB47_chr1-10.fasta -V:fb /home/hirschc1/oconnorc/freebayes_output/WiDiv509_PHB47_allchr_fb_indels_hard.filter.vcf -V:platy /home/hirschc1/oconnorc/platypus_output/WiDiv509_PHB47_allchr_platy_indels_hard.filter.vcf --genotypemergeoption UNIQUIFY -o /home/hirschc1/oconnorc/combined_indel_vcfs/WiDiv509_ref.PHB47_fb.platy_ComVar.vcf

java -Xmx50g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T CombineVariants -R /home/hirschc1/oconnorc/maize_refs/W22_chr1-10.fasta -V:fb /home/hirschc1/oconnorc/freebayes_output/WiDiv509_W22v12_allchr_fb_indels_hard.filter.vcf -V:platy /home/hirschc1/oconnorc/platypus_output/WiDiv509_W22v12_allchr_platy_indels_hard.filter.vcf --genotypemergeoption UNIQUIFY -o /home/hirschc1/oconnorc/combined_indel_vcfs/WiDiv509_ref.W22v12_fb.platy_ComVar.vcf


#select variants in common and that pass the hard filter
java -Xmx50g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T SelectVariants -R /home/hirschc1/oconnorc/maize_refs/B73_chr1-10.fasta  --excludeFiltered -select 'set == "Intersection";' -V /home/hirschc1/oconnorc/combined_indel_vcfs/WiDiv509_ref.B73v4_fb.platy_ComVar.vcf -o /home/hirschc1/oconnorc/combined_indel_vcfs/WiDiv509_ref.B73v4_fb.platy_intersect.vcf

java -Xmx50g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T SelectVariants -R /home/hirschc1/oconnorc/maize_refs/Mo17_chr1-10.fasta  --excludeFiltered -select 'set == "Intersection";' -V /home/hirschc1/oconnorc/combined_indel_vcfs/WiDiv509_ref.Mo17_fb.platy_ComVar.vcf -o /home/hirschc1/oconnorc/combined_indel_vcfs/WiDiv509_ref.Mo17_fb.platy_intersect.vcf

java -Xmx50g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T SelectVariants -R /home/hirschc1/oconnorc/maize_refs/PH207_chr1-10.fasta  --excludeFiltered -select 'set == "Intersection";' -V /home/hirschc1/oconnorc/combined_indel_vcfs/WiDiv509_ref.PH207_fb.platy_ComVar.vcf -o /home/hirschc1/oconnorc/combined_indel_vcfs/WiDiv509_ref.PH207_fb.platy_intersect.vcf

java -Xmx50g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T SelectVariants -R /home/hirschc1/oconnorc/maize_refs/PHB47_chr1-10.fasta  --excludeFiltered -select 'set == "Intersection";' -V /home/hirschc1/oconnorc/combined_indel_vcfs/WiDiv509_ref.PHB47_fb.platy_ComVar.vcf -o /home/hirschc1/oconnorc/combined_indel_vcfs/WiDiv509_ref.PHB47_fb.platy_intersect.vcf

java -Xmx50g -jar /home/hirschc1/oconnorc/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T SelectVariants -R /home/hirschc1/oconnorc/maize_refs/W22_chr1-10.fasta  --excludeFiltered -select 'set == "Intersection";' -V /home/hirschc1/oconnorc/combined_indel_vcfs/WiDiv509_ref.W22v12_fb.platy_ComVar.vcf -o /home/hirschc1/oconnorc/combined_indel_vcfs/WiDiv509_ref.W22v12_fb.platy_intersect.vcf

#end of script
