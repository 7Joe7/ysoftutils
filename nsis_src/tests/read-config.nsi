OutFile "Installer.exe"

!include LogicLib.nsh
!include StrFunc.nsh
!include FileFunc.nsh

${StrLoc}

!macro readFile RESULT FILENAME
StrCpy ${RESULT} ""
FileOpen $R1 ${FileName} r
# we have to omit byte order mark
FileSeek $R1 3
loop:
    FileRead $R1 $R2
    StrCpy ${Result} "${Result}$R2"
    IfErrors +1 loop
FileClose $R1
!macroend
!define readFile `!insertmacro readFile`

Section

    ${readFile} $1 "environment-configuration.properties"
    MessageBox MB_OK $1

    #${GetOptions} "$1" "/CFG:dbPassword=" $0
    #MessageBox MB_OK $0

    ${StrLoc} $0 $1 "database.password=" ">"
    MessageBox MB_OK $0

    #${GetOptions} "$1" "/database.url=" $0
    #MessageBox MB_OK $0

    #${GetOptions} "$1" "/database.password=" $0
    #MessageBox MB_OK $0

    #${GetOptions} "$1" "/database.username=" $0
    #MessageBox MB_OK $0

    #${GetOptions} "$1" "/database.vendor=" $0
    #MessageBox MB_OK $0

SectionEnd