#!/usr/bin/env bash 

#export PATH="/home/papajim/scratch/software/openmpi/bin:$PATH"
#export LD_LIBRARY_PATH="/home/papajim/scratch/software/openmpi/lib:$LD_LIBRARY_PATH"
#export PYTHONPATH="/usr/lib64/python2.6/site-packages/openmpi:$PYTHONPATH"
#MANPATH         /usr/share/man/openmpi-x86_64
#export MPI_BIN=/home/papajim/scratch/software/openmpi/bin
#MPI_SYSCONFIG   /etc/openmpi-x86_64
#MPI_FORTRAN_MOD_DIR     /usr/lib64/gfortran/modules/openmpi-x86_64
#export MPI_INCLUDE=/home/papajim/scratch/software/openmpi/include
#export MPI_LIB=/home/papajim/scratch/software/openmpi/lib
#MPI_MAN         /usr/share/man/openmpi-x86_64
#MPI_PYTHON_SITEARCH     /usr/lib64/python2.6/site-packages/openmpi
#MPI_COMPILER    openmpi-x86_64
#MPI_SUFFIX      _openmpi
#export MPI_HOME=/home/papajim/scratch/software/openmpi

SOFTWR=/shared/software
PREFIX=/home/panorama/scratch
cd $PREFIX
tar -zxf sassena.tar.gz

#######################
#  Boost environment  #
#######################
export BOOST_ROOT=$SOFTWR/boost-1.55

#####################
# BLAS environment  #
#####################
BLAS_LIBRARIES=$SOFTWR/lapack-3.8/lib/libblas.so

#######################
# LAPACK environment  #
#######################
LAPACK_LIBRARIES=$SOFTWR/lapack-3.8/lib/liblapack.so

######################
# FFTW3 environment  #
######################
#export FFTW3_HOME=$SOFTWR/fftw-3.3

########################
# LIBXML2 environment  #
########################
#LIBXML2_LIBRARIES=$SOFTWR/libxml2-2.9/lib/libxml2.so
#LIBXML2_INCLUDE_DIR=$SOFTWR/libxml2-2.9/include/libxml2

#####################
# ZLIB environment  #
#####################
#ZLIB_ROOT=$SOFTWR/zlib-1.2
#ZLIB_LIBRARIES=$SOFTWR/zlib-1.2/lib/libz.so
#ZLIB_INCLUDE_DIRS=$SOFTWR/zlib-1.2/include

#####################
# HDF5 environment  #
#####################
#HDF5_ROOT=$SOFTWR/hdf5-1.8
#HDF5_INCLUDE_DIRS=$SOFTWR/hdf5-1.8/include
#HDF5_INCLUDE_DIR=$SOFTWR/hdf5-1.8/include
#HDF5_LIBRARY_DIRS=$SOFTWR/hdf5-1.8/lib
#HDF5_LIBRARIES=${HDF5_LIBRARY_DIRS}/libhdf5.so
#HDF5_HL_LIBRARIES=${HDF5_LIBRARY_DIRS}/libhdf5_hl.so
#LD_LIBRARY_PATH=$HDF5_LIBRARY_DIRS:$LD_LIBRARY_PATH

########################################
# Sassena environment and compilation  #
########################################

SASSENA_HOME=$PREFIX/sassena-master
BUILDIR=$PREFIX/sassena-build
INSTALLDIR=$SOFTWR/sassena
mkdir -p $BUILDIR && cd $BUILDIR

#export CMAKE_PREFIX_PATH=/home/papajim/software/openmpi
cmake -D CMAKE_EXE_LINKER_FLAGS="-Wl,-rpath,$LD_LIBRARY_PATH" -D CMAKE_INSTALL_PREFIX=$INSTALLDIR \
$SASSENA_HOME -D CMAKE_BUILD_TYPE=Debug \
-D CMAKE_CXX_COMPILER=/usr/bin/mpicxx -D CMAKE_C_COMPILER=/usr/bin/mpicc \
-D BLAS_LIBRARIES=${BLAS_LIBRARIES} -D LAPACK_LIBRARIES=${LAPACK_LIBRARIES} -D STATIC=TRUE $SASSENA_HOME
#-D HDF5_ROOT=${HDF5_ROOT} -D ZLIB_ROOT={$ZLIB_ROOT} \
#-D LIBXML2_LIBRARIES=${LIBXML2_LIBRARIES} -D LIBXML2_INCLUDE_DIR=${LIBXML2_INCLUDE_DIR} \

#make 

#make && make install
