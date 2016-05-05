declareUpdate();
var jsearch = require('/MarkLogic/jsearch.sjs');
var URI;
 
if (fn.docAvailable(URI)) {
var newURI = fn.concat("/denormalized", URI);

var doc = cts.doc(URI);
var mutable = doc.toObject();
var empId = doc.root.emp_id;
var deptId = doc.root.dept_num;

var depts = jsearch.collections('department');

var deptInfo = depts.documents()
               .where(jsearch.byExample({dept_num: {$word: deptId}}))
               .map({extract: {paths: ['/dept_num'], selected: 'exclude'}})
               .result();

var salaries = jsearch.collections("salary");

var salaryInfo = salaries.documents()
               .where(jsearch.byExample({emp_id: {$word: empId}}))
               .map({extract: {paths: ['/emp_id'],  selected: 'exclude'}})
               .result();
 
var empDept = deptInfo.results[0].extracted[0];

var empSalary = salaryInfo.results[0].extracted[0];

mutable.dept_name = empDept.dept_name;
mutable.salary = empSalary;
xdmp.documentInsert(
    newURI,
    mutable,
    xdmp.documentGetPermissions(URI),
    "denormalized");

} else {
    xdmp.log("document not found");
}

