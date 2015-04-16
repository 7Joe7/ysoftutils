mvn -B deploy:deploy-file -DgroupId=com.ysoft.safeq.tools ^
        -DartifactId=com.ysoft.safeq.tools.adapi-yps ^
        -Dversion=1.0.0 ^
        -Dpackaging=zip ^
        -Dfile=adapi.zip ^
        -DrepositoryId=ysoft-releases ^
        -Durl=http://repo.ysoft.local/content/repositories/releases/