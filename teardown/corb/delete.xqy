xquery version "1.0-ml";
declare variable $URI as xs:string external;

let $uri := $URI 
return xdmp:document-delete($uri)
