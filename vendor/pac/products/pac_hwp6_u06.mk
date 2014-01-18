# Check for target product
ifeq (pac_hwp6_u06,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xhdpi

# AOKP device overlay
#PRODUCT_PACKAGE_OVERLAYS += vendor/pac/overlay/aokp/device/hwp6_u06

# PAC boot logo
#PRODUCT_COPY_FILES += \
#    vendor/pac/prebuilt/common/bootlogo/pac_logo_720x1280.rle:root/logo.rle


# PAC device overlay
$(shell cp -f vendor/huawei/hwp6_u06/proprietary/default_wallpaper.jpg vendor/pac/overlay/pac/common/frameworks/base/core/res/res/drawable-nodpi/default_wallpaper.jpg)

$(shell cp -f vendor/huawei/hwp6_u06/proprietary/default_wallpaper.jpg vendor/pac/overlay/pac/common/frameworks/base/core/res/res/drawable-sw720dp-nodpi/default_wallpaper.jpg)


# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/huawei/hwp6_u06/proprietary/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/pac/config/pac_common.mk

# Inherit CM device configuration
$(call inherit-product, device/huawei/hwp6_u06/cm.mk)

PRODUCT_NAME := pac_hwp6_u06

#skip asserts for now
TARGET_OTA_ASSERT_SKIP := true

# Update local_manifest.xml
GET_PROJECT_RMS := $(shell vendor/pac/tools/removeprojects.py $(PRODUCT_NAME))
GET_PROJECT_ADDS := $(shell vendor/pac/tools/addprojects.py $(PRODUCT_NAME))

endif
