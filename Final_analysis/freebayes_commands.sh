/home/hirschc1/oconnorc/software/freebayes_20190722_download/freebayes/bin/freebayes -L /panfs/roc/scratch/oconnorc/SVcaller_output/freebayes_output/bam_files_PH207ref.txt -f /home/hirschc1/oconnorc/maize_refs/PH207_chr1-10.fasta -t /home/hirschc1/oconnorc/maize_refs/bed_files/PH207_chr2_genic.bed -k -n 4 --min-coverage 100 -0 --skip-coverage 3278 -C 4 > /panfs/roc/scratch/oconnorc/SVcaller_output/freebayes_output/WiDiv100_PH207_chr2gene1kb_skip.nbest4.k.vcf

#parameters used 
#-t: limit analysis to these regions
#-k: no-population-priors Equivalent to --pooled-discrete --hwe-priors-off and removal of Ewens Sampling Formula component of priors.
#-n: --use-best-n-alleles N Evaluate only the best N SNP alleles, ranked by sum of supporting quality scores.  (Set to 0 to use all; default: all)
#--min-coverage Require at least this coverage to process a site; I interpret this as minimum coverage over all samples - so if I have 500 samples, 500*4x = 2000x
#-0 --standard-filters  Use stringent input base and mapping quality filters; Equivalent to -m 30 -q 20 -R 0 -S 0
#--skip-coverage Skip processing of alignments overlapping positions with coverage >N. This filters sites above this coverage, but will also reduce data nearby. I interpret this as max coverage over all samples - sum of genomewide mean coverage for each individual * 2.
#-c 4, Require at least this count of observations supporting an alternate allele within a single individual in order to evaluate the position.

