cmake_minimum_required(VERSION 3.22)

project(standalone)
enable_language(Fortran)

set(src
    model.f90
    standalone-driver.f90
)

add_executable(prog ${src})
