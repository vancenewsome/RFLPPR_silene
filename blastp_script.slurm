#!/bin/bash 

#SBATCH --ntasks=1
#SBATCH --mem=96000
#SBATCH --partition=standard
#SBATCH --account=taylorlab
#SBATCH --time=18:00:00
### Template, change filenames to match current files

module load blast/2.13

blastp -db nr -query /home/pmh3ax/pprs_analysis/rflseqs.fa -out /home/pmh3ax/pprs_analysis/rflseqs2.out -remote -max_target_seqs 5 -evalue 1e-3
blastp -db nr -query /home/pmh3ax/pprs_analysis/rflseqs-translation.fasta -out /home/pmh3ax/pprs_analysis/rflseqs-translation2.out -remote -max_target_seqs 5 -evalue 1e-3