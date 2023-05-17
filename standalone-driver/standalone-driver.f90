program standalone
    use my_model

    ! These parameters are read from a config file,
    ! regardless of whether running standalone
    type(config_type) :: config

    ! In standalone, we will set grid info here in the driver
    integer, parameter :: nx = 10
    real(rk) :: x(nx)

    ! Compute grid based on grid params above
    x = [(real(i, kind=rk), i = 1, nx)]

    ! Read parameters
    call read_config(config)

    ! Run
    print *, x
    print *, calc(x, config)

end program standalone
