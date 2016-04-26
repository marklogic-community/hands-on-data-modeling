REM Use this to deploy source code to the modules database.
REM  
REM Usage:
REM   deploy.bat <filename to deploy>
REM Example
REM  cd unit-01/corb
REM ../../deploy.bat 01-uris.xqy

REM Update if required
SET USERNAME="dr-who"
SET PASSWORD="doctor"

SET ARG1=%1


echo "Deploying" %ARG1%

curl --anyauth --user %USERNAME%:%PASSWORD% -X PUT -d@%ARG1% -i -H "Content-type: application/vnd.marklogic-xdmp" "http://localhost:8080/v1/ext/corb/%ARG1%?perm:rest-reader=read&perm:rest-writer=update&perm:modeler=execute"


