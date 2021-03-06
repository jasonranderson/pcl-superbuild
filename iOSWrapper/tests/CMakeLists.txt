cmake_minimum_required (VERSION 3.7)

# Based : https://github.com/Kitware/CMake/blob/master/Tests/XCTest/CMakeLists.txt
project(XCTest CXX C)
enable_testing()

find_package(XCTest REQUIRED)

set(DEPLOYMENT_TARGET 10.3)
set(DEVICE_FAMILY "1,2")
set(TEST_NAME Tests)
set(TEST_BUNDLE_IDENTIFIER com.sirokujira.tests)
set(LOGIC_ONLY_TESTS 0)

# Simulator only?
# https://github.com/ruslo/polly/issues/149
# add_subdirectory(tests)
# project(${TEST_NAME})
include(BundleUtilities)
include(FindXCTest)

message(STATUS XCTestFound:${XCTest_FOUND})

set(TEST_SOURCE
    ${CMAKE_CURRENT_LIST_DIR}/../PointCloudLibraryInterface.mm
    ${CMAKE_CURRENT_LIST_DIR}/../PointCloudLibraryInterface.h
    ${CMAKE_CURRENT_LIST_DIR}/Tests.m
    # ${CMAKE_CURRENT_LIST_DIR}/Tests.swift
)

xctest_add_bundle(
    ${TEST_NAME}                # Name of the XCTest bundle
    ${TEST_SOURCE}              # Target name of the testee
)

if(NOT LOGIC_ONLY_TESTS)
    target_include_directories(${TEST_NAME} PUBLIC
        "${CMAKE_SOURCE_DIR}"
    )
endif(NOT LOGIC_ONLY_TESTS)

xctest_add_test(
    ${TEST_BUNDLE_IDENTIFIER}   # Test name
    ${TEST_NAME}                # Target name of XCTest bundle
)

set(CMAKE_SHARED_LINKER_FLAGS "-Wall")

set_target_properties(${TEST_NAME} PROPERTIES
    MACOSX_BUNDLE_INFO_PLIST ${CMAKE_CURRENT_LIST_DIR}/tests.plist.in
    MACOSX_BUNDLE_IDENTIFIER ${TEST_BUNDLE_IDENTIFIER}
    XCODE_ATTRIBUTE_IPHONEOS_DEPLOYMENT_TARGET ${DEPLOYMENT_TARGET}
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer"
    # XCODE_ATTRIBUTE_DEVELOPMENT_TEAM ${DEVELOPMENT_TEAM_ID}
    XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY ${DEVICE_FAMILY}
    XCODE_ATTRIBUTE_FRAMEWORK_SEARCH_PATHS "\$(inherited)"
    # build.ios\Release-iphoneos
    # build.ios\Release-iphonesimulator
)

if(LOGIC_ONLY_TESTS)
    set_target_properties(${TEST_NAME} PROPERTIES
        XCODE_ATTRIBUTE_TEST_HOST ""
    )
endif(LOGIC_ONLY_TESTS)

xctest_add_test(XCTest.${FRAMEWORK_NAME} ${TEST_NAME})

# This is needed to erase invalid framework search paths set by FindXCTest.
# The drawback is that you can not use target_include_directories for setting up
# search paths for this target. You have to use
# XCODE_ATTRIBUTE_FRAMEWORK_SEARCH_PATHS. As long as you stick to running
# tests on code compiled into the host app this is not a hindrance.
# set_target_properties(${TEST_NAME} PROPERTIES
#     XCODE_ATTRIBUTE_FRAMEWORK_SEARCH_PATHS "\$(inherited) " 
# )
set_target_properties(${TEST_NAME} PROPERTIES
    XCODE_ATTRIBUTE_FRAMEWORK_SEARCH_PATHS "../../build/CMakeExternals/Install/frameworks-universal"
)

# import boost lib[@rpath?]

