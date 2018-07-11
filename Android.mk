LOCAL_PATH := $(call my-dir)

ifneq ($(filter maple, $(TARGET_DEVICE)),)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
