xquery version "1.0-ml";

let $uris := 
     cts:uris('', 'document',
               cts:collection-query(("employee","department","salary"))
             )
return (count($uris), $uris)

