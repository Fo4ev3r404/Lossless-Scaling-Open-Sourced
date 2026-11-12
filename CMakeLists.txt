cmake_minimum_required(VERSION 3.20)
project(LosslessScaling LANGUAGES C CXX RC)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(IMGUI_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src_cpp/imgui")

include_directories(
    src_cpp
    ${IMGUI_DIR}
)

set(SOURCES
    src_cpp/main.cpp
    ${IMGUI_DIR}/imgui.cpp
    ${IMGUI_DIR}/imgui_draw.cpp
    ${IMGUI_DIR}/imgui_widgets.cpp
    ${IMGUI_DIR}/imgui_tables.cpp
    ${IMGUI_DIR}/imgui_impl_win32.cpp
    ${IMGUI_DIR}/imgui_impl_dx11.cpp
    app.rc
)

add_executable(LosslessScaling WIN32 ${SOURCES})

target_link_libraries(LosslessScaling PRIVATE
    d3d11
    d3dcompiler
    dxgi
    dwmapi
    gdi32
)
