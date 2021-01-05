#!/bin/bash
#SBATCH -D /group/runciegrp/taylor/f17/results/mapping/seq_batch_two
#SBATCH -J circadian
#SBATCH -o /group/runciegrp/taylor/f17/results/mapping/seq_batch_two/str_out/%A_%a.out
#SBATCH -e /group/runciegrp/taylor/f17/results/mapping/seq_batch_two/str_err/%A_%a.err
#SBATCH --mem 10G
#SBATCH --array=2-672

module load samtools 
module load bwa 


files=/home/gnojoomi/Project_1/VCF_DNAseq_pipeline/files
genome=/home/gnojoomi/Project_1/VCF_DNAseq_pipeline/files/Zea_mays.AGPv4.dna.toplevel.fa
sam_files=/group/runciegrp/taylor/f17/results/mapping/seq_batch_two
sample_fastq=/home/gnojoomi/circadian/sup_files/seqbatchone_seqbatchtwo.csv

directory=`cut -f2 -d, $sample_fastq | sed -n "${SLURM_ARRAY_TASK_ID}p"`
#directory=`sed -n "${SLURM_ARRAY_TASK_ID}p" $sample_fastq`
#f_read=`cut -f2 -d, $sample_fastq | sed -n "${SLURM_ARRAY_TASK_ID}p"`
#r_read=`cut -f3 -d, $sample_fastq | sed -n "${SLURM_ARRAY_TASK_ID}p"`

echo $directory

#aln="output.sam"
aln_bam="${directory}.bam"
aln_sort="${directory}_sort.bam"

#mkdir $outputs/$directory
samtools view -b $sam_files/$directory/output_t.sam -o $sam_files/$directory/"${directory}.bam"
samtools sort $sam_files/$directory/$aln_bam -o $sam_files/$directory/$aln_sort
samtools index $sam_files/$directory/$aln_sort
