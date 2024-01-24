#!/system/bin/sh

# TODO: This postrecoveryboot shell script is needed for devices that have recovery-from-boot.p file in /vendor instead of /system, to prevent the stock ROM from replacing TWRP.
# By default, TWRP has an automatic feature for this, only if recovery-from-boot.p is in /system.

TMP_VENDOR="/tmp/vendor"
TMP_SYSTEM="/tmp/system"

mkdir -p "$TMP_VENDOR"
mkdir -p "$TMP_SYSTEM"
mount -w "/dev/block/mapper/vendor" "$TMP_VENDOR"
mount -w "/dev/block/mapper/system" "$TMP_SYSTEM"

  # partitions
  local Parts="system system_ext vendor"
  
  # loop through
  for i in ${Parts}
  do
     echo "I:Setting $i to read/write" >> /tmp/recovery.log
     blockdev --setrw /dev/block/mapper/$i
  done

# Android 12+
if [ -f "$TMP_VENDOR/recovery-from-boot.p" ]; then
  echo "I:postrecoveryboot: Removing stock recovery file in /vendor to prevent the stock ROM from replacing TWRP." >> /tmp/recovery.log
  rm "$TMP_VENDOR/bin/install-recovery.sh"
  rm "$TMP_VENDOR/etc/init/vendor_flash_recovery.rc"
  rm "$TMP_VENDOR/recovery-from-boot.p"
else
  echo "I:postrecoveryboot: Nothing to remove, /vendor/recovery-from-boot.p doesn't exist." >> /tmp/recovery.log
fi

umount "$TMP_VENDOR"
umount "$TMP_SYSTEM"
rm -r "$TMP_VENDOR"
rm -r "$TMP_SYSTEM"

exit 0
