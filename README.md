# very-basic-nuopc-example

The goal is to demonstrate how an external library ("model") can be used
* [x] in a standalone program
* [x] in a NUOPC "single model driver" framework [^a]
* [ ] in NUOPC, one-way coupling to a "data model"
* [ ] NUOPC two-way coupling

Build and run the programs using [`just`](https://github.com/casey/just):
```bash
just test
```


[^a]: See the [SingleModelProto](https://github.com/esmf-org/nuopc-app-prototypes/tree/main/SingleModelProto/) example.

## Background

* [NUOPC landing page](https://earthsystemmodeling.org/nuopc/)

## Getting ESMF

*Note that NUOPC is included with ESMF.*

### On NOAA Hera

We can follow the [hpc-stack usage instructions](https://github.com/NOAA-EMC/hpc-stack/wiki/Official-Installations) to get ESMF.

*Below current as of 2022-09-06*

```sh
module use /scratch2/NCEPDEV/nwprod/hpc-stack/libs/hpc-stack/modulefiles/stack
module load hpc/1.2.0
module load hpc-intel/2022.1.2 hpc-impi/2022.1.2
module load esmf/8.3.0
```

After this, `ESMFMKFILE` and other env vars (`env | grep ^ESMF`) are set:
ESMF is ready to go.

Prepare to build:
```sh
module load cmake/3.20.1
export FC=mpiifort
```

### Installing on Ubuntu

*Tested on WSL2 Ubuntu 20.04.5 LTS; based on [this guide](https://chenzhang.org/notes/gis/installing-esmf-on-ubuntu/)*

Basics:
```bash
sudo apt install build-essential gfortran
```

Minimal but sufficient ESMF deps:
```bash
sudo apt install libnetcdf-dev libnetcdff-dev liblapack-dev libopenblas-dev
```

Download the source code from [ESMF releases](https://github.com/esmf-org/esmf/releases).
The unpacked directory, which contains `build`, `src`, etc., subdirectories,
is what you use for `ESMF_DIR` below.

Settings:
```bash
export ESMF_DIR=/full/path/to/ESMF/dir
# export ESMF_INSTALL_PREFIX=/set/if/different/from/ESMF_DIR

export ESMF_LAPACK=netlib
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpiuni  # MPI bypass

# system GCC
export ESMF_F90COMPILER=/usr/bin/gfortran
export ESMF_CCOMPILER=/usr/bin/gcc
export ESMF_CXXCOMPILER=/usr/bin/g++
```

Build and run some tests (takes minutes):
```
make check
```

Set `ESMFMKFILE` (location of `esmf.mk`; important for being to find the built library):
```bash
export ESMFMKFILE=$ESMF_INSTALL_PREFIX/lib/libO/Linux.gfortran.64.mpiuni.default/esmf.mk  # e.g.
```
