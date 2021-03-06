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

#
# This file sets variables that control the way modules are built
# throughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/htc/click/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH := device/htc/click/include

# ARMv6-compatible processor rev 5 (v6l)
TARGET_BOARD_PLATFORM := msm7k
TARGET_ARCH_VARIANT := armv6j
TARGET_CPU_ABI := armeabi-v6j
TARGET_CPU_ABI2 := armeabi

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOOTLOADER_BOARD_NAME := bahamas
TARGET_OTA_ASSERT_DEVICE := click,tattoo
TARGET_BOARD_INFO_FILE := device/htc/click/board-info.txt

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER      := CUSTOM
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := libWifiApi
BOARD_WLAN_DEVICE                := wl1251
BOARD_WLAN_TI_STA_DK_ROOT        := system/wlan/ti/sta_dk_4_0_4_32
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_ARG           := ""
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_FIRMWARE_LOADER             := "wlan_loader"

TARGET_PROVIDES_INIT_RC := false

BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null
BOARD_KERNEL_BASE := 0x02E00000
BOARD_KERNEL_PAGESIZE := 2048

BOARD_EGL_CFG := device/htc/click/egl.cfg

TARGET_PROVIDES_LIBAUDIO := true

# Fake building with froyo cam
BOARD_USE_FROYO_LIBCAMERA := true
BOARD_USE_SKIA_LCDTEXT := true
BOARD_USE_NEW_LIBRIL_HTC := true
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

BOARD_HAVE_BLUETOOTH := true

BOARD_VENDOR_USE_AKMD := akm8973

BOARD_VENDOR_QCOM_AMSS_VERSION := 1355

BOARD_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
TARGET_FORCE_CPU_UPLOAD := true

BOARD_GPS_LIBRARIES := libgps librpc
BOARD_USES_GPSSHIM := true

BOARD_USES_QCOM_LIBS := true
BOARD_HAS_LIMITED_EGL := true
TARGET_HARDWARE_3D := false
TARGET_ELECTRONBEAM_FRAMES := 10

TARGET_WEBKIT_USE_MORE_MEMORY := true
JS_ENGINE := v8

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common

# # cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 000a0000 00020000 "misc"
# mtd1: 00500000 00020000 "recovery"
# mtd2: 00280000 00020000 "boot"
# mtd3: 09600000 00020000 "system"
# mtd4: 09600000 00020000 "cache"
# mtd5: 0a520000 00020000 "userdata"
# Changed for Tattoo
BOARD_BOOTIMAGE_PARTITION_SIZE := 2621440
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 5242880
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 157286400
#system partition size is used form buzz to avoid error about small system size
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 262144000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 173146112
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_LDPI_RECOVERY := true
BOARD_HAS_JANKY_BACKBUFFER := true

TARGET_PREBUILT_KERNEL := device/htc/click/prebuilt/kernel
BOARD_UMS_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file
