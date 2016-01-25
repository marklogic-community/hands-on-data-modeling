# Load As-Is

In this unit we want to load the following datasets "As-Is" using MarkLogic Content Pump. 

- ../data/EmployeeTables
- ../data/EmployeeImages
- ../data/EmployeeReviews

The sample mlcp command to load the Employees .csv is as follows:

mlcp.bat -options\_file C:\ContentPump8-04\bin\mlcp-cfgs\employees.cfg

Update the following .cfg files appropriately to import their associated content, placing them into collections named for their topics.  

See the MLCP guide for help. http://docs.marklogic.com/guide/mlcp

- dept.cfg     (csv file)
- salary.cfg   (csv file)
- images.cfg   (binaries)
- reviews.cfg  (xml)

