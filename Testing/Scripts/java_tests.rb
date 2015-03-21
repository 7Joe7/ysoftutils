# runs all the commands for connecting to remote databases with different Java JRE
# to run it all use the function run_all
# specify addresses for your system

require 'open3'

JAVA = [
    { path: 'C:\Progra~2\Java\jre1.8.0_40\bin\java.exe', msg: 'Java 1.8 32bit', sixty_four: false},
    { path: 'C:\Progra~2\Java\jre7\bin\java.exe', msg: 'Java 1.7 32bit', sixty_four: false},
    { path: 'C:\Progra~2\Java\jre6\bin\java.exe', msg: 'Java 1.6 32bit', sixty_four: false},
    { path: 'C:\Progra~1\Java\jre1.8.0_40\bin\java.exe', msg: 'Java 1.8 64bit', sixty_four: true},
    { path: 'C:\Progra~1\Java\jre7\bin\java.exe', msg: 'Java 1.7 64bit', sixty_four: true},
    { path: 'C:\Progra~1\Java\jre6\bin\java.exe', msg: 'Java 1.6 64bit', sixty_four: true},
    { path: 'java', msg: 'Environment Java', sixty_four: true }
]

DBAPI = {
    s: {path: 'C:\Users\erneker\Documents\libs\dbapi.jar', msg: 'Standard dbapi driver'},
    p: {path: 'C:\Users\erneker\Documents\Projects\dbapi\classes\artifacts\dbapi_jar', msg: 'dbapi patched driver'}
}

PARS = {
    db_tools: {path: 'C:\Users\erneker\Documents\libs\dbtools.jar', msg: 'DB_TOOLS'},
    postgres: {path: 'C:\Users\erneker\Documents\libs\postgresql.jar', msg: 'Standard Postgres driver'},
    liquibase_jar: {path: 'C:\Users\erneker\AppData\Local\Temp\liquibase-core.jar', msg: 'Liquibase 3.3.2'},
    database_changelog: {path: 'C:\Users\erneker\AppData\Local\Temp\database-changelog.jar', msg: 'Database-changelog'},
    yps_inst_dir: {path: 'C:\Program Files (x86)\YSoft Payment System'},
    tomcat: {path: "#{PARS[:yps_inst_dir]}\bin\tomcat7.exe"},
    payment_svc: {name: 'YSoftPaymentSystem', display: 'YSoft Payment System', description: 'YSoft Payment service'},
    bootstrap: {path: "#{PARS[:yps_inst_dir]}\bin\bootstrap.jar"}
}

MS_SQL = {
    db_name: 'joe-test',
    username: 'sa',
    password: 'sa',
    ip: '10.0.11.172',
    port: '1433',
    jtds128p: {path: 'C:\Users\erneker\Documents\Projects\jtds-1.2.8-src\classes\artifacts\jtds_jar2\jtds.jar', msg: 'JTDS 1.2.8 patched driver'},
    jtds131p: {path: 'C:\Users\erneker\Documents\Projects\jtds-1.3.1-src\out\artifacts\jtds_1_3_1_src_jar3\jtds-1.3.1-src.jar', msg: 'JTDS 1.3.1 patched driver'},
    jtds128: {path: 'C:\Users\erneker\Documents\libs\jtds-1.2.8.jar', msg: 'JTDS 1.2.8 driver'},
    jtds131: {path: 'C:\Users\erneker\Documents\libs\jtds-1.3.1.jar', msg: 'JTDS 1.3.1 driver'},
    sql4p: {path: 'C:\Users\erneker\Documents\libs\sqljdbc4.jar', msg: 'SQL JDBC 4 driver'}
}

COMMANDS = {
    update_liquibase: {
        command: "%s -jar #{PARS[:liquibase_jar][:path]} " +
        "--classpath=\"%s;#{PARS[:database_changelog][:path]}\" " +
        "--changeLogFile=changelog.xml --username=#{MS_SQL[:username]} --url=jdbc:jtds:sqlserver://#{MS_SQL[:ip]}:#{MS_SQL[:port]}/#{MS_SQL[:db_name]} " +
        "--driver=net.sourceforge.jtds.jdbc.Driver --password=#{MS_SQL[:password]} update"},
    test_db: {
        command: "%s %s -cp \"#{PARS[:db_tools][:path]};%s;#{PARS[:postgres][:path]};%s\" " +
        "com.ysoft.db.dbapi.DBBuilder type=MSSQL ip=#{MS_SQL[:ip]} user=#{MS_SQL[:username]} " +
        "\"pass=#{MS_SQL[:password]}\" port=#{MS_SQL[:port]} ssl=true database=#{MS_SQL[:db_name]} " +
        "action=TEST_DB \"\""},
    install_tomcat: {
        command: "\"C:\\Program Files (x86)\\YSoft Payment System\bin\tomcat7.exe\" //IS//YSoftPaymentSystem --DisplayName=\"YSoft Payment System\" --Description=\"YSoft System service\" --Startup=auto --StartMode=jvm --StopMode=jvm --StartClass=org.apache.catalina.startup.Bootstrap --StartParams=start --StopClass=org.apache.catalina.startup.Bootstrap --StopParams=stop --Jvm=\"C:\\SafeQ5\\java\bin\server\\jvm.dll\" --Classpath=\"C:\\Program Files (x86)\\YSoft Payment System\bin\bootstrap.jar;C:\\Program Files (x86)\\YSoft Payment System\bin\tomcat-juli.jar;C:\\Program Files (x86)\\YSoft Payment System\\payment-conf\\jdbc-drivers\\*;C:\\Program Files (x86)\\YSoft Payment System\\payment-conf\environment-configuration.properties\" --JvmOptions=\"-Dcatalina.home=C:\\Program Files (x86)\\YSoft Payment System;-Dcatalina.base=C:\\Program Files (x86)\\YSoft Payment System;-Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager;-Djava.util.logging.config.file=C:\\Program Files (x86)\\YSoft Payment System\conf\\logging.properties;-XX:MaxPermSize=128m;-XX:PermSize=64m\" --LogPath=\"C:\\Program Files (x86)\\YSoft Payment System\\logs\" --StartPath=\"C:\\Program Files (x86)\\YSoft Payment System\""
    }
    # tomcat_register: {
    #     command: "'#{PARS[:tomcat][:path]} //IS//#{PARS[:payment_svc][:name]} --DisplayName=\"#{PARS[:payment_svc][:description]}\" --Description=\"#{PARS[:payment_svc][:description]}\" " +
    #         "--Startup=auto --StartMode=jvm --StopMode=jvm --Jvm="$javaJvmPath" --StartClass=org.apache.catalina.startup.Bootstrap --StartParams=start --StopClass=org.apache.catalina.startup.Bootstrap " +
    #         "--StopParams=stop --Classpath=\"#{PARS[:bootstrap][:path]};$INSTDIR\bin\tomcat-juli.jar;$INSTDIR\payment-conf\jdbc-drivers\*;$INSTDIR\payment-conf\environment-configuration.properties" " +
    #         "--JvmOptions="-Dcatalina.home=$INSTDIR;-Dcatalina.base=$INSTDIR;-Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager;-Djava.util.logging.config.file=$INSTDIR\conf\logging.properties;-XX:MaxPermSize=128m;-XX:PermSize=64m" \
    #                                             --LogPath="$INSTDIR\logs" \
    #                                             --StartPath="$INSTDIR" '"
    # }
}

OUTPUT_FOLDER = '../Outputs/'

def divide(level = 0)
  puts if level > 0
  puts '-----------------------------------------------------------------------'
end

def for_each_java(output_file_name)
  $stdout.reopen("#{OUTPUT_FOLDER}#{output_file_name}.txt", 'w')
  JAVA.each do |java|
    command = yield java
    puts "Command: #{command}"
    divide
    stdout, stderr, success = Open3.capture3(command)
    puts "Success: #{success}"
    divide
    if stdout.size > 0
      puts "StdOut:\n#{stdout}"
      divide
    end
    if stderr.size > 0
      puts "StdErr:\n#{stderr}"
      divide
    end
  end
  divide(1)
end

def test_db(ms_sql, dbapi)
  for_each_java('test_db') do |java|
    puts "Testing with:
Java:             #{java[:msg]},
MS_SQL driver:    #{ms_sql[:msg]},
DB API driver:    #{dbapi[:msg]}"
    divide
    COMMANDS[:test_db][:command] % [java[:path], java[:sixty_four] ? '-server' : '', ms_sql[:path], dbapi[:path]]
  end
end

def run_all
  MS_SQL.each { |_, mssql| DBAPI.each { |_, dbapi| test_db(mssql, dbapi) } }
end

def update_liquibase(ms_sql)
  for_each_java('update_liquibase') do |java|
    puts "Testing with:
Java:             #{java[:msg]}"
    divide
    COMMANDS[:update_liquibase][:command] % [java[:path], ms_sql[:path]]
  end
end

def install_tomcat
  COMMANDS[:install_tomcat][:command]
end

# update_liquibase(MS_SQL[:jtds128p])
# test_db(MS_SQL[:jtds128p], DBAPI[:s])
# test_db(MS_SQL[:sql4p], DBAPI[:p])