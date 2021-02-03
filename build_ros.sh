echo "Building ROS nodes"
echo "Remember: export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:PATH/ORB_SLAM3/Examples/ROS"
NUM_CPU=$(nproc)

cd Examples/ROS/ORB_SLAM3
mkdir build
cd build
cmake .. -DROS_BUILD_TYPE=Release
make -j$(($NUM_CPU-1))
