# ┌──────────────────────────────────────────────────────────────────────┐
# │  X-Development (PIO, ESP32...) on Mac produces                       │
# │      "unrecognized command line option '-mmacosx-version-min=xx.xx'  │
# │                                                                      │
# │  -nostdlib solves the problem                                        │
# │                                                                      │
# └──────────────────────────────────────────────────────────────────┘

unset(CMAKE_OSX_DEPLOYMENT_TARGET)

set(MM_COMPILER_FOLDER "$ENV{HOME}/.platformio/packages/toolchain-xtensa-esp32")
#
SET(CMAKE_C_COMPILER "${MM_COMPILER_FOLDER}/bin/xtensa-esp32-elf-gcc")
SET(CMAKE_CXX_COMPILER "${MM_COMPILER_FOLDER}/bin/xtensa-esp32-elf-g++")
SET(CMAKE_CXX_FLAGS "-nostdlib")
SET(CMAKE_C_FLAGS "-nostdlib")

# optional 
# SET(CMAKE_OSX_SYSROOT "${MM_COMPILER_FOLDER}/xtensa-esp32-elf/sysroot")

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)

