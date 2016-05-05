xquery version "1.0-ml";

module namespace unpack = "http://marklogic.com/rest-api/transform/unpack";

declare function unpack:transform(
  $context as map:map,
  $params as map:map,
  $content as document-node())
as document-node()
{
  map:put($context, "output-type", "application/xml"),
  document { $content/employee/content }
};
