#
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).

LOCAL_PATH := device/samsung/i927

PRODUCT_PACKAGES += \
    libnetcmdiface \
    com.android.future.usb.accessory \
    SamsungServiceMode \
    Torch \
    FM

# Filesystem management tools
PRODUCT_PACKAGES += \
    static_busybox \
    make_ext4fs \
    setup_fs

# HAL
PRODUCT_PACKAGES += \
    sensors.n1 \
    lights.n1 \
    gps.tegra \
    camera.tegra \
    power.tegra \
    gralloc.tegra \
    hwcomposer.tegra \
    audio.primary.n1 \
    audio.primary.n1-alsa \
    audio_policy.n1 \
    audio.a2dp.default

# Set true if you want .odex files
DISABLE_DEXPREOPT := false

# INIT-scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.n1:root/fstab.n1 \
    $(LOCAL_PATH)/init.n1.rc:root/init.n1.rc \
    $(LOCAL_PATH)/init.n1.usb.rc:root/init.n1.usb.rc \
    $(LOCAL_PATH)/ueventd.n1.rc:root/ueventd.n1.rc \

# SELinux
PRODUCT_PACKAGES += \
    libselinux libsepol

# Wifi, BT
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf


PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=180

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/sirfgps.conf:system/etc/sirfgps.conf

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio_policy.conf.alsa:system/etc/audio_policy.conf.alsa \
    $(LOCAL_PATH)/tinyalsa_audio/alsas:system/xbin/alsas \
    $(LOCAL_PATH)/configs/tinyalsa-audio.xml:system/etc/tinyalsa-audio.xml


# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nvcamera.conf:system/etc/nvcamera.conf


# Shell and busybox
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/bashrc:system/etc/bash/bashrc \
    $(LOCAL_PATH)/configs/busybox.fstab:system/etc/fstab

# Vold and Storage need total commander
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/keylayout/Bluetooth_00_06_66_42.kl:system/usr/keylayout/Bluetooth_00_06_66_42.kl \
    $(LOCAL_PATH)/usr/keylayout/STMPE_keypad.kl:system/usr/keylayout/STMPE_keypad.kl \
    $(LOCAL_PATH)/usr/idc/STMPE_keypad.idc:system/usr/idc/STMPE_keypad.idc \
    $(LOCAL_PATH)/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    $(LOCAL_PATH)/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    $(LOCAL_PATH)/usr/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    $(LOCAL_PATH)/usr/keylayout/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl \
    $(LOCAL_PATH)/usr/keylayout/Vendor_04e8_Product_7021.kl:system/usr/keylayout/Vendor_04e8_Product_7021.kl \
    $(LOCAL_PATH)/usr/keylayout/Vendor_044f_Product_d007.kl:system/usr/keylayout/Vendor_044f_Product_d007.kl \
    $(LOCAL_PATH)/usr/keylayout/Vendor_046d_Product_c21d.kl:system/usr/keylayout/Vendor_046d_Product_c21d.kl \
    $(LOCAL_PATH)/usr/keylayout/Vendor_057e_Product_0306.kl:system/usr/keylayout/Vendor_057e_Product_0306.kl

# Keychars
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/keychars/sec_jack.kcm:system/usr/keychars/sec_jack.kcm \
    $(LOCAL_PATH)/usr/keychars/sec_key.kcm:system/usr/keychars/sec_key.kcm \
    $(LOCAL_PATH)/usr/keychars/STMPE_keypad.kcm:system/usr/keychars/STMPE_keypad.kcm \
    $(LOCAL_PATH)/usr/keychars/sec_touchkey.kcm:system/usr/keychars/sec_touchkey.kcm

# IDC files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Feature live wallpaper
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Overlay to set device specific parameters
DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SamsungExynos4RIL \
    mobiledata.interfaces=rmnet0,rmnet1,rmnet2
         
# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zygote.disable_gl_preload=1 \
    ro.opengles.version=131072

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.board.platform=tegra \
    ro.telephony.sends_barcount=1 \
    ro.com.android.dataroaming=false \
    ro.sys.fw.bg_apps_limit=27 \
    ro.config.max_starting_bg=5 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heaptargetutilization=0.50 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m \
    dalvik.vm.heapgrowthlimit=100m \
    dalvik.vm.heapsize=174m \
    dalvik.vm.jit.codecachesize=1 \
    persist.service.usb.setting=0 \
    dev.sfbootcomplete=0 

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    ro.com.android.dateformat=yyyy-MM-dd \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    debug.hwui.render_dirty_regions=false \
    ro.compcache.default=0 \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=true \
    media.stagefright.enable-scan=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-rtsp=true \
    ro.tether.denied=false \
    ro.flash.resolution=1080

#selinux set to permissive
PRODUCT_PROPERTY_OVERRIDES += ro.boot.selinux=permissive 


# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_LOCALES += hdpi

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi


# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available

$(call inherit-product-if-exists, vendor/samsung/i927/i927-vendor-blobs.mk)
