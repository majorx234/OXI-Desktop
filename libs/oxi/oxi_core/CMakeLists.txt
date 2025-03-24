cmake_minimum_required(VERSION 3.14)

project(oxi_core LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core)
find_package(Qt6 REQUIRED COMPONENTS Widgets)

find_package(qmidi REQUIRED)

add_library(oxi_core SHARED
  oxi_core_global.h
  midiworker.cpp
  midiworker.h
  Nibble.h
  delay.h
  crc32.h
  FileTypes.h
  oxidiscovery.h
  oxidiscovery.cpp
  Parser.h
  Project.cpp
  Project.h
  ProjectData.h
  ProjectVersion.h
  OXI_SYSEX_MSG.h
  MIDI.h
  SYSEX_APP.h
  miniz.h
  miniz.c
)

set_source_files_properties(miniz.c PROPERTIES LANGUAGE CXX )
SET(CMAKE_C_FLAGS "miniz.c -std=c99")

target_include_directories(oxi_core PUBLIC ${PROJECT_SOURCE_DIR})

target_link_libraries(oxi_core
    PRIVATE Qt6::Core
            Qt6::Widgets
            qmidi::QMidi
        )
target_compile_definitions(oxi_core
    PRIVATE OXI_CORE_LIBRARY)
