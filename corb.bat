REM Run MLCP with an options file

REM To use this script, copy your CORB and XCC JARs to the lib directory under
REM your projects home directory

REM The first parameter is the options file to use
SET OPTIONS=%1

SET SCRIPT_DIR=%~dp0
REM SET SCRIPT_DIR=C:\Corb8\

SET CLASSPATH=%SCRIPT_DIR%lib\marklogic-corb-2.3.0.jar;%SCRIPT_DIR%lib\marklogic-xcc-8.0.5.jar
REM SET CLASSPATH=%SCRIPT_DIR%corb.jar;%SCRIPT_DIR%marklogic-xcc-8.0.4.jar

java -server ^
  -cp %CLASSPATH% ^
  -DOPTIONS-FILE=%OPTIONS% ^
  com.marklogic.developer.corb.Manager
