#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "QtLive2dWidget/src/QLive2dWidget.hpp"
#include "QtLive2dWidget/src/LAppLive2DManager.hpp"
#include "QtLive2dWidget/src/LAppDefine.hpp"
#include <QLabel>

#ifdef WIN32
#include <Windows.h>
#endif

using namespace LAppDefine;

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    ui->textBrowser->append("Total Load "+QString::number(ModelDirSize)+" models");
    ui->textBrowser->append("Current Model:  "+QString(ModelDir[index%ModelDirSize]));
    ui->textBrowser->append("Path: "+QString(ResourcesPath)+QString(ModelDir[index%ModelDirSize]));
    ui->textBrowser->append("=========================");

/*
Transparent the window
*/

//    this->setAttribute(Qt::WA_TranslucentBackground);


/*
Transparent to messages (click, touch, keyboard). If you set this, whole windows will be Transparent to messages.
*/

//    this->setAttribute(Qt::WA_TransparentForMouseEvents);
//    SetForegroundWindow((HWND)winId());
//    this->setWindowFlags(Qt::Window | Qt::FramelessWindowHint |Qt::WindowStaysOnTopHint);

}

MainWindow::~MainWindow()
{
    delete ui;

}


void MainWindow::on_pushButton_clicked()
{
    LAppLive2DManager* live2DManager = LAppLive2DManager::GetInstance();
    live2DManager->NextScene();
    index++;
    ui->textBrowser->append("Change Model Sucessfully!");
    ui->textBrowser->append("Current Model:  "+QString(ModelDir[index%ModelDirSize]));
    ui->textBrowser->append("Path: "+QString(ResourcesPath)+QString(ModelDir[index%ModelDirSize]));
    ui->textBrowser->append("=========================");

}

