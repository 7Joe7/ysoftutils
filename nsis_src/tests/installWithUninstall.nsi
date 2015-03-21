OutFile "installer.exe"
InstallDir $DESKTOP

Section

SetOutPath $INSTDIR
File test.txt
WriteUninstaller $INSTDIR\uninstaller.exe

SectionEnd

# create a section to define what the uninstaller does.
# the section will always be named "Uninstall"
Section Uninstall

Delete $INSTDIR\uninstaller.exe
Delete $INSTDIR\test.txt

SectionEnd