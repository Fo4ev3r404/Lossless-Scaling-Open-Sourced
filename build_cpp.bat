@echo off
windres app.rc -O coff -o app.res
g++ -O3 -std=c++20 ^
    src_cpp/main.cpp ^
    src_cpp/imgui/imgui.cpp ^
    src_cpp/imgui/imgui_draw.cpp ^
    src_cpp/imgui/imgui_widgets.cpp ^
    src_cpp/imgui/imgui_tables.cpp ^
    src_cpp/imgui/imgui_impl_win32.cpp ^
    src_cpp/imgui/imgui_impl_dx11.cpp ^
    app.res ^
    -Isrc_cpp -Isrc_cpp/imgui ^
    -ld3d11 -ld3dcompiler -ldxgi -ldwmapi -lgdi32 ^
    -mwindows ^
    -o LosslessScaling.exe
