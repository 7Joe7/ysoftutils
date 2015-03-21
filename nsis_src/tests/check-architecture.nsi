OutFile "Installer.exe"

Section

ReadRegStr $0 HKLM "SYSTEM\CurrentControlSet\Control\Session Manager\Environment" "PROCESSOR_ARCHITECTURE"
MessageBox MB_OK $0

SectionEnd