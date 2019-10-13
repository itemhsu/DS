#!/bin/bash

function getbazel(){
	LINE=`readlink -f /home/$USER/code1/tensorflow-1.4.0-rc0/bazel-bin/`
	POS1="_bazel_$USER/"
	STR=${LINE##*$POS1}
	BAZEL=${STR:0:32}
	echo $BAZEL
}

BAZEL=`getbazel`

IINCLUDE="-I/usr/include -I/usr/local/include"

LLIBPATH="-L/usr/lib/x86_64-linux-gnu -L/home/$USER/code/test/pp/opencvlib/lib -L/usr/local/lib -L/homei/itemhsu/src/c/DS/deepsort/FeatureGetter "

rm DS -rf

function BOPENMPHOG(){
	LLIBS="-lopencv_core -lopencv_imgproc -lopencv_imgcodecs -lopencv_highgui -lopencv_videoio -lopencv_video  -lFeatureGetter -ltensorflow_framework -ltensorflow  -lboost_system -lglog -ltcmalloc_minimal"
	g++ --std=c++11 -O3 -fopenmp  -DUDL -o DS $IINCLUDE $LLIBPATH  deepsort/munkres/munkres.cpp deepsort/munkres/adapters/adapter.cpp deepsort/munkres/adapters/boostmatrixadapter.cpp  NT.cpp  Main.cpp $LLIBS
}
BOPENMPHOG

