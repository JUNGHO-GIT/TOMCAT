@echo off
setlocal EnableDelayedExpansion
echo "Start to set environment variables !"

set "JAVA_HOME=C:\JUNGHO\1.Language\1.JAVA\3.jdk17"
set "JAVA_HOME2=C:\JUNGHO\1.Language\1.JAVA\2.jdk11"
set "JAVA_HOME3=C:\JUNGHO\1.Language\1.JAVA\1.jdk1.8"
set "GIT_HOME=C:\JUNGHO\1.Language\3.GIT"
set "NODE_HOME=C:\JUNGHO\1.Language\2.Nodejs"
set "PHP_HOME=C:\JUNGHO\1.Language\4.PHP\2.php8"
set "PYTHON_HOME=C:\JUNGHO\1.Language\0.Python"
set "MAVEN_HOME=C:\JUNGHO\1.Language\5.Maven"
set "GRADLE_HOME=C:\JUNGHO\1.Language\6.Gradle"
set "MONGOD_HOME=C:\JUNGHO\5.SQL\0.MongoDB"
set "MYSQL_HOME=C:\JUNGHO\5.SQL\1.MySQL"
set "JAVA_TOOLS_OPTIONS=-Xms1g -Xmx6g -XX:MaxMetaspaceSize=2g -XX:ReservedCodeCacheSize=512m -XX:+UseG1GC -XX:+UseCompressedOops -XX:+UseStringDeduplication -XX:+JITServerUseAOTCache -XX:+PortableSharedCache -XX:+EnableCPUMonitor -XX:+GlobalLockReservation -XX:+IdleTuningCompactOnIdle -XX:NativeMemoryTracking=summary -XX:+TransparentHugePage -XX:+CompactStrings -XX:+DisableExplicitGC -XX:+EnableDynamicAgentLoading -XX:+UseContainerSupport -XX:+UseJITServer -Dfile.encoding=UTF-8"
set "CATALINA_OPTS=-Xms1g -Xmx6g -XX:MaxMetaspaceSize=2g -XX:ReservedCodeCacheSize=512m -XX:+UseG1GC -XX:+UseCompressedOops -XX:+UseStringDeduplication -XX:+JITServerUseAOTCache -XX:+PortableSharedCache -XX:+EnableCPUMonitor -XX:+GlobalLockReservation -XX:+IdleTuningCompactOnIdle -XX:NativeMemoryTracking=summary -XX:+TransparentHugePage -XX:+CompactStrings -XX:+DisableExplicitGC -XX:+EnableDynamicAgentLoading -XX:+UseContainerSupport -XX:+UseJITServer -Dfile.encoding=UTF-8"

setx JAVA_HOME "%JAVA_HOME%" /M
setx JAVA_HOME2 "%JAVA_HOME2%" /M
setx JAVA_HOME3 "%JAVA_HOME3%" /M
setx GIT_HOME "%GIT_HOME%" /M
setx NODE_HOME "%NODE_HOME%" /M
setx PHP_HOME "%PHP_HOME%" /M
setx PYTHON_HOME "%PYTHON_HOME%" /M
setx MAVEN_HOME "%MAVEN_HOME%" /M
setx GRADLE_HOME "%GRADLE_HOME%" /M
setx MONGOD_HOME "%MONGOD_HOME%" /M
setx MYSQL_HOME "%MYSQL_HOME%" /M
setx JAVA_TOOLS_OPTIONS "%JAVA_TOOLS_OPTIONS%" /M
setx CATALINA_OPTS "%CATALINA_OPTS%" /M

pause

SET "Key=HKLM\System\CurrentControlSet\Control\Session Manager\Environment"
SET "ValueName=PATH"
SET "AddPath=%JAVA_HOME%\bin;%JAVA_HOME2%\bin;%JAVA_HOME3%\bin;%GIT_HOME%\bin;%NODE_HOME%;%PHP_HOME%\;%MAVEN_HOME%\bin;%MONGOD_HOME%\bin;%MYSQL_HOME%\bin;%PYTHON_HOME%\Scripts;"

REM Get existing PATH variable value
FOR /F "tokens=2,*" %%A IN ('REG QUERY "%Key%" /v %ValueName%') DO (
  SET "CurrentValue=%%B"
)

REM Remove any existing entries from AddPath in CurrentValue
FOR %%I IN (%JAVA_HOME%\bin %JAVA_HOME2%\bin %JAVA_HOME3%\bin %GIT_HOME%\bin %NODE_HOME% %PHP_HOME%\ %MAVEN_HOME%\bin %MONGOD_HOME%\bin %MYSQL_HOME%\bin %PYTHON_HOME%\Scripts) DO (
  SET "CurrentValue=!CurrentValue:%%I=!"
)

REM Append the cleaned CurrentValue to AddPath
SET "NewValue=%AddPath%!CurrentValue!"

REM Update PATH variable
REG ADD "%Key%" /v %ValueName% /t REG_EXPAND_SZ /d "!NewValue!" /f

echo "Complete setting environment variables!"
pause
