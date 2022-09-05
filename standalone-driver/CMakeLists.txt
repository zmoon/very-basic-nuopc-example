cmake_minimum_required(VERSION 3.22)

project(standalone-driver)
enable_language(Fortran)

set(exe, "prog")
set(src
    ../model.f90
    standalone-driver.f90
)

add_executable(${exe} ${src})
