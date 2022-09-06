module my_model
    use iso_fortran_env, only: rk => real64, stderr => error_unit
    implicit none

    private
    public calc, rk, config_type, read_config

    character(*), parameter :: config_dir = ".."
    character(*), parameter :: config_fn = "config.nml"
    character(*), parameter :: config_fp = config_dir // "/" // config_fn

    type :: config_type
        real(rk) :: a
        real(rk) :: b
    end type config_type

contains

    !> Read params from namelist and set values in the `config` instance.
    subroutine read_config(config)
        type(config_type), intent(inout) :: config

        integer :: fu, rc
        real(rk) :: a, b

        ! Namelist definition
        namelist /PARAMS/ a, b

        ! Read namelist
        print *, "reading " // config_fp
        open (file=config_fp, action="read", newunit=fu)
        read (nml=PARAMS, unit=fu)
        if (rc /= 0) write (stderr, '("Error: invalid Namelist format")')

        ! Set config
        config%a = a
        config%b = b

    end subroutine read_config

    !> Compute something using the grid `x` and the parameters in `config`.
    function calc(x, config) result(res)
        real(rk), intent(in) :: x(:)
        type(config_type), intent(in) :: config
        real(rk) :: res(size(x))

        associate( &
            a => config%a, &
            b => config%b &
        )

        res = a * x + b

        end associate
    end function calc

end module my_model
