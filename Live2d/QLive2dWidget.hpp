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
//    void testMouse();
    void clear();
    inline static float ratio;

//    bool nativeEvent(const QByteArray &,void*,long*)override;

    inline static QElapsedTimer elapsedTimer;

protected:
    void mouseMoveEvent(QMouseEvent *event) override;
    void mousePressEvent(QMouseEvent *event) override;
    void mouseReleaseEvent(QMouseEvent *event) override;

private slots:
    void updateMotions();
//    bool is_dragging;
//    int oldx,oldy;
//    void mousePressEvent(QMouseEvent*e)override;
//    void mouseReleaseEvent(QMouseEvent*e)override;
//    void mouseMoveEvent(QMouseEvent*e)override;
};
#endif // QGLWIDGET_H
