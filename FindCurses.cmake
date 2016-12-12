# - Try to find fmt source lib
#
# Library Home: https://github.com/fmtlib/fmt
#
# Once done this will define
#  curses_FOUND - System has args
#  curses_INCLUDE_DIRS - The args include directories

find_package(PkgConfig)

set(curses_HINT "/usr/local/Cellar/ncurses/6.0_2")
find_path(curses_INCLUDE_DIR ncurses.h
        HINTS ${curses_HINT}
        PATH_SUFFIXES include
        )

#if(NOT curses_INCLUDE_DIR)
#    set(curses_INCLUDE_DIR "/Volumes/Daten/DevLocal/DevCPP/libs/curses")
#endif()

message(STATUS "curses-Include Dir:    ${curses_INCLUDE_DIR}" )

find_library(curses_LIBRARY NAMES ncursesw libncursesw ncurses libncurses
        HINTS ${curses_HINT}
        PATH /usr/lib/arm-linux-gnueabihf
        PATH_SUFFIXES lib)

message(STATUS "curses-Library Dir:    ${curses_LIBRARY}" )


include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBXML2_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(curses DEFAULT_MSG
        curses_INCLUDE_DIR
        )

mark_as_advanced(curses_INCLUDE_DIR)


set(curses_INCLUDE_DIRS ${curses_INCLUDE_DIR} )
set(curses_LIBRARIES ${curses_LIBRARY} )

include_directories(${curses_INCLUDE_DIR})