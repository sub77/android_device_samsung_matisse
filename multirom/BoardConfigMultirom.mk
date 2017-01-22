# MultiROM
include $(DEVICE_TREE)/multirom/versioning/MR_REC_VERSION.mk
ifeq ($(MR_REC_VERSION),)
MR_REC_VERSION := $(shell date -u +%Y%m%d)-01
endif

#TW_MAIN_VERSION=`sed -n '/#define TW_VERSION_STR              "3.0.3-0"/p' bootable/recovery/variables.h |cut -d '"' -f2|cut -d '-' -f1` &> /dev/null
#TW_AUTO_VERSION=`cat $(DEVICE_TREE)/multirom/versioning/MR_REC_BUILD_NUMBER-falcon.TXT |cut -d '-' -f2` &> /dev/null
#TW_DEVICE_SPECIFIC_VERSION=`sed -n '/#define TW_VERSION_STR              "3.0.3-0"/p' bootable/recovery/variables.h |cut -d '"' -f2|cut -d '-' -f1`-`cat $(DEVICE_TREE)/multirom/versioning/MR_REC_BUILD_NUMBER-falcon.TXT |cut -d '-' -f2` &> /dev/null
#$(TW_MAIN_VERSION)-$TW_AUTO_VERSION

BOARD_MKBOOTIMG_ARGS += --board mrom$(MR_REC_VERSION)
MR_KEXEC_MEM_MIN := 0x06200000

MR_INFOS := $(DEVICE_TREE)/multirom/infos
MR_DEVICE_HOOKS := $(DEVICE_TREE)/multirom/mr_hooks.c
MR_DEVICE_HOOKS_VER := 4
MR_FSTAB := $(DEVICE_TREE)/multirom/mrom.fstab
MR_INIT_DEVICES := $(DEVICE_TREE)/multirom/mr_init_devices.c

RECOVERY_GRAPHICS_USE_LINELENGTH := true
MR_USE_QCOM_OVERLAY := true
MR_PIXEL_FORMAT := "RGBX_8888"
MR_QCOM_OVERLAY_HEADER := $(DEVICE_TREE)/multirom/overlay/mr_qcom_overlay.h
MR_QCOM_OVERLAY_CUSTOM_PIXEL_FORMAT := MDP_RGBX_8888

MR_INPUT_TYPE := type_b
MR_DPI := hdpi
MR_DPI_FONT := 160
MR_KEXEC_DTB := true
MR_CONTINUOUS_FB_UPDATE := false

MR_DEV_BLOCK_BOOTDEVICE := true
MR_NO_KEXEC := enabled

MR_KEXEC_MEM_MIN := 0x05000000

MR_DEVICE_VARIANTS := matissewifi matissewifiue matisse3g matisselte

#DEVICE_RESOLUTION := 800x1280
