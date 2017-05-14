#!/bin/bash
#
#SBATCH --comment=r-test
#SBATCH --ntasks=1
#SBATCH --job-name=tidy
#SBATCH --output=output.%j.r-test
#SBATCH --time=05:00:00
#SBATCH --mem=30G
#### SLURM 4 processor R test to run for 1 hour.

module purge
module add apps/R/3.2.3

mpirun Rmpi tidy.R
