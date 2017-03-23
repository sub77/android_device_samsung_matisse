DEVICE_TREE := device/samsung/matisse

BOARD_VENDOR := samsung

USE_CAMERA_STUB := true

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := MSM8226

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Platform
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

# Architecture
TARGET_CPU_VARIANT := krait
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

#TARGET_PREBUILT_KERNEL := $(DEVICE_TREE)/prebuilt/twrpme.zImage
#TARGET_PREBUILT_DTB := $(DEVICE_TREE)/prebuilt/twrpme.dt.img

BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_TREE)/bootimg.mk
BOARD_KERNEL_CMDLINE := androidboot.console=null androidboot.hardware=qcom androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000
LZMA_RAMDISK_TARGETS := recovery

ifndef TARGET_PREBUILT_KERNEL
#BOARD_KERNEL_IMAGE_NAME := zImage-dtb
BOARD_KERNEL_SEPARATED_DT := true
BOARD_DTBTOOL_ARGS := --force-v2
KERNEL_TOOLCHAIN_PREFIX := arm-eabi-
KERNEL_TOOLCHAIN := "../../../../../../kernel/samsung/msm8226/arm-eabi-5.3-uber/bin"
TARGET_KERNEL_SOURCE := kernel/samsung/msm8226
TARGET_KERNEL_CONFIG := ../../../../../../$(DEVICE_TREE)/prebuilt/matisse_defconfig
endif

BOARD_BOOTIMAGE_PARTITION_SIZE     := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 2411724800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12759776768
BOARD_CACHEIMAGE_PARTITION_SIZE    := 314572800
BOARD_FLASH_BLOCK_SIZE := 131072

# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# RECOVERY
BOARD_HAS_NO_REAL_SDCARD := true
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_TREE)
#TARGET_USES_LOGD := true
#TWRP_INCLUDE_LOGCAT := true

# TWRP specific build flags
TW_THEME := landscape_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 162
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_NO_EXFAT_FUSE := true
TW_INCLUDE_NTFS_3G := true
TW_MTP_DEVICE := "/dev/mtp_usb"
TW_EXCLUDE_SUPERSU := true
#TW_USE_TOOLBOX := true

# Init properties from bootloader version, ex. model info
TARGET_INCREASES_COLDBOOT_TIMEOUT := true
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_RECOVERY_DEVICE_MODULES := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := $(DEVICE_TREE)/init/init_matisse.cpp

# Version control
include vendor/extra/vcontrol/TW_DEVICE_VERSION.mk
ifeq ($(TW_DEVICE_VERSION),)
TW_DEVICE_VERSION := 1
endif
