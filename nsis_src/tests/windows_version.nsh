!include WinVer.nsh

Var isWinVerServer
Var isWinVerSupported
Var windowsVersionStr

InstallDir  $DESKTOP

Function Test

    ClearErrors
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
            StrCpy $windowsVersionStr "Windows 2003 R2"
        ${Else}
            StrCpy $windowsVersionStr "Windows 2003"
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
    ${ElseIf} ${IsWin8.1}
        StrCpy $windowsVersionStr "Windows 8.1"
    ${ElseIf} ${IsWin10.0}
        StrCpy $windowsVersionStr "Windows 10.0"
    ${ElseIf} ${IsWin2012}
        StrCpy $windowsVersionStr "Windows 2012"
    ${ElseIf} ${IsWin2012R2}
        StrCpy $windowsVersionStr "Windows 2012 R2"
    ${Else}
        StrCpy $isWinVerSupported 0
        StrCpy $windowsVersionStr "Windows ???"
    ${EndIf}
    pop $0

    ${GetWindowsVersion} $0
    ${log} "GetWindowsVersion: $0"
    ${GetPresentableWindowsVersion} $0
    ${log} "Presentable: $0"
    ${log} "Supported: $isWinVerSupported"
    ${log} "Server: $isWinVerServer"
    ${log} "String: $windowsVersionStr"
    ${log} "NT: $registryWindowsNTCurrentVersionValue"
    ${log} "Server: $registryWindowsInstallationTypeValue"
    ${log} "Version: $actualWindowsVersionCalculated"
    ${WinVerGetServicePackLevel} $0
    ${log} "Service Pack: $registryServicePackCSDVersionValue"
    ${log} "Service Pack: $0"
    ${If} ${AtMostServicePack} 0
        ${log} "AtMostServicePack True"
    ${Else}
        ${log} "AtMostServicePack False"
    ${EndIf}
    ${If} ${AtMostServicePack} 1
        ${log} "AtMostServicePack True"
    ${Else}
        ${log} "AtMostServicePack False"
    ${EndIf}
    ${If} ${AtMostServicePack} 2
        ${log} "AtMostServicePack True"
    ${Else}
        ${log} "AtMostServicePack False"
    ${EndIf}
    ${If} ${AtLeastServicePack} 0
        ${log} "AtLeastServicePack True"
    ${Else}
        ${log} "AtLeastServicePack False"
    ${EndIf}
    ${If} ${AtLeastServicePack} 1
        ${log} "AtLeastServicePack True"
    ${Else}
        ${log} "AtLeastServicePack False"
    ${EndIf}
    ${If} ${AtLeastServicePack} 2
        ${log} "AtLeastServicePack True"
    ${Else}
        ${log} "AtLeastServicePack False"
    ${EndIf}
    ${If} ${IsServicePack} 0
        ${log} "IsServicePack True"
    ${Else}
        ${log} "IsServicePack False"
    ${EndIf}
    ${If} ${IsServicePack} 1
        ${log} "IsServicePack True"
    ${Else}
        ${log} "IsServicePack False"
    ${EndIf}
    ${If} ${IsServicePack} 2
        ${log} "IsServicePack True"
    ${Else}
        ${log} "IsServicePack False"
    ${EndIf}
    ${TEST_CONDITION} "AtLeastWin10.0"
    ${TEST_CONDITION} "AtLeastWin8.1"
    ${TEST_CONDITION} "AtLeastWin8"
    ${TEST_CONDITION} "AtLeastWin7"
    ${TEST_CONDITION} "AtLeastWinNT4"
    ${TEST_CONDITION} "AtLeastWinXP"
    ${TEST_CONDITION} "AtLeastWin2012R2"
    ${TEST_CONDITION} "AtLeastWin2015"
    ${TEST_CONDITION} "AtLeastWin2012"
    ${TEST_CONDITION} "AtLeastWin2008"
    ${TEST_CONDITION} "AtLeastWin2008R2"
    ${TEST_CONDITION} "AtMostWin2012R2"
    ${TEST_CONDITION} "AtMostWin2003"
    ${TEST_CONDITION} "AtMostWinNT4"
    ${TEST_CONDITION} "AtMostWinXP"
    ${TEST_CONDITION} "AtMostWin10.0"
    ${TEST_CONDITION} "AtMostWin8.1"
    ${TEST_CONDITION} "AtMostWin8"
    ${TEST_CONDITION} "IsServerOS"
    ${TEST_CONDITION} "IsNT"

    ClearErrors
FunctionEnd