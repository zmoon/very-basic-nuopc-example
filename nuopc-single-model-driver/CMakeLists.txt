cmake_minimum_required(VERSION 3.20)

project(nuopc-single-model-driver
  LANGUAGES Fortran)

set(exe "prog")
set(src
    ../my_model.f90
    driver.F90
    cap.F90
    app.F90
)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../cmake)
message("CMAKE_MODULE_PATH is ${CMAKE_MODULE_PATH}")

add_executable(${exe} ${src})

find_package(MPI REQUIRED)
message(STATUS "MPI_Fortran_COMPILER: ${MPI_Fortran_COMPILER}")
target_link_libraries(${exe} MPI::MPI_Fortran)

find_package(ESMF MODULE REQUIRED)
target_link_libraries(${exe} ESMF)
