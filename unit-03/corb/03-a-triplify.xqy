xquery version "1.0-ml";

import module namespace sem = "http://marklogic.com/semantics"
   at "../MarkLogic/semantics.xqy";

(: add triple to document mapping employee id to office number :)
(: an external ontology will map office numbers to buildings to cities, to states, etc. :)

declare variable $URI as xs:string external;

let $doc := fn:doc($URI)
let $new-uri := fn:concat("/employees-v3/", fn:tokenize($URI,"/")[fn:last()])

let $sem-prefix := "http://www.marklogic.com/employees"
let $emp_id := $doc/employee/root/emp_id/fn:string(.)
let $office-number := $doc/employee/root/office_number/fn:string(.)

let $triple :=  sem:triple(sem:iri(fn:concat($sem-prefix,"#empID",$emp_id)), 
                           sem:iri(fn:concat($sem-prefix,"","#hasOffice")), 
                           sem:iri(fn:concat($sem-prefix,"#officeNumber", $office-number )))
                       
let $update :=
           <employee>
              {
              $triple,
              $doc/employee/*
              }
           </employee>

return xdmp:document-insert($new-uri, $update, (), "employee-env-v3") 

