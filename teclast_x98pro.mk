#
# Copyright (C) 2014 The Android-x86 Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# includes the base of Android-x86 platform
$(call inherit-product,device/generic/common/x86_64.mk)

# Overrides
PRODUCT_NAME := teclast_x98pro
PRODUCT_DEVICE := x98pro
PRODUCT_MANUFACTURER := TECLAST
PRODUCT_BRAND := tPAD
PRODUCT_MODEL := Teclast x98 Pro

# =======================CUSTOM

TARGET_SYSTEM_PROP += device/teclast/x98pro/system.prop
#USE_SQUASHFS := 0
#PRODUCT_COPY_FILES += \
#    device/teclast/x98pro/custom_bootanimation.zip:system/media/bootanimation.zip
    
# Remove some test apps
#LOCAL_OVERRIDES_PACKAGES := \
#    RSSReader \
#    TSCalibration2

# Include opengapps (comment if not wanted)
#include device/teclast/x98pro/gapps.mk

# =======================CUSTOMEND
