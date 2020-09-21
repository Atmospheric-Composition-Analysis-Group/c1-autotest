cd ${RUN_DIRECTORY}
rm -f cap_restart gcchem*
chmod +x runConfig.sh ./geos
./runConfig.sh
export TMPDIR="$__LSF_JOB_TMPDIR__"
mpirun -np ${NUM_CORES} ${BUILD_DIRECTORY}/bin/geos &> run_log.txt
