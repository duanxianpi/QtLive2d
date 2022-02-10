QT       += core gui opengl openglwidgets

greaterThan(QT_MAJOR_VERSION, 5): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += $$PWD/Core/include
INCLUDEPATH += $$PWD/Framework/src
INCLUDEPATH += $$PWD/thirdParty/stb
DEPENDPATH += $$PWD/../dll


DEFINES += WIN32
DEFINES += _WINDOWS
DEFINES += CSM_TARGET_WIN_GL

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

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    Framework/src/Rendering/CubismRenderer.hpp \
    Framework/src/Rendering/OpenGL/CubismOffscreenSurface_OpenGLES2.hpp \
    Framework/src/Rendering/OpenGL/CubismRenderer_OpenGLES2.hpp \
    Framework/src/Rendering/OpenGL/openglhelper.hpp \
    Live2d/LAppAllocator.hpp \
    Live2d/LAppDefine.hpp \
    Live2d/LAppDelegate.hpp \
    Live2d/LAppLive2DManager.hpp \
    Live2d/LAppModel.hpp \
    Live2d/LAppPal.hpp \
    Live2d/LAppSprite.hpp \
    Live2d/LAppTextureManager.hpp \
    Live2d/LAppView.hpp \
    Live2d/LAppWavFileHandler.hpp \
    Live2d/QLive2dWidget.hpp \
    Live2d/TouchManager.hpp \
    Live2d/openglhelper.hpp \
    QtLive2d/mainwindow.h

SOURCES += \
    Framework/src/Rendering/CubismRenderer.cpp \
    Framework/src/Rendering/OpenGL/CubismOffscreenSurface_OpenGLES2.cpp \
    Framework/src/Rendering/OpenGL/CubismRenderer_OpenGLES2.cpp \
    Live2d/LAppAllocator.cpp \
    Live2d/LAppDefine.cpp \
    Live2d/LAppDelegate.cpp \
    Live2d/LAppLive2DManager.cpp \
    Live2d/LAppModel.cpp \
    Live2d/LAppPal.cpp \
    Live2d/LAppSprite.cpp \
    Live2d/LAppTextureManager.cpp \
    Live2d/LAppView.cpp \
    Live2d/LAppWavFileHandler.cpp \
    Live2d/QLive2dWidget.cpp \
    Live2d/TouchManager.cpp \
    QtLive2d/main.cpp \
    QtLive2d/mainwindow.cpp

FORMS += \
    QtLive2d/mainwindow.ui

