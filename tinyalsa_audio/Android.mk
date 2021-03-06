# Copyright (C) 2012 Paul Kocialkowski <contact@paulk.fr>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	audio_hw.c \
	audio_out.c \
	audio_in.c \
	audio_ril_interface.c \
	mixer.c

LOCAL_C_INCLUDES += \
	external/tinyalsa/include \
	external/expat/lib \
	system/media/audio_utils/include \
	system/media/audio_effects/include \
	hardware/tinyalsa-audio/include

LOCAL_SHARED_LIBRARIES := \
	libc \
	libcutils \
	libutils \
	libexpat \
	libtinyalsa \
	libaudioutils \
	libdl

LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_TAGS := optional

LOCAL_MODULE := audio.primary.$(TARGET_BOOTLOADER_BOARD_NAME)-alsa
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

ifeq ($(BOARD_USES_STE_FMRADIO),true)
LOCAL_C_FLAGS += -DSAMSUNG_FM_ENABLED -DLOG_NDEBUG=0
endif

include $(BUILD_SHARED_LIBRARY)

