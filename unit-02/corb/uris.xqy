xquery version "1.0-ml";

(:update uris.xqy to only return the documents from the "denormalized" collection :)

let $uris :=  cts:uris('', 'document',cts:collection-query(("denormalized")))
return (count($uris), $uris)

