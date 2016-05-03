# Deleting Documents Using Corb 

CORB can be very useful for deleting documents as well. While for the workshop, Query Console can be used to delete various documents individually or by collection, we provide this example of deleting documents using CORB for when working with larger sets of information in the database.

## Deploying the Transform

We can deploy the CORB modules required using the deploy.sh or deploy.bat script. This script uses the Management API to register the code with MarkLogic. The parameter we pass in is the name of file to be sent. 

    $ ../../deploy.sh uris.xqy
    $ ../../deploy.sh delete.xqy

## Running CORB

This sample CORB command can be used with their supporting files deployed above to delete documents loaded into the Employees database.

You can use the corb.sh or corb.bat script in the project's base directory to 
run CORB. 

    $ cd teardown/corb
    $ ../../corb.sh delete-myjob.properties

Alternatively, you can run CORB directly: 

java -server -cp marklogic-xcc-8.0.4.jar;corb.jar -DOPTIONS-FILE=delete-myjob.properties com.marklogic.developer.corb.Manager


