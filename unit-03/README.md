# Don't Leave Data As-Is - Envelope Pattern

In this unit we want to apply the the envelope pattern to the documents we denormalized in unit-01.

# Update Lesson Modules

You will need to update 2 modules:

- 03-a-uris.xqy
 - Update this to return the proper sequence of URIs to be processed


- 03-b-update-envelope.xqy 
 - In this module we'll want to create the URI for the employee images so we can reference these from their associated employee documents.  Take a look at the URI for the image in Query Console for an example. You'll want to use [fn:concat()](http://docs.marklogic.com/fn:concat) to create the URI to be added.

#Deploy Modules

Deploy your modules using deploy.sh as you did in Unit 2.

#Run Corb

Sample CORB command: 

java -server -cp marklogic-xcc-8.0.4.jar;corb.jar -DOPTIONS-FILE=myjob.properties com.marklogic.developer.corb.Manager

Note: You may need to update your properties to leverage different modules for retrieving the URIs to be processed and the transformation to be applied to them.
