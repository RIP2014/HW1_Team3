cmake_minimum_required (VERSION 2.8)
project(question_3)


set(CMAKE_CXX_FLAGS "-std=c++11")
FIND_PACKAGE( Boost 1.54 REQUIRED)
INCLUDE_DIRECTORIES( ${Boost_INCLUDE_DIR} )
ADD_EXECUTABLE (planner_state_space src/planner_state_space.cc src/sokobanplanner.h src/sokobanplanner.cpp)
message("Boost Libraries: " ${Boost_LIBRARY_DIRS})
TARGET_LINK_LIBRARIES( planner_state_space ${Boost_LIBRARIES} )
