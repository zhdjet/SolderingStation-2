cmake_minimum_required(VERSION 3.1)

if(NOT CMAKE_CONFIGURATION_TYPES AND NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING "" FORCE)
endif()
message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")

set(TARGET_PLATFORM "arm" CACHE STRING "Target platform")
set(PLATFORM_PATH ${CMAKE_CURRENT_SOURCE_DIR}/targets/${TARGET_PLATFORM})
if(NOT EXISTS ${PLATFORM_PATH})
  message(FATAL_ERROR "Target platform ${TARGET_PLATFORM} does not exist")
endif()
message(STATUS "Target platform ${TARGET_PLATFORM}")

include(functions.cmake)
include(${PLATFORM_PATH}/toolchain.cmake)

project(SolderingStation C CXX ASM)

SET(CMAKE_CXX_FLAGS_RELEASE "-O2 -DNDEBUG -flto")
SET(CMAKE_C_FLAGS_RELEASE "-O2 -DNDEBUG -flto")

SET(CMAKE_CXX_FLAGS_DEBUG  "-O0 -g")
SET(CMAKE_C_FLAGS_DEBUG  "-O0 -g")

include(${PLATFORM_PATH}/settings.cmake)


set(OUTPUT_PATH ${CMAKE_CURRENT_BINARY_DIR}/build/${TARGET_PLATFORM})
set(REPORTS_PATH ${OUTPUT_PATH}/reports)

file(MAKE_DIRECTORY ${OUTPUT_PATH})

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${OUTPUT_PATH}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${OUTPUT_PATH}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${OUTPUT_PATH}/bin)

add_subdirectory(libs)
add_subdirectory(core)
add_subdirectory(${PLATFORM_PATH})