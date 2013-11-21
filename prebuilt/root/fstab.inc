# nothing here is intented for mounting by init

# vold mounts internal storage and external sdcard
/devices/platform/msm_sdcc.3/mmc_host/mmc2 auto vfat defaults voldmanaged=sdcard0:3,noemulatedsd
/devices/platform/msm_sdcc.2/mmc_host/mmc1 auto vfat defaults voldmanaged=sdcard1:1,noemulatedsd

# for recovery and ota installer script, MTD requires labels
misc /misc mtd defaults defaults
recovery /recovery mtd defaults defaults
boot /boot mtd defaults defaults
system /system yaffs2 ro wait
cache /cache yaffs2 defaults defaults
/dev/block/mmcblk0p1 /data ext3 defaults defaults
datadata /datadata yaffs2 defaults defaults