
# Inherit common
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, build/target/product/full.mk)

# Inherit vendor
$(call inherit-product-if-exists, vendor/sharp/PA23/PA23-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Inherit from msm8974
$(call inherit-product, device/qcom/msm8974/msm8974.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := PA23
PRODUCT_NAME := PA23
PRODUCT_BRAND := SHARP
PRODUCT_MODEL := PA23
PRODUCT_MANUFACTURER := SHARP

