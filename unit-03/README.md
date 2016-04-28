# Don't Leave Data As-Is - Envelope Pattern

In this unit we will use CORB again to apply the the envelope pattern to the documents we denormalized in unit-02. We will also create 2 new elements to place inside our envelope. The first new element will capture a standardized name and value for the employee's job effective date.  The second new element will hold the URI for an employee's associated image. We will perform these updates to our documents in 2 separate passes.

Our first pass with CORB uses the 03-a-\* modules.  These will denormalize the employee tables and place them within an envelope.

Our second pass with CORB uses the 03-b-\* modules. These will update the envelope with 2 new elements, sibling to the source document, which contain a standardized effective-date for the employee as well as the employees image-uri.


## Update Lesson Modules

You will need to update 2 modules:

- 03-a-uris.xqy
 - Update this to return the proper sequence of URIs to be processed


- 03-b-update-envelope.xqy 
 - In this module we'll want to create the URI for the employee images so we can reference these from their associated employee documents.  Take a look at the URI for the image in Query Console for an example. You'll want to use [fn:concat()](http://docs.marklogic.com/fn:concat) to create the URI to be added.

## Deploy Modules

After making your updates, deploy your modules using deploy.sh or deploy.bat as you did in Unit 2.

    $ ../../deploy.sh 03-a-uris.xqy
    $ ../../deploy.sh 03-a-envelope.xqy


## Running Corb

This sample corb command can be used with their supporting files deployed above to envelope the documents we denormalized in unit-02, as well as to pack our envelope with our additional information.

You can use the corb.sh or corb.bat script in the project's base directory to 
run CORB. 

    $ cd unit-03/corb
    $ ../../corb.sh 03-a-myjob.properties

Alternatively, you can run CORB directly:

java -server -cp marklogic-xcc-8.0.4.jar;corb.jar -DOPTIONS-FILE=myjob.properties com.marklogic.developer.corb.Manager

Note: You may need to update your properties to leverage different modules for retrieving the URIs to be processed and the transformations to be applied to them.
