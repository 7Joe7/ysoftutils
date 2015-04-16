"c:\Deploy\java\bin\java.exe" -jar C:\Windows\system32\config\systemprofile\AppData\Local\Temp\liquibase-core.jar --classpath="C:\Windows\system32\config\systemprofile\AppData\Local\Temp\jtds.jar;C:\Windows\system32\config\systemprofile\AppData\Local\Temp\database-changelog.jar" --changeLogFile=changelog.xml --username=sa --url=jdbc:jtds:sqlserver://10.0.11.211:1433/YPSDB; --driver=net.sourceforge.jtds.jdbc.Driver --password=sa update
pause


