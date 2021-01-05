#!/bin/bash -l
#SBATCH -D /group/runciegrp/SharedResources/panzea/Maize282/uplifted_APGv4/
#SBATCH -o /home/gnojoomi/circadian/scripts/str_out_SNP_matrix/VCF_Filtered_%A_%a.out
#SBATCH -e /home/gnojoomi/circadian/scripts/str_err_SNP_matrix/VCF_Filtered_%A_%a.err
#SBATCH -J MakeSNP_Matrix
#SBATCH --mem 5G
#SBATCH --array=1-10

module load vcftools

a='hmp321_agpv4_chr'
b='.vcf.gz'

file="${a}${SLURM_ARRAY_TASK_ID}${b}"
#echo $file

Output='/home/gnojoomi/circadian/files/SNP_matrices'
c='.vcftools.tab_matrix.FILTERED'
Output_File=${file}${c}
Directory="/group/runciegrp/SharedResources/panzea/Maize282/uplifted_APGv4"
#echo "${Directory}/${file}"
zcat ${Directory}/${file} | shuf -n 1500 --out ${Output}/${Output_File}
#zcat ${Directory}/${file} | vcftools  --012  --out ${Output}/${Output_File}

