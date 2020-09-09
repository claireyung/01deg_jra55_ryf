#!/bin/bash
#PBS -q express
#PBS -l ncpus=1
#PBS -l wd
#PBS -l storage=gdata/hh5+scratch/x77+gdata/e14
#PBS -l walltime=4:00:00,mem=2GB
#PBS -P e14
#PBS -N output_to_gdata

# Set this directory to something in /g/data3/hh5/tmp/cosima/
# Make a unique path for your set of runs.
# DOUBLE-CHECK IT IS UNIQUE SO YOU DON'T OVERWRITE EXISTING OUTPUT!
GDATADIR=/g/data/e14/rmh561/access-om2/archive/01deg_jra55_ryf/

mkdir -p ${GDATADIR}
cd archive
rsync --exclude "*.nc.*" --exclude "ocean_daily_3d_*" --exclude "*ocean_*_3hourly*" --exclude "*iceh_03h*" -vrltoD --safe-links output* ${GDATADIR}
rsync -vrltoD --safe-links error_logs ${GDATADIR}
rsync -vrltoD --safe-links pbs_logs ${GDATADIR}
