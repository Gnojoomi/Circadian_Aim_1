#!/bin/bash -l
#SBATCH -D /group/runciegrp/Projects/HiLo_ASE/Results/map_sorted
#SBATCH -o /group/runciegrp/Projects/HiLo_ASE/Results/FeatureCounts/str_out/moving_%A_%a.out
#SBATCH -e /group/runciegrp/Projects/HiLo_ASE/Results/FeatureCounts/str_err/moving_%A_%a.err
#SBATCH -J Moving
#SBATCH --mem 5G
#SBATCH --array=504-516,518-548,562,615

set -e
set -u
set -o


#Load modules:
module load samtools
module load subread
module load cufflinks 

#Set up variables:
outputs=/group/runciegrp/Projects/HiLo_ASE/Results/FeatureCounts
sample_read_groups=/home/gnojoomi/circadian/sup_files/RNA_seq_bam_files_only.csv
samples=`cut -f1 -d, $sample_read_groups | sed -n "${SLURM_ARRAY_TASK_ID}p "`

#echo "$outputs/${samples}c"*
mv "$outputs/${samples}/${samples}counts.txt" "$outputs/${samples}/${samples}_counts.txt"
mv "$outputs/${samples}/${samples}counts.txt.summary" "$outputs/${samples}/${samples}_counts.txt.summary"
