# inherit from the proprietary version
-include vendor/lenovo/a1/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := omap3
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_PROVIDES_INIT_TARGET_RC := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_BOOTLOADER_BOARD_NAME := a1

BOARD_KERNEL_CMDLINE := no_console_suspend=1 msmsdcc_sdioirq=1 wire.search_count=5
BOARD_KERNEL_BASE := 0x80008000
BOARD_PAGE_SIZE := 0x00000800

BOARD_RECOVERYIMAGE_PARTITION_SIZE := 4718592 # 0x00480000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 147193856 # 0x08c60000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 34308096 # 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072 # check this

TARGET_PREBUILT_KERNEL := device/lenovo/a1/kernel

BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_RECOVERY_IGNORE_BOOTABLES := true
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/lenovo/a1/recovery/recovery_ui.c
TARGET_RECOVERY_PRE_COMMAND := "echo 2 > /proc/upgrade_mem/update_flag"

BOARD_USES_GENERIC_AUDIO := false

# Modem
TARGET_NO_RADIOIMAGE := true

# HW Graphics
OMAP3_GL := true

# Camera
#BOARD_USES_TI_CAMERA_HAL := true
USE_CAMERA_STUB := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true
BOARD_USES_TI_OMAP_MODEM_AUDIO := true
BOARD_HAS_NO_MISC_PARTITION := true
HARDWARE_OMX := true

ifdef HARDWARE_OMX
OMX_JPEG := true
OMX_VENDOR := ti
OMX_VENDOR_INCLUDES := \
  hardware/ti/omx/system/src/openmax_il/omx_core/inc \
  hardware/ti/omx/image/src/openmax_il/jpeg_enc/inc
OMX_VENDOR_WRAPPER := TI_OMX_Wrapper
BOARD_OPENCORE_LIBRARIES := libOMX_Core
BOARD_OPENCORE_FLAGS := -DHARDWARE_OMX=1
BOARD_CAMERA_LIBRARIES := libcamera
endif

ifdef OMAP_ENHANCEMENT
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT
endif

BOARD_HAS_NO_SELECT_BUTTON := true

BOARD_USES_UBOOT := true
