LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

KERNEL_DEFCONFIG := pa23_defconfig

# Inherit from msm8974
include device/qcom/msm8974/AndroidBoard.mk

# Include the non-open-source counterpart to this file
-include vendor/sharp/PA23/AndroidBoardVendor.mk

