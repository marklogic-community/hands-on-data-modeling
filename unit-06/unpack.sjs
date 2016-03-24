

function unpack(context, params, content) {
  var mutableDoc = content.xpath('/employee/root');

  context.outputType = "application/xml";

  return mutableDoc;
}

exports.transform = unpack;
