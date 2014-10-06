cmake_minimum_required (VERSION 2.8)
project(question_3)

FIND_PACKAGE( Boost 1.54 REQUIRED)
INCLUDE_DIRECTORIES( ${Boost_INCLUDE_DIR} )
ADD_EXECUTABLE (planner_state_space src/planner_state_space.cc)
TARGET_LINK_LIBRARIES( planner_state_space ${Boost_LIBRARIES} )
