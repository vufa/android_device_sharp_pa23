# Release name
PRODUCT_RELEASE_NAME := SBM303SH

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/sharp/PA23/PA23.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := PA23
PRODUCT_NAME := PA23
PRODUCT_BRAND := SHARP
PRODUCT_MODEL := PA23
PRODUCT_MANUFACTURER := SHARP

