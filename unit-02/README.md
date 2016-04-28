# Don't Leave Data As-Is - Transforming Content

In this unit we want to denormalize the EmployeeTables documents we loaded using [CORB](http://developer.marklogic.com/code/corb)

## Deploying the Transform

We can deploy the corb modules required using the deploy.sh or deploy.bat script. This script uses the Management API to register the code with MarkLogic. The parameter we pass in is the name of file to be sent. 

    $ ../../deploy.sh 02-uris.xqy
    $ ../../deploy.sh 02-denormalize.xqy

## Running Corb

This sample corb command can be used with their supporting files deployed above to denormalize the .csv documents we loaded in unit-01.

You can use the corb.sh or corb.bat script in the project's base directory to 
run CORB. 

    $ cd unit-02/corb
    $ ../../corb.sh 02-myjob.properties

Alternatively, you can run CORB directly: 

java -server -cp marklogic-xcc-8.0.4.jar;corb.jar -DOPTIONS-FILE=myjob.properties com.marklogic.developer.corb.Manager


