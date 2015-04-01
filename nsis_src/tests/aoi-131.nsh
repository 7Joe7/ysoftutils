
!include FileFunc.nsh

Function abortIfError
    ${If} ${Errors}
        GetErrorLevel $0
        ${log} "ERROR: Operation failed!, error $0"
        Abort
    ${EndIf}
FunctionEnd

!define REGISTRY_PRODUCT_NAME "YSoftMobilePrintServer"
!define REGISTRY_ROOT "Software\Y Soft Corporation\${REGISTRY_PRODUCT_NAME}"

!macro PrepareMpsUpdate
        Call stopMpsService
        Call abortIfError

        Call UninstallMpsService
        Call abortIfError

        #backup MPS configuration
        ${log} "Backing up MPS configuration."
        CopyFiles $INSTDIR\Service\conf\conversion.config ${TEMPDIR}\conversion.config
        CopyFiles $INSTDIR\Service\conf\mps.config ${TEMPDIR}\mps.config
        Call abortIfError
!macroEnd

Function Test
    !insertmacro PrepareMpsUpdate
    ReadRegStr $INSTDIR HKLM "${REGISTRY_ROOT}" "InstallDir"
    SetOutPath $INSTDIR
    ${logInfo} "Copying installation files..."
    SetOverwrite on
    ${logDebug} "Overwrite set"
    Call abortIfError
    File "..\resources\images\mps.ico"
    ${logDebug} "File two copied"
    Call abortIfError
    File /r "..\..\..\build\mps\*"
    ${logDebug} "File one copied"
    Call abortIfError
FunctionEnd