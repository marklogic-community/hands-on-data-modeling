#Setting up the Database for the Geophoto application, including the indexes

USERNAME="admin" #update if required
PASSWORD="admin" #update if required

echo 'Removing the users'
curl --anyauth -u $USERNAME:$PASSWORD -X DELETE http://localhost:8002/manage/v2/users/amy
curl --anyauth -u $USERNAME:$PASSWORD -X DELETE http://localhost:8002/manage/v2/users/rory
curl --anyauth -u $USERNAME:$PASSWORD -X DELETE http://localhost:8002/manage/v2/users/dr-who

echo 'Removing the role'
curl --anyauth -u $USERNAME:$PASSWORD -X DELETE http://localhost:8002/manage/v2/roles/modeler

echo 'Removing the app server and databases'
curl --anyauth --user $USERNAME:$PASSWORD -X DELETE 'http://localhost:8002/v1/rest-apis/employees-app-server?include=content&include=modules'

echo 'Done.'
