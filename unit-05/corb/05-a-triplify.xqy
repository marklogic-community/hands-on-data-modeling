xquery version "1.0-ml";

import module namespace sem = "http://marklogic.com/semantics"
   at "/MarkLogic/semantics.xqy";

(: Add one triple to document mapping employee id to office number 
   An external ontology will map office numbers to buildings to cities, to states, etc. 

example:   empID hasOffice officeNumber .

   Add another triple that represents who this employee reports to.

example:   empID reportsTo empID .

:)

declare variable $URI as xs:string external;

let $doc := fn:doc($URI)
let $new-uri := fn:concat("/employees-v3/", fn:tokenize($URI,"/")[fn:last()])

let $sem-prefix := "http://www.marklogic.com/employees#"
let $emp_id := $doc/employee/content/emp_id/fn:string(.)
let $office-number := $doc/employee/content/office_number/fn:string(.)

(:
 : Represent the reportsTo object as an IRI, not just a number, because we'll
 : use the that IRI in a chain query.
 :)
let $triples := (
  sem:triple(sem:iri($sem-prefix || "empID" || $emp_id),
             sem:iri($sem-prefix || "hasOffice"),
             sem:iri($sem-prefix || "officeNumber" || $office-number )),

  sem:triple(sem:iri($sem-prefix || "empID" || $emp_id),
             sem:iri($sem-prefix || "reportsTo"),
             sem:iri($sem-prefix || "empID" || $doc/employee/content/reports_to/fn:string()))
)

let $update :=
  <employee>
    {
      $triples,
      $doc/employee/*
    }
  </employee>

return
  xdmp:document-insert(
    $new-uri,
    $update,
    xdmp:document-get-permissions($URI),
    "employee-env-v3")
