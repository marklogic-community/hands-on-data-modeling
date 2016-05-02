xquery version "1.0-ml";

module namespace direct = "http://marklogic.com/rest-api/transform/direct-reports";

declare namespace search = "http://marklogic.com/appservices/search";

declare function direct:calculate-direct-reports($uri) 
{
  let $id := fn:doc($uri)/employee/content/emp_id/fn:string()
  return xdmp:estimate(cts:search(fn:doc(), cts:element-value-query(xs:QName('reports_to'), $id)))
};

declare function direct:add($node)
{
  typeswitch ($node)
  case element(search:result)
    return element { fn:node-name($node) } {
      $node/@*,
      element search:direct-reports {
        direct:calculate-direct-reports($node/@uri)
      },
      $node/node() ! direct:add(.)
    }
  case element()
    return element { fn:node-name($node) } {
      $node/@*,
      $node/node() ! direct:add(.)
    }
  case document-node()
    return document {
      $node/node() ! direct:add(.)
    }
  default
    return $node
};

declare function direct:transform(
  $context as map:map,
  $params as map:map,
  $content as document-node())
as document-node()
{
  direct:add($content)
};
