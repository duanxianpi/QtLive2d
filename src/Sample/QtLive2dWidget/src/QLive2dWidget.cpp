#include "QLive2dWidget.hpp"
#include <QApplication>
#include "openglhelper.hpp"
#include "LAppDelegate.hpp"
#include <QTimer>

#ifdef WIN32
#include <Windows.h>
#endif


QLive2dWidget::QLive2dWidget(QWidget *parent):
    QOpenGLWidget(parent)
{
    this->setAttribute(Qt::WA_AlwaysStackOnTop);
    this->setAttribute(Qt::WA_TranslucentBackground);

    elapsedTimer.start();

    //Add the render into Timer to make the animation
    QTimer *timer = new QTimer(this);
    connect(timer, &QTimer::timeout, this, &QLive2dWidget::updateMotions);
    timer->start(1);

    // the OpenGL in OpenGLWidget won't scale by HDPI setting, we need to scale manually.
    ratio = parent->devicePixelRatio();
}
void QLive2dWidget::initializeGL()
{
    this->makeCurrent();
    OpenGLHelper::init(this->context());

    LAppDelegate::GetInstance()->Initialize(this);
    LAppDelegate::GetInstance()->Run();

    OpenGLHelper::get()->glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    OpenGLHelper::get()->glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    OpenGLHelper::get()->glEnable(GL_BLEND);
    OpenGLHelper::get()->glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

}
void QLive2dWidget::resizeGL(int width, int height)
{
    LAppDelegate::GetInstance()->Resize(width*ratio,height*ratio);
}

void QLive2dWidget::paintGL()
{
    LAppDelegate::GetInstance()->Run();
}

void QLive2dWidget::clear()
{
    OpenGLHelper::get()->glViewport(0, 0, width()*ratio, height()*ratio);
    OpenGLHelper::get()->glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
    OpenGLHelper::get()->glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    OpenGLHelper::get()->glClearDepthf(1.0);
}


void QLive2dWidget::updateMotions()
{
    update();
}

void QLive2dWidget::mouseMoveEvent(QMouseEvent * event){
    LAppDelegate::GetInstance()->mouseMoveEvent(event);
}
void QLive2dWidget::mousePressEvent(QMouseEvent * event){
    LAppDelegate::GetInstance()->mousePressEvent(event);
}
void QLive2dWidget::mouseReleaseEvent(QMouseEvent * event){
    LAppDelegate::GetInstance()->mouseReleaseEvent(event);
}
