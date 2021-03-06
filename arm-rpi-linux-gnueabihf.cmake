#include(CMakeForceCompiler)

SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_VERSION 1)

set(CMAKE_SYSTEM_PROCESSOR arm )

set(XCTARGET "rpi1")

SET(PIROOT  /Volumes/DataElCapitan/raspberry/rpi1/rootfs)
SET(SYSROOT /usr/local/Mike/arm-rpi-linux-gnueabihf/arm-rpi-linux-gnueabihf/sysroot)

# specify the cross compiler
set(CROSS_BASE_DIR "arm-rpi-linux-gnueabihf")

set(CROSS_COMPILER_PATH "/usr/local/Mike/${CROSS_BASE_DIR}")
SET(CROSS_COMPILER ${CROSS_COMPILER_PATH}/bin/${CROSS_BASE_DIR}-)

# RPATH - a list of directories which is linked into the executable,
# supported on most UNIX systems. It is ignored if RUNPATH is present.
# QT funktioniert sonst nicht!!!!
set(FLAGS "${FLAGS} -Wl,-rpath-link,${PIROOT}/opt/vc/lib")
set(FLAGS "${FLAGS} -Wl,-rpath-link,${PIROOT}/lib/arm-linux-gnueabihf")
set(FLAGS "${FLAGS} -Wl,-rpath-link,${PIROOT}/usr/lib/arm-linux-gnueabihf")
set(FLAGS "${FLAGS} -Wl,-rpath-link,${PIROOT}/usr/local/lib")
set(RPATH_FLAGS ${FLAGS})

# which compilers to use for C and C++
SET(CMAKE_C_COMPILER ${CROSS_COMPILER}gcc)
SET(CMAKE_CXX_COMPILER ${CROSS_COMPILER}g++)
SET(CMAKE_ASM_COMPILER ${CROSS_COMPILER}as)

# Wenn dieses Setting gesetzt ist kommt die Fehlermeldung
# "Error running link command: No such file or directory"
# SET(CMAKE_AR ${CROSS_COMPILER}ar)

SET(CMAKE_RANLIB ${CROSS_COMPILER}ranlib)
#SET(CMAKE_RANLIB ${XCOMPILER}ranlib)
#PKG_CONFIG_EXECUTABLE=arm-linux-gnueabihf-pkg-config.

UNSET(CMAKE_C_FLAGS CACHE)
UNSET(CMAKE_CXX_FLAGS CACHE)

# compiler/linker flags ( --sysroot=${SYSROOT} )
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${RPATH_FLAGS}" CACHE STRING "c++ flags" FORCE)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${RPATH_FLAGS}" CACHE STRING "c flags" FORCE)

set(CMAKE_C_LINK_FLAGS "${CMAKE_C_LINK_FLAGS}" CACHE INTERNAL "c link flags" FORCE)
set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS}" CACHE INTERNAL "c++ link flags" FORCE)

# Sonst wird die glicxx_3.4.21 nicht gefunden
# (./HelloLib: /usr/lib/arm-linux-gnueabihf/libstdc++.so.6: version `GLIBCXX_3.4.21' not found)
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -static-libstdc++")

# here is the target environment located
SET(CMAKE_SYSROOT ${SYSROOT})
SET(CMAKE_FIND_ROOT_PATH ${PIROOT})

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# Weitere Suchpfade zu verschiedenen libs
# set(CMAKE_LIBRARY_PATH ${CMAKE_LIBRARY_PATH} ${PIROOT}/lib/ )
# set(CMAKE_LIBRARY_PATH ${CMAKE_LIBRARY_PATH} ${PIROOT}/lib/arm-linux-gnueabihf)

#CMAKE_FORCE_C_COMPILER(${CROSS_COMPILER}gcc GNU)
#CMAKE_FORCE_CXX_COMPILER(${CROSS_COMPILER}g++ GNU)

#include_directories(BEFORE
#        "/usr/local/Mike/armv6-rpi-linux-gnueabi/armv6-rpi-linux-gnueabi/include/c++/5.2.0"
#        "/usr/local/Mike/armv6-rpi-linux-gnueabi/armv6-rpi-linux-gnueabi/include/c++/5.2.0/tr1"
#        )


message( STATUS "PIROOT:                " ${PIROOT} )
message( STATUS "CROSS_COMPILER_PATH:   " ${CROSS_COMPILER_PATH} )
message( STATUS "LIBRARY_PATH:          " ${CMAKE_LIBRARY_PATH} )
#message( WARNING "CMAKE_FRAMEWORK_PATH:     " ${CMAKE_FRAMEWORK_PATH} )



