# - Try to find fmt source lib
#
# Library Home: https://github.com/nlohmann/json
#
# Once done this will define
#  json_FOUND - System has args
#  json_INCLUDE_DIRS - The args include directories

find_package(PkgConfig)

find_file(json_INCLUDE_DIR json.hpp
        PATH json
        HINTS src
        )

if(NOT json_INCLUDE_DIR)
    set(json_INCLUDE_DIR "$ENV{DEVCPP}/libs/json")
endif()

message(STATUS "json-Include Dir:      ${json_INCLUDE_DIR}" )

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBXML2_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(json DEFAULT_MSG
        json_INCLUDE_DIR
        )

mark_as_advanced(json_INCLUDE_DIR)

set(json_INCLUDE_DIRS ${json_INCLUDE_DIR} )

include_directories(${json_INCLUDE_DIR}/src)
