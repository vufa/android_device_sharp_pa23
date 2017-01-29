#
# Copyright (C) 2015 The CyanogenMod Project
# Copyright (C) 2017 The Mokee Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

BOARD_VENDOR := pa23

LOCAL_PATH := device/sharp/pa23


# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_NO_BOOTLOADER         := true
TARGET_NO_RADIOIMAGE         := true

# Platform
TARGET_BOARD_PLATFORM     := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330

# Architecture
TARGET_ARCH         := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI      := armeabi-v7a
TARGET_CPU_ABI2     := armeabi
TARGET_CPU_SMP      := true
TARGET_CPU_VARIANT  := krait

# Flags
BOARD_GLOBAL_CFLAGS   += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64 -DUSE_RIL_VERSION_10
BOARD_GLOBAL_CPPFLAGS += -DUSE_RIL_VERSION_10

# Kernel
BOARD_KERNEL_CMDLINE               := console=none vmalloc=340M androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3
BOARD_KERNEL_SEPARATED_DT          := true
BOARD_KERNEL_BASE                  := 0x00000000
BOARD_KERNEL_PAGESIZE              := 2048
BOARD_MKBOOTIMG_ARGS               := --kernel_offset 0x00008000 --ramdisk_offset 0x02000000 --second_offset 0x00f00000 --tags_offset 0x01e00000
TARGET_KERNEL_SOURCE               := kernel/sharp/msm8974
TARGET_KERNEL_ARCH                 := arm
TARGET_KERNEL_CONFIG               := pa23_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-
BOARD_DTBTOOL_ARGS                 := -2

# QCOM hardware
BOARD_USES_QCOM_HARDWARE            := true
TARGET_POWERHAL_VARIANT             := qcom


# Graphics
USE_OPENGL_RENDERER               := true
TARGET_CONTINUOUS_SPLASH_ENABLED  := true
TARGET_USES_C2D_COMPOSITION       := true
TARGET_USE_COMPAT_GRALLOC_PERFORM := true
TARGET_USES_ION                   := true
OVERRIDE_RS_DRIVER                := libRSDriver_adreno.so
NUM_FRAMEBUFFER_SURFACE_BUFFERS   := 3
# Filesystem
TARGET_USERIMAGES_USE_EXT4           := true
TARGET_USERIMAGES_USE_F2FS          := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE    := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE  := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE       := 17825792
BOARD_RECOVERYIMAGE_PARTITION_SIZE   := 26214400
BOARD_SYSTEMIMAGE_PARTITION_SIZE     := 2147483648
BOARD_USERDATAIMAGE_PARTITION_SIZE   := 12549357568
BOARD_CACHEIMAGE_PARTITION_SIZE      := 281018368
BOARD_PERSISTIMAGE_PARTITION_SIZE    := 33554432
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE := 268435456
BOARD_FLASH_BLOCK_SIZE               := 131072

# Recovery
RECOVERY_FSTAB_VERSION             := 2
TARGET_RECOVERY_FSTAB              := $(LOCAL_PATH)/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT       := "RGBX_8888"
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"

# TWRP
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
DEVICE_RESOLUTION := 1080x1920
RECOVERY_VARIANT := twrp
TW_USE_TOOLBOX := true
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := zh_CN
RECOVERY_GRAPHICS_USE_LINELENGTH := true
#TW_EXCLUDE_MTP := true
TW_EXCLUDE_SUPERSU := true
TW_NO_USB_STORAGE := true
TW_NO_REBOOT_BOOTLOADER := true
#TW_TARGET_USES_QCOM_BSP := true

# MK Hardware
BOARD_USES_MOKEE_HARDWARE = true
BOARD_HARDWARE_CLASS += \
    hardware/mokee/mkhw \
    $(LOCAL_PATH)/mkhw

# No old RPC for prop
TARGET_NO_RPC := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Keymaster
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Simple time service client
BOARD_USES_QC_TIME_SERVICES := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
DONT_DEXPREOPT_PREBUILTS := true

#
USE_CAMERA_STUB := true

# SELinux policies
# qcom sepolicy
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
        $(LOCAL_PATH)/sepolicy
-include vendor/sharp/pa23/BoardConfigVendor.mk
-include vendor/qcom/binaries/msm8974/graphics/BoardConfigVendor.mk
