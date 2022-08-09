# opencore_macos
EFIs for opencore

Common HW: Gigabyte AB350N-WIFI mITX, 16GB DDR4-3200, Corsair P2 NVMe, Realtek 8111 Ethernet, Realtek ALC1220 Audio

macOS: Monterey 12.4, OC 0.8.1

1) EFI_Athlon200GE: Crackling onboard audio in VLC, but audio in web-browser works fine. MacPro6,1, Intel 3165 Wifi+BT
2) EFI_Ryzen3700X: Audio works. MacPro7.1, Intel 3165 Wifi+BT, ALCID=1
3) EFI_Ryzen3700X_BRCM-Wifi: Same as above for Broadcom 94360NG Wifi+BT M.2
4) EFI_Ryzen3700X_BRCM_iMacPro_Polaris: Same as above with iMacPro1.1 with USBMap. Also adds explicit Polaris GPU framebuffer and SMUFWLoad call in plist

macOS: Monterey 12.5, OC 0.8.1 (w/ some plugins from 0.8.2)

5) EFI_Ryzen3700X_BRCM_MacPro7_Polaris: Same as above with MacPro7.1, Removes all manual GPU framebuffers/SMUFW, Shaneee's patch instead of Algrey's original patch

macOS: Monterey 12.5, OC 0.8.3

6) EFI_083_Ryzen3700X_BRCM_MacPro7_Polaris: Same as above with OpenCore upgrade to 0.8.3 including all kexts to latest as on Aug 8, 2022
