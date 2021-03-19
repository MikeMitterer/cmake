# - Try to find fmt source lib
#
# Library Home: https://github.com/fmtlib/fmt
#
# Once done this will define
#  fmt_FOUND - System has args
#  fmt_INCLUDE_DIRS - The args include directories

find_package(PkgConfig)

find_file(fmt_INCLUDE_DIR format.h
        PATH fmt
        HINTS fmt
        )

if(NOT fmt_INCLUDE_DIR)
    set(fmt_INCLUDE_DIR "$ENV{DEVCPP}/libs/fmt")
endif()

message(STATUS "fmt-Include Dir:       ${fmt_INCLUDE_DIR}" )

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBXML2_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(fmt DEFAULT_MSG
        fmt_INCLUDE_DIR
        )

mark_as_advanced(fmt_INCLUDE_DIR)

# Avoids "Undefined symbols for architecture" Error
add_definitions(-DFMT_HEADER_ONLY)

set(fmt_INCLUDE_DIRS ${fmt_INCLUDE_DIR} )

include_directories(${fmt_INCLUDE_DIR})
