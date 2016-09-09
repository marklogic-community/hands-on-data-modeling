# Don't Leave Data As-Is - Transforming Content

In this unit we want to use [CORB](http://developer.marklogic.com/code/corb) to denormalize the EmployeeTables documents we loaded in unit-01 using MLCP.

## Running CORB

This sample CORB command can be used with their supporting files deployed above to denormalize the .csv documents we loaded in unit-01.

You can use the corb.sh or corb.bat script in the project's base directory to 
run CORB. 

    $ cd unit-02/corb
    $ ../../corb.sh 02-myjob.properties

Alternatively, you can run CORB directly: 

java -server -cp marklogic-xcc-8.0.4.jar;corb.jar -DOPTIONS-FILE=myjob.properties com.marklogic.developer.corb.Manager


