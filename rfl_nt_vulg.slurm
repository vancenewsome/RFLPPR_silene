#!/bin/bash 

#SBATCH --ntasks=1
#SBATCH --mem=96000
#SBATCH --partition=standard
#SBATCH --account=taylorlab
#SBATCH --time=18:00:00
### Template, change filenames to match current files

module load miniforge/24.3.0-py3.11
cd /home/pmh3ax

conda activate mafft
mafft --op 5.0 --ep 0.5 --genafpair pprs_analysis/combined_rfl_seqs.fa > pprs_analysis/combined_rfl_seqs.afa

conda deactivate

trimal-1.5.0/source/trimal -in pprs_analysis/combined_rfl_seqs.afa -out pprs_analysis/trim_rfl_seqs.fa -seqoverlap 20 -resoverlap 0 -gt 0.25

conda activate iqtree
iqtree -s pprs_analysis/trim_rfl_seqs.fa -B 1000

conda deactivate