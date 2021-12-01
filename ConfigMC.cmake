# ┌──────────────────────────────────────────────────────────────────────┐
# │  X-Development (PIO, ESP32...) on Mac produces                       │
# │      "unrecognized command line option '-mmacosx-version-min=xx.xx'  │
# │                                                                      │
# │  -nostdlib solves the problem                                        │
# │                                                                      │
# └──────────────────────────────────────────────────────────────────┘

# unset(CMAKE_OSX_DEPLOYMENT_TARGET)

SET(CMAKE_C_COMPILER "$ENV{HOME}/.platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-gcc")
SET(CMAKE_CXX_COMPILER "$ENV{HOME}/.platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-g++")
SET(CMAKE_CXX_FLAGS "-nostdlib")
SET(CMAKE_C_FLAGS "-nostdlib")

# optional 
SET(CMAKE_OSX_SYSROOT "$ENV{HOME}/.platformio/packages/toolchain-xtensa32/xtensa-esp32-elf/sysroot")
