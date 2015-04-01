/*  IsDomainMember LogicLib Extention
    Example:
        ${If} ${IsDomainMember} "internal.mycompany.com"
    ----------------------------------------*/

!macro _IsServerOS _a _b _t _f
    !insertmacro _LOGICLIB_TEMP
    ReadRegStr $_LOGICLIB_TEMP HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion" InstallationType
    !insertmacro _== $_LOGICLIB_TEMP ${_b} `${_t}` `${_f}`
!macroend
!define IsServerOS `"" IsServerOS "server"`


Function Test
    ${If} ${IsServerOS}
        MessageBox MB_OK "Yeeees!"
    ${Else}
        MessageBox MB_OK "Nooooo!"
    ${EndIf}
FunctionEnd