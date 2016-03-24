xquery version "1.0-ml";

let $uris :=  cts:uris('', 'document',cts:collection-query(("employee-env-v1")))
return (count($uris), $uris)

