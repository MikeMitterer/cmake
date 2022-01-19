# --------------------------------------------------------------------------------------------------
# cmake-variables:
#       https://cmake.org/cmake/help/latest/manual/cmake-variables.7.html
# --------------------------------------------------------------------------------------------------

# Anzeige einer Test-Message
#
# Testet im Prinzip diese Lib
macro(showTestMessage)
    message (STATUS "Message aus UtilsMangoLila.cmake!")
endmacro()

# Anzeige aller, in CMAKE verfügbaren, Variablen
#
# CMake stellt eigentlich eine vergleichbare Funktion zur Verfügung
#   include(CMakePrintHelpers)
#   cmake_print_variables(VARIABLES)
#
macro(showCMakeVars)
    get_cmake_property(_variableNames VARIABLES)
    list (SORT _variableNames)
    foreach (_variableName ${_variableNames})
        message(STATUS "${_variableName} = ${${_variableName}}")
    endforeach()
endmacro()

# Liste von Source?-Files wird angezeigt
#
# Usage:
#   showFileList("loggerSource:" "${logger_SOURCES}")
function(showFileList LABEL FILES)
    message(STATUS "${LABEL}:")
    foreach (_file ${FILES})
        message(STATUS "    SRC-File: ${_file}")
    endforeach()
endfunction()

# Die Variablen PARENT_DIR und PARENT_NAME werden gesetzt.
# Basis um das entsprechende Dir zu ermitteln ist das CMakeLists.txt dass gerade 
# verarbeitet wird
macro(setParentDir)
    get_filename_component(PARENT_DIR ${CMAKE_CURRENT_LIST_DIR} DIRECTORY)
    get_filename_component(PARENT_NAME ${PARENT_DIR} NAME)
endmacro()

# Die Variablen CURRENT_DIR und CURRENT_NAME werden gesetzt.
# Basis um das entsprechende Dir zu ermitteln ist das CMakeLists.txt dass gerade 
# verarbeitet wird
macro(setCurrentDir)
    get_filename_component(CURRENT_DIR ${CMAKE_CURRENT_LIST_FILE} DIRECTORY)
    get_filename_component(CURRENT_NAME ${CURRENT_DIR} NAME)
endmacro()

