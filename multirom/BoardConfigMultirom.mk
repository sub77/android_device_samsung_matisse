# MultiROM
include device/samsung/matisse/multirom/versioning/MR_REC_VERSION.mk
ifeq ($(MR_REC_VERSION),)
MR_REC_VERSION := $(shell date +%Y%m%d)-01
endif

MR_DEVICE_SPECIFIC_VERSION := g

BOARD_MKBOOTIMG_ARGS += --board mrom$(MR_REC_VERSION)
MR_KEXEC_MEM_MIN := 0x06200000

MR_INFOS := device/samsung/matisse/multirom/infos
MR_DEVICE_HOOKS := device/samsung/matisse/multirom/mr_hooks.c
MR_DEVICE_HOOKS_VER := 4
MR_FSTAB := device/samsung/matisse/multirom/mrom.fstab
MR_INIT_DEVICES := device/samsung/matisse/multirom/mr_init_devices.c

RECOVERY_GRAPHICS_USE_LINELENGTH := true
MR_USE_QCOM_OVERLAY := true
MR_PIXEL_FORMAT := "RGBX_8888"
MR_QCOM_OVERLAY_HEADER := device/samsung/matisse/multirom/overlay/mr_qcom_overlay.h
MR_QCOM_OVERLAY_HEAP_ID_MASK := 2
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

DEVICE_RESOLUTION := 800x1280
