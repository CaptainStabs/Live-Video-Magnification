QT += core gui

linux {
###################################################################
# !! Not tested, change to match your OpenCV (>= v4) installation #
    QT_CONFIG -= no-pkg-config
    CONFIG += link_pkgconfig
    PKGCONFIG += opencv
# !! Not tested, change to match your OpenCV (>= v4) installation #
###################################################################
}

#win32 {
    ##########################################################################
    # !! Change this to match your OpenCV (>= v4) installation on Windows !! #
    INCLUDEPATH += "C:/OpenCV/include/"

    LIBS += -L"C:/OpenCV-MinGW-Build-OpenCV-4.5.5-x64/x64/mingw/bin" -lopencv_core455 -lopencv_highgui455 -lopencv_imgproc455 -lopencv_imgcodecs455 -lopencv_videoio455 -lopencv_gapi455  -lopencv_video455 -lopencv_ml455

    # !! Change this to match your OpenCV (>= v4) installation on Windows !! #
    ##########################################################################

    # Comment out if OpenCV was compiled without TBB
    # LIBS += -L"D:/Programme/OpenCV/source/tbb2019_20190605oss/bin/intel64/vc14"

    # Place compiled filed inside distinct release and debug folder
    # without another release and debug folder within each release and debug folder
    CONFIG -= debug_and_release debug_and_release_target

    CV22_INCLUDE =
    CV22_LIB =

greaterThan(QT_MAJOR_VERSION, 5): QT += widgets

TARGET = rvm
TEMPLATE = app

DEFINES += APP_VERSION=\\\"1.0\\\"

INCLUDEPATH += $$PWD/main \
    $$PWD/main/helper \
    $$PWD/main/magnification \
    $$PWD/main/other \
    $$PWD/main/threads \
    $$PWD/main/ui \
    $$PWD/external \
    $$PWD/external/qxtSlider

SOURCES += main/main.cpp \
    main/helper/MatToQImage.cpp \
    main/helper/SharedImageBuffer.cpp \
    main/magnification/Magnificator.cpp \
    main/magnification/RieszPyramid.cpp \
    main/magnification/SpatialFilter.cpp \
    main/magnification/TemporalFilter.cpp \
    main/threads/CaptureThread.cpp \
    main/threads/PlayerThread.cpp \
    main/threads/ProcessingThread.cpp \
    main/threads/SavingThread.cpp \
    main/ui/CameraConnectDialog.cpp \
    main/ui/CameraView.cpp \
    main/ui/FrameLabel.cpp \
    main/ui/MagnifyOptions.cpp \
    main/ui/MainWindow.cpp \
    main/ui/VideoView.cpp \
    external/qxtSlider/qxtglobal.cpp \
    external/qxtSlider/qxtspanslider.cpp

HEADERS += \
    main/helper/ComplexMat.h \
    main/helper/MatToQImage.h \
    main/helper/SharedImageBuffer.h \
    main/magnification/Magnificator.h \
    main/magnification/RieszPyramid.h \
    main/magnification/SpatialFilter.h \
    main/magnification/TemporalFilter.h \
    main/threads/CaptureThread.h \
    main/threads/PlayerThread.h \
    main/threads/ProcessingThread.h \
    main/threads/SavingThread.h \
    main/ui/CameraConnectDialog.h \
    main/ui/CameraView.h \
    main/ui/FrameLabel.h \
    main/ui/MagnifyOptions.h \
    main/ui/MainWindow.h \
    main/ui/VideoView.h \
    main/other/Buffer.h \
    main/other/Config.h \
    main/other/Structures.h \
    external/qxtSlider/qxtglobal.h \
    external/qxtSlider/qxtnamespace.h \
    external/qxtSlider/qxtspanslider.h \
    external/qxtSlider/qxtspanslider_p.h

FORMS += \
    main/ui/MainWindow.ui \
    main/ui/CameraView.ui \
    main/ui/CameraConnectDialog.ui \
    main/ui/MagnifyOptions.ui \
    main/ui/VideoView.ui

# Spare me those nasty C++ compiler warnings and pray instead
# QMAKE_CXXFLAGS += -W2
#QMAKE_CXX="clazy-cl.bat"
