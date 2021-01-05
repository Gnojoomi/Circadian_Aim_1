#!/bin/bash
#SBATCH -D /group/runciegrp/Projects/HiLo_ASE/Results/mapped_all_batches/
#SBATCH -J Mapping_STAR
#SBATCH -o /group/runciegrp/Projects/HiLo_ASE/Results/mapped_all_batches/str_out/%A_%a.out
#SBATCH -e /group/runciegrp/Projects/HiLo_ASE/Results/mapped_all_batches/str_err/%A_%a.err
#SBATCH --mem 50G

module load star

STAR --runThreadN 3 --runMode genomeGenerate --genomeDir /group/runciegrp/SharedResources/Genomes/Zea_mays/B73/AGPv5.0/STAR_index --genomeFastaFiles /group/runciegrp/SharedResources/Genomes/Zea_mays/B73/AGPv5.0/Zm-B73-REFERENCE-NAM-5.0.fa --sjdbGTFfile /group/runciegrp/SharedResources/Genomes/Zea_mays/B73/AGPv5.0/Zm-B73-REFERENCE-NAM-5.0_Zm00001e.1.gtf
