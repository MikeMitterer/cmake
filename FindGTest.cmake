# - Try to find Google-Test
#
# Library Home: https://github.com/google/googletest
#
# Once done this will define
#   gtest_DIR   - Place where GTest lives
#   gtest_FOUND - System has gtest
#
# Functions defined:
#   get_parent_name(<VAR>) - returns the name of the parent folder

find_package(PkgConfig)

find_file(gtest_DIR googletest
        PATH .dependencies
        #HINTS gtest
        )

#if(NOT gtest_INCLUDE_DIR AND IS_DIRECTORY "/Volumes/Daten/DevLocal/DevCPP/libs/${gtest_DIR}")
#    set(gtest_INCLUDE_DIR "/Volumes/Daten/DevLocal/DevCPP/libs/${gtest_DIR}")
#endif()

#message(STATUS "gtestDir:              ${gtest_DIR}" )

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBXML2_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(gtest DEFAULT_MSG
        gtest_DIR
        )

mark_as_advanced(gtest_DIR)

if(gtest_DIR)
    add_subdirectory(${gtest_DIR})
endif()

# Gibt den Namen des Parent-Dirs zurück
#
# Sample:
#   CMakeLists-Dir: /Volumes/Daten/DevLocal/DevCPP/Projects/XCTest/hello_world/tests
#
#   PARENT_DIR: /Volumes/Daten/DevLocal/DevCPP/Projects/XCTest/hello_world
#   PARENT_NAME: hello_world
#
# Usage:
#   get_parent_name(PARENT_NAME)
#   project(${PARENT_NAME}_tests)
#   ...
#
function(get_parent_name parentName)
    get_filename_component(PARENT_DIR ${CMAKE_CURRENT_SOURCE_DIR} DIRECTORY)
    # message(STATUS "PARENT_DIR:              ${PARENT_DIR}" )

    get_filename_component(PARENT_NAME ${PARENT_DIR} NAME)
    # message(STATUS "PARENT_NAME:              ${PARENT_NAME}" )

    SET(${parentName} ${PARENT_NAME} PARENT_SCOPE)
endfunction()