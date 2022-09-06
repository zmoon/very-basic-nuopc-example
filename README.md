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

...

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

Settings:
```bash
export ESMF_DIR='set this'  # "the full pathname of the top level ESMF directory before building"
export ESMF_INSTALL_PREFIX='set this if different from ESMF_DIR'

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
