sd_standalone := "standalone-driver"
bd_standalone := "_build_standalone"

sd_nuopc1 := "nuopc-single-model-driver"
bd_nuopc1 := "_build_nuopc1"

# Build all
build:
    cmake -S {{sd_standalone}} -B {{bd_standalone}}
    cmake --build {{bd_standalone}}
    cmake -S {{sd_nuopc1}} -B {{bd_nuopc1}}
    cmake --build {{bd_nuopc1}}

# Build and try running the executable
test: build
    @# Currently must be run from that dir in order to read the config file
    cd {{bd_standalone}} && ./prog
    cd {{bd_nuopc1}} && ./prog

# Remove build dirs
clean:
    rm -rf {{bd_standalone}} {{bd_nuopc1}}
