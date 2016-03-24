# How else might we change these employee documents? 

This exercise is a discussion. 

1. What other changes might we want to make in our document structure? 
2. Should these changes be made in the documents or as run-time transforms?
3. For changes in the documents, how would we make those changes? 
4. What additional data might we need? How should we represent it? (managed
triples? in-document triples? new elements?)

## Thoughts

*What other changes might we want to make in our document structure?*

There are lots of changes we could make. A key point is that these changes 
should be driven by requirements of the application we are building. 

*Should these changes be made in the documents or as run-time transforms?*

Some general principles:

* documents should be structured to support search/discovery; transforms should present data according to consumers' need (schema on read)
* if the transform is expensive, build it into the document instead (where possible)
* denormalize to help search, but keep frequently changing data in just one place

*For changes in the documents, how would we make those changes?*

Some options:

* CORB/Query Console
* modify ingest process (schema on write)

Most likely, both of these will need to be used. We'll modify the ingest 
process to get the new format for incoming data, but we'll use CORB or Query
Console to modify existing data. 

In many cases, we'll supplement data rather than changing things in place. For
instance, instead of changing `<hire_date>2/10/2007</hire_date>` to 
`<hire_date>2007-02-10</hire_date>`, we could add an envelope element with the
new date format (under a different name) or add an attribute:
`<hire_date canonical="2007-02-10">2/10/2007</hire_date>`. This type of change
makes it possible to display the original form (often desired) as well as 
simplifying change management in the application layer. 

*What additional data might we need? How should we represent it? (managed
triples? in-document triples? new elements?)*

We may need to bring in additional data sources or identify external services 
to supplement our data. For instance, we might use a geo-lookup or entity 
extraction service. We might add an ontology to our database to enable more 
interesting lookups. 