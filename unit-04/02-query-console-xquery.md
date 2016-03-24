# Query Console -- XQuery

Copy the contents of this file into a Query Console Buffer. Make sure the 
Content Source is set to the Employees database and that the Query Type is
set to XQuery. Click Run to see the results. 

## Simple text query

Here we do a simple document search, looking for any documents that contain 
the word "peter". 

Copy this line into a Query Console buffer and run it. 

    cts:search(fn:doc(), "peter")

## Searching in a property

    cts:search(fn:doc(), cts:json-property-value-query("first_name", "peter")
