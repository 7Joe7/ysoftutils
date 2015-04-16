!include WinVer.nsh

Var isWinVerServer
Var isWinVerSupported
Var windowsVersionStr

InstallDir $DESKTOP

Function Test

    ClearErrors

    ${TEST_MACRO_RESULT} "GetWindowsVersion"
    ${TEST_MACRO_RESULT} "GetPresentableWindowsVersion"

    ${log} ""

    ${TEST_CONDITION} "IsWin8.1"
    ${TEST_CONDITION} "IsWin8"
    ${TEST_CONDITION} "IsWin7"
    ${TEST_CONDITION} "IsWinXP"
    ${TEST_CONDITION} "IsWinVista"
    ${TEST_CONDITION} "IsWin2008"
    ${TEST_CONDITION} "IsWin2008R2"
    ${TEST_CONDITION} "IsWinVista"
    ${TEST_CONDITION} "IsWin2012"
    ${TEST_CONDITION} "IsWin2012R2"

    ${log} ""

    ${TEST_CONDITION} "AtLeastWin2015"
    ${TEST_CONDITION} "AtLeastWin10.0"
    ${TEST_CONDITION} "AtLeastWin8.1"
    ${TEST_CONDITION} "AtLeastWin2012R2"
    ${TEST_CONDITION} "AtLeastWin8"
    ${TEST_CONDITION} "AtLeastWin2012"
    ${TEST_CONDITION} "AtLeastWin7"
    ${TEST_CONDITION} "AtLeastWin2008R2"
    ${TEST_CONDITION} "AtLeastWin2008"
    ${TEST_CONDITION} "AtLeastWinVista"
    ${TEST_CONDITION} "AtLeastWinXP"
    ${TEST_CONDITION} "AtLeastWinNT4"

    ${log} ""

    ${TEST_CONDITION} "IsServerOS"
    ${TEST_CONDITION} "IsNT"

    ${log} ""

    ${TEST_CONDITION} "AtMostWin2015"
    ${TEST_CONDITION} "AtMostWin10.0"
    ${TEST_CONDITION} "AtMostWin8.1"
    ${TEST_CONDITION} "AtMostWin2012R2"
    ${TEST_CONDITION} "AtMostWin8"
    ${TEST_CONDITION} "AtMostWin2012"
    ${TEST_CONDITION} "AtMostWin7"
    ${TEST_CONDITION} "AtMostWin2008R2"
    ${TEST_CONDITION} "AtMostWin2008"
    ${TEST_CONDITION} "AtMostWinVista"
    ${TEST_CONDITION} "AtMostWinXP"
    ${TEST_CONDITION} "AtMostWinNT4"

    ${log} ""

    ${TEST_CONDITION_WITH_PAR} "AtMostServicePack" 0
    ${TEST_CONDITION_WITH_PAR} "AtMostServicePack" 1
    ${TEST_CONDITION_WITH_PAR} "AtMostServicePack" 2

    ${log} ""

    ${TEST_CONDITION_WITH_PAR} "AtLeastServicePack" 0
    ${TEST_CONDITION_WITH_PAR} "AtLeastServicePack" 1
    ${TEST_CONDITION_WITH_PAR} "AtLeastServicePack" 2

    ${log} ""

    ${TEST_CONDITION_WITH_PAR} "IsServicePack" 0
    ${TEST_CONDITION_WITH_PAR} "IsServicePack" 1
    ${TEST_CONDITION_WITH_PAR} "IsServicePack" 2

    /* ${If} ${AtMostServicePack} 0
            ${log} "AtMostServicePack 0 True"
        ${Else}
            ${log} "AtMostServicePack 0 False"
        ${EndIf}
        ${TEST_ERRORS}
        ${If} ${AtMostServicePack} 1
            ${log} "AtMostServicePack 1 True"
        ${Else}
            ${log} "AtMostServicePack 1 False"
        ${EndIf}
        ${TEST_ERRORS}
        ${If} ${AtMostServicePack} 2
            ${log} "AtMostServicePack 2 True"
        ${Else}
            ${log} "AtMostServicePack 2 False"
        ${EndIf}
        ${TEST_ERRORS}
        ${If} ${AtLeastServicePack} 0
            ${log} "AtLeastServicePack 0 True"
        ${Else}
            ${log} "AtLeastServicePack 0 False"
        ${EndIf}
        ${TEST_ERRORS}
        ${If} ${AtLeastServicePack} 1
            ${log} "AtLeastServicePack 1 True"
        ${Else}
            ${log} "AtLeastServicePack 1 False"
        ${EndIf}
        ${TEST_ERRORS}
        ${If} ${AtLeastServicePack} 2
            ${log} "AtLeastServicePack 2 True"
        ${Else}
            ${log} "AtLeastServicePack 2 False"
        ${EndIf}
        ${TEST_ERRORS}
        ${If} ${IsServicePack} 0
            ${log} "IsServicePack 0 True"
        ${Else}
            ${log} "IsServicePack 0 False"
        ${EndIf}
        ${TEST_ERRORS}
        ${If} ${IsServicePack} 1
            ${log} "IsServicePack 1 True"
        ${Else}
            ${log} "IsServicePack 1 False"
        ${EndIf}
        ${TEST_ERRORS}
        ${If} ${IsServicePack} 2
            ${log} "IsServicePack 2 True"
        ${Else}
            ${log} "IsServicePack 2 False"
        ${EndIf}
*/


/*
${TEST_CONDITION} "IsWin8.1"
${TEST_CONDITION} "IsWin2012R2"
${TEST_CONDITION} "IsWin2008"
${TEST_CONDITION} "IsWinVista"



    ${If} ${IsServerOS}
        ${AndIf} ${AtLeastWin2008}
        ${Else}
        ${EndIf}

    ${log} "done what failed"
    ${TEST_ERRORS}

    ${If} ${IsServerOS}
    ${EndIf}
    ${TEST_ERRORS}
    ${If} ${AtLeastWinXP}
        StrCpy $isWinVerSupported 1
    ${Else}
        StrCpy $isWinVerSupported 0
    ${EndIf}
    ${log} "AtLeastXP checked"
    ${TEST_ERRORS}

    # Set $isWinVerSupported, $isWinVerServer and $windowsVersionStr

    ${If} ${IsServerOS}
    ${log} "NT Checked"
        ${TEST_ERRORS}
        ${If} ${AtLeastWinXP}
            StrCpy $isWinVerSupported 1
        ${Else}
            StrCpy $isWinVerSupported 0
        ${EndIf}
        ${log} "AtLeastXP checked"
        ${TEST_ERRORS}
        StrCpy $isWinVerServer 1
    ${Else}
    ${log} "NT Checked"
            ${TEST_ERRORS}
            ${If} ${AtLeastWinXP}
                StrCpy $isWinVerSupported 1
            ${Else}
                StrCpy $isWinVerSupported 0
            ${EndIf}
            ${log} "AtLeastXP checked"
            ${TEST_ERRORS}
        StrCpy $isWinVerServer 0
    ${EndIf}
    ${log} "Server checked"
    ${TEST_ERRORS}
    ${If} ${IsNT}
        ${log} "NT Checked"
        ${TEST_ERRORS}
        ${If} ${AtLeastWinXP}
            StrCpy $isWinVerSupported 1
        ${Else}
            StrCpy $isWinVerSupported 0
        ${EndIf}
        ${log} "AtLeastXP checked"
        ${TEST_ERRORS}
    ${Else}
    ${log} "NT Checked"
            ${TEST_ERRORS}
            ${If} ${AtLeastWinXP}
                StrCpy $isWinVerSupported 1
            ${Else}
                StrCpy $isWinVerSupported 0
            ${EndIf}
            ${log} "AtLeastXP checked"
            ${TEST_ERRORS}
        # This is a non-NT system: 95, 98, ME? We don't care, we don't support this.
        StrCpy $isWinVerSupported 0
    ${EndIf}
    ${TEST_ERRORS}



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
        ${log} "checking Win2003R2"
        ${TEST_ERRORS}
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
    ${TEST_ERRORS}
    ${GetWindowsVersion} $0
    ${TEST_ERRORS}
    ${WinVerGetServicePackLevel} $1
    ${TEST_ERRORS}
    ${log} "WinVerGetServicePackLevel: $1"
    ${log} "GetWindowsVersion: $0"
    ${GetPresentableWindowsVersion} $0
    ${TEST_ERRORS}
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
    ${TEST_ERRORS}
    ${If} ${AtMostServicePack} 0
        ${log} "AtMostServicePack True"
    ${Else}
        ${log} "AtMostServicePack False"
    ${EndIf}
    ${TEST_ERRORS}
    ${If} ${AtMostServicePack} 1
        ${log} "AtMostServicePack True"
    ${Else}
        ${log} "AtMostServicePack False"
    ${EndIf}
    ${TEST_ERRORS}
    ${If} ${AtMostServicePack} 2
        ${log} "AtMostServicePack True"
    ${Else}
        ${log} "AtMostServicePack False"
    ${EndIf}
    ${TEST_ERRORS}
    ${If} ${AtLeastServicePack} 0
        ${log} "AtLeastServicePack True"
    ${Else}
        ${log} "AtLeastServicePack False"
    ${EndIf}
    ${TEST_ERRORS}
    ${If} ${AtLeastServicePack} 1
        ${log} "AtLeastServicePack True"
    ${Else}
        ${log} "AtLeastServicePack False"
    ${EndIf}
    ${TEST_ERRORS}
    ${If} ${AtLeastServicePack} 2
        ${log} "AtLeastServicePack True"
    ${Else}
        ${log} "AtLeastServicePack False"
    ${EndIf}
    ${TEST_ERRORS}
    ${If} ${IsServicePack} 0
        ${log} "IsServicePack True"
    ${Else}
        ${log} "IsServicePack False"
    ${EndIf}
    ${TEST_ERRORS}
    ${If} ${IsServicePack} 1
        ${log} "IsServicePack True"
    ${Else}
        ${log} "IsServicePack False"
    ${EndIf}
    ${TEST_ERRORS}
    ${If} ${IsServicePack} 2
        ${log} "IsServicePack True"
    ${Else}
        ${log} "IsServicePack False"
    ${EndIf}
    ${TEST_ERRORS}
    ${TEST_CONDITION} "AtLeastWin10.0"
    ${TEST_ERRORS}
    ${TEST_CONDITION} "AtLeastWin8.1"
    ${TEST_ERRORS}
    ${TEST_CONDITION} "AtLeastWin8"
    ${TEST_ERRORS}
    ${TEST_CONDITION} "AtLeastWin7"
    ${TEST_ERRORS}
    ${TEST_CONDITION} "AtLeastWinNT4"
    ${TEST_ERRORS}
    ${TEST_CONDITION} "AtLeastWinXP"
    ${TEST_ERRORS}
    ${TEST_CONDITION} "AtLeastWin2012R2"
    ${TEST_ERRORS}
    ${TEST_CONDITION} "AtLeastWin2015"
    ${TEST_ERRORS}
    ${TEST_CONDITION} "AtLeastWin2012"
    ${TEST_ERRORS}
    ${TEST_CONDITION} "AtLeastWin2008"
    ${TEST_ERRORS}
    ${TEST_CONDITION} "AtLeastWin2008R2"
    ${TEST_ERRORS}
    ${TEST_CONDITION} "AtMostWin2012R2"
    ${TEST_ERRORS}
    ${TEST_CONDITION} "AtMostWin2003"
    ${TEST_ERRORS}
    ${TEST_CONDITION} "AtMostWinNT4"
    ${TEST_ERRORS}
    ${TEST_CONDITION} "AtMostWinXP"
    ${TEST_ERRORS}
    ${TEST_CONDITION} "AtMostWin10.0"
    ${TEST_ERRORS}
    ${TEST_CONDITION} "AtMostWin8.1"
    ${TEST_ERRORS}
    ${TEST_CONDITION} "AtMostWin8"
    ${TEST_ERRORS}
    ${TEST_CONDITION} "IsServerOS"
    ${TEST_ERRORS}
    ${TEST_CONDITION} "IsNT"

    ${TEST_ERRORS}
    ${PRP} "registryWindowsProductNameValue"
*/
FunctionEnd