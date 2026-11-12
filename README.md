# Lossless Scaling (Open Source)

A native **C++20 & DirectX 11** high-performance screen scaling and frame generation utility with a **Windows 11 Acrylic / Mica** translucent interface.

---

## Features

- **Windows 11 Acrylic / Mica Backdrop**: Native DWM translucent frosted glass effect with direct GPU swapchain presentation.
- **Hardware Acceleration**: Built on DirectX 11 with smooth 60–144 Hz refresh rate and VSync pacing.
- **Game Profiles**: Manage multiple game configurations with custom multipliers and upscalers.
- **Frame Generation (LSFG)**:
  - Modes: `Adaptive`, `X2`, `X3`, `X4`
  - Target FPS and optical flow sensitivity controls
- **Spatial Upscaling**:
  - `AMD FSR 1.0` (EASU + RCAS)
  - `LS1` Edge Detection Filter
  - `NVIDIA Image Scaling (NIS)`
  - `Anime4K`
  - `Bicubic` & `Nearest Neighbor` (Integer scaling)
- **Capture & Rendering**:
  - `DXGI Desktop Duplication`, `Windows Graphics Capture (WGC)`, and `GDI`
  - Custom Max Frame Latency, G-Sync, HDR, and HUD toggle
- **Global Hotkey**: Press `Ctrl + Alt + S` to engage or disengage scaling anytime in-game.
- **HUD Counter**: Real-time Base FPS / Generated FPS display with latency metrics.

---

## Project Structure

```
├── assets/
│   ├── app_icon.ico       # Embedded multi-resolution icon
│   ├── logo.png           # Duck logo
│   └── wings_blue.png     # Glowing wings background
├── src_cpp/
│   ├── config.hpp         # Profiles and global settings state
│   ├── engine.hpp         # Scaling capture and presentation overlay
│   ├── main.cpp           # Direct3D 11 initialization and UI loops
│   ├── ui_widgets.hpp     # Vector icons and Windows 11 toggle controls
│   ├── duck_logo_data.h   # Compiled texture data for duck logo
│   ├── wings_data.h       # Compiled texture data for glowing wings
│   └── imgui/             # Dear ImGui library and DX11/Win32 backends
├── app.rc                 # Windows application resource file
├── build_cpp.bat          # One-click Windows build script
├── CMakeLists.txt         # Modern CMake build configuration
├── .gitignore             # Git ignore file for binaries and artifacts
└── LICENSE                # MIT License
```

---

## Building from Source

### Using GCC / MinGW-w64 (Recommended)
Run the build script:
```cmd
build_cpp.bat
```

Or compile manually:
```cmd
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
```

### Using CMake
```cmd
cmake -B build
cmake --build build --config Release
```

---

## Usage

1. Launch `LosslessScaling.exe`.
2. Configure your profile settings.
3. Start your game in **Windowed** or **Borderless Window** mode.
4. Click **Scale** or press `Ctrl + Alt + S`.
5. Switch focus to your game window before the countdown ends.
6. Press `Escape` or `Ctrl + Alt + S` to exit scaling.

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
