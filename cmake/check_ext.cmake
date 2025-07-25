function(check_ext NAME DIR HASH)
    if(NOT IS_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/${DIR}")
        message(
            FATAL_ERROR
            "The ${NAME} submodule directory is missing! "
            "Either that submodule was recently added to pbrt-v4 or you did not clone the project with '--recursive'. "
            "In order to update the submodules, run:\n"
            "    'git submodule update --init --recursive'"
        )
    endif()

    find_package(Git)
    if(GIT_FOUND)
        execute_process(
            COMMAND ${GIT_EXECUTABLE} rev-parse HEAD
            WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/${DIR}"
            RESULT_VARIABLE "git_return"
            ERROR_QUIET
            OUTPUT_STRIP_TRAILING_WHITESPACE
            OUTPUT_VARIABLE "git_hash"
        )
        if(NOT ${git_hash} MATCHES "^${HASH}")
            message(
                FATAL_ERROR
                "The ${CMAKE_CURRENT_SOURCE_DIR}/${DIR} "
                "submodule isn't up to date (${git_hash} vs ${HASH}). Please run:\n"
                "  \"git submodule update --recursive\""
            )
        else()
            message(STATUS "${NAME} at commit: ${git_hash}")
        endif()
    else()
        message(STATUS "git not found: unable to verify revisions in submodules")
    endif()
endfunction()

check_ext("double-conversion" "double-conversion/cmake" cc1f75a114aca8d2af69f73a5a959aecbab0e87a)
check_ext("glfw" "glfw/docs" 7b6aead9fb88b3623e3b3725ebb42670cbe4c579)
check_ext("libdeflate" "libdeflate/common" 1fd0bea6ca2073c68493632dafc4b1ddda1bcbc3)
check_ext("lodepng" "lodepng/examples" 8c6a9e30576f07bf470ad6f09458a2dcd7a6a84a)
check_ext("openexr" "openexr/src" f723c3940fff287c0a26b425b90a8e764823bfd4)
check_ext("openvdb" "openvdb/nanovdb" 414bed84c2fc22e188eac7b611aa85c7edd7a5a9)
check_ext("ptex" "ptex/src" 054047d02b9e06e690420b407114d2872435b953)
check_ext("qoi" "qoi" 028c75fd26e5e0758c7c711216c00404994c1ad3)
check_ext("stb" "stb/tools" af1a5bc352164740c1cc1354942b1c6b72eacb8a)
check_ext("utf8proc" "utf8proc/bench" 2484e2ed5e1d9c19edcccf392a7d9920ad90dfaf)
check_ext("zlib" "zlib/doc" 54d591eabf9fe0e84c725638f8d5d8d202a093fa)
