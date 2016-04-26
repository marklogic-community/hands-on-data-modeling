REM Use this to deploy source code to the modules database.
REM  
REM Usage:
REM   deploy-extension.bat <filename to deploy> <name of extension>

REM Update if required
SET USERNAME="dr-who"
SET PASSWORD="doctor"

SET ARG1=%1
SET ARG2=%2


echo "Deploying" %ARG1% as %ARG2%

REM If deploying an JavaScript extension, change the Content-type to
REM application/vnd.marklogic-javascript

curl --anyauth --user %USERNAME%:%PASSWORD% -X PUT -d@%ARG1% -i -H "Content-type: application/xquery" "http://localhost:8080/v1/config/resources/%ARG2%"


