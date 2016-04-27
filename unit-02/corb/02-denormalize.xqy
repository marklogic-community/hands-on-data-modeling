xquery version "1.0-ml";
declare variable $URI as xs:string external;

let $doc := fn:doc($URI) 
let $new-uri := fn:concat("/denormalized", $URI)
let $emp_id := fn:string($doc/content/emp_id)
let $dept_num := fn:string($doc/content/dept_num)

let $dept_info := fn:collection("department")/root[dept_num eq $dept_num]/(* except dept_num)
let $salary_info := fn:collection("salary")/root[emp_id eq $emp_id]/(* except emp_id)

let $final :=
       <content>
         {$doc/content/*,
          $dept_info,
          $salary_info}
       </content>

return
  xdmp:document-insert(
    $new-uri,
    $final,
    xdmp:document-get-permissions($URI),
    "denormalized")
