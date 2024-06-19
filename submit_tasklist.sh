#!/bin/bash
#SBATCH -J initconds
#SBATCH --nodes=1
#SBATCH --exclusive
#SBATCH --time=3-00:00:00
#SBATCH --qos=3d
#SBATCH --export=NONE
#SBATCH --array=1-101
#SBATCH --partition=l

unset MODULEPATH
source /opt/sw/Modules/4.7.1/init/bash

module load /opt/sw/Modules/4.7.1/modulefiles/icc/2023
module load /opt/sw/Modules/4.7.1/modulefiles/mkl/2023
module load /opt/sw/Modules/4.7.1/modulefiles/fermions/2024.05.06

module load /opt/sw/Modules/4.7.1/modulefiles/conda-venvs/3.11.7-latest
module load /opt/sw/Modules/4.7.1/modulefiles/sharc/peschel-20240613
module load /opt/sw/Modules/4.7.1/modulefiles/cis_nto/master-20240613

export LD_PRELOAD=/opt/sw/libraries/conda-venvs/3.11.7/latest/env/lib/python3.11/site-packages/scipy/fft/_pocketfft/../../../../../libstdc++.so.6

CWD=`pwd`
INPUT=$(grep -A1 "##### ${SLURM_ARRAY_TASK_ID} #####" task.list | tail -n1)
DIR=`dirname $INPUT`
NAME=`basename $INPUT`
WORK="$CWD/$DIR/"
cd $WORK
echo $PWD
bash run.sh
cd $CWD


