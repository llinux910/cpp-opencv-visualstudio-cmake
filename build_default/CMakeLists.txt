cmake_minimum_required(VERSION 3.10)
project(MyProject)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# 현재 폴더 경로 설정
get_filename_component(CURRENT_DIR "." ABSOLUTE)
get_filename_component(PREVIOUS_DIR "${CURRENT_DIR}/.." ABSOLUTE)

# OpenCV를 찾습니다.
set(OpenCV_DIR "${PREVIOUS_DIR}/opencv/opencv/build")
find_package(OpenCV REQUIRED)

# OpenCV가 있는지 확인합니다.
if(NOT OpenCV_FOUND)
   message(FATAL_ERROR "OpenCV not found in the system.")
endif(NOT OpenCV_FOUND)

add_executable(MyProject main.cpp)

# OpenCV의 include 폴더를 프로젝트에 연결합니다.
include_directories(${OpenCV_INCLUDE_DIRS})

# OpenCV 라이브러리를 프로젝트에 추가합니다.
target_link_libraries(MyProject 
    debug "${PREVIOUS_DIR}/opencv/opencv/build/x64/vc16/lib/opencv_world480d.lib"
    optimized "${PREVIOUS_DIR}/opencv/opencv/build/x64/vc16/lib/opencv_world480.lib"
)

# 실행 파일이 있는 폴더에 opencv_world480.dll을 복사합니다.
add_custom_command(TARGET MyProject POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${PREVIOUS_DIR}/opencv/opencv/build/x64/vc16/bin/opencv_world480.dll"
        $<TARGET_FILE_DIR:MyProject>
)

# 실행 파일이 있는 폴더에 opencv_world480d.dll을 복사합니다.
add_custom_command(TARGET MyProject POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${PREVIOUS_DIR}/opencv/opencv/build/x64/vc16/bin/opencv_world480d.dll"
        $<TARGET_FILE_DIR:MyProject>
)

# 스타트업 프로젝트로 설정
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT MyProject)
