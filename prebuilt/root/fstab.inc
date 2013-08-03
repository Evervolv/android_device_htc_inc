# nothing here is intented for mounting by init

# vold mounts internal storage and external sdcard
/devices/platform/msm_sdcc.2/mmc_host/mmc2 /storage/sdcard0 auto defaults voldmanaged=sdcard:3
/devices/platform/msm_sdcc.2/mmc_host/mmc1 /storage/sdcard1 auto defaults voldmanager=external_sd:1

# for recovery and ota installer script, MTD requires labels
misc /misc mtd defaults defaults
recovery /recovery mtd defaults defaults
boot /boot mtd defaults defaults
system /system yaffs2 ro wait
cache /cache yaffs2 defaults defaults
/dev/block/mmcblk0p1 /data ext3 defaults defaults
datadata /datadata yaffs2 defaults defaults