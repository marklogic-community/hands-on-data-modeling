# The MarkLogic REST API

## Parts of the REST API

- client API
  - search, document CRUD. We'll focus on search
  - can be used with any programming language that can send HTTP requests
- Management API
  - CRUD on app servers, databases, etc. 

## Example Query

The REST Client API supports a variety of seach types. Here is the familiar 
string query that we saw in the earlier files: 

    http://localhost:8080/v1/search?q=peter

