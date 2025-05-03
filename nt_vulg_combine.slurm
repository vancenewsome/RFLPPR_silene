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
mafft --op 5.0 --ep 0.5 --genafpair pprfinder_runs/groups_by_motif/fa/trim_p_pls.fa > pprfinder_runs/groups_by_motif/fa/p_pls.afa


conda deactivate

trimal-1.5.0/source/trimal -in pprfinder_runs/groups_by_motif/fa/p_pls.afa -out pprfinder_runs/groups_by_motif/fa/trimmed_p_pls.fa -seqoverlap 20 -resoverlap 0 -gt 0.25

conda activate iqtree
iqtree -s pprfinder_runs/groups_by_motif/fa/trimmed_p_pls.fa -B 1000

conda deactivate