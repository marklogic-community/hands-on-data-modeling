xquery version "1.0-ml";

(: update (:update-here:) with the appropriate query and collection name  :)

let $uris :=  cts:uris('', 'document', (:update-here:) )
return (count($uris), $uris)

