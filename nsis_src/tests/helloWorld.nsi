# name the installer
OutFile "Installer.exe"

# define the directory to install to, the desktop in this case as specified
# by the predefined $DESKTOP variable
InstallDir $DESKTOP

# default section start; every NSIS script has at least one section.
Section

# define the output path for this file
SetOutPath $INSTDIR

# create a popup box, with an OK button and the text "Hello world!"
# MessageBox MB_OK "Hello world!"

/* open an output file called "Hello_world.txt",
on the desktop in write mode. This file does not need to exist
before script is compiled and run */

# FileOpen $0 "$DESKTOP\Hello_world.txt" w

# write the string "hello world!" to the output file
# FileWrite $0 "hello world!"

# close the file
# FileClose $0
# Show Success message.
# MessageBox MB_OK "Hello_world.txt has been created successfully at Desktop!"

File text.txt

SectionEnd