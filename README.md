<p align="center">
  <img src="logo.png" height="150" />
</p>
<p align="center">
  A Qt-based Live2d widget
</p>
<p align="center">
  <a href="https://github.com/duanxianpi/QtLive2d/blob/main/LICENSE.md">  
    <img alt="GitHub" src="https://img.shields.io/github/license/duanxianpi/QtLive2d?label=License">
  </a>
  <a href="https://github.com/duanxianpi/QtLive2d">
    <img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/duanxianpi/QtLive2d"/>
  </a>
  <a href="https://github.com/duanxianpi/QtLive2d/releases">
    <img alt="GitHub release (latest by date including pre-releases)" src="https://img.shields.io/github/v/release/duanxianpi/QtLive2d?include_prereleases&sort=semver">
  </a>
  <a href="https://github.com/duanxianpi">
    <img alt="GitHub user" src="https://img.shields.io/badge/author-duanxianpi-brightgreen"/>
  </a>
</p>

## Introduction
QtLive2d is a Qt-based Live2d widget, it is modified from the [official Live2d Sample](https://github.com/Live2D/CubismNativeSamples). Unlike the official examples, QtLive2d uses QOpenGLWidget and QOpenGLFunctions provided by Qt instead of glfw and glew. This makes it easy to combine with any Qt Gui software.

**Thanks [6ziv](https://github.com/6ziv) for your blogs and projects. They have helped me a lot on this project**
## Feature
* Easy to use
* Using OpenGL instead of WebGL
* Less resource consumption
* Support Live2d mouse events
* Support transparent background
* CrossPlatform (Qt is CrossPlatform, haven't test on other platform yet)

## Sample
We provide a sample application called Sample to show you how to use it.
[![HUSmi4.md.png](https://s4.ax1x.com/2022/02/11/HUSmi4.md.png)](https://imgtu.com/i/HUSmi4)

## Build
### Dependency
* Live2DCubismCore.lib
* Framework.lib
* OpenGL32
* User32
* Glu32

### Usage
1. **Please use MSVC 2017 or 2019! and std C++ 17**
1. To use QtLive2d in your program, you need to add Floder QtLive2d, Framework, thirdParty and Core into you project.
2. Add includepath and dependpath in `pro` file
    ```pro
    INCLUDEPATH += $$PWD/Core/include
    INCLUDEPATH += $$PWD/Framework/src
    INCLUDEPATH += $$PWD/thirdParty/stb
    DEPENDPATH += $$PWD/../dll
    ```
3. Define flags in `pro` file
    ```pro
    DEFINES += WIN32
    DEFINES += _WINDOWS
    DEFINES += CSM_TARGET_WIN_GL
    ```
5. Compiling Framework and add Framework.lib into `pro` file. 
6. Add other libs into `pro` file. 
   ```pro
    CONFIG += debug_and_release
    CONFIG(debug, debug|release){
      message(Debug build)
      LIBS += -L$$PWD/lib/ -lLive2DCubismCore_MDd
      LIBS += -L$$PWD/lib/ -lFrameworkd

    }

    CONFIG(release, debug|release){
      message(Release build)
      LIBS += -L$$PWD/lib/ -lLive2DCubismCore_MD
      LIBS += -L$$PWD/lib/ -lFramework

    }
    LIBS += -lOpenGL32
    LIBS += -lUser32
    LIBS += -lGlu32
   ```
8. QLive2dWidget is a subclass of QOpenGLWidget, which can be used directly or be promoted in the Qt Designer.
9. To use QOpenGLWidget in Qt, you need add extra moudules.
    ```pro
    QT       += core gui opengl openglwidgets
    greaterThan(QT_MAJOR_VERSION, 5): QT += widgets
    ```
11. Define you model path in `LAppDefine.cpp`.
12. Enjoy it!

## What's Next?
- [ ] Cross Platform
