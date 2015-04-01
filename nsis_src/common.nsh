InstallDir 'C:\Users\erneker\Documents\Projects\YSoftUtils\nsis_src\results'
OutFile "results\Installer.exe"

Var logFileHandle
Var logTimeStamp
Var liquibaseCorePath205
Var liquibaseCorePath332
Var databaseChangelog1155
Var jtdsDriver128p
Var java632
Var java664
Var java732
Var java764
Var java832
Var java864

!include LogicLib.nsh
!include x64.nsh
!include MUI2.nsh
!include Sections.nsh
!include StrFunc.nsh
!include FileFunc.nsh
!include WinMessages.nsh
!include WinVer.nsh
!include WordFunc.nsh

!addincludedir tests

# ========================================================================
# Function for creating a string with a timestamp
# Usage: ${TimeStamp} $0
# $0 now contains timestamp as YYYYMMDDHHmmSS.xxxx
# This comes from http://nsis.sourceforge.net/GetTimeStamp (by Zinthose),
### TimeStamp
!ifndef TimeStamp
    !define TimeStamp "!insertmacro _TimeStamp"
    !macro _TimeStamp FormatedString Format
        Push `${Format}`
        !ifdef __UNINSTALL__
            Call un.__TimeStamp
        !else
            Call __TimeStamp
        !endif
        Pop ${FormatedString}
    !macroend

!macro __TimeStamp UN
Function ${UN}__TimeStamp
    ClearErrors

    # We need to keep original $8 in order to avoid interference with $8 from calling functions above timestamp.
    # Original function from NSIS examples was modified to support format as parameter and also keep $8 value.
    # Keeping original $8 value is tricky. Follow comments with *8* mark
    # *8*: Backup old $8 value. We'll have stack like: $8value, "human-readable", ...
    Push $8

    # *8*: Exchange top two values. We'll have stack like: "human-readable", $8value, ...
    Exch 1

    # *8*: Extract formatting parameter into $8. At the end of this function we will do this pop again
    # in order to restore former value of $8

    # Get params - like "human-readable"
    Pop $8

    ## Store the needed Registers on the stack
        Push $0 ; Stack $0
        Push $1 ; Stack $1 $0
        Push $2 ; Stack $2 $1 $0
        Push $3 ; Stack $3 $2 $1 $0
        Push $4 ; Stack $4 $3 $2 $1 $0
        Push $5 ; Stack $5 $4 $3 $2 $1 $0
        Push $6 ; Stack $6 $5 $4 $3 $2 $1 $0
        Push $7 ; Stack $7 $6 $5 $4 $3 $2 $1 $0

    ## Call System API to get the current system Time
        System::Alloc 16
        Pop $0
        System::Call 'kernel32::GetLocalTime(i) i(r0)'
        System::Call '*$0(&i2, &i2, &i2, &i2, &i2, &i2, &i2, &i2)i (.r1, .r2, n, .r3, .r4, .r5, .r6, .r7)'
        System::Free $0

        IntFmt $2 "%02i" $2
        IntFmt $3 "%02i" $3
        IntFmt $4 "%02i" $4
        IntFmt $5 "%02i" $5
        IntFmt $6 "%02i" $6
        IntFmt $7 "%03i" $7

    ## Generate Timestamp
        ;StrCpy $0 "YEAR=$1$\nMONTH=$2$\nDAY=$3$\nHOUR=$4$\nMINUITES=$5$\nSECONDS=$6$\nMS$7"
        #TODO: find a more universal solution - generic multiple formats
        ${If} $8 == "human-readable"
            StrCpy $0 "$1-$2-$3 $4:$5:$6.$7"
        ${Else}
            StrCpy $0 "$1$2$3$4$5$6.$7"
        ${Endif}

    ## Restore the Registers and add Timestamp to the Stack
        Pop $7  ; Stack $6 $5 $4 $3 $2 $1 $0
        Pop $6  ; Stack $5 $4 $3 $2 $1 $0
        Pop $5  ; Stack $4 $3 $2 $1 $0
        Pop $4  ; Stack $3 $2 $1 $0
        Pop $3  ; Stack $2 $1 $0
        Pop $2  ; Stack $1 $0
        Pop $1  ; Stack $0
        Exch $0 ; Stack ${TimeStamp}

        # *8*: We need to restore $8. There is result of function on the top of stack and former $8 values is on 2nd position.
        # We have to Pop original result of this function and then exchange it with the top from stack which contains former $8.
        # So simple :o)
        Pop $8
        Exch $8

FunctionEnd
!macroend
!insertmacro __TimeStamp ""
!insertmacro __TimeStamp "un."
!endif
###########

# ========================================================================
# Macros to push and pop the error flag
!macro PushErrors
    ${If} ${Errors}
        Push 1
    ${Else}
        Push 0
    ${EndIf}
!macroend
!define PushErrors `!insertmacro PushErrors`

!macro PopErrors
    Exch $0
    ${If} $0 == 0
        ClearErrors
    ${Else}
        SetErrors
    ${EndIf}
    Pop $0
!macroend
!define PopErrors `!insertmacro PopErrors`

!macro log TEXT
    FileOpen $logFileHandle "$INSTDIR\main_log.log" a
    FileSeek $logFileHandle 0 END
    ${Timestamp} $logTimeStamp "human-readable"
    FileWrite $logFileHandle `$logTimeStamp | ${TEXT}$\r$\n`
    FileClose $logFileHandle
!macroend
!define log `!insertmacro log`

!macro setup
    SetOutPath $INSTDIR
    StrCpy $liquibaseCorePath205 "C:\Users\erneker\Documents\libs\liquibase-core-2.0.5.jar"
    StrCpy $liquibaseCorePath332 "C:\Users\erneker\Documents\libs\liquibase-core-3.3.2.jar"
    StrCpy $databaseChangelog1155 "C:\Users\erneker\Documents\libs\database-changelog-1.15.5.jar"
    StrCpy $jtdsDriver128p "C:\Users\erneker\Documents\Projects\jtds-1.2.8-src\classes\artifacts\jtds_jar2\jtds.jar"
    FileOpen $logFileHandle "$INSTDIR\main_log.log" a
    FileSeek $logFileHandle 0 END
    FileWrite $logFileHandle `-------------------------------------------------------------------$\n`
    FileClose $logFileHandle
!macroend
!define setup `!insertmacro setup`

!macro TEST_CONDITION CONDITION
    ${If} ${${CONDITION}}
        ${log} "${CONDITION} True"
    ${Else}
        ${log} "${CONDITION} False"
    ${EndIf}
!macroend
!define TEST_CONDITION `!insertmacro TEST_CONDITION`