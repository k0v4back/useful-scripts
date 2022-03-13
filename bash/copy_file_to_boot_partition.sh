#! /bin/bash

echo -n "Enter the name of the copied file (am335x-boneblack.dtb or another): "
read FILE_NAME

umount /tmp
mount /dev/mmcblk0p1 /tmp
cp $FILE_NAME /tmp
sync
umount /tmp
echo 4 > /proc/sys/kernel/printk

# Check errors
if [ $? -eq 0 ]; then
    echo "Success"
else
    echo "Mistake"
fi
