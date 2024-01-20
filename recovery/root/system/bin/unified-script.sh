#!/system/bin/sh
# This script is needed to automatically set device props.

load_RMX3081IN()
{
      echo "Setting up props for RMX3081IN"
      resetprop "ro.build.product" "RMX3081"
      resetprop "ro.product.model" "RMX3081"
      resetprop "ro.product.device" "RMX3081L1"
      resetprop "ro.product.product.device" "RMX3081L1"
      resetprop "ro.commonsoft.ota" "OP4BA1"
      resetprop "ro.separate.soft" "20711"
}

load_RMX3081EU()
{
      echo "Setting up props for RMX3081EU"
      resetprop "ro.build.product" "RMX3081"
      resetprop "ro.product.model" "RMX3081"
      resetprop "ro.product.device" "RMX3081L1"
      resetprop "ro.product.product.device" "RMX3081L1"
      resetprop "ro.commonsoft.ota" "OP4BA1"
      resetprop "ro.separate.soft" "20713"
}

project=$(cat /proc/oplusVersion/prjName)
echo $project

case $project in
     "20711")
         load_RMX3081IN
              ;;
     "20713")
          load_RMX3081EU
              ;;
           *)
          load_RMX3081IN
              ;;

esac

exit 0