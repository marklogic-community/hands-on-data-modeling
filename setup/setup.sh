#Setting up the Database for the Geophoto application, including the indexes

USERNAME="admin" #update if required
PASSWORD="admin" #update if required

echo 'Setting up the app server and databases - '
curl --anyauth --user $USERNAME:$PASSWORD -X POST -d@"rest.json" -i -H "Content-type: application/json" http://localhost:8002/v1/rest-apis

echo 'Adding indexes'
curl --anyauth --user $USERNAME:$PASSWORD -X PUT -d@"database.json" -i -H "Content-type: application/json" http://localhost:8002/manage/v2/databases/Employees/properties

echo 'Adding role'
curl  --anyauth --user $USERNAME:$PASSWORD -X POST -d@"modeler.json" -H "Content-Type:application/json" http://localhost:8002/manage/v2/roles

echo 'Adding users'
curl --anyauth --user $USERNAME:$PASSWORD -X POST -d@"user-reader.json" -i -H "Content-type: application/json" http://localhost:8002/manage/v2/users
curl --anyauth --user $USERNAME:$PASSWORD -X POST -d@"user-writer.json" -i -H "Content-type: application/json" http://localhost:8002/manage/v2/users
curl --anyauth --user $USERNAME:$PASSWORD -X POST -d@"user-admin.json" -i -H "Content-type: application/json" http://localhost:8002/manage/v2/users

echo 'Done.'
