./unpackimg.sh boot.img
rm split_img/boot.img-dtb
rm split_img/boot.img-zImage
dtbToolCM -2 -o /home/jgcaap/oneplus/ramdisk/split_img/boot.img-dtb -s 2048 -p /home/jgcaap/msm8974/scripts/dtc/ /home/jgcaap/msm8974/arch/arm/boot/
cp /home/jgcaap/msm8974/arch/arm/boot/zImage /home/jgcaap/oneplus/ramdisk/split_img/boot.img-zImage
mkbootimg --kernel /home/jgcaap/msm8974/arch/arm/boot/zImage --ramdisk /home/jgcaap/oneplus/ramdisk/split_img/boot.img-ramdisk.cpio.gz --cmdline "console=ttyHSL0,115200,n8 androidboot.hardware=bacon user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=msm_sdcc.1" --pagesize 2048  --base 0x00000000 --kernel_offset 0x00008000 --ramdisk_offset 0x02000000 --tags_offset 0x01e00000 --dt boot.img-dtb -o image-new.img
echo "image-new.img ready"
cd ..
./repackimg.sh
echo "making zip file"
cp ../ramdisk/image-new.img zip/boot.img
cd zip/
zip -r9 jgcaap-kernel.zip * -x jgcaap-kernel.zip
echo "flash zip ready"




