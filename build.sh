
NUM_CPU=$(nproc)

COMPLIEWHITCH=$1

if [ $COMPLIEWHITCH == 1 ]
then
    echo "Will only configure and build Thirdparty/DBoW2"

elif [ $COMPLIEWHITCH == 2 ]
then
    echo "Will only configure and build ORB_SLAM3"

elif [ $COMPLIEWHITCH == 0 ]
then
    echo "Will only configure and build Thirdparty/DBoW2/ORB_SLAM3"

else
    echo "run commond: ./build.sh 0(for All or 1 for Thirdparty or 2 for ORBSLAM3)"
fi

if [[ $COMPLIEWHITCH == 1 || $COMPLIEWHITCH == 0 ]]
then
    echo "Configuring and building Thirdparty/DBoW2 ..."

    cd Thirdparty/DBoW2
    mkdir build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make -j$(($NUM_CPU-1))

    cd ../../g2o

    echo "Configuring and building Thirdparty/g2o ..."

    mkdir build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make -j$(($NUM_CPU-1))

    cd ../../../

    echo "Uncompress vocabulary ..."

    cd Vocabulary
    tar -xf ORBvoc.txt.tar.gz
    cd ..

fi

if [[ $COMPLIEWHITCH == 2 || $COMPLIEWHITCH == 0 ]]
then
    echo "Configuring and building ORB_SLAM3 ..."

    mkdir build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make -j$(($NUM_CPU-1))

fi


