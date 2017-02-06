# MultiROM
TARGET_RECOVERY_IS_MULTIROM := true
ifeq ($(TARGET_RECOVERY_IS_MULTIROM),true)
include device/samsung/matisse/multirom/BoardConfigMultirom.mk
include vendor/extra/vcontrol/MR_REC_VERSION.mk
ifeq ($(MR_REC_VERSION),)
MR_REC_VERSION := $(shell date +%Y%m%d)-01
else ifeq ($(TARGET_RECOVERY_IS_MULTIROM),)
include vendor/extra/vc/TW_DEVICE_VERSION.mk
ifeq ($(TW_DEVICE_VERSION),)
TW_DEVICE_VERSION := 1
endif

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := MSM8226

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Kernel Prebuilt
TARGET_PREBUILT_KERNEL := device/samsung/matisse/zImage
TARGET_PREBUILT_DTB := device/samsung/matisse/dtb
BOARD_CUSTOM_BOOTIMG_MK :=  device/samsung/matisse/mkbootimg.mk
BOARD_KERNEL_CMDLINE :=  androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x3F ehci-hcd.park=3
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000
ifndef TARGET_PREBUILT_KERNEL
BOARD_KERNEL_SEPARATED_DT := true
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-
TARGET_KERNEL_SOURCE := kernel/samsung/msm8226
TARGET_KERNEL_CONFIG := msm8226-sec_defconfig
TARGET_KERNEL_VARIANT_CONFIG := msm8226-sec_matissetwrp_defconfig
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig
endif

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_CACHEIMAGE_PARTITION_SIZE := 314572800
BOARD_HIDDENIMAGE_PARTITION_SIZE := 104857600
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2411724800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12759760384 # 12759776768 - 16384 (footer)
BOARD_FLASH_BLOCK_SIZE := 131072

# Platform
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

# Recovery
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"

# TWRP specific build flags
TW_THEME := portrait_hdpi
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/battery
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 162
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_NTFS_3G := true
TW_FLASH_FROM_STORAGE := true
TW_NO_EXFAT_FUSE := true
TW_EXCLUDE_SUPERSU := true
TW_INCLUDE_CRYPTO := true

# Vendor Init
TARGET_INCREASES_COLDBOOT_TIMEOUT := true
TARGET_INIT_VENDOR_LIB := libinit_matisse
TARGET_LIBINIT_DEFINES_FILE := device/samsung/matisse/init/init_matisse.cpp
TARGET_RECOVERY_DEVICE_MODULES := libinit_matisse
TARGET_UNIFIED_DEVICE := true

# Selinux
include device/qcom/sepolicy/sepolicy.mk
