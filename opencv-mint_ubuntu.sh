#!/bin/bash 

# OpenCV 3.x - installation script For Linux Ubuntu 14.04.2 LTS (Trusty Tahr) and Mint 17.1 (Rebecca)
# http://opencv.org/
# https://linuxhint.com/how-to-install-opencv-on-ubuntu/
# https://www.scivision.co/compiling-opencv3-with-extra-contributed-modules/
# https://www.learnopencv.com/install-opencv3-on-ubuntu/

# If the latest version > opencv-3.0.0-rc1 you must change the following variables
LINK="https://github.com/Itseez/opencv/archive/3.3.1.zip" #link to download opencv
FILE_NAME="opencv-3.3.1.zip" #Name of the file
LINK2="https://github.com/Itseez/opencv_contrib/archive/3.3.1.zip" #link to download opencv
FILE_NAME2="opencv_contrib.zip" #Name of the file
FILE_LENGTH=`expr length $FILE_NAME`
FILE_LENGTH=$((FILE_LENGTH-4))
DIRECTORY_NAME=${FILE_NAME%%.zip*} #It's just the FILE_NAME without the .zip

echo " **** Initialization **** "

echo " **** Update and upgrade the system **** "
sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
 
sudo apt-get update
sudo apt-get upgrade

echo " **** Dependencies installation **** "

sudo apt -y install libjasper1 libjasper-dev

wget http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb
sudo dpkg -i libpng12-0_1.2.54-1ubuntu1_amd64.deb

sudo apt-get -y remove x264 libx264-dev
 
sudo apt-get -y install build-essential checkinstall cmake pkg-config yasm
sudo apt-get -y install git gfortran
sudo apt-get -y install libjpeg8-dev libjasper-dev libpng12-dev
 
# If you are using Ubuntu 14.04
# sudo apt-get install libtiff4-dev
# If you are using Ubuntu 16.04
sudo apt-get -y install libtiff5-dev
 
sudo apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt-get -y install libxine2-dev libv4l-dev
sudo apt-get -y install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
sudo apt-get -y install qt5-default libgtk2.0-dev libtbb-dev
sudo apt-get -y install libatlas-base-dev
sudo apt-get -y install libfaac-dev libmp3lame-dev libtheora-dev
sudo apt-get -y install libvorbis-dev libxvidcore-dev
sudo apt-get -y install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt-get -y install x264 v4l-utils
 
# Optional dependencies
sudo apt-get -y install libprotobuf-dev protobuf-compiler
sudo apt-get -y install libgoogle-glog-dev libgflags-dev
sudo apt-get -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen#!/bin/bash



sudo apt-get -y install libopencv-dev build-essential cmake git libgtk2.0-dev pkg-config python-dev python-numpy libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff4-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev libtbb-dev libqt4-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils unzip qt-creator
sudo apt-get -y install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev
sudo apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get -y install libxvidcore-dev libx264-dev
sudo apt-get -y install libgtk-3-dev
sudo apt-get -y install libhdf5-serial-dev graphviz
sudo apt-get -y install libopenblas-dev libatlas-base-dev gfortran
sudo apt-get -y install python-tk python3-tk python-imaging-tk
sudo apt-get -y install python2.7-dev python3-dev

wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo python3 get-pip.py


wget http://download.qt.io/official_releases/qt/5.7/5.7.0/qt-opensource-linux-x64-5.7.0.run
chmod +x qt-opensource-linux-x64-5.7.0.run
./qt-opensource-linux-x64-5.7.0.run
sudo apt-get -y install build-essential
sudo apt-get -y install mesa-common-dev
sudo apt-get -y install libglu1-mesa-dev -y


# virtualenv and virtualenvwrapper

sudo pip install virtualenv virtualenvwrapper
sudo rm -rf ~/.cache/pip get-pip.py


export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

echo -e "\n# virtualenv and virtualenvwrapper" >> ~/.bashrc
echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
source ~/.bashrc


mkvirtualenv dl4cv -p python3
workon dl4cv
pip install numpy
cd ~

# Define a constant
FOLDER_NAME="opencv"
 
# Create a new directory with the constant name
mkdir ${FOLDER_NAME}
 
# Enter in the directory
cd ${FOLDER_NAME}
 
# Download opencv 3.x.
wget ${LINK} -O ${FILE_NAME}
wget ${LINK2} -O ${FILE_NAME2} 
# Extract the zip file
unzip ${FILE_NAME}
unzip ${FILE_NAME2}

echo " **** Installation of OpenCV 3.x **** "
 
# Enter to the directory
cd ${DIRECTORY_NAME}
 
# Create a new directory called 'build'
mkdir build
 
# Enter in the directory
cd build
 
# Use cmake to create a configuration files with configuration flags
#cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D WITH_QT=ON -D WITH_OPENGL=ON ..
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUDA=OFF -D INSTALL_PYTHON_EXAMPLES=ON \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-3.3.1/modules -D BUILD_EXAMPLES=ON ..

cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON ..

# Project compilation
make -j $(nproc)
 
# OpenCV installation
sudo make install
 
# Adds the path of OpenCV libraries to the standard library search paths
sudo /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
 
#  Use ldconfig to dynamically link to an OpenCV library
sudo ldconfig
 
echo " **** OpenCV 3.x was successfuly installed ! ****"
