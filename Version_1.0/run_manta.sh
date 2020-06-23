#!/bin/bash                                                                                                                                                                                                                    
#PBS -l mem=64gb,nodes=1:ppn=12,walltime=30:00:00                                                                                                                                                                              
#PBS -A hirschc1                                                                                                                                                                                                               
#PBS -m abe                                                                                                                                                                                                                    
#PBS -o /home/hirschc1/oconnorc                                                                                                                                                                                                
#PBS -e /home/hirschc1/oconnorc                                                                                                                                                                                                
#PBS -M oconnorc@umn.edu                                                                                                                                                                                                       
#PBS -q mesabi                                                                                                                                                                                                                 

#modules                                                                                                                                                                                                                       
module load python2

manta_loc=/home/hirschc1/oconnorc/software/manta-1.4.0.centos6_x86_64
output=/home/hirschc1/oconnorc/practice_data/manta_output
input_bam=/home/hirschc1/oconnorc/practice_data/filtered_bams
ref_genomes=/home/hirschc1/oconnorc/practice_data/maize_refs
sample_prefix="PHG29                                                                                                                                                                                                           
PHG35                                                                                                                                                                                                                          
PHN11
B84                                                                                                                                                                                                                           
PHB47"
#subset of WiDiv samples used to test pipeline

#in 72 hours with 12 threads can finish running manta on 5 samples
#manta runs quickly

#Before running manta:
#make output directories                                                                                                                                                                                                       
for i in $sample_prefix                                                                                                                                                                                                       
do                                                                                                                                                                                                                            
   mkdir $output/${i}_B73v4_manta                                                                                                                                                                                            
    mkdir $output/${i}_PH207_manta                                                                                                                                                                                           
    mkdir $output/${i}_W22v12_manta                                                                                                                                                                                           
done                                                                                                                                                                                                                                                                                                                                                                                                           

#Manta runs in two steps                                                                                                                                                                                                       
#1st: run configure program                                                                                                                                                                                                    
for j in $sample_prefix                                                                                                                                                                                                       
do                                                                                                                                                                                                                            
    python2 $manta_loc/bin/configManta.py --bam=$input_bam/${j}_B73v4_mapq20_sort.bam --referenceFasta=$ref_genomes/B73_chr1-10.fasta --runDir=$output/${j}_B73v4_manta --callRegions $ref_genomes/bed_files/B73_b2k_genic.bed.gz                                                                                                                                                                                                                           
    python2 $manta_loc/bin/configManta.py --bam=$input_bam/${j}_PH207_mapq20_sort.bam --referenceFasta=$ref_genomes/PH207_chr1-10.fasta --runDir=$output/${j}_PH207_manta --callRegions $ref_genomes/bed_files/PH207_b2k_genic.bed.gz                                                                                                                                                                                                                       
    python2 $manta_loc/bin/configManta.py --bam=$input_bam/${j}_W22v12_mapq20_sort.bam --referenceFasta=$ref_genomes/W22_chr1-10.fasta --runDir=$output/${j}_W22v12_manta --callRegions $ref_genomes/bed_files/W22v12_b2k_genic.bed.gz                                                                                                                                                                                                                      
done                                                                                                                                                                                                                          

#2nd: run actual SV finding program
for k in $sample_prefix                                                                                                                                                                                                       
do                                                                                                                                                                                                                            
    python2 $output/${k}_B73v4_manta/runWorkflow.py -m local -j 12                                                                                                                                                            
    python2 $output/${k}_PH207_manta/runWorkflow.py -m local -j 12                                                                                                                                                           
    python2 $output/${k}_W22v12_manta/runWorkflow.py -m local -j 12                                                                                                                                                           
done  

