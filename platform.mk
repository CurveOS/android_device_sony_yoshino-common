$(call inherit-product, device/sony/common-treble/common.mk)

PLATFORM_PATH := device/sony/yoshino-common

### PLATFORM INIT
PRODUCT_PACKAGES += \
    init.yoshino.usb \
    init.yoshino.pwr

DEVICE_PACKAGE_OVERLAYS += \
    $(PLATFORM_PATH)/overlay

### RECOVERY
ifeq ($(WITH_TWRP),true)
# Add Timezone database
PRODUCT_COPY_FILES += \
    system/timezone/output_data/iana/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata

# Add manifest for hwservicemanager
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/recovery/vendor/manifest.xml:recovery/root/vendor/manifest.xml

else # WITH_TWRP
### VERITY
ifeq ($(WITH_VERITY),true)
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/platform/soc/1da4000.ufshc/by-name/system
PRODUCT_VENDOR_VERITY_PARTITION := /dev/block/platform/soc/1da4000.ufshc/by-name/vendor
$(call inherit-product, build/target/product/verity.mk)
endif # WITH_VERITY

include $(PLATFORM_PATH)/platform/*.mk
include $(PLATFORM_PATH)/vendor_prop.mk
endif # WITH_TWRP
