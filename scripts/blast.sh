#!/bin/bash -l
#SBATCH -D /home/gnojoomi/circadian/sup_files/
#SBATCH -o /home/gnojoomi/circadian/sup_files/str_out_blast/%A_%a.out
#SBATCH -e /home/gnojoomi/circadian/sup_files/str_err_blast/%A_%a.err
#SBATCH -J Blast
#SBATCH --mem 60G

set -e
set -u
set -o

module load blast

#makeblastdb -in Zea_mays.AGPv4.cdna.all.fa -dbtype nucl -out ~/circadian/sup_files/Zea_mays.AGPv4.cdna.all.fa

blastn -db ~/circadian/sup_files/Zea_mays.AGPv4.cdna.all -query ~/circadian/sup_files/Microarray_final.fa -out ~/circadian/sup_files/Zea_mays_Microarray_transcripts_more_memory.out -outfmt 6
