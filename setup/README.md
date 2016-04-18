# Setup

## Linux:

setup.sh will setup and configure the following via cURL:

- Data and modules databases
- Indexes
- REST instance
- Application Server
- Users

wipe.sh will teardown and remove everything created by setup.sh.

NOTE: Update each .sh file with your own username/password credentials as required.

NOTE: The Application Server defaults to port 8080.  Update rest.json as required.


## Windows:
setup.bat will setup and configure the following via cURL: 

- Data and modules databases
- Indexes
- REST instance
- Application Server
- Users

wipe.bat will teardown and remove everything created by setup.bat.

NOTE: Update each .bat file with your own username/password credentials as required.

NOTE: The Application Server defaults to port 8080.  Update rest.json as required.

NOTE: cURL is not installed on Windows by default.  

## Query Console:

If you do not have cURL installed, you can also install the configuration manually via QueryConsole.
 
Employees.xml is a QueryConsole workspace.

Import the workspace and run the examples to:
- Create an Employees Database with it's requisite forests
- Deploy a REST Instance for the Employees database, which will create an App Server and Modules database
- Create Indexes
- Create Users

NOTE: Update the provided examples with your servername, port, username, and password.

NOTE: Teardown of assets created using QueryConsole can be removed manually either via the Admin UI or REST API.

