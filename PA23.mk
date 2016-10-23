$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

LOCAL_PATH := device/sharp/PA23

DEVICE_PACKAGE_OVERLAYS += device/sharp/PA23/overlay

include $(call all-subdir-makefiles)

LOCAL_KERNEL := $(LOCAL_PATH)/kernel
#LOCAL_DT := $(LOCAL_PATH)/dt.img

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
#	$(LOCAL_DT):dt.img

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/root/ueventd.qcom.rc:root/ueventd.qcom.rc \
	$(LOCAL_PATH)/recovery/root/fstab.qcom:root/fstab.qcom

# Screen density
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_NAME := PA23
PRODUCT_DEVICE := PA23
PRODUCT_BRAND := SHARP
PRODUCT_MANUFACTURER := SHARP
PRODUCT_MODEL := PA23

