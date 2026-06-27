KERNEL_LOADADDR := 0x80100000

define Device/Default
  PROFILES := Default
  BLOCKSIZE := 64k
  FILESYSTEMS := squashfs
  DEVICE_DTS_DIR := ../dts
  KERNEL := kernel-bin | append-dtb | lzma | uImage lzma
  KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma | uImage lzma
  IMAGES := sysupgrade.bin initramfs.bin
  IMAGE/sysupgrade.bin = append-kernel | pad-to $$$$(BLOCKSIZE) | \
	append-rootfs | pad-rootfs | append-metadata
  IMAGE/initramfs.bin = append-kernel
endef

define Device/siflower_sf19a2890-evb
  DEVICE_VENDOR := Siflower
  DEVICE_MODEL := SF19A2890 EVB
  BOARD_NAME := siflower,sf19a2890-evb
  DEVICE_DTS := sf19a2890_evb
  DEVICE_PACKAGES := kmod-switch-rtl8367b swconfig
endef
TARGET_DEVICES += siflower_sf19a2890-evb

define Device/tenda_ac10v5
  $(Device/Default)
  DEVICE_VENDOR := Tenda
  DEVICE_MODEL := AC10 V5
  BOARD_NAME := tenda,ac10v5
  DEVICE_DTS := sf19a2890_tenda_ac10
  DEVICE_PACKAGES := kmod-dsa-mt7530
endef
TARGET_DEVICES += tenda_ac10v5
