xquery version "1.0-ml";

let $uris :=  cts:uris('', 'document',cts:collection-query(("employee")))
return (count($uris), $uris)

