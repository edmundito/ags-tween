@echo off

set filename=ags-tween-%1-module.zip

C:\windows\System32\tar.exe ^
    -cvaf %filename% ^
    Tween.scm ^
    Tween1Compatibility.scm ^
    Tween2Compatibility.scm ^
    INSTALL.TXT ^
    CHANGES.TXT ^
    LICENSE

echo Created: %filename%
