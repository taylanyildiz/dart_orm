cmake_minimum_required(VERSION 3.25)
project(opencv)

find_package(OpenCV REQUIRED)

include_directories( ${OpenCV_INCLUDE_DIRS} )

add_executable( opencv open_cv/orm.cpp )

target_link_libraries( opencv  ${OpenCV_LIBS})