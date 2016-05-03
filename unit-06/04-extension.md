# REST API Service Extensions

What do you do when the REST API doesn't have an endpoint for what you need?
Extend it! By extending the API, you can do things that would take multiple 
calls or couldn't otherwise be done. 

## Example: 2-stage query

As we saw in Unit 4, sometimes it's helpful to do a 2-stage query, where the 
first stage gathers information for the second stage. We can do a 2-stage query
through the REST API by executing the first stage, then using the results in 
the middle tier to build the second stage. We can simplify this process by 
writing an extension to the REST API that handles both stages. Doing so keeps
our application tier code simpler and improves performance by reducing the 
number of HTTP requests that need to go between the layers. 

## Implementing an Extension

A REST API extension must provide a library function with a certain signature,
as specified in the documentation ([XQuery][XQuery docs], 
[JavaScript][JS docs]). Within that function, we can write whatever code we 
want using MarkLogic's XQuery and JavaScript APIs. 

two-stage.xqy is an example of doing this. This module implements a "get" 
function, corresponding to the HTTP verb. 

## Deploying an Extension

We have provided a script that passes a REST API extension to MarkLogic. Give
it the name of the file to deploy and the name under which it will be called.
Note that the name must match the namespace used in the file. 

    ./deploy-extension.sh two-stage.xqy two-stage

## Calling an Extension

In Query Console, the "using an extension" buffer illustrates calling our new
extension. 

[XQuery docs]: http://docs.marklogic.com/guide/rest-dev/extensions#id_41710
[JS docs]: http://docs.marklogic.com/guide/rest-dev/extensions#id_21018
