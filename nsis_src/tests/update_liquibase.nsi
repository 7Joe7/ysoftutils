OutFile "Installer.exe"

Section
    StrCpy $0 'java -jar C:\Users\erneker\AppData\Local\Temp\liquibase-core.jar --classpath="C:\Users\erneker\AppData\Loca
    l\Temp\jtds.jar;C:\Users\erneker\AppData\Local\Temp\database-changelog.jar" --changeLogFile=changelog.xml --username=sa --url=jdbc:jtds:sqlserv
    er://10.0.11.172:1433/joe-test --driver=net.sourceforge.jtds.jdbc.Driver --password=sa update'

    nsExec::ExecToStack $0
    Pop $1
    Pop $2
    PrintDetail "Update resulted with exit code $1. Message: $2"
SectionEnd