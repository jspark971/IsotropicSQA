#!/bin/csh
NULIB_LOC = NuLib
HDF5_LOC = /usr/local/hdf5-1.8.20_gnu7.3.0

INCLUDE  = -I${HDF5_LOC}/include

LIBRARY = ${NULIB_LOC}/src/nulib.a -L${HDF5_LOC}/lib -lhdf5 -lhdf5_fortran -lhdf5_cpp -lgfortran

WHICHCODE = sqa2.psma

COMP = g++  -g -std=gnu++11 -O3 -fopenmp -Wall # -DNDEBUG

${WHICHCODE}.o: ${WHICHCODE}.cpp
	rm -f sqa2.psma.x sqa.tar.gz
	tar --exclude=*.lum --exclude=*.cyl -cvzf sqa.tar.gz ./*
	${COMP} ${WHICHCODE}.cpp -o ${WHICHCODE}.x ${INCLUDE} ${LIBRARY}
