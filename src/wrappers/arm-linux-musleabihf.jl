# Autogenerated wrapper script for X11_jll for arm-linux-musleabihf
export libX11, libX11_xcb

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libX11`
const libX11_splitpath = ["lib", "libX11-xcb.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libX11_path = ""

# libX11-specific global declaration
# This will be filled out by __init__()
libX11_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libX11 = "libX11-xcb.so.1"


# Relative path to `libX11_xcb`
const libX11_xcb_splitpath = ["lib", "libX11-xcb.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libX11_xcb_path = ""

# libX11_xcb-specific global declaration
# This will be filled out by __init__()
libX11_xcb_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libX11_xcb = "libX11-xcb.so.1"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global libX11_path = abspath(joinpath(artifact"X11", libX11_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libX11_handle = dlopen(libX11_path)
    push!(LIBPATH_list, dirname(libX11_path))

    global libX11_xcb_path = abspath(joinpath(artifact"X11", libX11_xcb_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libX11_xcb_handle = dlopen(libX11_xcb_path)
    push!(LIBPATH_list, dirname(libX11_xcb_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

