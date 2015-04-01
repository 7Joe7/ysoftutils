mvn -B deploy:deploy-file -DgroupId=com.cratchpaper.nsis ^
        -DartifactId=unsis ^
        -Dversion=2.46.5.5-YSOFT ^
        -Dpackaging=zip ^
        -Dfile=unsis-2.46.5.5-YSOFT.zip ^
        -DrepositoryId=ysoft-releases ^
        -Durl=http://repo.ysoft.local/content/repositories/releases/