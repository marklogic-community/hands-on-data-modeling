# Use this to deploy source code to the modules database.
# 
# Usage:
#   deploy.sh <filename to deploy> <uri in modules database>
# Example
# ./deploy.sh unit-01/corb/uris.xqy /corb/uris.xqy
#   or from the unit-01 directory
# ../deploy.sh corb/uris.xqy /corb/uris.xqy

USERNAME="admin" #update if required
PASSWORD="admin" #update if required

echo Deploying $1 as $2

curl --anyauth --user $USERNAME:$PASSWORD -X PUT --data-binary @$1 \
  -i -H "Content-type: application/vnd.marklogic-javascript" \
  "http://localhost:8080/v1/config/transforms/$2"
