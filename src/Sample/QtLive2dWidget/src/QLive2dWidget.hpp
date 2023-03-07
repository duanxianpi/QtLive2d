#ifndef QQGLWIDGET_H
#define QQGLWIDGET_H
#include <QtOpenGLWidgets/QOpenGLWidget>
#include <QOpenGLFunctions>
#include <QElapsedTimer>

class QLive2dWidget :
        public QOpenGLWidget
{
public:
    QLive2dWidget(QWidget *parent = nullptr);
    void initializeGL()override;
    void resizeGL(int width, int height)override;
    void paintGL()override;
    void clear();

    inline static float ratio;
    inline static QElapsedTimer elapsedTimer;

protected:
    void mouseMoveEvent(QMouseEvent *event) override;
    void mousePressEvent(QMouseEvent *event) override;
    void mouseReleaseEvent(QMouseEvent *event) override;

private slots:
    void updateMotions();
};
#endif // QLIVE2DWIDGET_H
