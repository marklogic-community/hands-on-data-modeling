# Exercise 1: Create a Read Transform

Review the source code in label.sjs. This code implements the "label" transform,
expanding on the information we have about the office in which an employee 
works. This transform will be applied while reading an employee document. 

## Goal

Your goal in this exercise is to complete the implementation, adding labels for
the building, city, and country in which the employee works. 

## Using the Transform

To deploy the transform, run this command from the unit-06 directory:

    ./deploy-transform.sh label.sjs label

To run the transform, apply it to a document read. With the transform in its 
current state, it will only provide an empty <office> element. 

You can request a document in your brower by pointing it to:

    http://localhost:8080/v1/documents?uri=/employees-v3/EmployeeTable.csv-0-562.xml&transform=label

Note the use of "&transform=label" in the URL. 

## Working with the Transform

You can work with the transform code in Query Console. To do so, follow these steps:

1. Open Query Console in your browser (http://localhost:8001)
2. Create a new buffer (click the "+" button)
3. For Content Source, select "Employees (employees-modules: /)"
4. For Query Type, select "JavaScript"
5. Copy and paste the contents of label.sjs into the buffer
6. Remove the `exports.transform = label;` line from the buffer
7. Paste the following at the end of the buffer. 

JavaScript code to load a document and pass it to the function:

    var doc = cts.doc('/employees-v3/EmployeeTable.csv-0-916.xml');
    label(
      {},
      null,
      doc
    )

Click Run. In the lower section of Query Console, you'll see the result of the
transform run on a particular document. Work with `nb` to build up the rest of
the XML. 

When you have it working in Query Console, paste your revised code back into 
label.sjs, save it, and deploy it to MarkLogic. 
