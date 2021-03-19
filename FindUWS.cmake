# - Try to find uws source lib
#
# Library Home: https://github.com/uWebSockets/uWebSockets
#
# Once done this will define
#  uws_FOUND - System has args
#  uws_DIR - The uws include directories
#  uws_INCLUDE_DIR - The uws include directories
#  uws_SRCFILES - The uws Source-Files

find_package(PkgConfig)

find_file(uws_DIR WebSocket.h
        PATH uws
        HINTS src
        )

if(NOT uws_DIR)
    set(uws_DIR "$ENV{DEVCPP}/libs/uws")
endif()

set(uws_INCLUDE_DIR "${uws_DIR}/src" )
set(uws_SRCFILES
        "${uws_DIR}/src/Extensions.cpp"
        "${uws_DIR}/src/Group.cpp"
        "${uws_DIR}/src/Networking.cpp"
        "${uws_DIR}/src/Hub.cpp"
        "${uws_DIR}/src/Node.cpp"
        "${uws_DIR}/src/WebSocket.cpp"
        "${uws_DIR}/src/HTTPSocket.cpp"
        "${uws_DIR}/src/Socket.cpp"
        "${uws_DIR}/src/Epoll.cpp"
        )

message(STATUS "uws-Include Dir:       ${uws_INCLUDE_DIR}" )

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBXML2_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(uws DEFAULT_MSG
        uws_INCLUDE_DIR
        )

mark_as_advanced(uws_INCLUDE_DIR)

include_directories(${uws_INCLUDE_DIR} )
