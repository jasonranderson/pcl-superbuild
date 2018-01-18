CMake build scripts for cross compiling PCL and its dependencies for Android and iOS.

Windows
[![Build status](https://ci.appveyor.com/api/projects/status/u8l4ixwdpysbx45h/branch/master?svg=true)](https://ci.appveyor.com/project/Sirokujira/pcl-superbuild/branch/master)

Ubuntu/MacOSX
[![Build Status](https://travis-ci.org/Sirokujira/pcl-superbuild.svg?branch=master)](https://travis-ci.org/Sirokujira/pcl-superbuild)

pcl use libraries
boost 1.60.0 [!custom boost](https://svn.boost.org/trac10/ticket/13230), [!source code](https://github.com/sirokujira/boost-build/)
eigen 3.3.4
flann 1.9.1
qhull(2015.2?)


Requirements:
  Android
  �EAndroid NDK, Revision 15c/16b?
  �ECMake >=3.6.x

iOS
  �EXcode 8.3, 9.0(?)
  �ECMake >=3.6.x


# https://dl.google.com/android/repository/android-ndk-r16b-linux-x86_64.zip
# Building for Android(Ubuntu 14.04)
$ wget -qO- https://dl.google.com/android/repository/android-ndk-r16b-linux-x86_64.zip -O /tmp/android-ndk-r16b-linux-x86_64.zip
$ unzip -q /tmp/android-ndk-r16b-linux-x86_64.zip

$ cd android-ndk-r15c
$ cd android-ndk-r16b
$ export ANDROID_NDK=$PWD

$ export ANDROID_TARGET_API="23"
$ export ANDROID_ABIs="armeabi-v7a"
$ export TOOLCHAIN_NAME="arm-linux-android-clang3.6"
$ export TARGET_COMPILER="clang"

$ export ANDROID_ABIs="arm64-v8a"
$ export TOOLCHAIN_NAME="aarch64-linux-android-clang3.6"
$ export TARGET_COMPILER="clang"

$ export ANDROID_ABIs="armeabi-v7a"
$ export TOOLCHAIN_NAME="arm-linux-androideabi-4.9"
$ export TARGET_COMPILER="gcc"

$ export ANDROID_ABIs="arm64-v8a"
$ export TOOLCHAIN_NAME="aarch64-linux-android-4.9"
$ export TARGET_COMPILER="gcc"

$ mkdir build && cd build
$ cmake -DBUILD_ANDROID:BOOL="ON" -DBUILD_IOS_DEVICE:BOOL="OFF" -DBUILD_IOS_SIMULATOR:BOOL="OFF" -DCMAKE_TOOLCHAIN_FILE:FILEPATH=${ANDROID_NDK}/build/cmake/android.toolchain.cmake -DCMAKE_MAKE_PROGRAM=${ANDROID_NDK}/prebuilt/linux-x86_64/bin/make -DANDROID_TOOLCHAIN_NAME=${TOOLCHAIN_NAME} -DANDROID_NATIVE_API_LEVEL=${ANDROID_TARGET_API} -DANDROID_ABI=${ANDROID_ABIs} -DANDROID_TOOLCHAIN=${TARGET_COMPILER} ..
$ cmake --build .

Building for iOS
$ mkdir build && cd build
$ cmake -DBUILD_ANDROID:BOOL="OFF" -DBUILD_IOS_DEVICE:BOOL="OFF" -DBUILD_IOS_SIMULATOR:BOOL="OFF" ../
$ cmake --build .


Reference modules

Base module
https://github.com/patmarion/pcl-superbuild
https://github.com/hirotakaster/pcl-superbuild

Android
https://github.com/taka-no-me/android-cmake

iOS
https://github.com/sheldonth/ios-cmake

