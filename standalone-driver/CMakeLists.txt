cmake_minimum_required(VERSION 3.20)

project(standalone-driver
  LANGUAGES Fortran)

set(exe "prog")
set(src
    ../my_model.f90
    standalone-driver.f90
)

add_executable(${exe} ${src})
