#!/usr/bin/env bash

#SBATCH --job-name=RNAseq_pipeline 
#SBATCH --nodes=1                           # this script is designed to run on one node
#SBATCH --ntasks=2                          # modify this number to reflect how many cores you want to use (up to 24)
#SBATCH --time=04:00:00                     # modify this number to reflect how much time to request
#SBATCH --partition=amilan                    # modify this to reflect which queue you want to use. Either 'shas' or 'shas-testing'
#SBATCH --qos=normal                        # Should be 'normal' if partition is 'shas'; should be 'testing' if partition is 'shas-testing'
#SBATCH --mail-type=END                     # Keep these two lines of code if you want an e-mail sent to you when it is complete.
#SBATCH --mail-user=krstew@colostate.edu             # add your e-mail here
#SBATCH --output=log_RNAseq_pipe_%j.txt     # this will capture all output in a logfile with %j as the job #

######### Instructions ###########

# Modify your SLURM entries above to fit your choices
# Below, modify the SECOND argument to point to YOUR metadata.file
# Below, you don't need to change $SLURM_NTASKS. It will automatically populate whatever you put in --ntasks=# above.
# Execute this script using $ sbatch execute_RNAseq_pipeline.sbatch



## Execute the RNA-seq_pipeline to run the pipeline
source /curc/sw/anaconda3/latest
conda activate RNAseq
bash RNAseq_analyzer_221126.sh /pl/active/onishimura_lab/PROJECTS/Kayla/Dissected_Intestine_AdultN2_Erin/01_input/metadata_221024_A00405_0630_AHJTLGDSX5_L3_Nishimura.txt 
$SLURM_NTASKS


## Execute the cleanup script to zip .fastq files and delete extra files
#bash RNAseq_cleanup_221126.sh <metadatafile> 
