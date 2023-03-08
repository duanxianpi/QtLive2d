QT       += core gui opengl

greaterThan(QT_MAJOR_VERSION, 5): QT += widgets

CONFIG += c++17
TARGET = Sample

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += $$PWD/../Core/include
INCLUDEPATH += $$PWD/../Framework/src
INCLUDEPATH += $$PWD/QtLive2dWidget/thirdParty/stb

CONFIG += debug_and_release
linux-g++* {
    message(Compling with linux-g++)
    CONFIG(debug, debug|release){
        message(Debug build)
        LIBS += -L$$PWD/../lib/Linux -lFrameworkd
        LIBS += -L$$PWD/../lib/Linux -lLive2DCubismCore
        DEPENDPATH += $$PWD/../dll
        release

    }

    CONFIG(release, debug|release){
        message(Release build)
        LIBS += -L$$PWD/../lib/Linux -lFramework
        LIBS += -L$$PWD/../lib/Linux -lLive2DCubismCore

    }

    DEFINES += CSM_TARGET_LINUX_GL
}

win32-msvc*{
    message(Compling with win32-msvc)
    CONFIG(debug, debug|release){
        message(Debug build)
        LIBS += -L$$PWD/../lib/Win32 -lLive2DCubismCore_MDd
        LIBS += -L$$PWD/../lib/Win32 -lFrameworkd

    }

    CONFIG(release, debug|release){
        message(Release build)
        LIBS += -L$$PWD/../lib/Win32 -lLive2DCubismCore_MD
        LIBS += -L$$PWD/../lib/Win32 -lFramework

    }

    DEFINES += WIN32
    DEFINES += _WINDOWS
    DEFINES += CSM_TARGET_WIN_GL
    QT += openglwidgets

    LIBS += -lOpenGL32
    LIBS += -lUser32
    LIBS += -lGlu32
}

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

CONFIG += file_copies

resources.files = $$PWD/Resources
resources.path = $$OUT_PWD


COPIES += resources

HEADERS += \
    $$PWD/../Framework/src/Rendering/CubismRenderer.hpp \
    $$PWD/../Framework/src/Rendering/OpenGL/CubismOffscreenSurface_OpenGLES2.hpp \
    $$PWD/../Framework/src/Rendering/OpenGL/CubismRenderer_OpenGLES2.hpp \
    $$PWD/../Framework/src/Rendering/OpenGL/openglhelper.hpp \
    QtLive2dWidget/src/LAppAllocator.hpp \
    QtLive2dWidget/src/LAppDefine.hpp \
    QtLive2dWidget/src/LAppDelegate.hpp \
    QtLive2dWidget/src/LAppLive2DManager.hpp \
    QtLive2dWidget/src/LAppModel.hpp \
    QtLive2dWidget/src/LAppPal.hpp \
    QtLive2dWidget/src/LAppSprite.hpp \
    QtLive2dWidget/src/LAppTextureManager.hpp \
    QtLive2dWidget/src/LAppView.hpp \
    QtLive2dWidget/src/LAppWavFileHandler.hpp \
    QtLive2dWidget/src/QLive2dWidget.hpp \
    QtLive2dWidget/src/TouchManager.hpp \
    QtLive2dWidget/src/openglhelper.hpp \
    mainwindow.h

SOURCES += \
    $$PWD/../Framework/src/Rendering/CubismRenderer.cpp \
    $$PWD/../Framework/src/Rendering/OpenGL/CubismOffscreenSurface_OpenGLES2.cpp \
    $$PWD/../Framework/src/Rendering/OpenGL/CubismRenderer_OpenGLES2.cpp \
    QtLive2dWidget/src/LAppAllocator.cpp \
    QtLive2dWidget/src/LAppDefine.cpp \
    QtLive2dWidget/src/LAppDelegate.cpp \
    QtLive2dWidget/src/LAppLive2DManager.cpp \
    QtLive2dWidget/src/LAppModel.cpp \
    QtLive2dWidget/src/LAppPal.cpp \
    QtLive2dWidget/src/LAppSprite.cpp \
    QtLive2dWidget/src/LAppTextureManager.cpp \
    QtLive2dWidget/src/LAppView.cpp \
    QtLive2dWidget/src/LAppWavFileHandler.cpp \
    QtLive2dWidget/src/QLive2dWidget.cpp \
    QtLive2dWidget/src/TouchManager.cpp \
    main.cpp \
    mainwindow.cpp

FORMS += \
    mainwindow.ui

