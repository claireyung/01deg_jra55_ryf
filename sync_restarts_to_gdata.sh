#!/bin/bash
#PBS -q copyq
#PBS -l ncpus=1
#PBS -l wd
#PBS -l walltime=2:00:00,mem=2GB
#PBS -l storage=gdata/hh5+scratch/x77+gdata/ik11+scratch/e14
#PBS -P v45
#PBS -N restarts_to_gdata

source sync_output_to_gdata.sh # to define GDATADIR and cd archive

rsync -vrltoD --safe-links restart* ${GDATADIR}
