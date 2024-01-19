#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 TeamWin Recovery Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#

LOCAL_PATH := device/realme/RMX3081

# Dynamic partition stuff
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Api
PRODUCT_SHIPPING_API_LEVEL := 30

# Qcom common decryption
PRODUCT_PACKAGES += \
    qcom_decrypt\
    qcom_decrypt_fbe

# fastboot/d hal
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
	android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd
	
# Recovery Modules
TARGET_RECOVERY_DEVICE_MODULES += \
    libspl
    #android.hidl.allocator@1.0 \
    android.hidl.memory@1.0 \
    android.hidl.memory.token@1.0 \
    libdmabufheap \
    libhidlmemory \
    libion \
    libnetutils \
    libc.so \
    libxml2

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libspl.so
    #$(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.allocator@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory.token@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdmabufheap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhidlmemory.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libnetutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libc.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so