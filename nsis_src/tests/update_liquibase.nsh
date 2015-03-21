Function Test

    StrCpy $0 'java -jar $liquibaseCorePath205 --classpath="$jtdsDriver128p;$databaseChangelog1155" --changeLogFile=changelog.xml --username=sa --url=jdbc:jtds:sqlserver://10.0.11.172:1433/joe-test --driver=net.sourceforge.jtds.jdbc.Driver --password=sa update'

    ${log} $0
    nsExec::ExecToStack $0
    Pop $1
    Pop $2
    ${log} "Update resulted with exit code $1. Message: $\n$2"
FunctionEnd