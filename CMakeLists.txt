cmake_minimum_required(VERSION 3.14)

# set(CMAKE_CXX_STANDARD 17)
# set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(cmake-cpp-matlab)

include(CMakeParseArguments)

# target_copy_libraries(target items...)
macro(target_copy_libraries target)
  foreach(arg IN ITEMS ${ARGN})
    add_custom_command(
      TARGET ${target} POST_BUILD
      COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:${arg}> $<TARGET_FILE_DIR:${target}>
    )
  endforeach()
endmacro()

add_library(addition SHARED IMPORTED)
set_target_properties(addition
    PROPERTIES
    IMPORTED_LOCATION             "${MATLAB_BUILD_ROOT}/addition.dll"
    IMPORTED_IMPLIB               "${MATLAB_BUILD_ROOT}/addition.lib"
    INTERFACE_INCLUDE_DIRECTORIES "${MATLAB_BUILD_ROOT}"
)

target_include_directories(addition INTERFACE "${MATLAB_BUILD_ROOT}")
# D:\Softwares\MATLAB\R2022b\extern\
# 
set(MATLAB_LIBRARY_ROOT "D:/Softwares/MATLAB/R2022b/extern")
set(MATLAB_LIBRARY_MSVC_ROOT "${MATLAB_LIBRARY_ROOT}/lib/win64/microsoft")

add_library(mclmcrrt STATIC IMPORTED)
set_target_properties(mclmcrrt
    PROPERTIES
    IMPORTED_LOCATION     "${MATLAB_LIBRARY_MSVC_ROOT}/mclmcrrt.lib"
    INTERFACE_INCLUDE_DIRECTORIES "${MATLAB_LIBRARY_ROOT}/include"
)

# ;${MATLAB_LIBRARY_MSVC_ROOT}/mclmcr.lib;${MATLAB_LIBRARY_MSVC_ROOT}/libmat.lib;${MATLAB_LIBRARY_MSVC_ROOT}/libmx.lib"
# SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")

add_executable(${PROJECT_NAME} 
    "src/main.cpp"
)

target_link_libraries(${PROJECT_NAME} mclmcrrt addition)
target_copy_libraries(${PROJECT_NAME} addition)