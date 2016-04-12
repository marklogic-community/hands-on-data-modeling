# Use this to deploy source code to the modules database.
# 
# Usage:
#   deploy.sh <filename to deploy>
# Example
# cd unit-01/corb
# ../../deploy.sh 01-uris.xqy

USERNAME="dr-who" #update if required
PASSWORD="doctor" #update if required

echo Deploying $1

curl --anyauth --user $USERNAME:$PASSWORD -X PUT --data-binary @$1 \
  -i -H "Content-type: application/xquery" \
  "http://localhost:8080/v1/ext/corb/$1?perm:rest-reader=read&perm:rest-writer=update&perm:modeler=execute"
