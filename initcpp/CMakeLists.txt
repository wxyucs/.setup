cmake_minimum_required (VERSION 3.22)
project (!PROJNAME!)

file (GLOB SOURCE_FILES "src/*.cpp")

add_executable (!PROJNAME! ${SOURCE_FILES})
