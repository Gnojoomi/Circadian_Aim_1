#!/bin/bash -l
#SBATCH -D /group/runciegrp/Projects/HiLo_ASE/Results/FeatureCounts_all_batches/
#SBATCH -o /group/runciegrp/Projects/HiLo_ASE/Results/FeatureCounts_all_batches/str_out/%A_%a.out
#SBATCH -e /group/runciegrp/Projects/HiLo_ASE/Results/FeatureCounts_all_batches/str_err/%A_%a.err
#SBATCH -J FeatureCounts
#SBATCH --mem 5G
#SBATCH --array=1-672

#Load modules:
module load samtools
module load subread
module load cufflinks 

#Set up variables:
outputs=/group/runciegrp/Projects/HiLo_ASE/Results/FeatureCounts_all_batches
GFF3=/group/runciegrp/SharedResources/Genomes/Zea_mays/B73/AGPv5.0/Zm-B73-REFERENCE-NAM-5.0_Zm00001e.1.gff3
GTF=/group/runciegrp/SharedResources/Genomes/Zea_mays/B73/AGPv5.0/Zm-B73-REFERENCE-NAM-5.0_Zm00001e.1.gtf
genome=/group/runciegrp/SharedResources/Genomes/Zea_mays/B73/AGPv5.0/Zm-B73-REFERENCE-NAM-5.0.fa.gz

sup_files=/group/runciegrp/Data/Illumina/metadata/f17_sample_submission_batch_1-4.csv
F1_sample_names=/home/gnojoomi/Alternative_Splice/sup_files/High_sample_names.csv
sample=$(sed -n ${SLURM_ARRAY_TASK_ID}p $F1_sample_names)
bam_files=/group/runciegrp/Projects/HiLo_ASE/Results/map_sorted

echo $samples
mkdir $outputs/${samples}
# Run FeatureCounts:
featureCounts -T 2 -p \
-a $GTF -t exon -g gene_id -s 1 \
-o $outputs/${samples}/${samples}"_counts.txt" \
$bam_files/${samples}"_sorted.bam" \

echo "Finishing Counting!"
