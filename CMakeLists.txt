CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

PROJECT(Scripts)

FILE(
  GLOB_RECURSE
  SCRIPTS
  src/*
)

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
