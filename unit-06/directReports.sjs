// This search transform supplements each result with the number of direct 
// reports that employee (search result) has. 
//
// Note that unlike JSON, we can't update XML in place. Instead, we make a copy
// of the XML structure we want with the desired changes. 

var mem = require("/lib/memory-operations");

// Use NodeBuilder to create attributes that are present in the passed-in node
function addAttributes(nb, node) {
  var attrs = node.attributes;
  var attr;
  for (var i = 0; i < attrs.length; i++) {
    attr = attrs.item(i);
    nb.addAttribute(
      attr.nodeName,
      attr.textContent
    );
  }
}

// Given a document URI, look up that employee's ID and see how many people 
// report to that person. 
function calculateDirectReports(uri) {
  var id = cts.doc(uri).xpath('/employee/root/emp_id/fn:string()');
  return cts.estimate(cts.elementValueQuery(xs.QName('reports_to'), id)).toString();
}

// Use NodeBuilder to construct a copy of the search:response, adding 
// direct-reports elements to each search:result. 
function directReports(context, params, content) {
  var results = content.xpath('search:response/search:result', { search: 'http://marklogic.com/appservices/search'});
  var updatedResults = content;

  var nb = new NodeBuilder();
  nb.startElement('response', 'http://marklogic.com/appservices/search');
  addAttributes(nb, content.firstChild);

  for (var result of results) {
    nb.startElement('result', 'http://marklogic.com/appservices/search');
    addAttributes(nb, result);
    nb.addElement(
      'direct-reports',
      calculateDirectReports(result.attributes.getNamedItem('uri')),
      'http://marklogic.com/appservices/search'
    );
    for (var node of result.xpath('./*')) {
      nb.addNode(node);
    }
    nb.endElement(); // </direct-reports>
  }

  nb.endElement(); // </search:response>

  return nb.toNode();
}

exports.transform = directReports;