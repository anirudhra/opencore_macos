#!/bin/sh
# enable below
defaults write com.apple.AppleGVA gvaForceAMDKE -boolean no           #forces AMD DRM decoder for streaming services (like Apple TV and iTunes movie streaming)
defaults write com.apple.coremedia hardwareVideoDecoder -string force #forces hardware accelerated video decoder (for any resolution)
#
# below for reference
#defaults write com.apple.AppleGVA gvaForceAMDKE -boolean yes #forces AMD DRM decoder for streaming services (like Apple TV and iTunes movie streaming)
#defaults write com.apple.AppleGVA gvaForceAMDAVCDecode -boolean yes #forces AMD AVC accelerated decoder
#defaults write com.apple.AppleGVA gvaForceAMDAVCEncode -boolean yes #forces AMD AVC accelerated encoder
#defaults write com.apple.AppleGVA gvaForceAMDHEVCDecode -boolean yes #forces AMD HEVC accelerated decoder
#defaults write com.apple.AppleGVA disableGVAEncryption -string YES #forces AMD HEVC accelerated decoder
#defaults write com.apple.coremedia hardwareVideoDecoder -string force #forces hardware accelerated video decoder (for any resolution)
#defaults write com.apple.coremedia hardwareVideoDecoder -string disable #disables hardware accelerated video decoder (in QuickTime / Apple TV)
