# Triples

In this unit we will use semantic triples to connect our envelope document to an ontology that we will load separately. These additional triples will provide addtional context (using triples from our world, and triples from our domain) so we can create richer queries against our employees.  We will also represent the reports to relationship relationship of an employee as a triple within the envelope (triples within our documents). This will allow us to use SPARQL to query who reports to who.

First we will load additional data using mlcp.  Second we will update our envelope document with triples using CORB.

## Load Triples using MLCP

We will load the following datasets using mlcp.

- ../data/offices.ttl
- ../data/locations.n3

offices.ttl is an internal ontology, created by the fictional company of our employees, to provide a mapping between office numbers and the city an office is located in.  This is an example of triples from our domain.

locations.n3 is a subset of DBPedia.  This ontology relates cities to states and countries.  This is an example of triples from our world.

The following sample mlcp command demonstrates how to load a RDF file. Refer to the .cfg files for details on which paramters are being passed to mlcp. Use mlcp to load both data files.

    $ mlcp.bat -options_file offices.cfg

See the [MLCP](http://docs.marklogic.com/guide/mlcp) guide for more information.

## Update Lesson Modules

You will need to update the following module:

- 04-a-triplify.xqy
 - Update this to create a sem:triple() that creates the triple: empID hasOffice officeNumber . 

The triples created will be inserted sibling to the source document and the additional information we've already added to the envelope.

## Deploy Modules

After making your updates, deploy your modules using deploy.sh or deploy.bat as you did in Unit 2.

    $ ../../deploy.sh 04-a-uris.xqy
    $ ../../deploy.sh 04-a-triplify.xqy


## Running CORB 

This sample CORB command can be used with their supporting files deployed above to add triples to the documents we enveloped and updated in unit-03.

You can use the corb.sh or corb.bat script in the project's base directory to 
run CORB. 

    $ cd unit-04/corb
    $ ../../corb.sh 04-a-myjob.properties

Alternatively, you can run CORB directly:

java -server -cp marklogic-xcc-8.0.4.jar;corb.jar -DOPTIONS-FILE=myjob.properties com.marklogic.developer.corb.Manager

