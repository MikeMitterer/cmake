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

function(showFileList FILES)
    message(STATUS "Source-Files:")
    foreach (_file ${FILES})
        message(STATUS "    SRC-File: ${_file}")
    endforeach()
endfunction()

