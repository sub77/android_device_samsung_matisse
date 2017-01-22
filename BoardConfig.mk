DEVICE_TREE := device/samsung/matisse

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := MSM8226

# Platform
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

# Flags
BOARD_GLOBAL_CFLAGS += -DREFRESH_RATE=60
BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Kernel Prebuilt
#TARGET_PREBUILT_KERNEL := $(DEVICE_TREE)/zImage
TARGET_PREBUILT_DTB := $(DEVICE_TREE)/dtb
BOARD_CUSTOM_BOOTIMG_MK :=  $(DEVICE_TREE)/bootimg.mk
BOARD_KERNEL_CMDLINE :=  androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x3F ehci-hcd.park=3
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x00000000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000

ifndef TARGET_PREBUILT_KERNEL
BOARD_KERNEL_SEPARATED_DT := true
TARGET_KERNEL_CONFIG := twrp_matissewifi_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-
TARGET_KERNEL_SOURCE := kernel/samsung/msm8226
endif

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE     := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 2097152000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12759760384 # 12759776768 - 16384 (footer)
BOARD_CACHEIMAGE_PARTITION_SIZE    := 0x00C800000
BOARD_HIDDENIMAGE_PARTITION_SIZE   := 0x00FA00000
BOARD_FLASH_BLOCK_SIZE := 262144

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# TWRP specific build flags
TW_THEME := portrait_hdpi
TW_HAS_LANDSCAPE := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/battery
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 162
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_NTFS_3G := true

# exFAT drivers included in the kernel
TW_NO_EXFAT_FUSE := true

# No love for the wicked (very small partition)
TW_EXCLUDE_SUPERSU := true

# Encryption support
#TW_INCLUDE_CRYPTO := true

# Debug flags
#TWRP_INCLUDE_LOGCAT := true

# Init properties from bootloader version, ex. model info
TARGET_INCREASES_COLDBOOT_TIMEOUT := true
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := $(DEVICE_TREE)/init/init_matisse.cpp

# MultiROM
TARGET_RECOVERY_IS_MULTIROM := true
MR_DEVICE_SPECIFIC_VERSION := g
TW_MAIN_VERSION=`sed -n '/#define TW_VERSION_STR              "3.0.3-0"/p' bootable/recovery/variables.h |cut -d '"' -f2|cut -d '-' -f1`

ifeq ($(TARGET_RECOVERY_IS_MULTIROM),true)
-include $(DEVICE_TREE)/multirom/BoardConfigMultirom.mk
endif
