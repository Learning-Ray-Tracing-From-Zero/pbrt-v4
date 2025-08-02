# include(${CMAKE_SOURCE_DIR}/cmake/check_ext.cmake)


# zlib
set(ZLIB_BUILD_TESTING OFF CACHE BOOL "Enable Zlib Examples as tests" FORCE)
set(ZLIB_BUILD_STATIC_LIBS ON CACHE BOOL "Enable building zlib shared library" FORCE)
set(ZLIB_BUILD_SHARED_LIBS OFF CACHE BOOL "Enable building zlib static library" FORCE)
set(ZLIB_BUILD_MINIZIP OFF CACHE BOOL "Enable building libminizip contrib library" FORCE)
set(ZLIB_INSTALL OFF CACHE BOOL "Enable installation of zlib" FORCE)
set(ZLIB_PREFIX OFF CACHE BOOL "prefix for all types and library functions, see zconf.h.in" FORCE)
add_subdirectory(zlib)
add_library(ZLIB::ZLIB ALIAS zlibstatic)
set_property(TARGET zlibstatic PROPERTY FOLDER "ext")
set(ZLIB_LIBRARIES zlibstatic)
set(ZLIB_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/zlib ${CMAKE_CURRENT_BINARY_DIR}/zlib)

# try to make openexr happy about this...
set(ZLIB_LIBRARY zlibstatic)
set(ZLIB_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/zlib ${CMAKE_CURRENT_BINARY_DIR}/zlib)
set(ZLIB_FOUND TRUE)
include_directories(${ZLIB_INCLUDE_DIRS})  # yuck, but so openexr/ptex can find zlib.h...
set(ZLIB_INCLUDE_DIRS ${ZLIB_INCLUDE_DIRS} PARENT_SCOPE)
set(ZLIB_LIBRARIES ${ZLIB_LIBARIES} PARENT_SCOPE)


# libdeflate
set(LIBDEFLATE_BUILD_STATIC_LIB ON CACHE BOOL "Build the static library" FORCE)
set(LIBDEFLATE_BUILD_SHARED_LIB OFF CACHE BOOL "Build the shared library" FORCE)
set(LIBDEFLATE_COMPRESSION_SUPPORT ON CACHE BOOL "Support compression" FORCE)
set(LIBDEFLATE_DECOMPRESSION_SUPPORT ON CACHE BOOL "Support decompression" FORCE)
set(LIBDEFLATE_ZLIB_SUPPORT ON CACHE BOOL "Support the zlib format" FORCE)
set(LIBDEFLATE_GZIP_SUPPORT ON CACHE BOOL "Support the gzip format" FORCE)
set(
    LIBDEFLATE_FREESTANDING
    OFF CACHE BOOL
    "Build a freestanding library, i.e. a library that doesn't link to any
    libc functions like malloc(), free(), and memcpy().  Library users will
    need to provide a custom memory allocator."
    FORCE
)
set(LIBDEFLATE_BUILD_GZIP ON CACHE BOOL "Build the libdeflate-gzip program" FORCE)
set(LIBDEFLATE_BUILD_TESTS OFF CACHE BOOL "Build the test programs" FORCE)
set(
    LIBDEFLATE_USE_SHARED_LIB
    OFF CACHE BOOL
    "Link the libdeflate-gzip and test programs to the shared library instead
    of the static library"
    FORCE
)
if(APPLE)
    set(LIBDEFLATE_APPLE_FRAMEWORK OFF CACHE BOOL "Build as Apple Framework" FORCE)
endif()
add_subdirectory(libdeflate)
# set(libdeflate_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libdeflate PARENT_SCOPE)
# set(libdeflate_FOUND TRUE CACHE BOOL "libdeflate has found" PARENT_SCOPE)
set(libdeflate_DIR ${CMAKE_CURRENT_BINARY_DIR}/libdeflate)
message("libdeflate_DIR: " ${libdeflate_DIR})
set(LIBDEFLATE_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/libdeflate PARENT_SCOPE)
set(LIBDEFLATE_LIBRARIES libdeflate_static PARENT_SCOPE)
set_property(TARGET libdeflate_static PROPERTY FOLDER "ext")


# stb
set(STB_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/stb PARENT_SCOPE)


# ptex
set(CMAKE_MACOSX_RPATH 1)
set(PTEX_BUILD_STATIC_LIBS ON CACHE BOOL "Enable building Ptex static libraries" FORCE)
set(PTEX_BUILD_SHARED_LIBS ON CACHE BOOL "Enable building Ptex shared libraries" FORCE)
set(PTEX_BUILD_DOCS OFF CACHE BOOL "Enable building Ptex documentation (require Doxygen)" FORCE)
set(PRMAN_15_COMPATIBLE_PTEX OFF CACHE BOOL "Enable PRMan 15 compatibility" FORCE)
if(WIN32)
    add_definitions (/DPTEX_STATIC)
endif()
add_subdirectory(ptex)
set_property(TARGET Ptex_static Ptex_dynamic ptxinfo halftest ftest rtest wtest PROPERTY FOLDER "ext/ptex")
set(PTEX_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/ptex/src/ptex PARENT_SCOPE)

# Only do this if both targets actually exist
if(TARGET Ptex_static AND TARGET zlibstatic)
    install(
        TARGETS zlibstatic
        EXPORT Ptex             # Same export set name as used by Ptex
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
    )
endif()


# double-conversion
set(BUILD_TESTING OFF CACHE BOOL "Build test programs" FORCE)
add_subdirectory(double-conversion)
set(DOUBLE_CONVERSION_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/double-conversion PARENT_SCOPE)
set_property(TARGET double-conversion PROPERTY FOLDER "ext")


# nanovdb
set(NANOVDB_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/openvdb/nanovdb PARENT_SCOPE)


# FLIP
set(FLIP_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/flip PARENT_SCOPE)
add_library(flip_lib STATIC ${CMAKE_CURRENT_SOURCE_DIR}/flip/flip.cpp)
set_property(TARGET flip_lib PROPERTY FOLDER "ext")


# utf8proc
set(UTF8PROC_INSTALL OFF CACHE BOOL "Enable installation of utf8proc" FORCE)
set(UTF8PROC_ENABLE_TESTING OFF CACHE BOOL "Enable testing of utf8proc" FORCE)
set(LIB_FUZZING_ENGINE OFF CACHE BOOL "Fuzzing engine to link against" FORCE)
set(UTF8PROC_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/utf8proc PARENT_SCOPE)
add_subdirectory(utf8proc)


# qoi
set(QOI_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/qoi PARENT_SCOPE)


# glfw
if (UNIX AND NOT APPLE)
    set(GLFW_BUILD_WAYLAND ${ENABLE_WAYLAND} CACHE BOOL "" FORCE)
endif ()
set(GLFW_LIBRARY_TYPE SHARED CACHE STRING "Build shared libraries" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "Build the GLFW example programs" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "Build the GLFW test programs" FORCE)
set(GLFW_BUILD_DOCS OFF CACHE BOOL "Build the GLFW documentation" FORCE)
set(GLFW_INSTALL OFF CACHE BOOL "Generate installation target" FORCE)
add_subdirectory(glfw)
set_property(TARGET glfw PROPERTY FOLDER "ext")
set(GLFW_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/glfw/include PARENT_SCOPE)


# glad
set(GLAD_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/glad/include PARENT_SCOPE)
add_subdirectory(glad)
set_property(TARGET glad PROPERTY FOLDER "ext")


# openexr
set(OPENEXR_INSTALL OFF CACHE BOOL "Install OpenEXR libraries" FORCE)
set(OPENEXR_INSTALL_TOOLS OFF CACHE BOOL "Install OpenEXR tools" FORCE)
set(OPENEXR_INSTALL_DOCS OFF CACHE BOOL "Set ON to install tool manpages" FORCE)
set(BUILD_WEBSITE OFF CACHE BOOL "Set ON to build website source" FORCE)
add_subdirectory(openexr)
# set_property(TARGET IlmThread Iex OpenEXR PROPERTY FOLDER "ext/OpenEXR")
