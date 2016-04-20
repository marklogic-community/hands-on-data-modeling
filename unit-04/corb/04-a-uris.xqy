xquery version "1.0-ml";

let $uris :=  cts:uris('', 'document',cts:collection-query(("employee-env-v2")))
return (count($uris), $uris)

