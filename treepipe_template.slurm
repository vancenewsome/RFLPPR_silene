#!/bin/bash 

#SBATCH --ntasks=1
#SBATCH --mem=96000
#SBATCH --partition=standard
#SBATCH --account=taylorlab
#SBATCH --time=06:00:00
### Template, change filenames to match current files

module load miniforge/24.3.0-py3.11
cd /home/pmh3ax

conda activate mafft
mafft --auto pprfinder_runs/motif_conica.fa > pprfinder_runs/align_conica.fa
conda deactivate

trimal-1.5.0/source/trimal -in pprfinder_runs/align_conica.fa -out pprfinder_runs/trim_conica.fa -seqoverlap 20 -resoverlap 0 -gt 0.2

conda activate iqtree
iqtree -s pprfinder_runs/trim_conica.fa -m LG+F+R10 -B 1000
conda deactivate