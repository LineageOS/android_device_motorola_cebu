#
# SPDX-FileCopyrightText: 2022-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6225-common
include device/motorola/sm6225-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/cebu

# A/B
AB_OTA_PARTITIONS += \
    recovery

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := cebu

# Display
TARGET_SCREEN_DENSITY := 280

# HIDL
ODM_MANIFEST_SKUS += b d dn fdn n
ODM_MANIFEST_B_FILES := $(DEVICE_PATH)/sku/manifest_b.xml
ODM_MANIFEST_D_FILES := $(DEVICE_PATH)/sku/manifest_d.xml
ODM_MANIFEST_DN_FILES := $(DEVICE_PATH)/sku/manifest_dn.xml
ODM_MANIFEST_FDN_FILES := $(DEVICE_PATH)/sku/manifest_fdn.xml
ODM_MANIFEST_N_FILES := $(DEVICE_PATH)/sku/manifest_n.xml

# Kernel
BOARD_BOOT_HEADER_VERSION := 2
TARGET_KERNEL_CONFIG += vendor/ext_config/cebu-default.config

# Kernel Modules - Recovery
BOARD_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery))
RECOVERY_KERNEL_MODULES := $(BOARD_RECOVERY_KERNEL_MODULES_LOAD)

# Partitions
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_USERDATAIMAGE_PARTITION_SIZE := 50616843776

BOARD_SUPER_PARTITION_SIZE := 9763291136
BOARD_MOTO_DYNAMIC_PARTITIONS_SIZE := 4877451264 # (BOARD_SUPER_PARTITION_SIZE / 2) - 4MB

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_DENSITY := hdpi
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 70

# Security patch level
BOOT_SECURITY_PATCH := 2022-11-01
VENDOR_SECURITY_PATCH := 2022-11-01

# Verified Boot
BOARD_AVB_ROLLBACK_INDEX := 13

# Inherit from the proprietary version
include vendor/motorola/cebu/BoardConfigVendor.mk
