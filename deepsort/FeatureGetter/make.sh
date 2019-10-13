#!/bin/bash
function getbazel(){
	LINE=`readlink -f /home/$USER/code1/tensorflow-1.4.0-rc0/bazel-bin/`

	POS1="_bazel_$USER/"
	STR=${LINE##*$POS1}

	BAZEL=${STR:0:32}

	echo $BAZEL
}



BAZEL=`getbazel`

function TF(){
IINCLUDE="-I/home/itemhsu/src/c/tensorflow/ -I/home/itemhsu/.cache/bazel/_bazel_itemhsu/eeac80d65a0203b7e393eff1c69755ff/execroot/org_tensorflow/bazel-out/host/bin/ -I/home/itemhsu/.cache/bazel/_bazel_itemhsu/eeac80d65a0203b7e393eff1c69755ff/external/protobuf_archive/src/ -I/usr/local/include/eigen3 -I/home/itemhsu/.local/lib/python2.7/site-packages/tensorflow/include/tensorflow/include/external/com_google_absl/ -I/usr/local/include -I/home/$USER/.cache/bazel/_bazel_$USER/$BAZEL/external/eigen_archive/Eigen -I/home/$USER/.cache/bazel/_bazel_$USER/$BAZEL/external/eigen_archive -I/home/$USER/code1/tensorflow-1.4.0-rc0 -I/home/$USER/code1/tensorflow-1.4.0-rc0/bazel-genfiles -I/home/$USER/.cache/bazel/_bazel_$USER/$BAZEL/external/nsync/public"

LLIBPATH="-L/usr/lib/x86_64-linux-gnu/ -L/home/$USER/code/test/pp/opencvlib/lib -L/usr/local/lib -L/home/$USER/code1/tensorflow-1.4.0-rc0/bazel-bin/tensorflow"
LLIBS="-lopencv_core -lopencv_imgproc -lopencv_highgui -ltensorflow_cc -ltensorflow_framework"

rm libFeatureGetter.so -rf
g++ --std=c++14 -O3 -fopenmp -fPIC -shared -o libFeatureGetter.so $IINCLUDE $LLIBPATH  FeatureGetter.cpp $LLIBS

}
TF






