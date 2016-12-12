# ┌──────────────────────────────────────────────────────────────────┐
# │  Doxygen                                                         │
# └──────────────────────────────────────────────────────────────────┘

find_package(Doxygen)

if(DOXYGEN_FOUND)

  add_custom_target(docQtCmdline ${DOXYGEN_EXECUTABLE} WORKING_DIRECTORY ${CMAKE_HOME_DIRECTORY} )
  message("Doxygen was found! (${DOXYGEN_EXECUTABLE})")

else(DOXYGEN_FOUND)

  message(STATUS "Doxygen not found - Documentation will not be generated")

endif(DOXYGEN_FOUND)


