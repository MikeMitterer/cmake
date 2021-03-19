# - Try to find args source lib
#
# Library Home: https://github.com/Taywee/args
#
# Once done this will define
#  args_FOUND - System has args
#  args_INCLUDE_DIRS - The args include directories

find_package(PkgConfig)

find_file(args_INCLUDE_DIR args.hxx
        PATH args
        HINTS args
        )

if(NOT args_INCLUDE_DIR)
    set(args_INCLUDE_DIR "$ENV{DEVCPP}/libs/args")
endif()

message(STATUS "args-Include Dir:   ${args_INCLUDE_DIR}" )

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBXML2_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(args DEFAULT_MSG
        args_INCLUDE_DIR
        )

mark_as_advanced(args_INCLUDE_DIR)

set(args_INCLUDE_DIRS ${args_INCLUDE_DIR} )

include_directories(${args_INCLUDE_DIR})
