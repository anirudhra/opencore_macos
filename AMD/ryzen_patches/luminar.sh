sudo perl -i -pe 's|\x90\x90\x90\x90\x56\xE8\x6A\x00|\x90\x90\x90\x90\x56\xE8\x3A\x00|sg' '/Applications/Luminar 4.app/Contents/Frameworks/MPCore.framework/Versions/A/Frameworks/libtbb.dylib'
sudo perl -i -pe 's|\x90\x90\x90\x90\x56\xE8\x4A\x00|\x90\x90\x90\x90\x56\xE8\x1A\x00|sg' '/Applications/Luminar 4.app/Contents/Frameworks/MPCore.framework/Versions/A/Frameworks/libtbb.dylib'
sudo perl -i -pe 's|\x90\x90\x90\x90\x56\xE8\x6A\x00|\x90\x90\x90\x90\x56\xE8\x3A\x00|sg' '/Applications/Luminar 4.app/Contents/Frameworks/MPCore.framework/Versions/A/Frameworks/libtbbmalloc.dylib'
sudo perl -i -pe 's|\x90\x90\x90\x90\x56\xE8\x4A\x00|\x90\x90\x90\x90\x56\xE8\x1A\x00|sg' '/Applications/Luminar 4.app/Contents/Frameworks/MPCore.framework/Versions/A/Frameworks/libtbbmalloc.dylib'

