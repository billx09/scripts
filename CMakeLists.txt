CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

PROJECT(Scripts)

set(CMAKE_MODULE_PATH
  ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")

FIND_PACKAGE(Zenity)
IF (ZENITY_FOUND)
  set(PROGRESSBAR_COMMAND
    "coproc PROGRESSBAR_GTK {
    zenity --progress --title \"Benchmark\" --percentage=0 --auto-kill --text \"Running...\";
    }")
ELSE()
  set(ZENITY_COMMAND
    "echoerr \"Zenity not found\"")
ENDIF()

CONFIGURE_FILE(
  "${PROJECT_SOURCE_DIR}/src/benchmark"
  "${PROJECT_BINARY_DIR}/src/benchmark"
  @ONLY)

SET(SCRIPTS "${PROJECT_BINARY_DIR}/src/benchmark")

INSTALL(PROGRAMS
  ${SCRIPTS}
  DESTINATION bin
  )

CONFIGURE_FILE(
  "${PROJECT_SOURCE_DIR}/cmake_uninstall.cmake.in"
  "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
  IMMEDIATE
  @ONLY
  )

ADD_CUSTOM_TARGET(
  uninstall
  "${CMAKE_COMMAND}" -P
  "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
  )
