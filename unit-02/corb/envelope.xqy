xquery version "1.0-ml";

(: update envelope.xqy to add the image uri to the envelope :)
(: update envelope.xqy to add any associated review uri to the envelope :)

declare variable $URI as xs:string external;

let $doc := fn:doc($URI) 
let $job-eff-date := fn:string($doc/root/job_effective_date)
let $job-eff-date-toks := fn:tokenize($job-eff-date, "/")
let $upd-jed-date := fn:concat($job-eff-date-toks[3],"-",
                               $job-eff-date-toks[1],"-",
                               $job-eff-date-toks[2])

let $envelope :=
           <employee>
             <effective-date>{$upd-jed-date}</effective-date>
              { $doc }
           </employee>


return xdmp:document-insert($URI, $envelope, (), "envelope")
