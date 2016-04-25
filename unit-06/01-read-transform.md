# Read Transforms

A read transform allows us to change the contents of a document as we read it from the database. To illustrate this, we'll use a simple transform called "unpack", which retrieves the original content from the envelope. 

Take a look at the code in `unpack.xqy`. There's one function, which receives the whole document being requested. The function then gets the "root" element and returns just that part. 

## Deploying the Transform

We can deploy this code using the deploy-transform.sh script. This script uses the Management API to register the code with MarkLogic. The parameters we pass in are the file to be send and the name of the transform, which will be used to call it. 

    $ ./deploy-transform unpack.xqy unpack

## Calling the Transform

 Use the following curl command to retrieve a document.

 Note: Windows users may need to replace ' with ".

    curl --digest --user rory:rory \
        'http://localhost:8080/v1/documents?uri=/employees-v3/EmployeeTable.csv-0-562.xml'

MarkLogic returns the entire document. Now try it again, but this time specify the transform. 

    curl --digest --user rory:rory \
        'http://localhost:8080/v1/documents?uri=/employees-v3/EmployeeTable.csv-0-562.xml&transform=unpack'

This time, we get back just the `root` part of the document. 
