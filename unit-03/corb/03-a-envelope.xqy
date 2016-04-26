xquery version "1.0-ml";

(: first denormalize and stuff the contents into an envelope :)

declare variable $URI as xs:string external;

let $doc := fn:doc($URI) 
let $new-uri := fn:concat("/employees", $URI)
let $emp_id := fn:string($doc/root/emp_id)
let $dept_num := fn:string($doc/root/dept_num)

let $dept_info := fn:collection("department")/root[dept_num eq $dept_num]/(* except dept_num)
let $salary_info := fn:collection("salary")/root[emp_id eq $emp_id]/(* except emp_id)

let $envelope :=
     <employee>
       <root>
         {$doc/root/*,
          $dept_info,
          $salary_info}
       </root>
     </employee>

return
  xdmp:document-insert(
    $new-uri,
    $envelope,
    xdmp:document-get-permissions($URI),
    "employee-env-v1")
