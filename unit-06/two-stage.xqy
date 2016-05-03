xquery version "1.0-ml";

module namespace stage = "http://marklogic.com/rest-api/resource/two-stage";

import module namespace search="http://marklogic.com/appservices/search" at "/MarkLogic/appservices/search/search.xqy";

(: find employees in the San Carlos office whose effective-date is at least a year ago
 : @param rs:office  IRI portion after http://dbpedia.org/resource/
 : @param rs:duration  a yearMonthDuration string (example: "P1Y")
 :)
declare function stage:get(
  $context as map:map,
  $params  as map:map
) as document-node()*
{

  let $target-office := xdmp:get-request-field("rs:office")

  let $duration := xdmp:get-request-field("rs:duration")

  (: identify the office numbers in the target city :)
  let $city-office-nums :=
    sem:sparql(
      "prefix emp: <http://www.marklogic.com/employees#> " ||
       "select ?officeNum " ||
       "where { " ||
       "  ?bldg emp:inCity ?city . " ||
       "  ?office emp:inBuilding ?bldg . " ||
       "  ?officeNum emp:inOffice ?office " ||
       "}",
      map:new((
        map:entry('city', sem:iri('http://dbpedia.org/resource/' || $target-office))
      ))
    )

  (: Turn the SPARQL results into a string query :)
  let $office-query :=
    "(" ||
    fn:string-join(
      for $num in $city-office-nums
      return "num:" || map:get($num, 'officeNum'),
      " OR "
    )
    || ")"

  let $one-year-ago := fn:current-date() - xs:yearMonthDuration($duration)

  return
    document {
      search:search(
        "eff LT " || $one-year-ago || " " || $office-query,
        <options xmlns="http://marklogic.com/appservices/search">
          <additional-query>
            <cts:collection-query xmlns:cts="http://marklogic.com/cts">
              <cts:uri>employee-env-v3</cts:uri>
            </cts:collection-query>
          </additional-query>
          <constraint name="eff">
            <range type="xs:date" facet="false">
              <element ns="" name="effective-date"/>
            </range>
          </constraint>
          <constraint name="num">
            <value>
              <element ns="http://marklogic.com/semantics" name="object"/>
            </value>
          </constraint>
        </options>
      )
    }
};
