# Copyright (C) 2011 The Android Open Source Project
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

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay


PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Media configuration xml file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media_profiles.xml:/system/etc/media_profiles.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.bahamas.rc:root/init.bahamas.rc \
    $(LOCAL_PATH)/init.bahamas.usb.rc:root/init.bahamas.usb.rc \
    $(LOCAL_PATH)/ueventd.bahamas.rc:root/ueventd.bahamas.rc \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/prebuilt/FileManager.apk:system/app/FileManager.apk \
    $(LOCAL_PATH)/custom/hosts:system/etc/hosts \
    $(LOCAL_PATH)/custom/app/HTCCalibrate.apk:system/app/HTCCalibrate.apk 

# Input device calibration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/tssc-manager.idc:system/usr/idc/tssc-manager.idc \
    $(LOCAL_PATH)/custom/backuptool.sh:system/bin/backuptool.sh \
    $(LOCAL_PATH)/custom/calibrate_screen:system/bin/calibrate_screen

# Keychars and keylayout files
PRODUCT_COPY_FILES += \
    device/htc/click/keylayout/bahamas-keypad.kl:system/usr/keylayout/bahamas-keypad.kl \
    device/htc/click/keychars/bahamas-keypad.kcm.bin:system/usr/keychars/bahamas-keypad.kcm.bin \
    device/htc/click/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/click/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/click/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/click/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

# Firmware files
PRODUCT_COPY_FILES += \
    device/htc/click/firmware/Fw1251r1c.bin:system/etc/firmware/Fw1251r1c.bin \
    device/htc/click/firmware/brf6300.bin:system/etc/firmware/brf6300.bin \
    device/htc/click/firmware/brf6350.bin:system/etc/firmware/brf6350.bin

PRODUCT_PACKAGES += \
    librs_jni \
    sensors.bahamas \
    lights.bahamas \
    copybit.bahamas \
    gralloc.bahamas \
    gps.bahamas \
    audio.primary.bahamas \
    audio_policy.bahamas \
    audio.a2dp.default \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore \
    libOmxVidEnc \
    wlan_loader \
    tiwlan.ini \
    dhcpcd.conf \
    com.android.future.usb.accessory

# Live wallpaper packages
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    librs_jni

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Gallery 2D
PRODUCT_PACKAGES += Gallery


# Kernel Targets
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

#$(call inherit-product, device/htc/common/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Wifi module
PRODUCT_COPY_FILES += \
    device/htc/click/prebuilt/wlan.ko:system/lib/modules/wlan.ko

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

$(call inherit-product-if-exists, $(LOCAL_PATH)/click-vendor-blobs.mk)

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf

# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1

PRODUCT_LOCALES += mdpi
#PRODUCT_NAME := htc_tattoo
PRODUCT_NAME := cm_click
PRODUCT_DEVICE := tattoo
