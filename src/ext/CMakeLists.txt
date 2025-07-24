include(${CMAKE_SOURCE_DIR}/cmake/check_ext.cmake)


# zlib
set(ZLIB_BUILD_TESTING OFF CACHE BOOL "Enable Zlib Examples as tests" FORCE)
set(ZLIB_BUILD_SHARED OFF CACHE BOOL "Enable building zlib shared library" FORCE)
set(ZLIB_BUILD_STATIC ON CACHE BOOL "Enable building zlib static library" FORCE)
set(ZLIB_BUILD_MINIZIP OFF CACHE BOOL "Enable building libminizip contrib library" FORCE)
set(ZLIB_INSTALL OFF CACHE BOOL "Enable installation of zlib" FORCE)
set(ZLIB_PREFIX OFF CACHE BOOL "prefix for all types and library functions, see zconf.h.in" FORCE)
add_subdirectory(zlib)

# set(ZLIB_LIBRARIES zlibstatic)
# set(ZLIB_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/zlib ${CMAKE_CURRENT_BINARY_DIR}/zlib)

# try to make openexr happy about this...
# set(ZLIB_LIBRARY zlibstatic)
# set(ZLIB_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/zlib ${CMAKE_CURRENT_BINARY_DIR}/zlib)
# set(ZLIB_FOUND TRUE)

# set_property(TARGET ZLIB::ZLIBSTATIC PROPERTY FOLDER "ext")

# add_library (ZLIB::ZLIB ALIAS zlibstatic)
# include_directories(${ZLIB_INCLUDE_DIRS})  # yuck, but so openexr/ptex can find zlib.h...
# set(ZLIB_INCLUDE_DIRS ${ZLIB_INCLUDE_DIRS} PARENT_SCOPE)
# set(ZLIB_LIBRARIES ${ZLIB_LIBARIES} PARENT_SCOPE)


# # libdeflate
# add_subdirectory(libdeflate)
# set(LIBDEFLATE_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/libdeflate PARENT_SCOPE)
# set(LIBDEFLATE_LIBRARIES deflate::deflate PARENT_SCOPE)
# set_property(TARGET deflate PROPERTY FOLDER "ext")


# # stb
# set(STB_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/stb PARENT_SCOPE)


# # filesystem
# set(FILESYSTEM_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/filesystem PARENT_SCOPE)


# # ptex
# set(PTEX_BUILD_SHARED_LIBS OFF CACHE BOOL " " FORCE)
# set(CMAKE_MACOSX_RPATH 1)
# if(WIN32)
#     add_definitions (/DPTEX_STATIC)
# endif()

# add_subdirectory(ptex)
# set_property(TARGET Ptex_static ptxinfo halftest ftest rtest wtest PROPERTY FOLDER "ext/ptex")
# set(PTEX_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/ptex/src/ptex PARENT_SCOPE)


# # double-conversion
# add_subdirectory(double-conversion)
# set(DOUBLE_CONVERSION_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/double-conversion PARENT_SCOPE)
# set_property(TARGET double-conversion cctest PROPERTY FOLDER "ext")


# # nanovdb
# set(NANOVDB_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/openvdb/nanovdb PARENT_SCOPE)


# # FLIP
# set(FLIP_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/flip PARENT_SCOPE)
# add_library (flip_lib STATIC ${CMAKE_CURRENT_SOURCE_DIR}/flip/flip.cpp)
# set_property(TARGET flip_lib PROPERTY FOLDER "ext")


# # utf8proc
# set(UTF8PROC_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/utf8proc PARENT_SCOPE)
# add_subdirectory(utf8proc)


# # qoi
# set(QOI_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/qoi PARENT_SCOPE)


# # glfw
# set(GLFW_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/glfw/include PARENT_SCOPE)
# set(GLFW_LIBRARY_TYPE STATIC CACHE STRING "" FORCE)
# set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
# set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
# set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
# add_subdirectory(glfw)
# set_property(TARGET glfw PROPERTY FOLDER "ext")


# # glad
# set(GLAD_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/glad/include PARENT_SCOPE)
# add_subdirectory(glad)
# set_property(TARGET glad PROPERTY FOLDER "ext")


# # OpenEXR
# find_package(OpenEXR)
# if(OPENEXR_FOUND)
#     message(STATUS "Found OpenEXR version ${OPENEXR_VERSION}")
# else ()
#     message(STATUS "OpenEXR not found, building it from scratch.")
#     add_subdirectory(openexr)
#     set_property(TARGET IlmThread Iex OpenEXR PROPERTY FOLDER "ext/OpenEXR")
# endif()
