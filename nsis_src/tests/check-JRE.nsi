# name the installer
OutFile "installer.exe"

!include x64.nsh

#default section start
Section

    ${If} ${RunningX64}
        SetRegView 64
    ${EndIf}

    # read the value from the registry into the $0 register
    ReadRegStr $2 HKLM "SOFTWARE\JavaSoft\Java Runtime Environment\1.8" "JavaHome"
    DetailPrint $2
    #ReadRegStr $1 HKLM "

    # print the results in a popup message box
    MessageBox MB_OK $2

# default section end
SectionEnd