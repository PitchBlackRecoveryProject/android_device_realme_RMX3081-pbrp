#!/sbin/sh
#
# TODO: this kludge is needed to prevent removing stock recovery file in /vendor
# to prevent the stock ROM from replacing TWRP.
#

mkdir -p "/tmp/vendor";
mkdir -p "/tmp/system";
mount -w "/dev/block/mapper/vendor" "/tmp/vendor";
mount -w "/dev/block/mapper/system" "/tmp/system";

# Android 12+
if [ -f "/tmp/vendor/recovery-from-boot.p" ]; then
  echo "I:postrecoveryboot: Removing stock recovery file in /vendor to prevent the stock ROM from replacing TWRP." >> /tmp/recovery.log;
  rm "/tmp/vendor/bin/install-recovery.sh";
  rm "/tmp/vendor/etc/init/vendor_flash_recovery.rc";
  rm "/tmp/vendor/recovery-from-boot.p";
elif [ -f "/tmp/system/system/recovery-from-boot.p" ]; then
  # Android 11
  rm "/tmp/system/system/recovery-from-boot.p" ];
  rm "/tmp/system/system/bin/install-recovery.sh" ];
fi;

umount "/tmp/vendor";
umount "/tmp/system";
rm -r "/tmp/vendor";
rm -r "/tmp/system";

exit 0;