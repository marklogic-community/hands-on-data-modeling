REM Remove the application server and databases

REM Update if required
SET USERNAME="admin"
SET PASSWORD="admin"

echo "Removing the app server and databases - "
curl --anyauth --user %USERNAME%:%PASSWORD% -X DELETE "http://localhost:8002/v1/rest-apis/employees-app-server?include=content&include=modules"

echo 'Done.'
