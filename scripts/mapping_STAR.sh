#!/bin/bash
#SBATCH -D /group/runciegrp/Projects/HiLo_ASE/Results/mapped_all_batches/
#SBATCH -J Mapping_STAR
#SBATCH -o /group/runciegrp/Projects/HiLo_ASE/Results/mapped_all_batches/str_out/%A_%a.out
#SBATCH -e /group/runciegrp/Projects/HiLo_ASE/Results/mapped_all_batches/str_err/%A_%a.err
#SBATCH --mem 50G
#SBATCH --array=2-672%5

module load star

sup_files=/home/gnojoomi/Aim_1/circadian/sup_files/f17_sample_submission_batch_1-4.csv
F1_sample_names=/home/gnojoomi/Aim_1/circadian/sup_files/F1_file_names.csv
sample=$(sed -n ${SLURM_ARRAY_TASK_ID}p $F1_sample_names)
#echo "${SLURM_ARRAY_TASK_ID}p"


f_reads=$(grep $sample $sup_files | cut -d',' -f22,23 | sed 's/[,""]//g' | tr '\r\n' ',' | sed 's/\(.*\),/\1/')
r_reads=$(grep $sample $sup_files | cut -d',' -f22,24 | sed 's/[,""]//g' | tr '\r\n' ',' | sed 's/\(.*\),/\1/')
space=" "
all_reads=$f_reads$space$r_reads
index=/group/runciegrp/SharedResources/Genomes/Zea_mays/B73/AGPv5.0

directory=/group/runciegrp/Projects/HiLo_ASE/Results/mapped_all_batches/
sample=$(echo $sample | tr -d '"' | tr -d "'")
output_directory=$directory$sample
mkdir $output_directory
cd $output_directory
STAR --runThreadN 8 --genomeDir /group/runciegrp/SharedResources/Genomes/Zea_mays/B73/AGPv5.0/STAR_index --readFilesCommand gunzip -c --readFilesIn $all_reads
