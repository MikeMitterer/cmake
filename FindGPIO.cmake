# - Try to find Google-Test
#
# Library Home: https://github.com/google/googletest
#
# Once done this will define
#   gpio_DIR   - Place where GTest lives
#   gpio_FOUND - System has gtest
#
# Functions defined:
#

find_package(PkgConfig)

set(_GPIO_DIR_HINT ".dependencies/gpio")
set(_GPIO_FILE_HINT "src/GPIO.cpp")

find_file(gpio_DIR ${_GPIO_FILE_HINT}
        PATH "${CMAKE_CURRENT_SOURCE_DIR}/${_GPIO_DIR_HINT}" ${_GPIO_DIR_HINT} ENV GPIO_DIR
        )

# Hack da sonst das File in dem symbolischen Link nicht gefunden wird...
if(NOT gpio_DIR AND IS_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/${_GPIO_DIR_HINT}")
    set(gpio_DIR "${CMAKE_CURRENT_SOURCE_DIR}/${_GPIO_DIR_HINT}/${_GPIO_FILE_HINT}")
endif()


if(gpio_DIR)
    # gpio_DIR:   xxx/hello_led/.dependencies/gpio/src/GPIO.cpp
    get_filename_component(PARENT_DIR ${gpio_DIR} DIRECTORY)

    # PARENT_DIR: xxx/hello_led/.dependencies/gpio/src/
    get_filename_component(PARENT_DIR ${PARENT_DIR} DIRECTORY)

    set(gpio_DIR ${PARENT_DIR})
endif()

message(STATUS "gpio_DIR:              ${gpio_DIR}" )

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBXML2_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(gpio DEFAULT_MSG
        gpio_DIR
        )

mark_as_advanced(gpio_DIR)

if(gpio_DIR)
    add_subdirectory(${gpio_DIR})

    include_directories(${gpio_DIR}/include )

endif()

