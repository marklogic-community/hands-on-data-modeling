// This is a read transform that adds information about the office in which
// the employee works.

var mem = require("/ext/corb/memory-operations");

function getOfficeInfo(officeNum) {

  var triples = sem.sparql(
    'PREFIX emp: <http://www.marklogic.com/employees#> ' +
    'PREFIX foaf: <http://xmlns.com/foaf/0.1/> ' +
    'PREFIX dbpedia-owl: <http://dbpedia.org/ontology/> ' +
    'select ?buildingName ?cityName ?countryName ' +
    'where { ' +
    '  ?empID emp:hasOffice ?officeNum . ' +
    '  ?officeNum emp:inOffice ?office . ' +
    '  ?office emp:inBuilding ?building . ' +
    '  ?building emp:inCity ?city ; ' +
    '            foaf:name ?buildingName . ' +
    '  ?city dbpedia-owl:country ?country ; ' +
    '        foaf:name ?cityName . ' +
    '  ?country foaf:name ?countryName . ' +
    '}',
    {
      officeNum: sem.iri(officeNum)
    }
  );

  return triples.next().value;
}

function label(context, params, content) {
  context.outputType = "application/xml";

  var office = getOfficeInfo(
    content.xpath('employee/sem:triple/sem:object/fn:string()', {sem: 'http://marklogic.com/semantics'}).next().value
  );

  // Use NodeBuilder's startElement(string), addText(string), and endElement()
  // functions to build an XML structure like this one:
  // <office>
  //   <building>Hancock Building</building>
  //   <city>City of Chicago</city>
  //   <country>the United States</country>
  // </office>
  var nb = new NodeBuilder();
  nb
    .startElement('office')

      .endElement();

  return mem.insertBefore(
    content.xpath('//effective-date'),
    nb.toNode()
  );
}

exports.transform = label;
