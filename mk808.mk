# include common makefile
$(call inherit-product, device/rockchip/rk3066-common/common.mk)

LOCAL_PATH := device/rockchip/mk808

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_AAPT_configs := xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xlarge

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.rk30board:root/fstab.rk30board \
    $(LOCAL_PATH)/init.rk30board.rc:root/init.rk30board.rc \
    $(LOCAL_PATH)/E_T_INC__E_T_IR_SCREEN.idc:system/usr/idc/E_T_INC__E_T_IR_SCREEN.idc

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.otg=slave \
    persist.sys.usb.config=mtp

PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=wifi-only \
    ro.sf.lcd_density=170 \
    ro.config.facelock=enable_facelock \
    persist.facelock.detect_cutoff=5000 \
    persist.facelock.recog_cutoff=5000

ADDITIONAL_DEFAULT_PROPERTIES += \
    wifi.interface=wlan0 \
    persist.sys.strictmode.visual=false \
    ro.default.size=100 \
    persist.ro.hardware=rk30board \
    ro.product.manufacturer=Rockchip \
    ro.product.model=mk808

# Debug
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.debuggable=1

$(call inherit-product-if-exists, vendor/rockchip/mk808/mk808-vendor.mk)
