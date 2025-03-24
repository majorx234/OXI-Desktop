if(WIN32)
    # See about TARGET_RUNTIME_DLLS from 3.21 https://cmake.org/cmake/help/git-stage/manual/cmake-generator-expressions.7.html#genex:TARGET_RUNTIME_DLLS
    cmake_minimum_required(VERSION 3.21)
else()
    cmake_minimum_required(VERSION 3.5)
endif()

project(oxi_desktop VERSION 2.3 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core Widgets Network)
find_package(qmidi REQUIRED)

set(PROJECT_SOURCES
        main.cpp
        mainwindow.cpp
        mainwindow.h
        mainwindow.ui
        oxi_desktop.qrc
)

add_executable(oxi_desktop
    ${PROJECT_SOURCES}
    ${CMAKE_SOURCE_DIR}/libs
)

target_link_libraries(oxi_desktop
    PRIVATE Qt6::Core
            Qt6::Widgets
            Qt6::Network
            qmidi::QMidi
            oxi_core)

set_target_properties(oxi_desktop
    PROPERTIES OUTPUT_NAME "OXI-Desktop")

qt6_finalize_target(oxi_desktop)
