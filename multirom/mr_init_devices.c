#include <stdlib.h>

// These are paths to folders in /sys which contain "uevent" file
// need to init this device.
// MultiROM needs to init framebuffer, mmc blocks, input devices,
// some ADB-related stuff and USB drives, if OTG is supported
// You can use * at the end to init this folder and all its subfolders
const char *mr_init_devices[] =
{
    "/sys/devices/virtual/mem/null",
    "/sys/devices/virtual/misc/fuse",

    // Framebuffer
    "/sys/class/graphics/fb0", 

    // Storage Devices
    "/sys/block/mmcblk0",

    "/sys/devices/msm_sdcc.1",
    "/sys/devices/msm_sdcc.1/mmc_host/mmc0/mmc0:0001",
    "/sys/devices/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0",
    "/sys/devices/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p1", //apnhlos
    "/sys/devices/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p2", //modem
    "/sys/devices/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p14", //boot
    "/sys/devices/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p15", //recovery
    "/sys/devices/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p21", //persist
    "/sys/devices/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p23", //system
    "/sys/devices/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p24", //cache
    "/sys/devices/msm_sdcc.1/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p26", //userdata

    "/sys/block/mmcblk1",

    "/sys/devices/msm_sdcc.2/mmc_host/mmc1",
    "/sys/devices/msm_sdcc.2/mmc_host/mmc1/mmc1:59b4",
    "/sys/devices/msm_sdcc.2/mmc_host/mmc1/mmc1:59b4/block/mmcblk1",
    "/sys/devices/msm_sdcc.2/mmc_host/mmc1/mmc1:59b4/block/mmcblk1/mmcblk1p1",
    "/sys/devices/msm_sdcc.2/mmc_host/mmc1/mmc1:59b4/block/mmcblk1/mmcblk1p2",
    "/sys/devices/msm_sdcc.2/mmc_host/mmc1/mmc1:59b4/block/mmcblk1/mmcblk1p3",
    "/sys/devices/msm_sdcc.2/mmc_host/mmc1/mmc1:59b4/block/mmcblk1/mmcblk1p4",

    "/sys/bus/mmc",
    "/sys/bus/mmc/drivers/mmcblk",
    "/sys/module/mmc_core",
    "/sys/module/mmcblk",

    // Input
    "/sys/class/input/input0",
    "/sys/class/input/input0/event0",
    "/sys/class/input/input1",
    "/sys/class/input/input1/event1",
    "/sys/class/input/input2",
    "/sys/class/input/input2/event2",
    "/sys/class/input/input3",
    "/sys/class/input/input3/event3",
    "/sys/class/input/input4",
    "/sys/class/input/input4/event4",
    "/sys/class/input/input5",
    "/sys/class/input/input5/event5",
    "/sys/class/input/input6",
    "/sys/class/input/input6/event6",
    "/sys/class/input/input7",
    "/sys/class/input/input7/event7",
    "/sys/class/input/input8",
    "/sys/class/input/input8/event8",
    "/sys/class/input/input9",
    "/sys/class/input/input9/event9",

    // For adb
    "/sys/devices/virtual/tty/ptmx",
    "/sys/devices/virtual/misc/android_adb",
    "/sys/devices/virtual/android_usb/android0/f_adb",
    "/sys/bus/usb",

    // USB Drive is in here
    "/sys/devices/platform/msm_hsusb_host*",

    // exfat requires fuse device
    "/sys/devices/virtual/misc/fuse",

    // for qualcomm overlay - /dev/ion
    "/sys/devices/virtual/misc/ion",

    NULL
};
