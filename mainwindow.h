#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <midiworker.h>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
    MidiWorker *midiWorker;
    QTimer *connection_timer;

//    QMidiIn midi_in;
//    QMidiOut midi_out;
//    std::vector<unsigned char> raw_data;

private slots:

    void updateProgressBar(int value);

    void on_gotoBLEBootloaderButton_clicked();
    void on_gotoSPLITBootloaderButton_clicked();
    void on_gotoOXIBootloaderButton_clicked();

    void on_exitBootloaderButton_clicked();

    void on_loadFileButton_clicked();

    void on_stopButton_clicked();

    void on_sendProjectButton_clicked();

    void ConnectionCheck(void);;

    void on_getProjectButton_clicked();

    void on_seq_index_valueChanged(double arg1);

    void on_project_index_valueChanged(double arg1);

    void on_pattern_index_valueChanged(double arg1);

    void on_getPatternButton_clicked();

    void on_deleteProjectButton_clicked();

    void on_deletePatternButton_clicked();

    void on_getCalibDataButton_clicked();

    void on_sendCalibDataButton_clicked();

signals:
    void updateWorkerDelayTime(int);
    void WorkerRefreshDevices(void);
    void WorkerUpdateFile(QString);

private:
//public:
    Ui::MainWindow *ui;
};
#endif // MAINWINDOW_H
