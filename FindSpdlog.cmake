# - Try to find spdlog source lib
#
# Library Home: https://github.com/gabime/spdlog
#
# Once done this will define
#  spdlog_FOUND - System has spdlog
#  spdlog_INCLUDE_DIRS - The spdlog include directories

find_package(PkgConfig)

set(SPDLOG_DIR spdlog/include)

find_file(spdlog_INCLUDE_DIR spdlog.h
        PATH ${SPDLOG_DIR}
        HINTS spdlog
        )

if(NOT spdlog_INCLUDE_DIR AND IS_DIRECTORY "/Volumes/Daten/DevLocal/DevCPP/libs/${SPDLOG_DIR}")
    set(spdlog_INCLUDE_DIR "/Volumes/Daten/DevLocal/DevCPP/libs/${SPDLOG_DIR}")
endif()

message(STATUS "spdlog-Include Dir:    ${spdlog_INCLUDE_DIR}" )

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBXML2_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(spdlog DEFAULT_MSG
        spdlog_INCLUDE_DIR
        )

mark_as_advanced(spdlog_INCLUDE_DIR)

set(spdlog_INCLUDE_DIRS ${spdlog_INCLUDE_DIR} )

include_directories(${spdlog_INCLUDE_DIR})