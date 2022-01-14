# ┌──────────────────────────────────────────────────────────────────┐
# │  Compiler + basic path settings                                  │
# └──────────────────────────────────────────────────────────────────┘

# --------------------------------------------------------------------
# Der C++-Standard sollte eigentlich mit CXX_STANDARD für das jeweilige
# Target gesetzt werden:
#       https://cmake.org/cmake/help/latest/prop_tgt/CXX_STANDARD.html
# --------------------------------------------------------------------

# C++11:
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
# -march=armv6
# -march valid arguments (gcc 4.9.3):
#   armv2 armv2a armv3 armv3m armv4 armv4t armv5 armv5e armv5t armv5te armv6 armv6-m armv6j
#   armv6k armv6s-m armv6t2 armv6z armv6zk armv7 armv7-a armv7-m armv7-r armv7e-m armv7ve
#   armv8-a armv8-a+crc iwmmxt iwmmxt2 native

# C++14:
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")

# C++17:
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17")

# GoogleTest requires at least C++11
# Muss natürlich mit den Compiler-Settings übereinstimmen
set(CMAKE_CXX_STANDARD 17)

# C++20:
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++20")

add_compile_options("-Wall")

# Einige Warnings machen relativ wening Sinn und werden
# ausgeschaltet
add_compile_options("-Wno-unused-variable")
add_compile_options("-Wno-unknown-pragmas")

# add_compile_options("-Wextra")

# GNU - gcc
if (${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU" )

endif ()

if (${CMAKE_SYSTEM_NAME} STREQUAL "Linux" )
    # Wichtig - sonst funktioniert's auf dem Raspi (und auf Linux) nicht
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")
endif ()

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
    #set(CMAKE_GENERATOR_PLATFORM )
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
set(CMAKE_LIBRARY_PATH
    ${CMAKE_LIBRARY_PATH}
    "${CMAKE_SOURCE_DIR}/.dependencies"
)

# Include-Libs (Header only) werden auch hier abgelegt
#
# CMAKE_CURRENT_SOURCE_DIR
#   this is the directory where the currently processed CMakeLists.txt is located in
#
# Dependencies wurde mit git submodule add <repository-url> hinzugefügt
# und können mit "git submodule update --init -- external/<repo name>" aktualisiert werden
#
#   Hint:
#       git submodule update --init -- .dependencies/*
#
set(CMAKE_INCLUDE_PATH
    ${CMAKE_INCLUDE_PATH}
    "${CMAKE_SOURCE_DIR}/.dependencies"
)

#list(APPEND CMAKE_MODULE_PATH "/usr/local/share/cmake/Modules")


