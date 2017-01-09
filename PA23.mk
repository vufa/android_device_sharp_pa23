$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

LOCAL_PATH := device/sharp/PA23

# enable overlays to use our version of
# source/resources etc.
DEVICE_PACKAGE_OVERLAYS += device/sharp/PA23/device/overlay
PRODUCT_PACKAGE_OVERLAYS += device/sharp/PA23/product/overlay

include $(call all-subdir-makefiles)

#LOCAL_KERNEL := $(LOCAL_PATH)/kernel
#LOCAL_DT := $(LOCAL_PATH)/dt.img

#PRODUCT_COPY_FILES += \
#    $(LOCAL_KERNEL):kernel
#	$(LOCAL_DT):dt.img

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/root/ueventd.qcom.rc:root/ueventd.qcom.rc \
	$(LOCAL_PATH)/recovery/root/fstab.qcom:root/fstab.qcom

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    init.target.rc \
    init.qcom.usb.rc \
    ueventd.qcom.rc \
    init.qcom.early_boot.sh \
    init.qcom.factory.sh \
    init.qcom.sh \
    init.qcom.usb.sh


# Proprietery Firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/xtwifi.conf:system/etc/xtwifi.conf \
    $(LOCAL_PATH)/rootdir/etc/calib.cfg:system/etc/calib.cfg \
    $(LOCAL_PATH)/rootdir/etc/modem/Diag.cfg:system/etc/modem/Diag.cfg

#chargeonlymode
PRODUCT_COPY_FILES += \
   device/sharp/PA23/rootdir/sbin/chargeonlymode:sbin/chargeonlymode

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

# call the proprietary setup
$(call inherit-product, vendor/sharp/PA23/PA23-vendor.mk)
