# OpenCore EFI for HP Elitedesk 800 G4 Mini

## Incremental OS updates

1. Disable BlueToolFixup.kext extension under Kernel
2. Disable SecureBootModel under Misc > Security
3. Reboot
4. Check for and install incremental OS updates
5. Enable the kernel extension and security after update

## HP Elitedesk 800 G4 Mini

* HW: Intel Core i5-8600, Q370 Chipset, UHD 630 iGPU, AMD Radeon RX 560X 4GB (1 DP), 32GB DDR4-2666 2x16, MP44 2TB NVMe, Intel i219 LAN, Conexant Audio, Intel 9260 Wifi/BT, Dell 4K DP 
* macOS: Sequoia 15.4
* SMBIOS: iMac19,2
* BIOS: 2.30
* OC: 1.0.4
* EFI: iGPU as headless, AirportItlwm for wireless, 3008x1692x2 60Hz over displayport
* BIOS: Secure boot disabled, {VT-d, TPM} enabled

While untested, this same EFI has been reported to work on HP Elitedesk 800 G5 Mini as well.

## AMD System (decommissioned, for legacy/backup only)

* HW: AMD Ryzen 5600 (6C12T), Gigabyte B450 I AORUS PRO WIFI (rev. 1.0) ITX, 32GB DDR4-3200 (16x2), WD SN850X 2TB NVMe, Intel I211 LAN, Realtek ALC1220 Audio, AMD RX460, Intel AC9260 WiFi+BT
* macOS: Sonoma 14.5
* SMBIOS: MacPro7,1
* BIOS: F63a
* OC: 0.9.8
* EFI: 6 Cores enabled, ALCID=1, Shaneee's GPU patch instead of Algrey's original patch RX460
* BIOS: {"Secure boot", SVM/IOMMU, TPM, Above 4G decoding} enabled, CSM disabled

### Ryzen Patches

Individual scripts available. amdfriend compressed executable/binary also available for universal fix (https://github.com/NyaomiDEV/AMDFriend). Run after app updates

## OpenCore Bootloader Restore (if Windows overwrites)

Doing this will break Windows 11 bootup temporarily:

* Access your EFI via administrative console (Admin Terminal, "mountvol [drive] [volume]")
* Rename the bootmgfw.efi file under EFI/Microsoft/Boot to something you can remember, but it cannot have .efi at the end)
* Replace BOOTX64.EFI inside EFI/BOOT with the one from your OpenCore install
* Reboot machine
* ---- Alternatively, you can boot from OpenCore USB in to macOS and do above ----
* You should see OpenCore again, boot back into macOS
* Go into your config.plist, and enable LauncherOption (Either Full or Short) - https://dortania.github.io/OpenCore-Post-Install/multiboot/bootstrap.html
* Reboot once more to choose OpenCore, but instead of booting into macOS, choose the reboot option
* Press the key to access your UEFI Boot Menu, and you should see a new entry called OpenCore
* Set OpenCore to the highest boot order and reboot
* OpenCore should boot normally
* Mount EFI in macOS like normal, and rename the bootmgfw.efi you renamed earlier back to its original file name.
* Reboot but go into your UEFI BIOS Utility, and change the boot order again, Windows Boot Manager will be at top but move OpenCore above it.
* Reboot and OpenCore should boot normally with Windows as an option.
