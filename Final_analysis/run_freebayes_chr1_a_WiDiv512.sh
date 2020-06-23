#!/bin/bash
#PBS -l mem=245gb,nodes=1:ppn=1,walltime=96:00:00
#PBS -A hirschc1
#PBS -m abe
#PBS -o /home/hirschc1/oconnorc/OandE
#PBS -e /home/hirschc1/oconnorc/OandE
#PBS -M oconnorc@umn.edu
#PBS -q mangi
#PBS -N B73_chr1A

#job to run samtools filter and sort using gnu parallel

#go here: https://www.msi.umn.edu/support/faq/how-can-i-use-gnu-parallel-run-lot-commands-parallel

#this command works interactively: 
#parallel --jobs 3 < run_samtools_filter.sort.txt 

#run_samtools_filter.sort.txt created by create_commands_forparallel.sh

#load needed modules
#module load parallel
#module load gatk/3.3.0
#module load java

#directory with scripts in it
command_files=/home/hirschc1/oconnorc/scripts


#above is including environment variables (i.e. samtools) in my PBS script after I've loaded modules but before GNU parallel is run

#now run parallel command 
cd /home/hirschc1/oconnorc/scripts

#export PARALLEL="--workdir . --env PATH --env LD_LIBRARY_PATH --env LOADEDMODULES --env _LMFILES_ --env MODULE_VERSION --env MODULEPATH --env MODULEVERSION_STACK --env MODULESHOME --env OMP_DYNAMICS --env OMP_MAX_ACTIVE_LEVELS --env OMP_NESTED --env OMP_NUM_THREADS --env OMP_SCHEDULE --env OMP_STACKSIZE --env OMP_THREAD_LIMIT --env OMP_WAIT_POLICY --compress"

#export PARALLEL="--workdir . --env PATH --env LD_LIBRARY_PATH --env LOADEDMODULES --env _LMFILES_ --env MODULE_VERSION --env MODULEPATH --env MODULEVERSION_STACK --env MODULESHOME --env OMP_DYNAMICS --env OMP_MAX_ACTIVE_LEVELS --env OMP_NESTED --env OMP_NUM_THREADS --env OMP_SCHEDULE --env OMP_STACKSIZE --env OMP_THREAD_LIMIT --env OMP_WAIT_POLICY --tmpdir /home/hirschc1/oconnorc/OandE/tmp_files"

#sort -u $PBS_NODEFILE > unique_nodelist_freebayes2.txt
#parallel --jobs 1 --sshloginfile unique_nodelist_freebayes2.txt --workdir $PWD < WiDiv_freebayes_test25_B73v4ref_gene1kb.txt

/home/hirschc1/oconnorc/software/freebayes_20190722_download/freebayes/bin/freebayes -L /home/hirschc1/oconnorc/scripts/WiDiv512_B73v4_filenames.txt -f /home/hirschc1/oconnorc/maize_refs/B73_chr1-10.fasta -t /home/hirschc1/oconnorc/maize_refs/bed_files/B73_chr1.A_genic.bed -k -n 4 --min-coverage 512 -0 --skip-coverage 17271 -C 4  > /home/hirschc1/oconnorc/freebayes_output/WiDiv512_B73v4_chr1A_gene1kb.vcf

#end of script

