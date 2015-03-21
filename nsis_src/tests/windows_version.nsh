!include WinVer2.nsh

Var isWinVerServer
Var isWinVerSupported
Var windowsVersionStr

Function Test
    # Set $isWinVerSupported, $isWinVerServer and $windowsVersionStr
    ${If} ${IsServerOS}
        StrCpy $isWinVerServer 1
    ${Else}
        StrCpy $isWinVerServer 0
    ${EndIf}
    ${If} ${IsNT}
        ${If} ${AtLeastWinXP}
            StrCpy $isWinVerSupported 1
        ${Else}
            StrCpy $isWinVerSupported 0
        ${EndIf}
    ${Else}
        # This is a non-NT system: 95, 98, ME? We don't care, we don't support this.
        StrCpy $isWinVerSupported 0
        StrCpy $windowsVersionStr "Windows 95/98/ME"
    ${EndIf}
    ${If} ${IsWin95}
        StrCpy $windowsVersionStr "Windows 95"
    ${ElseIf} ${IsWin98}
        StrCpy $windowsVersionStr "Windows 98"
    ${ElseIf} ${IsWinME}
        StrCpy $windowsVersionStr "Windows ME"
    ${ElseIf} ${IsWinNT4}
        StrCpy $windowsVersionStr "Windows NT 4"
    ${ElseIf} ${IsWin2000}
        StrCpy $windowsVersionStr "Windows 2000"
    ${ElseIf} ${IsWinXP}
        StrCpy $windowsVersionStr "Windows XP"
    ${ElseIf} ${IsWin2003}
        ${If} ${IsWin2003R2}
            StrCpy $windowsVersionStr "Windows 2003"
        ${Else}
            StrCpy $windowsVersionStr "Windows 2003 R2"
        ${EndIf}
    ${ElseIf} ${IsWinVista}
        StrCpy $windowsVersionStr "Windows Vista"
    ${ElseIf} ${IsWin2008}
        StrCpy $windowsVersionStr "Windows 2008"
    ${ElseIf} ${IsWin7}
        StrCpy $windowsVersionStr "Windows 7"
    ${ElseIf} ${IsWin2008R2}
        StrCpy $windowsVersionStr "Windows 2008 R2"
    ${ElseIf} ${IsWin8}
        StrCpy $windowsVersionStr "Windows 8"
    ${ElseIf} ${IsWin2012}
        ${If} ${IsWin2012R2}
            StrCpy $windowsVersionStr "Windows 2012 R2"
        ${Else}
            StrCpy $windowsVersionStr "Windows 2012"
        ${EndIf}
    ${Else}
        StrCpy $isWinVerSupported 0
        StrCpy $windowsVersionStr "Windows ???"
    ${EndIf}

    MessageBox MB_OK "Supported: $isWinVerSupported"
    MessageBox MB_OK "Server: $isWinVerServer"
    MessageBox MB_OK "String: $windowsVersionStr"
    ${log} "Supported: $isWinVerSupported"
    ${log} "Server: $isWinVerServer"
    ${log} "String: $windowsVersionStr"

FunctionEnd