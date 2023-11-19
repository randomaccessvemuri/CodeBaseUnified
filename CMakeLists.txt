cmake_minimum_required(VERSION 3.20)
project(CodeBaseUnified CUDA CXX)

set(CMAKE_CUDA_STANDARD 17)
set(CMAKE_CXX_STANDARD 17)


find_package(OpenCV REQUIRED)

add_library(CodeBaseUnified
        src/Image/ImageClass.cu
        src/Image/ImageClass.cuh
)

include_directories( ${OpenCV_INCLUDE_DIRS} )

set_target_properties(CodeBaseUnified PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)



target_link_libraries( CodeBaseUnified ${OpenCV_LIBS} )

target_compile_options(CodeBaseUnified PRIVATE $<$<COMPILE_LANGUAGE:CUDA>:-x=cu -ccbin=g++-10>)



#TESTS
find_package(Catch2 REQUIRED)

add_executable(tests tests/Graphics/imageTest.cpp)
target_include_directories(tests PUBLIC src)
target_link_libraries(tests PRIVATE Catch2::Catch2WithMain)



