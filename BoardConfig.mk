# config.mk
#
# Product-specific compile-time definitions.
#

ifeq ($(TARGET_ARCH),)
TARGET_ARCH := arm
endif

TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_APPEND_DTB := true
BOARD_USES_GENERIC_AUDIO := true
USE_CAMERA_STUB := true

-include vendor/qcom/proprietary/common/msm8960/BoardConfigVendor.mk

TARGET_USE_HDMI_AS_PRIMARY := false

ifeq ($(TARGET_USE_HDMI_AS_PRIMARY),true)
    TARGET_HAVE_HDMI_OUT := false
else
    TARGET_HAVE_HDMI_OUT := true
endif # TARGET_USE_HDMI_AS_PRIMARY
#TODO: Fix-me: Setting TARGET_HAVE_HDMI_OUT to false
# to get rid of compilation error.
TARGET_HAVE_HDMI_OUT := false
BOARD_USES_LEGACY_ALSA_AUDIO := false
TARGET_USES_OVERLAY := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_NO_BOOTLOADER := false
TARGET_NO_KERNEL := false
BOOTLOADER_GCC_VERSION := arm-eabi-4.8
BOOTLOADER_PLATFORM := msm8960 # use msm8960 LK configuration
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RPC := true
TARGET_CPU_VARIANT=krait
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_INIT_VENDOR_LIB := libinit_msm

TARGET_HARDWARE_3D := false
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOOTLOADER_BOARD_NAME := MSM8960

# Change 'TARGET_USES_3GB_DDR' to 'true' to enable 3GB for ADP
# requires kernel flag 'CONFIG_APQ8064_ADP2_ES2_3GB' set to 'y'
TARGET_USES_3GB_DDR := true
ifeq ($(TARGET_USES_3GB_DDR),true)
    BOARD_KERNEL_BASE    := 0x40200000
else
    BOARD_KERNEL_BASE    := 0x80200000
endif
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4

#BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3

# Change 'BOARD_ENABLE_SERIAL_CONSOLE' to 'true' to enable serial console
BOARD_ENABLE_SERIAL_CONSOLE := false
ifeq ($(BOARD_ENABLE_SERIAL_CONSOLE), true)
    BOARD_KERNEL_CMDLINE += console=ttyHSL0,115200,n8
endif

BOARD_EGL_CFG := device/qcom/$(TARGET_PRODUCT)/egl.cfg

BOARD_BOOTIMAGE_PARTITION_SIZE := 23068672 # 22M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 23068672 # 22M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10737401856

BOARD_CACHEIMAGE_PARTITION_SIZE := 33554432
BOARD_PERSISTIMAGE_PARTITION_SIZE := 5242880
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE := 268435456
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Use signed boot and recovery image
#TARGET_BOOTIMG_SIGNED := true

TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

HAVE_CYTTSP_FW_UPGRADE := true
HAVE_MXT_FW_UPGRADE := true
HAVE_MXT_CFG := true

# Add NON-HLOS files for ota upgrade
ADD_RADIO_FILES ?= false

# Added to indicate that protobuf-c is supported in this build
PROTOBUF_SUPPORTED := false

# Add building support AR8151 ALX ethernet driver
BOARD_HAS_ATH_ETH_ALX := true

#TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
#TARGET_RECOVERY_UI_LIB := librecovery_ui_qcom

TARGET_USES_ION := true

#PRODUCT_BOOT_JARS := $(subst $(space),:,$(PRODUCT_BOOT_JARS))

#Use dlmalloc instead of jemalloc for mallocs
MALLOC_IMPL := dlmalloc

USE_OPENGL_RENDERER := true

#add selinux specific folders
BOARD_SEPOLICY_DIRS := \
    device/qcom/msm8960/sepolicy
