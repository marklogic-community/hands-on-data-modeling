xquery version "1.0-ml";

(: update envelope.xqy to add the image uri to the envelope :)
(: update envelope.xqy to add any associated review uri to the envelope :)

declare variable $URI as xs:string external;

let $doc := fn:doc($URI)
let $new-uri := fn:concat("/employees-v2/", fn:tokenize($URI,"/")[fn:last()])
let $emp-id := fn:string($doc/employee/root/emp_id)
let $first-name := fn:string($doc/employee/root/first_name)
let $last-name := fn:string($doc/employee/root/last_name)
let $job-eff-date := fn:string($doc/employee/root/job_effective_date)
let $job-eff-date-toks := fn:tokenize($job-eff-date, "/")
let $upd-jed-date := fn:concat($job-eff-date-toks[3],"-",
                               $job-eff-date-toks[1],"-",
                               $job-eff-date-toks[2])
let $image-uri := fn:concat("/",fn:lower-case($first-name), "-", fn:lower-case($last-name), "-", $emp-id,".png")

let $rev-doc := fn:collection("reviews")/review[member-id eq $emp-id]
let $rev-doc-uri-elem := if (fn:empty($rev-doc)) then 
                           ()
                         else 
                           <review-uri>{xdmp:node-uri($rev-doc)}</review-uri>
                      
let $update :=
           <employee>
             <effective-date>{$upd-jed-date}</effective-date>
             <image-uri>{$image-uri}</image-uri>
             {$rev-doc-uri-elem,
              $doc/employee/*}
           </employee>

return
  xdmp:document-insert(
    $new-uri,
    $update,
    xdmp:document-get-permissions($URI),
    "employee-env-v2")
