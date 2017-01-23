LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)

#----------------------------------------------------------------------
# extra images
#----------------------------------------------------------------------
# include the non-open-source counterpart to this file
-include vendor/sharp/pa23/AndroidBoardVendor.mk

