mvn -B deploy:deploy-file -DgroupId=com.ysoft.vault ^
        -DartifactId=preconfigured-tomcat7-server ^
        -Dversion=1.0.5-YSOFT ^
        -Dpackaging=zip ^
        -Dfile=tomcat.zip ^
        -DrepositoryId=ysoft-releases ^
        -Durl=http://repo.ysoft.local/content/repositories/releases/