# ┌──────────────────────────────────────────────────────────────────┐
# │  Compiler + basic path settings                                  │
# └──────────────────────────────────────────────────────────────────┘

# C++11:
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

# C++14:
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y ")

add_compile_options("-Wall")
# add_compile_options("-Wextra")

SET( CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS}")

# ┌──────────────────────────────────────────────────────────────────┐
# │  Main-Config (Architecture,...)                                  │
# │     https://cmake.org/Wiki/CMake_Useful_Variables                │
# └──────────────────────────────────────────────────────────────────┘

# Architecture (32/64 bit) Wenn X64 nicht auf ON steht funkt der build der
# lib unter MacOSX nicht...
set(X64 OFF)
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(X64 ON)
endif()
#message (STATUS "Architecture is 64Bit - ${X64}")

# Mac needed variables (adapt according to your needs)
#set(CMAKE_MACOSX_RPATH ON)
#set(CMAKE_SKIP_BUILD_RPATH FALSE)
#set(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)
#set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")
#set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

if (NOT XCTARGET)
    set(XCTARGET mac)
endif ()

#message(STATUS "XCTarget:              ${XCTARGET}" )

# ┌──────────────────────────────────────────────────────────────────┐
# │  CMake useful variables                                          │
# └──────────────────────────────────────────────────────────────────┘

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin/${XCTARGET}")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/lib/${XCTARGET}")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/lib/${XCTARGET}")

# Weitere Suchpfade zu verschiedenen libs
set(CMAKE_LIBRARY_PATH ${CMAKE_LIBRARY_PATH} "${CMAKE_SOURCE_DIR}/.dependencies" )

# Include-Libs (Header only) werden auch hier abgelegt
#
# CMAKE_CURRENT_SOURCE_DIR
#   this is the directory where the currently processed CMakeLists.txt is located in
#
# Dependencies wurde mit git submodule add <repository-url> hinzugefügt
# und können mit git submodule update --init -- external/<repo name> aktualisiert werden
#
set(CMAKE_INCLUDE_PATH ${CMAKE_INCLUDE_PATH} "${CMAKE_SOURCE_DIR}/.dependencies" )

#list(APPEND CMAKE_MODULE_PATH "/usr/local/share/cmake/Modules")


