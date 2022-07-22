# opencore_macos
EFIs for opencore

Common HW: Gigabyte AB350N-WIFI mITX, 16GB DDR4-3200, Corsair P2 NVMe, Realtek 8111 Ethernet, Realtek ALC1220 Audio

macOS: Monterey 12.4

1) EFI_Athlon200GE: Crackling onboard audio in VLC, but audio in web-browser works fine. MacPro6,1, Intel 3165 Wifi+BT
2) EFI_Ryzen3700X: Audio works. MacPro7,1, Intel 3165 Wifi+BT
3) EFI_Ryzen3700X_BRCM-Wifi: Same as above for Broadcom 94360ng Wifi+BT
4) EFI_Ryzen3700X_BRCM_iMacPro: Same as above with iMacPro1,1 SMBIOS with USBMap. Also adds Polaris GPU framebuffer and SMUFWLoad call in plist
