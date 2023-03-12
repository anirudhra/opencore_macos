# opencore_macos
EFIs for opencore

Common HW: Gigabyte AB350N-WIFI mITX, 16GB DDR4-3200, Corsair P2 NVMe, Realtek 8111 Ethernet, Realtek ALC1220 Audio, BIOS CSM disabled

macOS: Ventura 13.1, OC 0.9.0

* EFI_083_Ryzen3700X_BRCM_MacPro7_Polaris: Audio works, ALCID=1, MacPro7.1, BCM94360NG Wifi+BT (no changes, native support), Shaneee's GPU patch instead of Algrey's original patch RX460
* Needs "secure boot" enabled, SVM/IOMMU enabled, above 4G decoding enabled

Ryzen Patches

Individual scripts available. amdfriend compressed executable/binary also available for universal fix (https://github.com/NyaomiDEV/AMDFriend). Run after app updates

OpenCore Bootloader Restore

Doing this will break Windows 11 bootup temporarily:

* Access your EFI via administrative console (Admin Terminal, "mountvol [drive] [volume]")
* Rename the bootmgfw.efi file under EFI/Microsoft/Boot to something you can remember, but it cannot have .efi at the end)
* Replace BOOTX64.EFI inside EFI/BOOT with the one from your OpenCore install
* Reboot machine
---- Alternatively, you can boot from OpenCore USB in to macOS and do above ----
* You should see OpenCore again, boot back into macOS
* Go into your config.plist, and enable LauncherOption (Either Full or Short) - https://dortania.github.io/OpenCore-Post-Install/multiboot/bootstrap.html
* Reboot once more to choose OpenCore, but instead of booting into macOS, choose the reboot option
* Press the key to access your UEFI Boot Menu, and you should see a new entry called OpenCore
* Set OpenCore to the highest boot order and reboot
* OpenCore should boot normally
* Mount EFI in macOS like normal, and rename the bootmgfw.efi you renamed earlier back to its original file name.
* Reboot but go into your UEFI BIOS Utility, and change the boot order again, Windows Boot Manager will be at top but move OpenCore above it.
* Reboot and OpenCore should boot normally with Windows as an option.
