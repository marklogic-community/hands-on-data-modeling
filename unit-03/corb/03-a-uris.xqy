xquery version "1.0-ml";

(: Replace (:update-here:) with the appropriate query and collection name  :)

let $uris :=  cts:uris('', 'document', (:update-here:) )
return (count($uris), $uris)

