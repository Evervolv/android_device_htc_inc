# Copyright (C) 2009 The Android Open Source Project
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
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := false

# inherit from the proprietary version
-include vendor/htc/inc/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true

TARGET_BOARD_PLATFORM := qsd8k
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := inc
TARGET_SPECIFIC_HEADER_PATH := device/htc/inc/include

# Legacy support flags
BOARD_USE_LEGACY_TRACKPAD := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER      := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WLAN_DEVICE                := bcm4329
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/vendor/firmware/fw_bcm4329.bin nvram_path=/proc/calibration"
WIFI_DRIVER_MODULE_NAME          := "bcm4329"

BOARD_USES_GENERIC_AUDIO := false

BOARD_KERNEL_CMDLINE := no_console_suspend=1
BOARD_KERNEL_BASE := 0x20000000
BOARD_KERNEL_NEW_PPPOX := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

#BOARD_HAVE_FM_RADIO := true
#BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

BOARD_VENDOR_QCOM_AMSS_VERSION := 3200

BOARD_VENDOR_USE_AKMD := akm8973

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := inc
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240

# Hardware rendering
BOARD_EGL_CFG := device/htc/inc/prebuilt/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_GENLOCK := true
# Unnecessary with new egl libs
#COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE
# Our copybit supports YV12 conversion, so not needed
#COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_PIXEL_FORMAT_YV12
# We only have 2 buffers so still need to hack it
COMMON_GLOBAL_CFLAGS += -DMISSING_GRALLOC_BUFFERS
# Unneeded but use as safety measure to ensure that everything is included
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
# Force refresh rate since fps calc reports 0
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60
# qsd8k: no support for overlay, bypass, or c2d
TARGET_USE_OVERLAY := false
TARGET_HAVE_BYPASS := false
TARGET_USES_C2D_COMPOSITION := false

# Try to use ASHMEM if possible (when non-MDP composition is used)
# If enabled, set debug.sf.hw=1 in system.prop
# Disabling for now since pmem and mdp seem to work fine
#TARGET_GRALLOC_USES_ASHMEM := true

# Flags present in CAF but not Evervolv yet(unsure of purpose)
#HAVE_ADRENO200_SOURCE := true
#HAVE_ADRENO200_SC_SOURCE := true
#HAVE_ADRENO200_FIRMWARE := true
#BOARD_USES_QCNE := true
# Unsure if these flags do anything but others use them
#BOARD_USE_QCOM_PMEM := true
#BOARD_USES_ADRENO_200 := true
#TARGET_HARDWARE_3D := false
# Debugging egl
COMMON_GLOBAL_CFLAGS += -DEGL_TRACE

TARGET_FORCE_CPU_UPLOAD := true
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true

TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file

#BOARD_USE_FROYO_LIBCAMERA := true

# cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 000a0000 00020000 "misc"
# mtd1: 00480000 00020000 "recovery"
# mtd2: 00300000 00020000 "boot"
# mtd3: 0f800000 00020000 "system"
# mtd4: 000a0000 00020000 "local"
# mtd5: 02800000 00020000 "cache"
# mtd6: 09500000 00020000 "datadata"
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00300000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00480000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0f800000   # limited so we enforce room to grow
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x09500000
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common
TARGET_PREBUILT_KERNEL := device/htc/inc/prebuilt/root/kernel

BOARD_HAS_DATADATA := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
BOARD_DATA_DEVICE := /dev/block/mmcblk0p1
BOARD_DATA_FILESYSTEM := auto
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p2
BOARD_CACHE_FILESYSTEM := auto

# Make sure vold formats the proper sdcard partition
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
