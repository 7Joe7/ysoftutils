OutFile "Installer.exe"

Var mustInstallDotNet

!include LogicLib.nsh

Function detectDotNet
    # Detect .NET Framework version and set $mustInstallDotNet.
    StrCpy $mustInstallDotNet 1

    ReadRegDWORD $0 HKLM "SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" "Install"
    ${If} $0 == 1
        # .NET 4.0 is installed

        # Check for 4.5 according to http://msdn.microsoft.com/en-us/library/hh925568(v=vs.110).aspx
        ReadRegStr $2 HKLM "SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" "Release"
        ${If} $2 > 378674
            ReadRegStr $2 HKLM "SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" "Version"

            StrCpy $mustInstallDotNet 0
        ${EndIf}
    ${EndIf}

    # All the reads from the registry can fail (the keys can be nonexistent), but we don't want to indicate an error status.
FunctionEnd

Section
    SetOutPath $INSTDIR

    Call detectDotNet

    MessageBox MB_OK "$mustInstallDotNet"
SectionEnd