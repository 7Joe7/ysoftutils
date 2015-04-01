Function Test

    !macro _AHOJ _a _b _t _f
      !insertmacro _LOGICLIB_TEMP
      StrCpy $_LOGICLIB_TEMP 0
      !insertmacro _= $_LOGICLIB_TEMP `${_b}` `${_t}` `${_f}`
    !macroend
    !define AHOJ `"" AHOJ ""`

    ${If} AHOJ
        ${log} "it executed!"
        MessageBox MB_OK "it executed!"
    ${EndIf}
FunctionEnd