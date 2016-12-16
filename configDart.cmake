# - configure all necessary Dart-Settings
#
# Once done this will define
#
#  dart_FOUND - System has Dart
#  dart_SDK - Place where we can find Darts SDK
#  dart_EXEC - Path to dart
#  dart_INCLUDE - The Dart include directory
#  dart_TARGET - The place where we copy our native lib
#  dart_CXX_ARCHITECTURE_FLAGS - Flags we need for Dart

# Get path to Dart's SDK.
if ($ENV{DART_SDK})
    set(dart_SDK $ENV{DART_SDK})

else ($ENV{DART_SDK})
    # Get full path to the Dart executable.
    execute_process(COMMAND which dart OUTPUT_VARIABLE dart_EXEC OUTPUT_STRIP_TRAILING_WHITESPACE)

    if (NOT dart_EXEC)
        message(FATAL_ERROR "Error: Unable to find dart executable!")
    endif ()

    # Expand symlinks.
    get_filename_component(dart_EXEC ${dart_EXEC} REALPATH)

    get_filename_component(dart_SDK ${dart_EXEC}/../.. ABSOLUTE)

    if (NOT dart_SDK)
        message(FATAL_ERROR "Error: Unable to find dart-sdk!!!")
    endif ()

endif ()

set(dart_INCLUDE "${dart_SDK}/include")
set(dart_TARGET "${CMAKE_CURRENT_SOURCE_DIR}/dart/lib/native")

include_directories("${dart_INCLUDE}")

message(STATUS "dart_SDK:              " ${dart_SDK})
message(STATUS "dart_EXEC:             " ${dart_EXEC})
message(STATUS "dart_INCLUDE:          " ${dart_INCLUDE})
message(STATUS "dart_TARGET:           " ${dart_TARGET})

# ┌──────────────────────────────────────────────────────────────────┐
# │  Dart - Step II (SystemInfo) More: https://goo.gl/Hq8N5N         │
# └──────────────────────────────────────────────────────────────────┘

if( CMAKE_SIZEOF_VOID_P EQUAL 8 )
    MESSAGE(STATUS "64 bits compiler detected" )
    SET( EX_PLATFORM 64 )
    SET( EX_PLATFORM_NAME "x64" )
else( CMAKE_SIZEOF_VOID_P EQUAL 8 )
    MESSAGE(STATUS "32 bits compiler detected" )
    SET( EX_PLATFORM 32 )
    SET( EX_PLATFORM_NAME "x86" )
endif( CMAKE_SIZEOF_VOID_P EQUAL 8 )

message(STATUS "System name:           " ${CMAKE_SYSTEM_NAME})
message(STATUS "Platform:              " ${EX_PLATFORM})
message(STATUS "Platform Name:         " ${EX_PLATFORM_NAME})

if (${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")

    if (${EX_PLATFORM} EQUAL "32")

        set(dart_CXX_ARCHITECTURE_FLAGS "-arch i386")

    elseif (${EX_PLATFORM} EQUAL "64")

        set(dart_CXX_ARCHITECTURE_FLAGS "-arch x86_64")

    endif ()

else ()
    if (${EX_PLATFORM} EQUAL "32")

        set(dart_CXX_ARCHITECTURE_FLAGS "-m32")

    elseif (${EX_PLATFORM} EQUAL "64")

        set(dart_CXX_ARCHITECTURE_FLAGS "-m64")

    endif ()

endif ()

message(STATUS "dart_CXX_ARCHITECTURE_FLAGS:   " ${dart_CXX_ARCHITECTURE_FLAGS})




