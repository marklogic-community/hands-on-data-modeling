# Load Data As-Is

In this unit we want to load the following datasets "As-Is" using MarkLogic Content Pump (mlcp). 

- ../data/EmployeeTables
- ../data/EmployeeImages
- ../data/EmployeeReviews

## Running MLCP

This sample mlcp command demonstrates how to load a .csv file from the EmployeeTables directory. Refer to the .cfg files for details on which paramters are being passed to mlcp.

    $ mlcp.bat -options_file employees.cfg

See the [MLCP](http://docs.marklogic.com/guide/mlcp) guide for more information. 

Update the following .cfg files as need to import their associated content, placing them into collections named for their topics.

- employees.cfg (csv file)
- dept.cfg      (csv file)
- salary.cfg    (csv file)
- images.cfg    (binaries)
- reviews.cfg   (xml)

